create trigger [bankart_dtrig] on dbo.bankart 
for delete  not for replication

as

set nocount on

if (select count(*) 
    from deleted, analitika 
    where (deleted.id = analitika.vezaid and analitika.analitikavrsta = 3)) > 0
	begin
	delete [analitika] 
	from analitika, deleted 
	where analitika.vezaid = deleted.id and analitikavrsta = 3
	end