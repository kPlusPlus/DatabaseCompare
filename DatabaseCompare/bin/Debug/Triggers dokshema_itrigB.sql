create trigger [dbo].[dokshema_itrig] on [dbo].[dokshema]
after insert
as

if exists (select *  from inserted, dbo.konto where inserted.kontoid = konto.id 
		and (konto.analitikavrsta <> inserted.analitikavrsta and inserted.analitikavrsta <> 90 
		and inserted.analitikavrsta <> 0 and inserted.analitikavrsta <> 1 
		and inserted.analitikavrsta <> 4 and inserted.analitikavrsta <> 5))
	begin
        	raiserror 44445 '300569 
the record can''t be inserted. 
since type of analitic is diferent from type 
of analitic in konto.
origin: dokshema_itrig'
        	rollback transaction
	end

if exists(select * from inserted, dbo.dokshema 
	where inserted.vk = dbo.dokshema.vk 
	and inserted.pozicija = dbo.dokshema.pozicija 
	and inserted.kontoid = dbo.dokshema.kontoid 
	and inserted.analitikavrsta = dbo.dokshema.analitikavrsta 
	and inserted.dp = dbo.dokshema.dp  
	and inserted.pecat = dbo.dokshema.pecat 
	and inserted.ks = dbo.dokshema.ks
	and inserted.analitika3 = dbo.dokshema.analitika3 
	and inserted.kontoid > 0 
	and inserted.redbr <> dbo.dokshema.redbr)
	begin
        	raiserror 44445 '300570 
the record can''t be inserted. 
it generates duplicate records in shema!
origin: dokshema_itrig'
        	rollback transaction
	end

if exists(select * from inserted where inserted.ks = 1 and inserted.pozicija = 1150)
and exists (select * from inserted, dbo.dokshema where inserted.vk = dokshema.vk 
	and (dbo.dokshema.pozicija between 1152 and 1162 or dbo.dokshema.pozicija = 2010))
	begin
        	raiserror 44445 '300571 

the record can''t be inserted!
you can''t  have position 1150 ''ks=1'' when you are 
using positions 1152 - 1162 or 2010 

origin: dokshema_itrig'
        	rollback transaction
	end

if exists(select * from inserted where inserted.ks = 1 
	and (inserted.pozicija between 1152 and 1162 or inserted.pozicija = 2010))
and exists (select * from inserted, dbo.dokshema where inserted.vk = dokshema.vk 
	and dbo.dokshema.pozicija = 1150 and dbo.dokshema.ks = 1)
	begin
        	raiserror 44445 '300571 

the record can''t be inserted!
you can''t  have position 1150 ''ks=1'' when you are 
using positions 1152 - 1162 or 2010 

origin: dokshema_itrig'
        	rollback transaction
	end

	if exists (select *  from inserted 
			inner join dbo.dokvk on inserted.vk = dbo.dokvk.sifra 
			inner join dbo.dokvrsta on  dbo.dokvk.dokvrsta = dbo.dokvrsta.sifra 
		where dbo.dokvrsta.vrsta = 101 and inserted.ks = 1)
	begin
		raiserror 44445 '300572 

plan can''t have gl entry!
origin:  dokshema_itrig
'
        		rollback transaction
	end

	if exists (select *  from inserted 
			inner join dbo.dokvk on inserted.vk = dbo.dokvk.sifra 
			inner join dbo.dokvrsta on dbo.dokvk.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.dokvrstapredmet on dbo.dokvrsta.sifra = dbo.dokvrstapredmet.dokvrsta
			inner join dbo.dokvk dokvkpred on dbo.dokvrstapredmet.dokvrstapredmet = dokvkpred.dokvrsta
			inner join dbo.dokshema dokshemapred on dokvkpred.sifra = dokshemapred.vk
	where inserted.pozicija = 1252 and dokshemapred.pozicija = 1252)
	begin
		raiserror 44445 '300573 

possitin 1252 can be used only once
in documentation folder !
origin:  dokshema_itrig
'
        		rollback transaction
	end