create trigger [dbo].[dokstavka_utrig] on [dbo].[dokstavka]
after update not for replication
as
set nocount on

if exists(select * from inserted)
begin

	if exists (select * from inserted 
				inner join deleted on inserted.id = deleted.id 
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
			where checksum (deleted.pozicija, deleted.kontoid, deleted.analitikaid, 
					deleted.iznos, deleted.ks, deleted.dp, deleted.pozdatum) <> 
				checksum (inserted.pozicija, inserted.kontoid, inserted.analitikaid,
					inserted.iznos, inserted.ks, inserted.dp, inserted.pozdatum))
	begin

			if exists (select *  from inserted
					inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				where dbo.dokvrsta.iznos = 0 and inserted.iznos < 0 and inserted.pozicija = 1000)
			begin
				raiserror 44445 '
		
		the value can''t be < 0, referential 
		integrity rules would be violated. 
		this document can''t have negative value !
		origin:  dokstavka_utrig'
	        			rollback transaction
			end
		
		

		if exists (select * from inserted 
				inner join deleted on inserted.id = deleted.id 
				inner join dbo.dokstart ds with(nolock) on inserted.dokumid = ds.id
				inner join dbo.dokvrsta dsv with(nolock) on ds.dokvrsta = dsv.sifra
				left outer join dbo.glavknjiga with(nolock) on inserted.id = dbo.glavknjiga.dokstavkaid
				left outer join dbo.dokpoprat with(nolock) on inserted.dokumid = dbo.dokpoprat.dokpopratid
				left outer join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id 
				left outer join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			where (dbo.dokvrsta.vrsta in (6,8,9) 
				or ds.placeno = 1
				or ds.knjizeno = 1
				or ds.zakljuceno = 1
				or glavknjiga.dokstavkaid > 0)
				and (dsv.zatvaranje = 0 or (dsv.zatvaranje > 0 and (select [dbo].[sikorisnikhier] ()) < 3))
				and checksum (deleted.pozicija, deleted.kontoid, deleted.analitikaid, 
					deleted.iznos, deleted.ks, deleted.dp) <> 
					checksum (inserted.pozicija, inserted.kontoid, inserted.analitikaid,
						inserted.iznos, inserted.ks, inserted.dp))
				begin
	    	    		raiserror 44445 n'

		the document can''t be updated, 
		since exist in general ledger 
		or in payment or in specification 
		or in calculation or it is closed.
		origin: dokstavka_utrig'
	      	  		rollback transaction
				end

		
		if exists (select * from inserted where ks = 1)
		begin

			if exists (select * from inserted
					inner join dbo.konto with(nolock) on inserted.kontoid = dbo.konto.id
					inner join dbo.analitika with(nolock) on inserted.analitikaid = dbo.analitika.id
				where  analitika.analitikavrsta not in (0,1,4,5,90,99)
					and konto.analitikavrsta <> analitika.analitikavrsta and inserted.ks = 1
					and konto.nepprih = 0 and konto.neptros = 0)
				begin
				raiserror 44445 '
			
			the record can''t be changed. 
			type of analitic is different from 
			type of analitic in account !
			origin:  dokstavka_utrig'
				rollback transaction
				end

		

			if exists (select * from inserted
					inner join dbo.analitika with(nolock) on inserted.analitikaid = dbo.analitika.id 
					inner join dbo.os with(nolock) on dbo.analitika.vezaid = dbo.os.id
					inner join dbo.osvrsta with(nolock) on dbo.os.osvrstaid = dbo.osvrsta.id
			where  dbo.analitika.analitikavrsta = 6 and inserted.ks = 1
					and inserted.kontoid <> dbo.osvrsta.kontoid
					and  inserted.kontoid <> dbo.osvrsta.konto1id
					and inserted.kontoid <> dbo.osvrsta.konto2id
					and inserted.kontoid <> dbo.osvrsta.konto3id
					and inserted.kontoid <> dbo.osvrsta.konto4id)
				begin
				raiserror 44445 '
			
			the record can''t be updated, account for 
			fixed assets is different
			from account in depreciation list !
			origin: dokstavka_utrig'
				rollback transaction
				end

			if exists (select *  from inserted
					inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				where dbo.dokvrsta.vrsta >= 100 and inserted.ks = 1)
				begin
				raiserror 44445 '
			
			plans can''t have gl entry!
			origin:  dokstavka_utrig'
				rollback transaction
				end
		end
	end

	if exists (select *  from inserted
			inner join deleted on inserted.id = deleted.id
		where checksum (deleted.pozicija, deleted.kontoid, deleted.analitikaid, 
						deleted.ks, deleted.dp, deleted.pozdatum) <> 
			  checksum (inserted.pozicija, inserted.kontoid, inserted.analitikaid,
						inserted.ks, inserted.dp, inserted.pozdatum)) 
	begin

		if exists (select * from inserted 
					inner join dbo.pozicija with(nolock) on  inserted.pozicija = dbo.pozicija.sifra 
				where (inserted.pozdatum < cast('19700101' as smalldatetime) 
					or inserted.pozdatum is null) 
					and pozicija.datumvrsta >0 
					and pozicija.datumvrsta <> 3)
			begin
			raiserror 44445 '
		
		the record can''t be added, business logic violation, 
		the position has wrong type of date or date missing !
		origin: dokstavka_utrig'
	        		rollback transaction
			end

		if exists (select *  from inserted
				inner join deleted on inserted.id = deleted.id
				inner join dbo.pozicija with(nolock) on  inserted.pozicija = dbo.pozicija.sifra 
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dokstart.id
				inner join dbo.dokvrsta with(nolock) on  dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where (checksum (deleted.pozicija, deleted.kontoid, deleted.analitikaid, 
						deleted.ks, deleted.dp) <> 
				checksum (inserted.pozicija, inserted.kontoid, inserted.analitikaid,
						inserted.ks, inserted.dp)) 
				and (deleted.pecat = 1 or  inserted.pecat = 1) 
				and dokstart.vk <> 0 
				and pozicija.zatvaranje = 0
				and dokvrsta.vrsta <> 9)
				begin
				raiserror 44445 '
		
		the position can''t be changed, it''s 
		opened by automatic "accounting stamp".
		origin:  dokstavka_utrig'
	        			rollback transaction
				end
	end	

				insert into dbo.dokstavkaknjiga (dokstavkaid, firmaid)
				select inserted.id, dokstart.firmaid
				from inserted
					inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
					inner join dbo.pozicija on inserted.pozicija = dbo.pozicija.sifra
					left outer join dbo.dokstavkaknjiga on inserted.id = dbo.dokstavkaknjiga.dokstavkaid 
				where inserted.ks = 1
					and (kontoid > 0 or pozicija.zatvaranje = 1)
					and dokstavkaknjiga.dokstavkaid is null
		
				delete  dbo.dokstavkaknjiga
				from inserted
					inner join dbo.dokstavkaknjiga on inserted.id = dbo.dokstavkaknjiga.dokstavkaid
				where inserted.ks = 0 
