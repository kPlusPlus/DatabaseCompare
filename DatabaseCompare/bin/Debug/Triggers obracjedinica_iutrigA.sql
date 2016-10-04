create trigger [dbo].[obracjedinica_iutrig] on [dbo].[obracjedinica] 
for insert, update
as

if (select count(*) from inserted, dbo.obracjedinica where inserted.obrjedgrupa = obracjedinica.obrjedgrupa 
		and obracjedinica.osnovna = 1 group by obracjedinica.obrjedgrupa) > 1
	begin
	raiserror 44445 ' 
obracjedinica_iutrig(8): 
the record can''t be inserted or updated 
becouse basic unit allready exist'  
	rollback transaction
	end