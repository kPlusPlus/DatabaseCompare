
create    trigger [asoutrosak_iutrig] on dbo.asoutrosak 
for insert, update
as

if exists (select * from inserted
			inner join dbo.asortiman on inserted.asortid = dbo.asortiman.id
			inner join dbo.obracjedinica asortjmj on inserted.asortjmj = asortjmj.sifra
			inner join dbo.asortiman asokomp on inserted.asokompid = asokomp.id
			inner join dbo.obracjedinica asokompjmj on inserted.asokompjmj = asokompjmj.sifra
		where (asortiman.obracjedgrupa <>  asortjmj.obrjedgrupa)
			or (asokomp.obracjedgrupa <>  asokompjmj.obrjedgrupa))
	begin
	raiserror 44445 ' 

the record can''t be inserted or updated 
becouse units are not basic !
origin: asoutrosak_iutrig'
	rollback transaction
	end