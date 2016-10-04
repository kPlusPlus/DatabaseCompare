create trigger [dbo].[dokstart_utrig] on [dbo].[dokstart]
for update
not for replication
as
set nocount on

if exists (select * from inserted)
begin

	if exists (select * from inserted where listid is null)
	begin
		insert dbo.list (analitikaid)
		select id from inserted
		where inserted.listid is null

		update dbo.dokstart
		set listid = dbo.list.id 
		from inserted
			inner join dbo.list on inserted.id = dbo.list.analitikaid
			inner join dbo.dokstart on inserted.id = dbo.dokstart.id
		where dbo.dokstart.listid is null
	end

	if exists (select *  from deleted
			inner join inserted on deleted.id = inserted.id 
			inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra
			inner join cfg.dbo.korisnik with(nolock) on cfg.dbo.korisnik.id = deleted.korisnikid
		where (deleted.knjizeno = 1 or deleted.placeno = 1 or deleted.zakljuceno = 1
			or ((deleted.azuriranje = 1 or dokvrsta.samovl = 1)
			and (dokvrsta.sklad = 1 or dokvrsta.skk = 1 or dokvrsta.skd = 1 or dokvrsta.mp = 1) 
			and (rtrim(cfg.dbo.korisnik.loginname) <> suser_sname() and dokvrsta.samovl = 1)))
		and [dbo].[sikorisnikhier] () < 3 
		and inserted.placeno = deleted.placeno 
		and inserted.knjizeno = deleted.knjizeno)  
	begin
		raiserror 44445 n' 
		the record can''t be deleted or changed. 
		since document exist in general ledger 
		or in payment or it is closed or 
		only owner can change the document!!!
		origin: dokstart_utrig'
		rollback transaction
	end

	if exists (select * from inserted 
		inner join deleted on inserted.id = deleted.id
		inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.dokstavka with(nolock) on inserted.id = dbo.dokstavka.dokumid 
	where checksum (inserted.godina, inserted.vk, inserted.firmaid) 
		<> checksum (deleted.godina, deleted.vk, deleted.firmaid)
		and dokvrsta.mp = 0)
	begin
		raiserror 44445 n'300444

		the record can''t be updated, 
		"acounting stamp" exist for this document. 
		delete the "acounting stamp" first, 
		then you can change this record!

		origin: dokstart_utrig'
		rollback transaction
	end

	if exists (select * from inserted
			inner join deleted on inserted.id = deleted.id 
		where inserted.knjizeno <> deleted.knjizeno)
	begin

			if exists (select * from inserted 
					inner join deleted on inserted.id = deleted.id 
					inner join dbo.dokstavka with(nolock) on inserted.id = dbo.dokstavka.dokumid
					left outer join dbo.glavknjiga with(nolock) on dbo.dokstavka.id = dbo.glavknjiga.dokstavkaid 
				where deleted.knjizeno = 0 and inserted.knjizeno = 1 and dokstavka.ks = 1 
					and dokstavka.iznos <> 0 and dokstavka.kontoid > 0
					and dbo.glavknjiga.dokstavkaid is null) 
			begin
    	    		raiserror 44445 n'
			the document can''t be marked 
			as "gl enter", 
			since all necessery items don''t 
			have entry in general ledger.
			origin: dokstart_utrig'
      	  		rollback transaction
			end

			update dbo.dokstavkaknjiga
			set 	opis = case when kz.skopis = '' or kz.skopis is null
					then kz.opis
					else kz.skopis
					end, 
				firmaid = case when kz.skfirmaid is null
					then kz.firmaid
					else kz.skfirmaid
					end,
				analitpcid = case when dokstavkaknjiga.analitpcid is null and kz.analitpcid > 0
						then kz.analitpcid
						else dokstavkaknjiga.analitpcid
						end,				
				analitdodid = case when kz.analitikaid > 0 and kz.analitvrstadod > 0and dokstavkaknjiga.analitdodid is null 
						then kz.analitikaid
						else dokstavkaknjiga.analitdodid
						end,
				procjena = case when kz.pozicijagrupa = 100 
						then 1
						else dokstavkaknjiga.procjena
						end
			from (select dbo.dokstavkaknjiga.dokstavkaid, 
				rtrim(dbo.dokvrsta.prefiks) + '-' + cast(inserted.godina as nvarchar(4)) + '-' 
				+ rtrim(inserted.broj) + ' (' + rtrim(isnull(inserted.izvornik,'')) + ')' as opis, 
				dbo.dokstavkaknjiga.opis as skopis,
				dbo.dokstavkaknjiga.firmaid as skfirmaid, inserted.firmaid, 
				dokvk.pozicijagrupa, listnad.analitikaid, pozicija.analitvrstadod,
				dokvk.analitpcid
				from inserted
					inner join deleted on inserted.id = deleted.id 
					inner join dbo.dokvrsta on inserted.dokvrsta = dbo.dokvrsta.sifra
					inner join dbo.dokvk on inserted.vk = dbo.dokvk.sifra
					inner join dbo.dokstavka on inserted.id = dbo.dokstavka.dokumid
					inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra
					inner join dbo.dokstavkaknjiga on dbo.dokstavka.id = dbo.dokstavkaknjiga.dokstavkaid 
					left outer join dbo.list on inserted.listid = dbo.list.id
					left outer join dbo.listnad on dbo.list.listnadid = dbo.listnad.id 
							and dbo.listnad.skupdogadjaj between 12 and 14	
				where inserted.knjizeno = 1 and deleted.knjizeno = 0 and dokstavka.ks = 1) as kz
			where dbo.dokstavkaknjiga.dokstavkaid = kz.dokstavkaid

			if exists (select *  from inserted
					inner join deleted on inserted.id = deleted.id 
					inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra 
				where inserted.knjizeno = 1  and deleted.knjizeno = 0 
					and dbo.dokvrsta.zadrazd = 1 and dbo.dokvrsta.sklvrst = -1)
			begin

			if exists (select *  from inserted
					inner join deleted on inserted.id = deleted.id 
					inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra
					inner join dbo.evid with(nolock) on inserted.listid = dbo.evid.listid 
					inner join dbo.skladiste with(nolock) on dbo.evid.id = dbo.skladiste.evidid
					inner join dbo.zaliha with(nolock) on dbo.skladiste.zalihaid = dbo.zaliha.id
					inner join dbo.skladiste skladiste_1 with(nolock) on dbo.zaliha.skladisteid = skladiste_1.id
					inner join dbo.evid evid_1 with(nolock) on skladiste_1.evidid = evid_1.id

					inner join ( 
						select 	ds.listid ,

							max(convert (tinyint, ds.knjizeno )) knjizeno,
							max(convert (tinyint, ds.zakljuceno )) zakljuceno		
						from dbo.dokstart ds 
						inner join dbo.dokvrsta dv on ds.dokvrsta = dv.sifra	
						where 
							(dv.zadrazd = 1 

							)
							and (ds.knjizeno = 0 or ds.zakljuceno = 0)
						group by ds.listid
					) dz on evid_1.listid = dz.listid
				where  dokvrsta.zadrazd = 1 and dokvrsta.sklvrst = -1
					and inserted.knjizeno = 1 and deleted.knjizeno = 0

					and dz.knjizeno = 0 
					and dz.zakljuceno = 0 
					)
				begin
    	    		raiserror 44445 n'
			the document can''t be marked as "gl enter", 
			since all inventory input document don''t have 
			entry in general ledger.

			origin: dokstart_utrig'
      	  			rollback transaction
				end
			end

		if exists ( select * from inserted
					inner join deleted on inserted.id = deleted.id
					inner join dbo.dokstavka with(nolock) on inserted.id = dbo.dokstavka.dokumid
					left outer join dbo.glavknjiga with(nolock) on dbo.dokstavka.id = dbo.glavknjiga.dokstavkaid 
				where deleted.knjizeno = 1 and inserted.knjizeno = 0 
					and dokstavka.ks = 1 
					and dokstavka.iznos <> 0 
					and dokstavka.kontoid > 0
					and dbo.glavknjiga.dokstavkaid > 0) 
			begin
    	    		raiserror 44445 n'
		the document can''t be unmarked 
		from "gl enter" because some items
		still exists in general ledger!
		origin: dokstart_utrig'
      	  		rollback transaction
			end

			if exists (select *  from inserted
					inner join deleted on inserted.id = deleted.id
					inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra
					inner join dbo.evid with(nolock) on inserted.listid = dbo.evid.listid 
					inner join dbo.skladiste with(nolock) on dbo.evid.id = dbo.skladiste.evidid
					inner join dbo.zaliha with(nolock) on dbo.zaliha.skladisteid = dbo.skladiste.id
					inner join dbo.skladiste skladiste_1 with(nolock) on dbo.zaliha.id = skladiste_1.zalihaid
					inner join dbo.evid evid_1 with(nolock) on skladiste_1.evidid = evid_1.id
					inner join dbo.dokstart with(nolock) on evid_1.listid = dbo.dokstart.listid
					inner join dbo.dokvrsta dokvrsta_1 with(nolock) on dbo.dokstart.dokvrsta = dokvrsta_1.sifra
				where  ( dokvrsta.zadrazd = 1 or dokvrsta.sklad = 1 ) and dbo.dokvrsta.sklvrst = 1
					and ((inserted.knjizeno = 0  and deleted.knjizeno = 1 ) or ( inserted.zakljuceno = 0 and deleted.zakljuceno = 1 ) )
					and  (dokvrsta_1.zadrazd = 1 and dokvrsta_1.sklad = 1 ) 
					and (dokstart.knjizeno = 1 or dokstart.zakljuceno = 1 ))
				begin
    	    			raiserror 44445 n'
		the document can''t be removed from general ledger
		or disclosed since some inventory output documents have 
		entry in general ledger or are closed.
		origin: dokstart_utrig'
      	  			rollback transaction
				end
	end

	if exists (select * from inserted 
				where inserted.azuriranje = 1 and inserted.kontrola = 1 )
	begin
		update [dbo].[list]
		set	[analitikaid] = dbo.list.analitikaid
		from inserted
			inner join dbo.list on inserted.listid = dbo.list.id
		where inserted.azuriranje = 1 and inserted.kontrola = 1
	end

	if exists (select * from inserted 
					inner join deleted on inserted.id = deleted.id
				where (deleted.azuriranje = 1 or deleted.kontrola = 1) 
				and inserted.azuriranje = 0 and inserted.kontrola = 0 )
	begin

		if exists (select * from inserted
				inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra 
			where dokvrsta.autoskupdog1 > 0 or dokvrsta.autoskupdog2 > 0)
		begin
			update dbo.listnad 
			set sifra = case 
				when inserted.izvornik = '' or inserted.izvornik is null
				then rtrim (dbo.dokvrsta.prefiks) + n'-' + cast(inserted.godina as nvarchar(4)) + n'-' + rtrim(inserted.broj)
				else isnull(rtrim(inserted.izvornik),'') +' (' +rtrim (dbo.dokvrsta.prefiks) + n'-' + cast(inserted.godina as nvarchar(4)) + n'-' + rtrim(inserted.broj) + ')'
				end,
				koristi = case when inserted.zakljuceno = 1 then 0 else 1 end 
			from inserted
				inner join dbo.dokvrsta on inserted.dokvrsta = dbo.dokvrsta.sifra 
			where inserted.id = listnad.vezaid
				and dbo.dokvrsta.autoskupdog1 = dbo.listnad.skupdogadjaj

			update dbo.listnad 
			set sifra =  case 
				when inserted.izvornik = '' or inserted.izvornik is null
				then rtrim (dbo.dokvrsta.prefiks) + n'-' + cast(inserted.godina as nvarchar(4)) + n'-' + rtrim(inserted.broj)
				else isnull(rtrim(inserted.izvornik),'') +' (' +rtrim (dbo.dokvrsta.prefiks) + n'-' + cast(inserted.godina as nvarchar(4)) + n'-' + rtrim(inserted.broj) + ')'
				end,
				koristi = case when inserted.zakljuceno = 1 then 0 else 1 end  
			from inserted
				inner join dbo.dokvrsta on inserted.dokvrsta = dbo.dokvrsta.sifra 
			where inserted.id = listnad.vezaid 
				and dbo.dokvrsta.autoskupdog2 = dbo.listnad.skupdogadjaj

			update dbo.list
			set listnadid =  listnad.id 
			from inserted
				inner join dbo.list on inserted.listid = dbo.list.id 
				inner join dbo.dokvrsta on inserted.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.listnad on inserted.id = dbo.listnad.vezaid
					and dbo.dokvrsta.autoskupdog1 = dbo.listnad.skupdogadjaj
			where dbo.dokvrsta.autoskupdog1 > 0 

			update dbo.list
			set listnad1id =  listnad.id 
			from inserted
				inner join dbo.list on inserted.listid = dbo.list.id 
				inner join dbo.dokvrsta on inserted.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.listnad on inserted.id = dbo.listnad.vezaid
					and dbo.dokvrsta.autoskupdog2 = dbo.listnad.skupdogadjaj
			where dbo.dokvrsta.autoskupdog2 > 0  
		end

		if exists(select * from inserted 
					inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra
				where dokvrsta.skd = 1 and len(inserted.izvornik) > 0)
		begin
			if exists(select * from inserted 
				inner join dbo.dokstart on inserted.godina = dbo.dokstart.godina
					and rtrim(inserted.izvornik) = rtrim(dbo.dokstart.izvornik)
					and inserted.id <> dbo.dokstart.id
				inner join dbo.dokvrsta on inserted.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokvrsta dvd on dbo.dokstart.dokvrsta = dvd.sifra 
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
				inner join dbo.dokum insdokum on inserted.id = insdokum.dokumid
						and dbo.dokum.analitika1id = insdokum.analitika1id
				inner join dbo.analitika on insdokum.analitika1id = dbo.analitika.id
							and dbo.analitika.analitikavrsta = 2
				inner join dbo.dokstavka on insdokum.dokumid = dbo.dokstavka.dokumid
				inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra
								and dbo.pozicija.plac = 1
				where dokvrsta.skd = 1 and dvd.skd = 1 and len(inserted.izvornik) > 0 and dokstavka.iznos <> 0)
			begin
			raiserror 44445 '

		>>> duplicates in documents! <<<
		the document for the same partner 
		and with same original number in 
		same year exists in the system!!!
		origin: dokstart_utrig'
	        		rollback transaction
			end
		end

		if exists (select *  from inserted 
				inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.dokum with(nolock) on inserted.id = dbo.dokum.dokumid
			where dbo.dokvrsta.knjizenje = 1 and dbo.dokum.pdvstatus not in (0, 1,11,12)
				and dbo.dokum.tecaj = 1 and inserted.vk > 0)		begin
			if not exists (select * from inserted
				inner join dbo.dokum with(nolock) oninserted.id = dbo.dokum.dokumid
				inner join dbo.dokstavka with(nolock) on dbo.dokum.dokumid = dbo.dokstavka.dokumid
				inner join dbo.pozicija with(nolock) on dbo.dokstavka.pozicija = dbo.pozicija.sifra 
				inner join dbo.portarif with(nolock) on dbo.pozicija.portarifid = dbo.portarif.id 
				inner join dbo.pozicija pozicija_1 with(nolock) on dbo.portarif.id = pozicija_1.portarifid 
				inner join dbo.dokstavka dokstavka_1 with(nolock) on dbo.dokum.dokumid = dokstavka_1.dokumid 
						and pozicija_1.sifra = dokstavka_1.pozicija 
				where dbo.pozicija.osnpdv = 1 and pozicija_1.pdv = 1 
					and dbo.dokum.pdvstatus not in (0, 1,11,12)
					and dbo.dokum.tecaj = 1 and inserted.vk > 0
					and koef <> 1

					and (((dokstavka_1.iznos between (dbo.dokstavka.iznos * (koef -1)) -1 
						and (dbo.dokstavka.iznos * (koef -1)) +1) 
					and (dbo.dokstavka.iznos between (dokstavka_1.iznos  (koef -1)) +1)) 
					or (dbo.dokstavka.iznos = 0 and dokstavka_1.iznos = 0)))
			begin
        			raiserror 44445 n'

		the document can''t be updated, 
		vat or vat base missing in accounting stamp
		or vat against vat base is wrong!
		origin: dokstart_utrig'
        			rollback transaction
			end
		end

		if exists(select * from inserted
				inner join dbo.dokum with(nolock) on inserted.id = dbo.dokum.dokumid
				inner join dbo.dokstavka with(nolock) on inserted.id = dbo.dokstavka.dokumid
				left outer join dbo.dokstavkaknjiga with(nolock) on dbo.dokstavka.id = dbo.dokstavkaknjiga.dokstavkaid
		where inserted.dokvrsta not in (98,100) and pozicija > 255 
			and (dokstavkaknjiga.procjena = 0 or dokstavkaknjiga.procjena is null)
			and ((dbo.dokum.tecaj = 1 and (iznosval > iznos or iznosval < iznos))
			or (dbo.dokum.tecaj not in (-1,1) 
			and (iznos - 0.2 > round(iznosval * tecaj,2) 
			or iznos + 0.2 < round(iznosval * tecaj,2)))))
		begin
		raiserror 44445 n'
		amount <> foreign currency amount !
		origin: dokstart_utrig'
        		rollback transaction
		end

		if exists (select  inserted.id from inserted 
				inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.dokstavka with(nolock) on inserted.id = dbo.dokstavka.dokumid
				inner join dbo.pozicija with(nolock) on dbo.dokstavka.pozicija = dbo.pozicija.sifra
			where (knjizenje = 1 and ks = 1 and ps = 0 and kontoid > 0 and mp = 0) 
			or (mp = 1 and ks = 1 and ps = 0 and kontoid > 0 and pozicija.zatvaranje = 0) 
			group by  inserted.id 
			having isnull(sum(case when dp = 1 then dokstavka.iznos else 0 end),0) <> isnull(sum(case when dp = 0 then dokstavka.iznos else 0 end),0)
				or isnull(sum(case when dp = 1 then dokstavka.iznosval else 0 end),0) <> isnull(sum(case when dp = 0 then dokstavka.iznosval else 0 end),0))

		begin
		raiserror 44445 n'
	the document can''t be updated, 
	credit and debit are not the same value !
	origin: dokstart_utrig'
		rollback transaction
		end

	end

	if exists(select * from inserted
				inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra 
				where dokvrsta.status = 1)
	begin
		insert into dbo.izmj (tabela, polje, slog, prije, poslije, dokumid, izmjvrsta)
		select 	n'dokstart', 
			n'status' + ', ' + cast(deleted.dokvrsta as nvarchar(3)) as polje, 
			inserted.id as slog, 
			rtrim(ddvs.tekst) as prije,
			rtrim(idvs.tekst) as poslije,
			inserted.id, 
			izmjvrsta.sifra 
		from inserted
			inner join deleted on inserted.id = deleted.id
			inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.dokvrstastatus idvs with(nolock) on inserted.status = idvs.sifra
			inner join dbo.dokvrstastatus ddvs with(nolock) on deleted.status = ddvs.sifra
			cross join dbo.izmjvrsta with(nolock) 
		where izmjvrsta.sifra = 1 
			and izmjvrsta.koristi = 1
			and dokvrsta.status = 1 
			and (deleted.status <> inserted.status)
	end

end