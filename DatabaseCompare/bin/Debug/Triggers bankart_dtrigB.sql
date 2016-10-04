create trigger [dbo].[bankart_dtrig] on [dbo].[bankart] 
for delete  not for replication

as

set nocount on

if exists(select * from deleted, dbo.analitika 
    where deleted.id = dbo.analitika.vezaid and dbo.analitika.analitikavrsta = 3)
	begin
		delete dbo.analitika 
		from deleted, dbo.analitika 
		where deleted.id = dbo.analitika.vezaid and dbo.analitika.analitikavrsta = 3
	end