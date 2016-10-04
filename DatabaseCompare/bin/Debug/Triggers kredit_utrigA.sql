
create      trigger [kredit_utrig] on dbo.kredit 
for update
as

if exists(select * from inserted 
		inner join dbo.analitika on inserted.analitikaid = dbo.analitika.id where analitikavrsta not in (2,3))
begin
        		raiserror 44445 '

please select bank or partner

origin: kredit_utrig'
        		rollback transaction
end

if (select count(*) from  deleted
		inner join dbo.kamata on deleted.kamataid=dbo.kamata.id
		inner join dbo.kamateobstavka on dbo.kamata.id=dbo.kamateobstavka.kamataid 
		where deleted.kamataid=dbo.kamateobstavka.kamataid) >0
		begin
raiserror 44445 '

loan contract and payment plan 
exists for this credit!

origin: kredit_utrig'

        		rollback transaction
end

if exists(select * from inserted
		inner join dbo.kamata on inserted.kamataid=dbo.kamata.id
		where dbo.kamata.kamatavrsta=1)
begin
        		raiserror 44445 '

please chose another interest
which is not penalty interest!

origin: kredit_utrig'
        		rollback transaction
end

if update (partija)
	begin
		update dbo.analitika
		set analitika = kr.analitika
		from (select inserted.id, (rtrim(inserted.partija) + n' ' + rtrim(analitika.analitika)) as analitika
			from inserted 
				inner join dbo.analitika on inserted.analitikaid = dbo.analitika.id) kr
		where analitika.analitikavrsta = 31 and vezaid = kr.id
	end