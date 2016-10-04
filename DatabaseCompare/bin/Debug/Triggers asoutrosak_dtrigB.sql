create trigger [dbo].[asoutrosak_dtrig] on [dbo].[asoutrosak]
after delete
as
if exists (select *	from deleted
		inner join dbo.asokatalog on deleted.asortid = dbo.asokatalog.asortid
		inner join dbo.asokatalog asokomp on deleted.asokompid = asokomp.asortid
		inner join dbo.asonorm on dbo.asokatalog.id = dbo.asonorm.katalogid
			and asokomp.id = dbo.asonorm.komponentid) 
begin
	raiserror 44447 '

the record can''t be deleted, 
this definition exists in ''normativ''! 
origin: asoutrosak_dtrig'
	rollback transaction
end