
create      trigger [dbo].[radraspored_iutrig] on [dbo].[radraspored]
for insert, update  not for replication

as 

if exists (select dbo.radraspored.partnerid from inserted 
			inner join dbo.radraspored on inserted.partnerid = dbo.radraspored.partnerid 
		where inserted.id <> dbo.radraspored.id
			and dbo.radraspored.stop is null or  dbo.radraspored.stop < '19500101' 
			and (dbo.radraspored.raspored < 100 or dbo.radraspored.raspored >= 200)
		group by dbo.radraspored.partnerid
		having count(radraspored.id) > 1)
begin
	raiserror 44447 n'
	
	the record can''t be inserted or updated. 
	there are schedules without stop date.
	origin: radraspored_iutrig
	'
	rollback transaction
end

if exists(select * from inserted 

	where inserted.raspored between 101 and 199 
		and (inserted.stop is null or inserted.stop < '19500101'))
begin
	raiserror 44447 n'
	
	the record can''t be inserted or updated. 
	temporary schedules must have stop date.
	origin: radraspored_iutrig
	'
	rollback transaction
end

if exists (select * from inserted 
		inner join dbo.radraspored on inserted.partnerid = dbo.radraspored.partnerid
	where inserted.id <> dbo.radraspored.id 
	and (dbo.radraspored.raspored < 100 or dbo.radraspored.raspored >= 200) 
	and ((inserted.start >= dbo.radraspored.start 
		and (inserted.start <= dbo.radraspored.stop 
		or dbo.radraspored.stop is null 
		or  dbo.radraspored.stop < '19500101'))
	or (inserted.stop >= dbo.radraspored.start 
		and (inserted.stop <= dbo.radraspored.stop 
		or dbo.radraspored.stop is null 
		or  dbo.radraspored.stop < '19500101')) 
	or (inserted.start <= dbo.radraspored.start 
		and (inserted.stop >= dbo.radraspored.stop
		or inserted.stop is null 
		or dbo.radraspored.stop < '19500101')) ))
or exists (select * from inserted 
		inner join dbo.radraspored on inserted.partnerid = dbo.radraspored.partnerid
	where inserted.id <> dbo.radraspored.id and inserted.raspored = 100 and dbo.radraspored.raspored = 100	
	and ((inserted.start >= dbo.radraspored.start 
		and (inserted.start <= dbo.radraspored.stop 
		or dbo.radraspored.stop is null 
		or  dbo.radraspored.stop < '19500101'))
	or (inserted.stop >= dbo.radraspored.start 
		and (inserted.stop <= dbo.radraspored.stop 
		or dbo.radraspored.stop is null 
		or  dbo.radraspored.stop < '19500101')) 
	or (inserted.start <= dbo.radraspored.start 
		and (inserted.stop >= dbo.radraspored.stop
		or inserted.stop is null 
		or dbo.radraspored.stop < '19500101')) ))
begin
	raiserror 44447 n'
	
	the record can''t be inserted or updated. 
	schedules are overlapping.
	origin: radraspored_iutrig
	'
	rollback transaction
end