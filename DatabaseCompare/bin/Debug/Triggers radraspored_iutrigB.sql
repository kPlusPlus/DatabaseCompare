create trigger [dbo].[radraspored_iutrig] on [dbo].[radraspored]
after insert, update not for replication
as

if exists (
		select * from inserted where start < '19500101'
	)
	begin
		raiserror 44447 n'
		
		the record can''t be inserted or updated. 
		start date is to old.
		origin: radraspored_iutrig
		'
		rollback transaction
	end

if exists (select * from inserted)
begin 

	if exists ( 
			select *
			from inserted i
			where ((i.raspored > 50 and i.raspored < 100) or i.raspored >= 200)
		) and suser_sname() <> n'nlab'
	begin
			update rru set

				stop = 
					case when i.raspored >= 200 and i.start <> i.stop then i.start
					else dateadd(d,	-1, i.start)
					end
			from inserted i
				left outer join deleted d on i.id = d.id
				inner join dbo.analitfirma af on i.analitikaid = af.analitikaid
				left outer join ( 
						select 
							rr.id, 
							rr.partnerid,
							rr.stop,
							af.firmaid
						from dbo.radraspored rr
							inner join dbo.analitfirma af on rr.analitikaid = af.analitikaid							
						where rr.raspored < 100 
					) rrpt on i.partnerid = rrpt.partnerid and rrpt.id <> i.id
										and (rrpt.stop = dateadd(d,	-1, d.start) 
										or rrpt.stop is null) 
										and af.firmaid = rrpt.firmaid 
				left outer join dbo.radraspored rru on rrpt.id = rru.id
			where ((i.raspored > 50 and i.raspored < 100) or i.raspored >= 200) and (rrpt.id <> i.id) and (i.stop is null or i.raspored >= 200)
				 and not rru.id is null 

	end

	if exists (select * from inserted i where i.raspored >= 200 and (i.stop is null or i.start <> i.stop)) and suser_sname() <> n'nlab'
	begin
		update rr set
			stop = rr.start
		from inserted i
			inner join dbo.radraspored rr on i.id = rr.id
		where i.raspored >= 200 and (i.stop is null or i.start <> i.stop)
	end

	update r set
		stazgodina = isnull(rr.stazgodina, 0)
		,stazmjeseci = isnull(rr.stazmjeseci, 0)
		,stazdana = isnull(rr.stazdana, 0)
	from inserted i
		inner join dbo.radnik r on i.partnerid = r.partnerid
		inner join dbo.analitika a on i.partnerid = a.vezaid and a.analitikavrsta = 2
		inner join dbo.analitfirma af on a.id = af.analitikaid
		inner join ( 
				select
					partnerid,
					max(start) maxstart
				from dbo.radraspored rr
					inner join dbo.analitfirma af on rr.analitikaid = af.analitikaid
				where rr.raspored < 51
				group by rr.partnerid
			) rrmd on i.partnerid = rrmd.partnerid 
		inner join dbo.radraspored rr on i.partnerid = rr.partnerid and rr.raspored < 51 and rrmd.maxstart = rr.start
		inner join dbo.analitfirma afrr on rr.analitikaid = afrr.analitikaid and af.firmaid = afrr.analitikaid
	where checksum(r.stazgodina, r.stazmjeseci, r.stazdana) <> checksum(rr.stazgodina, rr.stazmjeseci, rr.stazdana)

	if exists (
			select *
			from inserted i
				inner join deleted d on i.id = d.id
			where (i.raspored not between 51 and 99 and d.raspored between 51 and 99)	
				or (i.raspored >= 51 and d.raspored < 51) 
				or (i.raspored < 200 and d.raspored >= 200) 
				or (i.raspored not between 100 and 199 and d.raspored between 100 and 199) 
		)	and suser_sname() <> n'nlab'
	begin
		raiserror 44447 n'300687
		
		the record can''t be updated. 
		wrong type of schedule.
		origin: radraspored_iutrig
		'
		rollback transaction
	end

	if exists (select dbo.radraspored.partnerid from inserted 
				inner join dbo.analitfirma afi on inserted.analitikaid = afi.analitikaid
				inner join dbo.radraspored on inserted.partnerid = dbo.radraspored.partnerid 
				inner join dbo.analitfirma afrr on dbo.radraspored.analitikaid = afrr.analitikaid and afi.firmaid = afrr.firmaid
			where 
				(dbo.radraspored.stop is null or  dbo.radraspored.stop < '19500101') 
				and (dbo.radraspored.raspored < 100 or dbo.radraspored.raspored >= 200)
			group by dbo.radraspored.partnerid
			having count(distinct radraspored.id) > 1)
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
			inner join dbo.analitfirma af on inserted.analitikaid = af.analitikaid
			inner join dbo.radraspored on inserted.partnerid = dbo.radraspored.partnerid
			inner join dbo.analitfirma afrr on dbo.radraspored.analitikaid = afrr.analitikaid and af.firmaid = afrr.firmaid
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
			inner join dbo.analitfirma af on inserted.analitikaid = af.analitikaid
			inner join dbo.radraspored on inserted.partnerid = dbo.radraspored.partnerid
			inner join dbo.analitfirma afrr on dbo.radraspored.analitikaid = afrr.analitikaid and af.firmaid = afrr.firmaid
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

	if exists (
			select *
			from inserted i
				left outer join dbo.radraspored rr on i.partnerid = rr.partnerid and (i.id <> rr.id) and rr.raspored < 100  

																							and (i.start = dateadd(d, 1, rr.stop) or rr.stop is null)
																								
			where (i.raspored between 51 and 99 or i.raspored >= 200) 
				and rr.id is null 
		)

	begin
		raiserror 44447 n'300686
		
		the record can''t be inserted or updated. 
		previous schedule is required
		for consistent chain of chedules.
		origin: radraspored_iutrig
	'
		rollback transaction
	end
end 