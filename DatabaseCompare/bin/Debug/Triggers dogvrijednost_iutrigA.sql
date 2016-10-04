create   trigger dogvrijednost_iutrig on dbo.dogvrijednost 
for insert, update
as

if exists(select * from inserted
			left outer join deleted on inserted.id = deleted.id
	where checksum(inserted.dogvrijedvrsta, inserted.od, inserted.do, inserted.valkod, inserted.iznos, inserted.interno, inserted.aktiv)
 		<> checksum(deleted.dogvrijedvrsta, deleted.od, deleted.do, deleted.valkod, deleted.iznos, deleted.interno, deleted.aktiv)
		or deleted.id is null)
begin

	update dbo.dogvrijednost 
	set aktiv = case when do is null or do < '19700101' and aktiv = 0 
			then 1
			when not(do is null) or do > '19700101' and aktiv = 1 
			then 0
			else aktiv
			end
	
	

	if exists(select * from inserted 
			inner join dbo.dogvrijednost on inserted.dogvrijedvrsta = dbo.dogvrijednost.dogvrijedvrsta
								and inserted.valkod = dbo.dogvrijednost.valkod
								and inserted.interno = dbo.dogvrijednost.interno
								and inserted.aktiv = dbo.dogvrijednost.aktiv
			where inserted.aktiv = 1 and inserted.id <> dbo.dogvrijednost.id )
	begin
		raiserror 44447 '
		
		the record can''t be inserted or updated, 
		there are more then one activ values
		of the same kind ! 
		origin: dogvrijednost_iutrig '
		rollback transaction
	end
end