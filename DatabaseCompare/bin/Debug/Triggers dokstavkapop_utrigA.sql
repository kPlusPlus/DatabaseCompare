create       trigger [dbo].[dokstavkapop_utrig] on [dbo].[dokstavkapop] 
for update
not for replication
as
set nocount on

if exists (select * from inserted)
begin

		if exists (select * from inserted where dokstavka is null and len(pnbz) > 1)
		begin
			update dbo.dokstavkapop

			set dokstavka = dbo.dokstavka.id 
			from dbo.dokstavkapop
			inner join inserted on dbo.dokstavkapop.dokstavkaorg = inserted.dokstavkaorg		
			inner join dbo.dokpozivbr on rtrim(inserted.pnbz) = rtrim(dbo.dokpozivbr.pnb)
			inner join dbo.dokstavka on dbo.dokpozivbr.dokumid = dbo.dokstavka.dokumid
			inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra
			left outer join dbo.dokstavkapop dspp on dbo.dokstavka.id = dspp.dokstavka 
			where  inserted.dokstavka is null and len(inserted.pnbz) > 1
				and dbo.dokpozivbr.pozivbrvrsta = 1 and dbo.pozicija.plac = 1 
				and dbo.dokstavka.iznos > 0 and dspp.dokstavka is null 
				and dbo.dokstavkapop.pnbz in (select inserted.pnbz from inserted group by inserted.pnbz having count(inserted.dokstavkaorg)<2)

			update dbo.dokstavka set

				kontoid = case when dstd.kontoid is null then dbo.dokstavka.kontoid else dstd.kontoid end,
				analitikaid = dstd.analitikaid
			from dbo.dokstavkapop
			inner join inserted on dbo.dokstavkapop.dokstavkaorg = inserted.dokstavkaorg		
			inner join dbo.dokstavka on inserted.dokstavkaorg = dbo.dokstavka.id
			inner join dbo.dokpozivbr on rtrim(inserted.pnbz) = rtrim(dbo.dokpozivbr.pnb)
			inner join dbo.dokstavka dstd on dbo.dokpozivbr.dokumid = dstd.dokumid
			inner join dbo.pozicija on dstd.pozicija = dbo.pozicija.sifra
			where  inserted.dokstavka is null and len(inserted.pnbz) > 1
				and dbo.dokpozivbr.pozivbrvrsta = 1 and dbo.pozicija.plac = 1 
				and dbo.dokstavka.analitikaid is null
				and dbo.dokstavka.iznos > 0 

		end

	

		update dbo.dokstavka
		set kontoid = dstd.kontoid, analitikaid = dstd.analitikaid
		from dbo.dokstavka
		inner join inserted on dbo.dokstavka.id = inserted.dokstavkaorg
		inner join dbo.dokstavka dstd on inserted.dokstavka = dstd.id
		inner join dbo.pozicija pozd on dstd.pozicija = pozd.sifra
		where dstd.kontoid > 0 
			and pozd.plac = 1 

	if exists (select * from  dbo.firma with(nolock) where naziv like 'avon%' )
	begin

		insert into dbo.aries_payment (id, accountnumber, payamount, transdate, sent)
		select inserted.dokstavkaorg, cast(rtrim(dbo.partner.sifra) as nchar (10)), 
			cast(dbo.dokstavka.iznos as nchar (15)), dbo.dokstavka.pozdatum, 
			(convert(smalldatetime,convert(varchar,getdate(),102)))
		from inserted
			inner join dbo.dokstavka on inserted.dokstavkaorg = dbo.dokstavka.id
			inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra
			inner join dbo.analitika on dbo.dokstavka.analitikaid = dbo.analitika.id
			inner join dbo.partner on dbo.analitika.vezaid = dbo.partner.partnerid
			inner join dbo.parmlm on dbo.partner.partnerid = dbo.parmlm.partnerid
			left outer join dbo.aries_payment on dbo.dokstavka.id = dbo.aries_payment.id
			left outer join dbo.aries_paymentarchive on dbo.dokstavka.id = dbo.aries_paymentarchive.id
		where dbo.analitika.analitikavrsta = 2 and dokstavka.dp = 0 
			and dbo.pozicija.zatvaranje = 1 
			and dbo.aries_payment.id is null
			and dbo.aries_paymentarchive.id is null
			and (dbo.dokstavka.protuid is null or dbo.dokstavka.protuid < 0)
	end

	if exists (select * from inserted where dokstavka > 0)
	begin

		if exists (select * from inserted where [dbo].[modokstavkarest] (inserted.dokstavka, 1) < 0)
		begin

		insert dbo.dokstavka 
		select dbo.dokstavka.dokumid, dbo.dokstavka.pozicija, 
			dbo.dokstavka.kontoid, dbo.dokstavka.analitikaid, 
			iznos = case when dbo.dokstavka.pozicija = 2993 
				then dstrest.rest * dbo.dokum.tecaj 
				else abs(dstrest.rest) * dbo.dokum.tecaj 
				end, 
			iznosval = case when dbo.dokstavka.pozicija = 2993 
				then dstrest.rest
				else abs(dstrest.rest)
				end, 

			dbo.dokstavka.pozdatum, dbo.dokstavka.dp, dbo.dokstavka.ps, 
			dbo.dokstavka.zk, dbo.dokstavka.ks, 
			pecat = case when dbo.dokstavka.pozicija = 2993 
					then 0	  
					else  dbo.dokstavka.pecat 
					end, 

			dbo.dokstavka.id 
		from inserted 
			inner join dbo.dokstavka on  inserted.dokstavkaorg = dbo.dokstavka.id
			inner join dbo.dokum on  dbo.dokstavka.dokumid = dbo.dokum.dokumid
			inner join dbo.dokstavka dokstavka_1 on inserted.dokstavka = dokstavka_1.id 
			inner join dbo.pozicija poz_1 on dokstavka_1.pozicija = poz_1.sifra 

			inner join (select dbo.dokstavka.id as dokstavkaid, 
						rest = case when max(dokum.tecaj) = 1 
							then isnull(max(abs(dbo.dokstavka.iznos)) - sum (abs(dokstavka_2.iznos)),max(dbo.dokstavka.iznos))
							else isnull(max(abs(dbo.dokstavka.iznosval)) - sum (abs(dokstavka_2.iznosval)), max(dbo.dokstavka.iznosval))
							end
					from dbo.dokum
						inner join dbo.dokstavka on dbo.dokum.dokumid = dbo.dokstavka.dokumid
						inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra
						left outer join dbo.dokstavkapop on dbo.dokstavka.id = dbo.dokstavkapop.dokstavka
						left outer join dbo.dokstavka dokstavka_2 on dbo.dokstavkapop.dokstavkaorg = dokstavka_2.id
					where dbo.pozicija.plac = 1
					group by dbo.dokstavka.id) 
			dstrest on dokstavka_1.id = dstrest.dokstavkaid
		where dstrest.rest < 0 
			and poz_1.plac = 1

		

		insert into [dbo].[glavknjiga]([dokstavkaid], [knjiga], [knjiga2], [dnevnik], [dnevnik2], [korisnikid], [gkperiod])
		select dokstavka_1.id, [knjiga], [knjiga2], [dnevnik], [dnevnik2], [korisnikid], [gkperiod]
		from inserted 
			inner join dbo.dokstavka on  inserted.dokstavkaorg = dbo.dokstavka.id
			inner join dbo.pozicija on  dbo.dokstavka.pozicija = dbo.pozicija.sifra
			inner join dbo.glavknjiga on dbo.dokstavka.id = dbo.glavknjiga.dokstavkaid
			inner join dbo.dokstavka dokstavka_1 on dbo.dokstavka.id = dokstavka_1.protuid			
		where dokstavka_1.protuid > 0 and pozicija.zatvaranje = 1 and dbo.glavknjiga.dokstavkaid > 0

		update dstki set
			dokumid = dstk.dokumid
		from inserted i
			inner join dbo.dokstavka dst on i.dokstavkaorg = dst.id
			inner join dbo.dokstavkaknjiga dstk on dst.id = dstk.dokstavkaid
			inner join dbo.dokstavka dsti on dst.id = dsti.protuid		
			inner join dbo.dokstavkaknjiga dstki on dsti.id = dstki.dokstavkaid
		where dstk.dokumid > 0

		update dbo.dokstavka
		set iznos = dbo.dokstavka.iznos - dokstavka_1.iznos, 
				iznosval = dbo.dokstavka.iznosval - dokstavka_1.iznosval
		from inserted 
			inner join dbo.dokstavka on  inserted.dokstavkaorg = dbo.dokstavka.id
			inner join dbo.pozicija on  dbo.dokstavka.pozicija = dbo.pozicija.sifra

			inner join dbo.dokstavka dokstavka_1 on dbo.dokstavka.id = dokstavka_1.protuid	
		where dokstavka_1.protuid > 0 and pozicija.zatvaranje = 1

		end

		update dbo.dokstart 
		set dbo.dokstart.placeno = 1
		from inserted
			inner join dbo.dokstavka on inserted.dokstavka = dbo.dokstavka.id
			inner join dbo.pozicija poz on dbo.dokstavka.pozicija = poz.sifra 
			inner join dbo.dokstart on dbo.dokstavka.dokumid = dbo.dokstart.id	
			inner join dbo.tbsaldodok() tbsaldodok on dbo.dokstart.id = tbsaldodok.id
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		where	dbo.dokvrsta.zatvaranje = 0 
			and poz.plac = 1 
			and tbsaldodok.saldo = 0 
		

		if exists (select * from inserted
					inner join dbo.dokstavka dokstavka_2 with(nolock) on inserted.dokstavkaorg = dokstavka_2.id
					inner join dbo.dokstavka dokstavka_1 with(nolock) on inserted.dokstavka = dokstavka_1.id
					inner join dbo.pozicija poz_1 with(nolock) on dokstavka_1.pozicija = poz_1.sifra 
					inner join dbo.dokum with(nolock) on dokstavka_1.dokumid = dbo.dokum.dokumid
					inner join dbo.pdvstatus with(nolock) on dbo.dokum.pdvstatus = dbo.pdvstatus.sifra
					inner join dbo.dokstavka dokstavka_3 with(nolock) on dokum.dokumid = dokstavka_3.dokumid
					inner join dbo.pozicija with(nolock) on dokstavka_3.pozicija = dbo.pozicija.sifra
				where  dbo.pdvstatus.datplac = 1 and dbo.pozicija.datumvrsta = 3 and poz_1.plac = 1) 
     		begin
			update dbo.dokstavka
			set pozdatum = dsplac.pozdatum 
			from (select dokstavka_3.id, dokstavka_2.pozdatum, restval
				from inserted
					inner join dbo.dokstavka dokstavka_2 on inserted.dokstavkaorg = dokstavka_2.id
					inner join dbo.dokstavka dokstavka_1 on inserted.dokstavka = dokstavka_1.id
					inner join dbo.pozicija poz_1 on dokstavka_1.pozicija = poz_1.sifra 
					inner join dbo.dokum on dokstavka_1.dokumid = dbo.dokum.dokumid
					inner join (select dbo.dokstavka.id as dokstavkaid,
							  restval = isnull(max(abs(dbo.dokstavka.iznosval)) - sum (abs(dokstavka_2.iznosval)), max(dbo.dokstavka.iznosval))
							from dbo.dokstavka
								inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra
								left outer join dbo.dokstavkapop on dbo.dokstavka.id = dbo.dokstavkapop.dokstavka
								left outer join dbo.dokstavka dokstavka_2 on dbo.dokstavkapop.dokstavkaorg = dokstavka_2.id
							where dbo.pozicija.plac = 1
							group by dbo.dokstavka.id) 
						dsrest on dokstavka_1.id = dsrest.dokstavkaid
					inner join dbo.pdvstatus on dbo.dokum.pdvstatus = dbo.pdvstatus.sifra
					inner join dbo.dokstavka dokstavka_3 on dokum.dokumid = dokstavka_3.dokumid
					inner join dbo.pozicija on dokstavka_3.pozicija = dbo.pozicija.sifra
				where  dbo.pdvstatus.datplac = 1 and dbo.pozicija.datumvrsta = 3 and poz_1.plac = 1) as dsplac
			where dbo.dokstavka.id = dsplac.id 
				and (dsplac.restval between -1 and 1) 
     		end

			update dbo.dokstavkaknjiga
			set opis = rtrim(dbo.dokvrsta.prefiks) + '-' + cast(dokstart.godina as nvarchar(4)) + '-' 
					+ rtrim(dokstart.broj) + ' (' + rtrim(isnull(dokstart.izvornik,'')) + ')'
			from inserted
				inner join dbo.dokstavka dokstavka_1 on inserted.dokstavka = dokstavka_1.id
				inner join dbo.pozicija poz_1 on dokstavka_1.pozicija = poz_1.sifra 
				inner join dbo.dokum on dokstavka_1.dokumid = dbo.dokum.dokumid
				inner join dbo.dokstart on dokstavka_1.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dbo.dokstavkaknjiga.dokstavkaid = inserted.dokstavkaorg
				and  (dbo.dokstavkaknjiga.opis is null or dbo.dokstavkaknjiga.opis = '')
				and poz_1.plac = 1 and poz_1.analitvrstadod > 0 
	end

	if exists (select inserted.dokstavkaorg from inserted 
			inner join deleted on inserted.dokstavkaorg = deleted.dokstavkaorg
		where inserted.dokstavka <> deleted.dokstavka or inserted.dokstavka is null)
	begin
		update dbo.dokstart set 
			dbo.dokstart.placeno = 0
		from deleted
		inner join dbo.dokstavka on deleted.dokstavka = dbo.dokstavka.id
		inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra 
		inner join dbo.dokstart on dbo.dokstavka.dokumid = dbo.dokstart.id	
		inner join  dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		where dbo.dokstart.placeno = 1 and dbo.dokvrsta.zatvaranje = 0 and dbo.pozicija.plac = 1
	end
end