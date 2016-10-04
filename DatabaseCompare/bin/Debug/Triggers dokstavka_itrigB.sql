create  trigger [dbo].[dokstavka_itrig] on [dbo].[dokstavka] 
for insert
not for replication
as
set nocount on

if exists (select * from inserted)
begin
	if exists (select * from inserted where iznos <> 0)
	begin

	if exists (select * from inserted 
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

			and (dsv.zatvaranje = 0 or isnull(inserted.protuid,0) = 0 or (dsv.zatvaranje > 0 and (select  [dbo].[sikorisnikhier] ()) < 3)))

			begin
    	    		raiserror 44445 n'
		
		the record can''t be inserted, 
		since exist in general ledger 
		or in payment or in specification 
		or in calculation or it is closed.
		origin: dokstavka_itrig'
      	  		rollback transaction
			end

	if exists (select * from inserted 
				inner join dbo.pozicija with(nolock) on  inserted.pozicija = dbo.pozicija.sifra 
			where (inserted.pozdatum < cast('19700101' as smalldatetime) 
			or inserted.pozdatum is null) 
			and ((pozicija.datumvrsta >0 or inserted.kontoid > 0)
				 and pozicija.datumvrsta <> 3)) 
		begin
		raiserror 44445 '

		the record can''t be added, business logic violation, 
		the position has wrong date or date missing !
		origin: dokstavka_itrig'
        		rollback transaction
		end

	if exists (select *  from inserted
			inner join dbo.dokstart with(nolock) on  inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		where dbo.dokvrsta.iznos = 0 and inserted.iznos < 0 and inserted.pozicija = 1000)
		begin
			raiserror 44445 '
		
		the value can''t be < 0, 
		document can''t have negative value !
		origin:  dokstavka_itrig'
        			rollback transaction
		end

		if exists (select *  from inserted
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dbo.dokvrsta.vrsta >= 100 and inserted.ks = 1)
		begin
			raiserror 44445 '

		plan can''t have gl entry!
		origin:  dokstavka_itrig'
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
		fixed assets is different
		from account in depreciation list !
		origin: dokstavka_itrig'
		rollback transaction
		end

			insert into dbo.dokstavkaknjiga (dokstavkaid, firmaid)
			select inserted.id, dokstart.firmaid
			from inserted 
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.pozicija on inserted.pozicija = dbo.pozicija.sifra
			where inserted.ks = 1 
				and (kontoid > 0 or pozicija.zatvaranje = 1) 
option (keepfixed plan)
	end

			insert into dbo.dokstavkapop (dokstavkaorg)
			select inserted.id from inserted 
				inner join dbo.pozicija on inserted.pozicija = dbo.pozicija.sifra
			where dbo.pozicija.zatvaranje = 1
option (keepfixed plan)

		if exists (select * from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dokvrsta.mp = 1)
		begin
		update dbo.dokstavkapop
		set dokstavka = dbo.dokstavka.id
		from inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
			inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra
			inner join dbo.dokstavkapop on inserted.id = dbo.dokstavkapop.dokstavkaorg
		where pozicija.plac = 1 and dokvrsta.mp = 1 and dokstavkapop.dokstavka is null
option (keepfixed plan)

		update dbo.dokstavkapop
		set dokstavka = dsp.dokstavka
		from inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.dokstavka on inserted.protuid = dbo.dokstavka.id
			inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra
			inner join dbo.dokstavkapop dsp on dbo.dokstavka.id = dsp.dokstavkaorg
			inner join dbo.dokstavkapop on inserted.id = dbo.dokstavkapop.dokstavkaorg
		where pozicija.zatvaranje = 1 and dokvrsta.mp = 1 and dokstavkapop.dokstavka is null
option (keepfixed plan)
	

		update dbo.dokstavkaknjiga
		set analitdodid = analitzat
		from inserted
			inner join dbo.dokstavka on inserted.id = dbo.dokstavka.id 
			inner join dbo.dokstavkaknjiga on dbo.dokstavka.id = dbo.dokstavkaknjiga.dokstavkaid
			inner join dbo.pozicija on dbo.dokstavka.pozicija = pozicija.sifra
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.list on dbo.dokstart.listid = dbo.list.id
			inner join dbo.listnad on dbo.list.listnadid = dbo.listnad.id
			inner join dbo.listvrstplac on dbo.listnad.listvrstplac = dbo.listvrstplac.sifra
					and dbo.pozicija.sifra = dbo.listvrstplac.pozicijazat 
		where  pozicija.zatvaranje = 1
			and pozicija.analitvrstadod > 0
			and listnad.skupdogadjaj = 13 
			and listvrstplac.pozicijaupis = 1 
option (keepfixed plan)
		end
end