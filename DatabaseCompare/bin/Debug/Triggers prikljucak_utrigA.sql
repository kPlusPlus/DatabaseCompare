create    trigger [dbo].[prikljucak_utrig] on [dbo].[prikljucak] 
for update
as

if exists (select * from inserted
							inner join deleted on inserted.id = deleted.id
	where inserted.analitikaid <> deleted.analitikaid)
	begin
        	raiserror 44445 '

the record can''t be changed,
analitic already exists.
delete or add new record instead.

origin:  prikljucak_utrig'
        	rollback transaction
	end

	update dbo.analitika
	set analitika = pr.analitika, 
		analitkoristi = pr.koristi
	from (select inserted.id, (rtrim(inserted.sb) 
			+ n' ' + isnull(rtrim(inserted.ident),'')
			+ n' ' + rtrim(analitika.analitika)) as analitika,
			inserted.koristi
		from inserted 
			inner join dbo.analitika on inserted.analitikaid = dbo.analitika.id) pr
	where analitika.analitikavrsta = 41 and vezaid = pr.id