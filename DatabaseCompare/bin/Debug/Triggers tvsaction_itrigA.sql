create trigger tvsaction_itrig on dbo.tvsaction 
for insert
as

if (select count(*) from inserted) > 0
	begin
	if exists (select * from inserted inner join dbo.tvsaction on inserted.id = dbo.tvsaction.id   
			left outer join cfg.dbo.tvstructure on tvsaction.code = cfg.dbo.tvstructure.code
			where cfg.dbo.tvstructure.code is null)
	   	begin
		raiserror 44445 '
the record can''t be inserted, 
referential integrity rules would be violated. 
inserted.code do not exist in table tvstructure! '
        	rollback transaction
		end
	end