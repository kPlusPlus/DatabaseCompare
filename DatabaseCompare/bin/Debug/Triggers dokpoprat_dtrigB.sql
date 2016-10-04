create trigger [dbo].[dokpoprat_dtrig] on [dbo].[dokpoprat]
after delete
as

if  exists (select * from deleted
			inner join dbo.dokstart ds on deleted.dokumid = ds.id
		 where ds.knjizeno = 1 or ds.zakljuceno = 1 or ds.placeno = 1 )
	begin
        	raiserror 44445 '

the record can''t be deleted
specification is closed!
origin: dokpoprat_dtrig'
         	rollback transaction
	end

if exists (select * from deleted
			inner join dbo.dokstart on deleted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		where dokvrsta.vrsta = 6)
begin
	delete dbo.dokstavka
	from deleted
		inner join dbo.dokstart on deleted.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.dokstavka on dbo.dokstart.id = dbo.dokstavka.dokumid
	where (dokvrsta.vrsta = 6 or dokvrsta.sifra = 98) and dokstavka.pozicija = 2800
end

	delete dbo.kamateobstavka 
	from deleted
		inner join dbo.kamateobstavka on deleted.id = dbo.kamateobstavka.dokpopratid

if exists (select * from deleted
			inner join dbo.dokstart on deleted.dokumid = dbo.dokstart.id
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			inner join dbo.evidpoprat on deleted.id = dbo.evidpoprat.dokpopid
		where evid.autoins = 1)
begin

		update dbo.evid 
		set autoins = 0
		from deleted
			inner join dbo.dokstart on deleted.dokumid = dbo.dokstart.id
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			inner join dbo.evidpoprat on deleted.id = dbo.evidpoprat.dokpopid
		where evid.autoins = 1 

		delete dbo.evid 
		from deleted
			inner join dbo.dokstart on deleted.dokumid = dbo.dokstart.id
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			inner join dbo.evidpoprat on deleted.id = dbo.evidpoprat.dokpopid
		where evid.autoins = 0

end

	delete dbo.dokpozivbr 
	from deleted
		inner join dbo.dokstart ds on deleted.dokumid = ds.id
		inner join dbo.dokpozivbr on deleted.dokpopratid = dbo.dokpozivbr.dokumid
	where ds.dokvrsta = 123 and dbo.dokpozivbr.modulpnb like n'ob' 
		and dbo.dokpozivbr.pozivbrvrsta = 4 and cast(rtrim(dbo.dokpozivbr.pnb) as int) = ds.id
