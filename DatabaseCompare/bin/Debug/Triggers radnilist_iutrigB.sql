create trigger [dbo].[radnilist_iutrig] on [dbo].[radnilist]
after insert, update
as
set nocount on

if exists (
	select id from inserted where datumod > datumdo or 
													(datumod = datumdo and caltimeod > caltimedo)
	)
begin
	        	raiserror 44445 '

date & time to must be greater or equal then date & time from.
origin:  radnilist_iutrig'
        	rollback transaction
end