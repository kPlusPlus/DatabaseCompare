create trigger [dbo].[asokatalog_itrig] on [dbo].[asokatalog]
after insert not for replication
as
set nocount on

if exists 
		(select *	from inserted
				inner join dbo.asokatalog on inserted.asortid = dbo.asokatalog.asortid
		group by asokatalog.asortid
		having count(asokatalog.id) > 1 )
	
	
and
exists(select * from dbo.firma 
			inner join dbo.tbfetchfirma() tbff on dbo.firma.id = tbff.firmaid
		where firma.katalog = 0)	
	begin
	raiserror 44447 '
the record can''t be inserted. 
firma.katalog rule violation!
origin: asokatalog_itrig'
	rollback transaction
	end

if exists(select * from inserted 
			inner join dbo.asortiman on inserted.asortid = dbo.asortiman.id
			where rtrim(inserted.katbroj) <> rtrim(asortiman.sifra)
			and isnumeric(rtrim(inserted.katbroj)) = 1

			and exists (select * from dbo.firma 
					inner join dbo.tbfetchfirma() tbff on dbo.firma.id = tbff.firmaid
					where dbo.firma.katalog = 0))
	begin
		update dbo.asokatalog
		set katbroj = asortiman.sifra
		from inserted
			inner join dbo.asokatalog on inserted.id = dbo.asokatalog.id
			inner join dbo.asortiman on dbo.asokatalog.asortid = dbo.asortiman.id
		where rtrim(inserted.katbroj) <> rtrim(asortiman.sifra)
			and isnumeric(rtrim(inserted.katbroj)) = 1

			and exists (select * from dbo.firma 
					inner join dbo.tbfetchfirma() tbff on dbo.firma.id = tbff.firmaid
					where dbo.firma.katalog = 0)
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