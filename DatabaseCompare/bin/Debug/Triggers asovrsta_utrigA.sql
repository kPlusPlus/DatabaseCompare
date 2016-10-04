create trigger asovrsta_utrig on dbo.asovrsta 
for update
as

if not exists(select * from inserted, dbo.asovrsta where inserted.vrstanad = dbo.asovrsta.sifra)
	begin
        		raiserror 44445 '
asovrsta_utrig(7): 
the record can''t be changed. 
since related records do not exist in table ''asovrsta'', 
referential integrity rules would be violated.
'
        		rollback transaction
	end