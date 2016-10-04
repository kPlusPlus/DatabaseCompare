create trigger [dbo].[asosklad_itrig] on [dbo].[asosklad]
after insert not for replication

as
set nocount on

if exists (select * from inserted)
begin

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

	if exists(select * from inserted
			where inserted.minzal <> 0)
	begin
		update dbo.asortiman
		set minimum = isnull(asm.minzal, dbo.asortiman.minimum)
		from dbo.asortiman 
			inner join (select distinct inserted.asortid, sum(inserted.minzal) as minzal 
						from inserted
							inner join dbo.analitika on inserted.analitsklid = dbo.analitika.id
							inner join dbo.sklpj on dbo.analitika.vezaid = dbo.sklpj.cjelinaid
						where analitika.analitikavrsta = 4 and sklpj.oscm = 1
						group by inserted.asortid) asm
				on dbo.asortiman.id = asm.asortid
		where asortiman.minimum <> isnull(asm.minzal, dbo.asortiman.minimum)
	end

end