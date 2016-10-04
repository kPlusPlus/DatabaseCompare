create trigger [obracjedinica_dtrig] on dbo.obracjedinica 
for delete 
as

if (select count(*) from deleted, obracjedinica where deleted.obrjedgrupa = obrac.jedinica.obrjedgrupa 
		and obracjedinica.osnovna = 1 group by obrac.jedinica.obrjedgrupa) = 0
	begin
	raiserror 44445 ' 
obracjedinica_dtrig(8): 
the record can''t be deleted,
basic unit must exist'  
	rollback transaction
	end