create trigger [dbo].[asovrsta_dtrig] on [dbo].[asovrsta] 
for delete
as

if ((select count(*) from deleted, dbo.asovrsta where deleted.sifra = dbo.asovrsta.vrstanad) <> 0)
	begin
        		raiserror 44445 '
asovrsta_dtrig(7): 
the record can''t be deleted. 
since related records exist in table ''asovrsta'', 
referential integrity rules would be violated.
origin:asovrsta_dtrig'
        		rollback transaction
	end