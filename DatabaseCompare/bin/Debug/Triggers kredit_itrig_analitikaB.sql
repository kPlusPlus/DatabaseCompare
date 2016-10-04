create trigger [dbo].[kredit_itrig_analitika] on [dbo].[kredit]
after insert not for replication
as

if exists(select * from inserted 
		inner join dbo.analitika on inserted.analitikaid = dbo.analitika.id where analitikavrsta not in (2,3))
begin
        		raiserror 44445 '

please select bank or partner

origin: kredit_itrig_analitika'
        		rollback transaction
end

if exists(select * from inserted
		inner join dbo.kamata on inserted.kamataid=dbo.kamata.id
		where dbo.kamata.kamatavrsta=1)
begin
        		raiserror 44445 '

please chose another interest
which is not penalty interest!

origin: kredit_itrig_analitika'
        		rollback transaction
end

	insert into analitika (vezaid, analitika, analitikavrsta)
	select inserted.id, (rtrim(inserted.partija) + n' ' + rtrim(analitika.analitika)) as analitika, 31
	from inserted 
		inner join dbo.analitika on inserted.analitikaid = dbo.analitika.id