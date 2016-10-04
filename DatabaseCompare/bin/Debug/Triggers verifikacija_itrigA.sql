
create   trigger [dbo].[verifikacija_itrig] on  [dbo].[verifikacija] 
for insert
as
set nocount on

if exists (select * from inserted)
begin

	if exists (
		select * 
		from inserted i
			inner join dbo.dokstart ds on i.dokumid = ds.id
			inner join dbo.dokvrstaverif dvv on i.verifvrsta = dvv.verifvrsta and ds.dokvrsta = dvv.dokvrsta			
		where not(i.verificirao is null) and not(i.verificirano is null) 
			and i.zatrazio <> suser_sname() 
			
	)
	begin
		raiserror 44445 n'

	document verification request 
	rules violation!
	origin: verifikacija_itrig'
		rollback transaction
	end

	if exists(select * from inserted
				inner join dbo.verifikacija on inserted.verifvrsta = dbo.verifikacija.verifvrsta
							and inserted.dokumid = dbo.verifikacija.dokumid
			where inserted.id <> verifikacija.id
				and verifikacija.verifvrsta not in (2,3, 44, 49)) 
	begin
	raiserror 44445 n'

	this type of verification allready 
	exist in this document!
	origin: verifikacija_itrig'
	rollback transaction
	end

end