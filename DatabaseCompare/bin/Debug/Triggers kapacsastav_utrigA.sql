create   trigger [kapacsastav_utrig] on [dbo].[kapacsastav] 
for insert
not for replication
as

if exists(select * from inserted, dbo.kapacitet, dbo.analitika where inserted.kapacitetid  = dbo.analitika.vezaid 
		and dbo.analitika.analitikavrsta = 90 and inserted.analitikaid = dbo.analitika.id)
begin
raiserror 44445 '

kapacsastav_itrig: 
resource can''t have it self
for analitical detail.
'
rollback transaction
end