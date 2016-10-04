
create   trigger [dbo].[asocjenik_ud_trig] on [dbo].[asocjenik]
for update, delete not for replication
as
set nocount on

if exists ( select *
		from  deleted
		left outer join inserted on deleted.id = inserted.id 
		inner join dbo.asokatalog with(nolock) on deleted.asokatalogid = dbo.asokatalog.id
		inner join dbo.evid with(nolock) on dbo.asokatalog.id = dbo.evid.asokatalogid 
		inner join dbo.list with(nolock) on dbo.evid.listid = dbo.list.id
		where (deleted.cjenik = dbo.list.cjenik and inserted.id is null) or

				 deleted.cjenik <> inserted.cjenik )
begin
raiserror 44445 n'
	
	the record can''t be deleted or changed, 
	it is used in documents.
	origin: asocjenik_ud_trig '
        		rollback transaction

end

if exists ( select *
				from inserted
				inner join dbo.cjenik with(nolock) on inserted.cjenik = dbo.cjenik.sifra
				where dbo.cjenik.primjdev = 0 and inserted.valkodcijena <> dbo.invalkod() )
begin
raiserror 44445 n'
	
	the record can''t be changed, 
	currency must be domestic.
	origin: asocjenik_ud_trig'
        		rollback transaction

end
				

	insert into dbo.izmj (tabela, polje, slog, prije, poslije)
	select 	n'asocjenik', 
		n'cijena dobave' + ', ' + rtrim(cjenik.tekst) as polje, 
		inserted.id as slog, 
		rtrim(cast(deleted.cijenadob as nvarchar(12))) as prije,
		rtrim(cast(inserted.cijenadob as nvarchar(12))) as poslije
	from inserted
		inner join deleted on inserted.id = deleted.id
		inner join dbo.cjenik with(nolock) on deleted.cjenik = dbo.cjenik.sifra
	where  deleted.cijenadob <> inserted.cijenadob 

	insert into dbo.izmj (tabela, polje, slog, prije, poslije)
	select 	n'asocjenik', 
		n'prodajna cijena' + ', ' + rtrim(cjenik.tekst) as polje, 
		inserted.id, 
		rtrim(cast(deleted.cijena as nvarchar(12))) as prije,
		rtrim(cast(inserted.cijena as nvarchar(12))) as poslije
	from inserted
		inner join deleted on inserted.id = deleted.id
		inner join dbo.cjenik with(nolock) on deleted.cjenik = dbo.cjenik.sifra
	where  deleted.cijena <> inserted.cijena