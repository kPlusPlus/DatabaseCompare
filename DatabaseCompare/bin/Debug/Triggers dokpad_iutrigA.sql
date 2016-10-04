create  trigger [dbo].[dokpad_iutrig] on [dbo].[dokpad] 
for insert, update
not for replication
as
set nocount on

if exists (select * from inserted)
begin

	if exists(select * from inserted
					inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
					inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra  
				where len(inserted.odobrio) >= 2 and dokvrsta.odobrenje = 1)
	begin
		if exists (select *  from inserted
					inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
					inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 

					where len(inserted.odobrio) >= 2 and dokvrsta.odobrenje = 1
						and (suser_sname() not in (select top 1 verifikator 
											from dbo.verifikatori
											where rtrim(verifikator) = suser_sname()
												and verifvrsta = 250)
						or rtrim(inserted.odobrio) not in (select ime 
														from cfg.dbo.korisnik
														where rtrim(cfg.dbo.korisnik.loginname) = suser_sname())))
		begin
		raiserror 44445 '
		the record can''t be inserted or updated. 
		since there is no authorization permisions.
		origin: dokpad_itrig'
		rollback transaction
		end
	end
end