
create trigger radvrstedatum_iutrig on dbo.radvrstedatum
for insert, update  not for replication

as 

if exists (select * from inserted 
		inner join dbo.radvrstedatum on inserted.radvrsta = dbo.radvrstedatum.radvrsta
	where inserted.id <> dbo.radvrstedatum.id 
	and ((inserted.start >= dbo.radvrstedatum.start 
		and (inserted.start <= dbo.radvrstedatum.stop 
		or dbo.radvrstedatum.stop is null))
	or (inserted.stop >= dbo.radvrstedatum.start 
		and (inserted.stop <= dbo.radvrstedatum.stop 
		or dbo.radvrstedatum.stop is null )) 
	or (inserted.start <= dbo.radvrstedatum.start 
		and (inserted.stop >= dbo.radvrstedatum.stop
		or inserted.stop is null )) ))
begin
	raiserror 44447 n'
the record can''t be inserted updated. 
dates are overlapping.
origin: radvrstedatum_iutrig'
	rollback transaction
end