
create trigger [dbo].[verifikacija_utrig] on  [dbo].[verifikacija] 
after update
as
set nocount on

if exists (select * from inserted)
begin

	if exists (	select * 
			from inserted i 
				inner join deleted d on i.id = d.id
				inner join dbo.verifvrsta vv on i.verifvrsta = vv.sifra
				inner join dbo.verifikatori vi on i.verificirao = vi.verifikator and vv.sifra = vi.verifvrsta
				inner join dbo.dokstart ds on i.dokumid = ds.id
				inner join dbo.dokvrstaverif dvv on vv.sifra = dvv.verifvrsta and ds.dokvrsta = dvv.dokvrsta
				inner join cfg.dbo.korisnik k on vi.verifikator = k.loginname
			where checksum(d.zatrazio, d.zatrazeno, d.verifvrsta, d.dokumid) <> checksum(i.zatrazio, i.zatrazeno, i.verifvrsta, i.dokumid) 
				or k.hierarchy < dvv.hierarchy
				or i.verificirao <> suser_sname() or d.verificirao is not null 
					) 
		begin 
			raiserror 44445 n'
		
	document can''t be verified
	due to verification rules violation.

	origin: verifikacija_utrig '
			rollback transaction
		end

	

	if exists(select * from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where inserted.verifvrsta between 2 and 3 
					and dokvrsta.zaliha = 1 and dokvrsta.bck = 1)
	begin

		update dbo.evidpad
		set karantena = 0
		from inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join (select dokvrsta,
							kvantkont = case when verifvrsta = 2 then 1 else 0 end,
							kvalitkont = case when verifvrsta = 3 then 1 else 0 end
						from dbo.dokvrstaverif) dvv on dbo.dokvrsta.sifra = dvv.dokvrsta
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
			inner join dbo.evidpad on dbo.evid.id = dbo.evidpad.evidid
			inner join dbo.dokstart ulka on dbo.dokstart.listid = ulka.listid 
								and dbo.dokstart.id < ulka.id
		where (ulka.knjizeno = 1 or ulka.zakljuceno = 1) 
			and evidpad.karantena = 1 
			and ((kvalitkont = 0 and kvantkont = 1 and inserted.verifvrsta = 2)
				or (kvalitkont = 1 and inserted.verifvrsta = 3))
			and dokvrsta.zaliha = 1 and dokvrsta.bck = 1
			and not(inserted.verificirao is null) 
			and inserted.verificirano >= evidpad.datumk 
			and ((asokatalog.sb = 1 and len(rtrim(evidpad.barcodeaso))>2 and len(rtrim(evidpad.barcodebach))>3)
			or (asokatalog.sb = 0 and len(rtrim(evidpad.barcodeaso))>3))
			and evid.kolicina2 = evidpad.kolicina 

			if exists(select * from inserted
							inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
							inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
							inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
							inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
							inner join dbo.evidpad on dbo.evid.id = dbo.evidpad.evidid
				where inserted.verifvrsta between 2 and 3 
					and dokvrsta.zaliha = 1 and dokvrsta.bck = 1
					and asokatalog.ulkontrola = 1 and evidpad.karantena = 0 
					and inserted.verificirano >= evidpad.datumk 
					and ((asokatalog.sb = 1 and (len(rtrim(evidpad.barcodeaso)) < 3 
						or len(rtrim(evidpad.barcodebach)) < 3))
					or (asokatalog.sb = 0 and len(rtrim(evidpad.barcodeaso)) < 3 )))
			begin
				raiserror 44445 n'
			
			verification impossible !!!
			some of items didn''t pass control
			according to their basic setings!!!
			origin: verifikacija_utrig '
				rollback transaction
			end
	end

	if exists(select * from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where inserted.verifvrsta = 20 
					and dokvrsta.zaliha = 1 and dokvrsta.bck = 1) 
	begin
		update dbo.evidpad
		set karantena = 0
		from inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
			inner join dbo.evidpad on dbo.evid.id = dbo.evidpad.evidid
		where inserted.verifvrsta = 20 
			and evidpad.karantena = 1 
			and dokvrsta.zaliha = 1 
			and not(inserted.verificirao is null)

	end

end