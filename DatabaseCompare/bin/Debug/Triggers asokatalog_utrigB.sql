create trigger [dbo].[asokatalog_utrig] on [dbo].[asokatalog]
after update not for replication
as
set nocount on

if exists (select * from inserted
		inner join deleted on inserted.id = deleted.id
		inner join dbo.evid on inserted.id = dbo.evid.asokatalogid 
		where inserted.katbroj <> deleted.katbroj)
	begin
	raiserror 44447 '
the record can''t be changed. 
it was allready used in documents!.
origin: asokatalog_utrig'
	rollback transaction
	end

if exists(select * from inserted 
			inner join dbo.asokatalog on inserted.barcode = dbo.asokatalog.barcode
					and inserted.id <> dbo.asokatalog.id
					and inserted.asortid <> dbo.asokatalog.asortid
		where len(inserted.barcode) > 3)

	begin
	raiserror 44447 '
the record can''t be inserted. 
this barcode is in use for other asortment !
origin: asokatalog_itrig'
	rollback transaction
	end
