create       trigger [dbo].[cjenik_itrig] on [dbo].[cjenik] 
for insert
as

if exists (select * from inserted where inserted.osnovni = 1)
	and (select count(*) from dbo.cjenik where cjenik.osnovni = 1) > 1
	begin
		raiserror 44447 n'300460 
the record can''t be added. 
referential integrity rules require only one 
record can contain ''osnovni = 1'' in table ''cjenik''.

origin: cjenik_itrig'
		rollback transaction
	end

if exists (select * from inserted where inserted.cjenikvrsta = 100)
	and (select count(*) from dbo.cjenik where cjenik.cjenikvrsta = 100) > 1
	begin
		raiserror 44447 n'300461 
the record can''t be added. 
only one pricelist can be ''preliminary'' by type.

origin:cjenik_itrig'
		rollback transaction
	end

if exists (select * from inserted where inserted.web = 1)
	and (select count(*) from dbo.cjenik where cjenik.web = 1) > 1
	begin
		raiserror 44447 n' 
the record can''t be added. 
only one web pricelist can exists .

origin:cjenik_itrig'
		rollback transaction
	end

if exists (select * from inserted 
			inner join dbo.analitika on inserted.analitikaid = dbo.analitika.id
			inner join dbo.cjenikvrsta on inserted.cjenikvrsta = dbo.cjenikvrsta.sifra
		where cjenikvrsta.sifra = 1 
			and not(inserted.analitikaid is null) 
			and  analitikavrsta <> 2)
	begin
		raiserror 44447 n'300462 
the record can''t be inserted. 
business rules require dependence on supplier!

origin:cjenik_itrig'
		rollback transaction
	end

if (select count(*) from inserted 
			inner join dbo.cjenik on inserted.analitikaid = dbo.cjenik.analitikaid
			inner join dbo.analitika on inserted.analitikaid = dbo.analitika.id
			inner join dbo.cjenikvrsta on inserted.cjenikvrsta = dbo.cjenikvrsta.sifra
		where cjenikvrsta.sifra = 1 and  analitikavrsta = 2
		group by inserted.analitikaid) > 1
	begin
		raiserror 44447 n'300463 
the record can''t be inserted. 
this supplier already has pricelist!

origin:cjenik_itrig'
		rollback transaction
	end

if exists (select * from inserted 
			inner join dbo.analitika on inserted.analitikaid = dbo.analitika.id
			inner join dbo.cjenikvrsta on inserted.cjenikvrsta = dbo.cjenikvrsta.sifra
		where cjenikvrsta.sifra in (0,2) 
			and not(inserted.analitikaid is null) 
			and  analitikavrsta not in  (1,4,99))
	begin
		raiserror 44447 n'300464 
the record can''t be inserted. 
business rules require dependence on 
company or department or stock!

origin:cjenik_itrig '
		rollback transaction
	end

if exists (select * from inserted
				where inserted.start > inserted.stop)
	begin
		raiserror 44447 n'300465 
the record can''t be inserted. 
date violation occured ! 

origin: cjenik_itrig'
		rollback transaction
	end

if exists (select * from inserted
					inner join dbo.cjenik on inserted.cjenikvrsta = dbo.cjenik.cjenikvrsta 
					where inserted.primjmp = dbo.cjenik.primjmp 
						and inserted.primjmp = 1 and inserted.cjenikvrsta = 2
						and inserted.analitikaid is null and dbo.cjenik.analitikaid is null )

begin
		raiserror 44447 n'
the record can''t be inserted. 
business rules require dependence on analitics

origin: cjenik_itrig'
		rollback transaction
	end

	update dbo.cjenik 
	set tekst = rtrim(inserted.tekst) + n' (mp)'from inserted 
	where inserted.sifra = cjenik.sifra and inserted.primjmp = 1 and len(rtrim(inserted.tekst)) < 45

	update dbo.cjenik 
	set tekst = rtrim(inserted.tekst) + n' (vp)' from inserted 
	where inserted.sifra = cjenik.sifra and inserted.primjvp = 1 and len(rtrim(inserted.tekst)) < 45

	update dbo.cjenik 
	set tekst = rtrim(inserted.tekst) + n' (dev)' from inserted 
	where inserted.sifra = dbo.cjenik.sifra and inserted.primjdev = 1 and len(rtrim(inserted.tekst)) < 45