option (keepfixed plan)

		

				insert into dbo.dokstavkapop (dokstavkaorg)
				select inserted.id 
				from inserted
					inner join dbo.pozicija on  inserted.pozicija = dbo.pozicija.sifra
					left outer join dbo.dokstavkapop on inserted.id = dokstavkapop.dokstavkaorg 
				where pozicija.zatvaranje = 1 and dokstavkapop.dokstavkaorg is null
option (keepfixed plan)

	if exists (select * from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dokvrsta.mp = 1)
	begin
		insert into dbo.dokstavka(dokumid,[pozicija],[kontoid],[analitikaid], 
					[iznos],[iznosval],[pozdatum],[dp],[ps],[zk],[ks],[pecat],protuid)
		select top 1 inserted.dokumid, 
			pozicija =	case when dokstavkapop.dokstavkaorg is null
						then pozicija.sifra
						else 2991
						end, 
			kontoid = case when pozicija.sifra in(2990,2994,2993) then null else inserted.kontoid end, 
			inserted.analitikaid, 
			saldo = dbo.mosaldopredmet(inserted.dokumid),  
			saldoval = dbo.mosaldopredmet(inserted.dokumid),  
			inserted.pozdatum, 
			dp = case when inserted.dp = 1 then 0 else 1 end,
			0, 0, 
			ks = case when pozicija.sifra in(2990,2994,2993) then 0 else 1 end, 
			0, inserted.id
		from inserted
			inner join dbo.pozicija pdst on inserted.pozicija = pdst.sifra
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.list on dbo.dokstart.listid = dbo.list.id
			inner join dbo.listnad on dbo.list.listnadid = dbo.listnad.id
			inner join dbo.listvrstplac on dbo.listnad.listvrstplac = dbo.listvrstplac.sifra
			inner join dbo.pozicija on dbo.listvrstplac.pozicijazat = dbo.pozicija.sifra

	 		left outer join dbo.dokstavkapop on inserted.id = dbo.dokstavkapop.dokstavkaorg
		where inserted.iznos <> 0 and dbo.mosaldopredmet(inserted.dokumid) <> 0 
			and pdst.plac = 1
			and dokvrsta.mp = 1
			and listnad.skupdogadjaj = 13 
			and listvrstplac.pozicijaupis = 1 
			and pozicija.zatvaranje = 1
			and dbo.dokstavkapop.dokstavka is null
option (keepfixed plan)

	end

end