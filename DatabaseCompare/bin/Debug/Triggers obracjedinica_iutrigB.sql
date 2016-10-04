create trigger [dbo].[obracjedinica_iutrig] on [dbo].[obracjedinica] 
for insert, update
as

if (select count(*) from inserted, dbo.obracjedinica 
		where inserted.obrjedgrupa = obracjedinica.obrjedgrupa 
				and obracjedinica.osnovna = 1 
		group by obracjedinica.obrjedgrupa) > 1
	begin
	raiserror 44445 ' 
obracjedinica_iutrig(8): 
the record can''t be inserted or updated 
becouse basic unit allready exist
origin:obracjedinica_iutrig'  
	rollback transaction
	end

if exists(select * from inserted
			inner join deleted on inserted.sifra = deleted.sifra 
			inner join dbo.evid with(nolock) on inserted.sifra = dbo.evid.obracjedinica
		where inserted.tekst <> deleted.tekst
			or inserted.koef <> deleted.koef
			or inserted.offset <> deleted.offset
			or inserted.osnovna <> deleted.osnovna)
	begin
	raiserror 44445 ' 

the record can''t be updated 
becouse this unit allready is used
in documents!
origin:obracjedinica_iutrig'  
	rollback transaction
	end