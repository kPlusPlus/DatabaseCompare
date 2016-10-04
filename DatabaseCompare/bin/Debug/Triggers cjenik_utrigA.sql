create     trigger [dbo].[cjenik_utrig] on [dbo].[cjenik] 
for update
as

		if (select count(*) from cjenik where osnovni = 1) <> 1
		begin
		raiserror 44447 n'300466 
the record can''t be changed. 
referential integrity rules require one 
record for "osnovni = 1" in table ''cjenik''.

origin: cjenik_utrig'

		rollback transaction
		end

		if (select count(*) from cjenik where cjenikvrsta = 100) > 1
		begin
		raiserror 44447 n'300467 
the record can''t be changed. 
only one pricelist can be ''preliminary'' by type.

origin: cjenik_utrig'
		rollback transaction
		end

if exists (select * from inserted where inserted.web = 1)
	and (select count(*) from dbo.cjenik where cjenik.web = 1) > 1
	begin
		raiserror 44447 n' 
the record can''t be updated. 
only one web pricelist can exists .

origin:cjenik_utrig'
		rollback transaction
	end

if exists (select * from inserted 
			inner join dbo.analitika on inserted.analitikaid = dbo.analitika.id
			inner join dbo.cjenikvrsta on inserted.cjenikvrsta = dbo.cjenikvrsta.sifra
		where cjenikvrsta.sifra = 1 
			and not(inserted.analitikaid is null) 
			and  analitikavrsta <> 2)
	begin
		raiserror 44447 n'300468 
the record can''t be updated. 
business rules require dependence on supplier!

origin: cjenik_utrig'
		rollback transaction
	end

if (select count(*) from inserted 
			inner join dbo.cjenik on inserted.analitikaid = dbo.cjenik.analitikaid
			inner join dbo.analitika on inserted.analitikaid = dbo.analitika.id
			inner join dbo.cjenikvrsta on inserted.cjenikvrsta = dbo.cjenikvrsta.sifra
		where cjenikvrsta.sifra = 1 and  analitikavrsta = 2
		group by inserted.analitikaid) > 1
	begin
		raiserror 44447 n'300469 
the record can''t be updated. 
this supplier already has pricelist!

origin: cjenik_utrig'
		rollback transaction
	end

if exists (select * from inserted 
			inner join dbo.analitika on inserted.analitikaid = dbo.analitika.id
			inner join dbo.cjenikvrsta on inserted.cjenikvrsta = dbo.cjenikvrsta.sifra
		where cjenikvrsta.sifra in (0,2) 
			and not(inserted.analitikaid is null) 
			and  analitikavrsta not in  (1,4,99))
	begin
		raiserror 44447 n'300470 
the record can''t be updated. 
referential integrity rules require dependence on 
company or department or stock!

origin: cjenik_utrig'
		rollback transaction
	end

if exists (select * from inserted 
			inner join dbo.list on inserted.sifra = dbo.list.cjenik
		where checksum(sifra, inserted.analitikaid, primjvp, primjmp, primjdev, cjenikvrsta)
			<> checksum(sifra, inserted.analitikaid, primjvp, primjmp, primjdev, cjenikvrsta))
	begin
		raiserror 44447 n'300471 
the record can''t be updated after usage in documents!

origin: cjenik_utrig'
		rollback transaction
	end

if exists (select * from inserted
				where inserted.start > inserted.stop)
	begin
		raiserror 44447 n'300472 
the record can''t be updated. 
date violation occured ! 

origin: cjenik_utrig'
		rollback transaction
	end

if exists (select * from inserted
					inner join dbo.cjenik on inserted.cjenikvrsta = dbo.cjenik.cjenikvrsta 
					where inserted.primjmp = dbo.cjenik.primjmp 
						and inserted.primjmp = 1 and inserted.cjenikvrsta = 2
						and inserted.analitikaid is null and dbo.cjenik.analitikaid is null
						and inserted.sifra <> dbo.cjenik.sifra )

begin
		raiserror44447 n'
the record can''t be inserted. 
business rules require dependence on analitics

origin: cjenik_utrig'
		rollback transaction
	end

set ansi_nulls off