create  trigger tvsexpimp_itrig on dbo.tvsexpimp 
for insert
as

	if exists (select * from inserted 
			inner join dbo.tvsaction on inserted.tvsactionid = dbo.tvsaction.id
			where stuff(rtrim([name]),1,2,n'v') <> rtrim(objectname) )
	   	begin
		raiserror 44445 '
the record can''t be updated, 
referential integrity rules would be violated. 
link to detectives is wrong! '
        	rollback transaction
		end