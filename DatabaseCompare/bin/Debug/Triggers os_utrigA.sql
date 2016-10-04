
create        trigger [os_utrig] on dbo.os 
for update
as

if update (invbroj)
	begin
	update dbo.analitika
	set analitika = rtrim(inserted.invbroj) + ' ' + isnull(rtrim(inserted.naziv),'')
	from inserted inner join dbo.analitika on inserted.id = dbo.analitika.vezaid
	where ( dbo.analitika.analitikavrsta = 6)
	end

if exists (select * from inserted
			inner join dbo.os on inserted.id = dbo.os.id
			inner join dbo.osvrsta on dbo.os.osvrstaid = dbo.osvrsta.id 
		where  os.rashod < os.zaprimanje or  os.rashod is null
	or (osvrsta.amoperiod > -1 and os.rashod > dateadd(yyyy, osvrsta.amoperiod, os.zaprimanje)))
begin
update os
set rashod = case when osvrsta.amoperiod = -1 
			then dateadd(mm, 2, os.zaprimanje)
			else dateadd(yyyy, osvrsta.amoperiod, os.zaprimanje)
			end
from inserted
	inner join dbo.os on inserted.id = dbo.os.id
	inner join dbo.osvrsta on dbo.os.osvrstaid = dbo.osvrsta.id 
where os.rashod < inserted.zaprimanje or  inserted.rashod is null
	or (osvrsta.amoperiod > -1 and os.rashod > dateadd(yyyy, osvrsta.amoperiod, os.zaprimanje))
end

if exists (select * from inserted
		inner join deleted on inserted.id = deleted.id
		inner join dbo.analitika on inserted.id = dbo.analitika.vezaid and dbo.analitika.analitikavrsta = 6
		inner join dbo.dokstavka on dbo.analitika.id = dbo.dokstavka.analitikaid
		inner join dbo.dokstart on dbo.dokstavka.dokumid = dbo.dokstart.id 
	where dbo.dokstart.dokvrsta = 51 
	and ( inserted.zaprimanje <> deleted.zaprimanje 
		or inserted.radsmjena <> deleted.radsmjena))
		begin
		raiserror 44445 '
the record can''t be updated, 
fixed assets starts depreciation !
origin: os_utrig'
	        	rollback transaction
		end