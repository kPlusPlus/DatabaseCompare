create  trigger osvrsta_utrig on dbo.osvrsta 
for update 
as

if exists (select * from inserted
	inner join dbo.os on inserted.id = dbo.os.osvrstaid 
	inner join dbo.osinventura on dbo.os.id = dbo.osinventura.osid)
		begin
		raiserror 44445 '
the record can''t be updated, 
fixed assets linked to this list starts depreciation !
origin: osvrsta_utrig'
	        	rollback transaction
		end