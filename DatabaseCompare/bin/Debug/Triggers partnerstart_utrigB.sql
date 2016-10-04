create trigger [dbo].[partnerstart_utrig] on [dbo].[partnerstart]
after update not for replication
as

if exists (select * from inserted
					left outer join dbo.partner on inserted.id = dbo.partner.partnerid 
					left outer join dbo.analitika on inserted.id = dbo.analitika.vezaid and dbo.analitika.analitikavrsta = 2
					where dbo.analitika.vezaid is null )
begin					
	insert into dbo.analitika (analitika, vezaid, analitikavrsta, analitikavrstapod)
	select 
	analitika = case when dbo.partner.partnerid > 0 
					 then rtrim(inserted.naziv) + n' ' + rtrim(partner.sifra) + n' ' +
							case when len(partner.poreznibroj) < 13  
								then rtrim(partner.poreznibroj)
								else n' *** '
								end	
					 else 
					 rtrim(inserted.naziv)
					 end,
	inserted.id, 2,
	analitikavrstapod = case when inserted.radnik = 1 then 201 
								when inserted.suradnik = 1 then 202
								else null end
	from inserted
	left outer join dbo.partner on inserted.id = dbo.partner.partnerid 
	left outer join dbo.analitika on inserted.id = dbo.analitika.vezaid and dbo.analitika.analitikavrsta = 2
	where dbo.analitika.vezaid is null 

end

if exists (select * from inserted
					inner join dbo.partner on inserted.id = dbo.partner.partnerid
					where dbo.partner.parveza is null )
begin
	update dbo.partner
	set parveza = inserted.id
	from inserted, dbo.partner 
	where inserted.id = partner.partnerid and partner.parveza is null

end

update dbo.analitika 
set analitika = case when dbo.partner.partnerid > 0 
					then rtrim(rtrim(inserted.naziv) + n' ' + rtrim(partner.sifra) + n' ' + 
							case when len(partner.poreznibroj) < 13  
								then rtrim(partner.poreznibroj)
								else n' *** '
								end)
					else 
					rtrim(inserted.naziv)
					end,
	analitikavrstapod = case when inserted.radnik = 1 then 201 
							when inserted.suradnik = 1 then 202
							else null end

from inserted
inner join dbo.analitika on inserted.id = dbo.analitika.vezaid 
left outer join dbo.partner on inserted.id = dbo.partner.partnerid
where dbo.analitika.analitikavrsta = 2

	if exists (
			select * 
			from inserted i
				inner join dbo.analitika a with (nolock) on i.id = a.vezaid and a.analitikavrsta = 2
				inner join dbo.prikljucak pr with (nolock)  on a.id = pr.analitikaid
		)

		update dbo.prikljucak 
		set koristi = koristi
		from inserted
			inner join dbo.analitika on inserted.id = dbo.analitika.vezaid and dbo.analitika.analitikavrsta = 2
			inner join dbo.prikljucak on dbo.analitika.id = dbo.prikljucak.analitikaid

if exists (select * from inserted where (inserted.kontrola = 1 and inserted.azuriranje = 1))
begin

	if exists (select * from inserted where inserted.osoba = 1)
	begin
		if not exists (select * from inserted, dbo.parosoba
		where inserted.id = dbo.parosoba.partnerid)
		begin
		raiserror 44447 n'300445

	the record can''t be updated. 
	partner is person without personal data.
	origin: partnerstart_utrig
'
		rollback transaction
		end
	end

	if not exists (select * from inserted, dbo.paradresa
	where paradresa.partnerid = inserted.id)
	begin
	raiserror 44447 n'

	the record can''t be updated.
	partner must have at least one address.
	origin: partnerstart_utrig
