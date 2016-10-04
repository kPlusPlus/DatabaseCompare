create  trigger [dbo].[dogpad_iutrig] on [dbo].[dogpad] 
for insert, update
as

if exists(select * from inserted
				inner join dbo.dogadjaj on inserted.dogadjajid = dbo.dogadjaj.id
				inner join dbo.dogvrsta on dbo.dogadjaj.dogvrsta = dbo.dogvrsta.sifra  
			where len(inserted.odobrio) >= 2 and dogvrsta.odobrenje = 1)
begin
	if exists (select *  from inserted
				inner join dbo.dogadjaj on inserted.dogadjajid = dbo.dogadjaj.id
				inner join dbo.dogvrsta on dbo.dogadjaj.dogvrsta = dbo.dogvrsta.sifra 
				where len(inserted.odobrio) >= 2 and dogvrsta.odobrenje = 1
					and (suser_sname() not in (select top 1 verifikator 
										from dbo.verifikatori
										where rtrim(verifikator) = suser_sname()
											and verifvrsta = 251)
					or rtrim(inserted.odobrio) not in (select ime 
													from cfg.dbo.korisnik
													where rtrim(cfg.dbo.korisnik.loginname) = suser_sname())))
	begin
        raiserror 44445 '
	the record can''t be inserted or updated. 
	since there is no authorization permisions.
	origin: dogpad_iutrig'
		rollback transaction
	end
end