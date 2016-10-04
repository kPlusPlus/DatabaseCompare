create trigger [dbo].[sklpj_utrig_analitika] on [dbo].[sklpj]
after update not for replication
as

if exists (select * from inserted
			inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id
		 where dbo.cjelina.nivo <> 80) 
	begin
	raiserror 44447 n'

organization unit must have apropriate level!
origin: sklpj_utrig_analitika'
	rollback transaction
	end

begin
	insert dbo.analitika (analitika, vezaid, analitikavrsta)
	select analitika = rtrim(dbo.cjelina.naziv) + n' ' 
			+ rtrim(dbo.cjelina.sifra) + n', ' 
			+ rtrim(dbo.sklvrsta.tekst),
		vezaid = inserted.cjelinaid,
		analitikavrsta = 4
	from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
		inner join dbo.sklvrsta on inserted.sklvrsta = dbo.sklvrsta.sifra
	where inserted.cjelinaid not in (select analitika.vezaid from dbo.analitika 
		where dbo.analitika.analitikavrsta in (1,4,5))
end

if exists(select * from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
		inner join dbo.analitika on dbo.cjelina.id = dbo.analitika.vezaid
	where dbo.analitika.analitikavrsta = 1)
begin
	update dbo.analitika
	set analitika = rtrim(dbo.cjelina.naziv) + n' ' 
			+ rtrim(dbo.cjelina.sifra) + n', ' 
			+ rtrim(dbo.sklvrsta.tekst),
		vezaid = inserted.cjelinaid,
		analitikavrsta = 4
	from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
		inner join dbo.analitika on dbo.cjelina.id = dbo.analitika.vezaid
		inner join dbo.sklvrsta on inserted.sklvrsta = dbo.sklvrsta.sifra
	where dbo.analitika.analitikavrsta = 1 and  inserted.cjelinaid not in 
		(select analitika.vezaid from dbo.analitika 
		where dbo.analitika.analitikavrsta in (4,5))
end

if exists(select * from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
		inner join dbo.analitika on dbo.cjelina.id = dbo.analitika.vezaid
	where dbo.analitika.analitikavrsta = 4)
begin
	update dbo.analitika
	set analitika = rtrim(dbo.cjelina.naziv) + n' ' 
			+ rtrim(dbo.cjelina.sifra) + n', ' 
			+ rtrim(dbo.sklvrsta.tekst),
		vezaid = inserted.cjelinaid,
		analitikavrsta = 4
	from inserted 
		inner join dbo.cjelina on inserted.cjelinaid = dbo.cjelina.id 
		inner join dbo.analitika on dbo.cjelina.id = dbo.analitika.vezaid
		inner join dbo.sklvrsta on inserted.sklvrsta = dbo.sklvrsta.sifra
	where dbo.analitika.analitikavrsta = 4 and  inserted.cjelinaid not in 
		(select analitika.vezaid from dbo.analitika 
		where dbo.analitika.analitikavrsta in (1,5))
end