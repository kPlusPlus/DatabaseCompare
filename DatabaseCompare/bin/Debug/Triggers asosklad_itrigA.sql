create    trigger [dbo].[asosklad_itrig] on [dbo].[asosklad]
for insert not for replication

as

set nocount on

if exists(select * from inserted
			inner join dbo.analitika on inserted.analitsklid = dbo.analitika.id
		where analitika.analitikavrsta <> 4) 	
	begin
	raiserror 44447 '
the record can''t be inserted. 
this analitics is not inventory!
origin: asosklad_itrig'
	rollback transaction
	end