create trigger [dbo].[dokpozivbr_utrig] on [dbo].[dokpozivbr]
after update
as

if exists(select * 
					from inserted i inner join deleted d on i.dokumid = d.dokumid and i.pozivbrvrsta = d.pozivbrvrsta 
					where d.pozivbrvrsta in (2,3,4) and i.pnb <> d.pnb)
begin
	        	raiserror 44445 '

	the post number
	can not be changed.
	delete and insert one instead.
	origin: dokpozivbr_utrig
'
	        	rollback transaction

end