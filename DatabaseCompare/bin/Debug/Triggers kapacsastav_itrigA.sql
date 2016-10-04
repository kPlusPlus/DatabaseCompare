create      trigger [dbo].[kapacsastav_itrig] on [dbo].[kapacsastav] 
for insert
not for replication
as

if (select count (*) from inserted
		inner join dbo.kapacitet on inserted.kapacitetid = dbo.kapacitet.id
		inner join dbo.kapacsastav on inserted.kapacitetid = dbo.kapacsastav.kapacitetid 
		where  dbo.kapacitet.kapacvrsta in (0,1,2,3,4,30,50,51,52,101)) > 1
begin
raiserror 44445 '

kapacsastav_itrig: 
this type of resources can''t have
more than one analitical detail.
origin:kapacsastav_itrig'
rollback transaction
end

if exists(select * from inserted, dbo.kapacitet, dbo.analitika where inserted.kapacitetid  = dbo.analitika.vezaid 
		and dbo.analitika.analitikavrsta = 90 and inserted.analitikaid = dbo.analitika.id)
begin
raiserror 44445 '

kapacsastav_itrig: 
resource can''t have it self
for analitical detail.
origin:kapacsastav_itrig'
rollback transaction
end