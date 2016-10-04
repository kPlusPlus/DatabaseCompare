create trigger [dbo].[blagajna_itrig_analitika] on [dbo].[blagajna]
after insert not for replication
as

if exists (select * from inserted
			inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id
		 where dbo.cjelina.nivo <> 90) 
	begin
	raiserror 44447 n'

organization unit must have apropriate level!
origin: blagajna_itrig'
	rollback transaction
	end

if not exists(select * from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
		inner join dbo.analitika on dbo.cjelina.id = dbo.analitika.vezaid
	where dbo.analitika.analitikavrsta = 1)
and
not exists(select * from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
		inner join dbo.analitika on dbo.cjelina.id = dbo.analitika.vezaid
	where dbo.analitika.analitikavrsta = 5)
begin
	insert dbo.analitika (analitika, vezaid, analitikavrsta)
	select analitika = rtrim(inserted.naziv) + n' ' 
			+ rtrim(dbo.cjelina.sifra),
		vezaid = inserted.cjelinaid,
		analitikavrsta = 5
	from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
	where inserted.cjelinaid not in	(select analitika.vezaid from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
		inner join dbo.analitika on dbo.cjelina.id = dbo.analitika.vezaid
		where dbo.analitika.analitikavrsta = 1)and inserted.cjelinaid
		not in	(select analitika.vezaid from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
		inner join dbo.analitika on dbo.cjelina.id = dbo.analitika.vezaid
		where dbo.analitika.analitikavrsta = 5)
end

if exists(select * from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
		inner join dbo.analitika on dbo.cjelina.id = dbo.analitika.vezaid
	where dbo.analitika.analitikavrsta = 1)
begin
	update dbo.analitika
	set analitika = rtrim(inserted.naziv) + n' ' 
			+ rtrim(dbo.cjelina.sifra),
		vezaid = inserted.cjelinaid,
		analitikavrsta = 5
	from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
		inner join dbo.analitika on dbo.cjelina.id = dbo.analitika.vezaid
	where dbo.analitika.analitikavrsta = 1 
end