'
	rollback transaction
	end

	if exists (select * from inserted where inserted.suradnik = 1) 
	begin
	if not exists (select * from inserted, dbo.parmlm, dbo.racun, dbo.analitika
	where inserted.id = dbo.parmlm.partnerid and inserted.id = dbo.analitika.vezaid
		and dbo.analitika.analitikavrsta = 2 and dbo.analitika.id = dbo.racun.analitikaid 
		and inserted.suradnik = 1)
	begin
	raiserror 44447 n'

	the record can''t be updated. 
	partner is mlm without mlm data.
	origin: partnerstart_utrig
'
	rollback transaction
	end
	end

	if exists (select * from inserted where inserted.radnik = 1 or inserted.suradnik = 1)
	begin
	if not exists(
			select * 
			from inserted
				inner join dbo.analitika a on inserted.id = a.vezaid and a.analitikavrsta = 2
				inner join  dbo.racun rac on a.id = rac.analitikaid
				inner join dbo.radraspored rr on inserted.id = rr.partnerid
				left outer join dbo.radnik r on inserted.id = r.partnerid
			where (inserted.radnik = 1 or inserted.suradnik = 1)
				and (not r.partnerid is null or inserted.radnik = 0)
		)
	begin
	raiserror 44447 n'

	the record can''t be updated. 
	partner is employee without employee data.
	origin: partnerstart_utrig
'
	rollback transaction
	end
	end

	if exists (select id from inserted where inserted.radnik = 0 and inserted.suradnik = 0)
	begin
		if exists (select inserted.id from inserted inner join dbo.radraspored on inserted.id = dbo.radraspored.partnerid
								where inserted.radnik = 0 and inserted.suradnik = 0)
				or exists (select inserted.id from inserted inner join dbo.radnik on inserted.id = dbo.radnik.partnerid
								where inserted.radnik = 0) 

		begin
			raiserror 44447 n'

	the record can''t be updated. 
	partner is non-employee or non-associate with employee or associate data.
	origin: partnerstart_utrig
'
			rollback transaction
		end
	end

	if exists(select * from inserted where inserted.formalni = 1 
		and inserted.radnik = 0 and inserted.suradnik = 0 )
	begin

		if not exists(select * from inserted, dbo.analitika, dbo.racun
		where inserted.id = dbo.analitika.vezaid 
			and dbo.analitika.analitikavrsta = 2 and dbo.analitika.id = dbo.racun.analitikaid 
			and inserted.formalni = 1 and inserted.radnik = 0 and inserted.suradnik = 0
			and dbo.racun.racunnamjena = 1)
		begin
			insert dbo.racun (
				[analitikaid]
				,[racunvrsta]
				,[racunnamjena]
				,[redbr]
				,[bankartid]
				,[racun]
				,[iban]
				,[koristi]				
			)
			select top 1
				a.id
				,1
				,1 
				,1
				,b.id
				,null
				,null
				,1
			from inserted i
				inner join dbo.analitika a on i.id = a.vezaid and a.analitikavrsta = 2
				left outer join dbo.racun r on a.id = r.analitikaid and r.racunnamjena = 1
				cross join dbo.bankart b 
			where b.sifra =  0 and
				i.formalni = 1 and i.radnik = 0 and i.suradnik = 0 and r.id is null

		end

		if not exists(select * from inserted, dbo.partner, dbo.analitika, dbo.racun
		where inserted.id = dbo.partner.partnerid and dbo.partner.partnerid = dbo.analitika.vezaid 
			and dbo.analitika.analitikavrsta = 2 and dbo.analitika.id = dbo.racun.analitikaid 
			and inserted.formalni = 1 and inserted.radnik = 0 and inserted.suradnik = 0
			and dbo.racun.racunnamjena = 1)
		begin
		raiserror 44447 n'

	the record can''t be updated. 
	partner is "formal" without formal data...
	... status or account data.
	origin: partnerstart_utrig
'
		rollback transaction
		end
	end

	update partnerstart
	set kontrola = 0, azuriranje = 0 
	from inserted, dbo.partnerstart where dbo.partnerstart.id = inserted.id

end