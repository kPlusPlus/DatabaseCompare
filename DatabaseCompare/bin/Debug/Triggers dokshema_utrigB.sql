create trigger [dbo].[dokshema_utrig] on [dbo].[dokshema]
after update
as

if exists (select *  from inserted 
		inner join dbo.konto on inserted.kontoid = dbo.konto.id 
		where (konto.analitikavrsta <> inserted.analitikavrsta and inserted.analitikavrsta <> 90 
		and inserted.analitikavrsta <> 0 and inserted.analitikavrsta <> 1 
		and inserted.analitikavrsta <> 4 and inserted.analitikavrsta <> 5))
	begin
        	raiserror 44445 n'
the record can''t be updated. 
since type of analitic is diferent from type of analitic in konto.
origin: dokshema_utrig'
        	rollback transaction
	end

if update (kontoid)
and  (select count(*)  from inserted
			inner join dbo.dokshema on inserted.vk = dbo.dokshema.vk
		where  inserted.pozicija = dokshema.pozicija 
	and inserted.kontoid = dokshema.kontoid and inserted.analitikavrsta = dokshema.analitikavrsta 
	and inserted.dp = dokshema.dp  and inserted.pecat = dokshema.pecat and inserted.ks = dokshema.ks
	and inserted.analitika3 = dokshema.analitika3 and not(inserted.kontoid is null)) > 1
	begin
        	raiserror 44445 n'
the record can''t be inserted. 
it generates duplicate records in shema!
origin: dokshema_utrig'
        	rollback transaction
	end

if exists(select * from inserted where inserted.ks = 1 and inserted.pozicija = 1150)
and exists (select * from inserted, dbo.dokshema where inserted.vk = dokshema.vk 
	and (dbo.dokshema.pozicija between 1152 and 1162 or dbo.dokshema.pozicija = 2010))
	begin
        	raiserror 44445 '
the record can''t be inserted!
you can''t  use position 1150 when you are using 1152 - 1162 or 2010 
origin: dokshema_itrig'
        	rollback transaction
	end

if exists(select * from inserted where inserted.ks = 1 
	and (inserted.pozicija between 1152 and 1162 or inserted.pozicija = 2010))
and exists (select * from inserted, dbo.dokshema where inserted.vk = dokshema.vk 
	and dbo.dokshema.pozicija = 1150 and dbo.dokshema.ks = 1)
	begin
        	raiserror 44445 '
the record can''t be inserted!
you can''t  use position 1152 - 1162 or 2010 when you are using 1150  
origin: dokshema_itrig'
        	rollback transaction
	end

	if exists (select *  from inserted 
			inner join dbo.dokvk on inserted.vk = dbo.dokvk.sifra 
			inner join dbo.dokvrsta on  dbo.dokvk.dokvrsta = dbo.dokvrsta.sifra 
		where dbo.dokvrsta.vrsta = 101 and inserted.ks = 1)
	begin
		raiserror 44445 '

plan can''t have gl entry!
origin:  dokshema_utrig
'
        		rollback transaction
	end

	insert into dbo.izmj (tabela, polje, slog, prije, poslije)
	select n'dokshema', n'vk,pozicija,kontoid,analitikavrsta,dp,ks,pretv', inserted.id, 
			cast(deleted.vk as nvarchar(6)) 
			+ ', ' + cast(deleted.pozicija as nvarchar(6)) 
			+ ', '  + cast(deleted.kontoid as nvarchar (15))
			+ ', '  + cast(deleted.analitikavrsta as nvarchar (3))
			+ ', '  + cast(deleted.dp as nvarchar (1))
			+ ', '  + cast(deleted.ks as nvarchar (1))
			+ ', '  + cast(deleted.analitpret as nvarchar (1)) as prije,
			cast(inserted.vk as nvarchar(6)) 
			+ ', ' + cast(inserted.pozicija as nvarchar(6)) 
			+ ', '  + cast(inserted.kontoid as nvarchar (15))
			+ ', '  + cast(inserted.analitikavrsta as nvarchar (3))
			+ ', '  + cast(inserted.dp as nvarchar (1))
			+ ', '  + cast(inserted.ks as nvarchar (1))
			+ ', '  + cast(inserted.analitpret as nvarchar (1)) as poslije
	from inserted
		inner join deleted on inserted.id = deleted.id
	where  checksum(deleted.vk,deleted.pozicija,deleted.kontoid,
				deleted.analitikavrsta,deleted.dp, deleted.ps,
				deleted.zk,deleted.ks,deleted.analitpret) 
			<> 
		checksum(inserted.vk,inserted.pozicija,inserted.kontoid,inserted.analitikavrsta,inserted.dp, inserted.ps,
				inserted.zk,inserted.ks,inserted.analitpret) 

	if exists (select *  from inserted 
			inner join dbo.dokvk on inserted.vk = dbo.dokvk.sifra 
			inner join dbo.dokvrsta on dbo.dokvk.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.dokvrstapredmet on dbo.dokvrsta.sifra = dbo.dokvrstapredmet.dokvrsta
			inner join dbo.dokvk dokvkpred on dbo.dokvrstapredmet.dokvrstapredmet = dokvkpred.dokvrsta
			inner join dbo.dokshema dokshemapred on dokvkpred.sifra = dokshemapred.vk
	where inserted.pozicija = 1252 and dokshemapred.pozicija = 1252)
	begin
		raiserror 44445 '

possitin 1252 can be used only once
in documentation folder !
origin:  dokshema_itrig
'
        		rollback transaction
	end