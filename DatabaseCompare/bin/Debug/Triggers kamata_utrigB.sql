create trigger [dbo].[kamata_utrig] on [dbo].[kamata]
after update
as

if (select count(*) from deleted 
				inner join dbo.kamateobstavka on deleted.id=dbo.kamateobstavka.kamataid
				where deleted.id = dbo.kamateobstavka.kamataid) <> 0
	begin
	raiserror 44447 '
the record can''t be changed. 
it was allready used in documents!.
origin: kamata_utrig'
	rollback transaction
	end