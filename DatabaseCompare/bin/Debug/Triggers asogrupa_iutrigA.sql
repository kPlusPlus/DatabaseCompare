create   trigger [asogrupa_iutrig] on dbo.asogrupa 
for insert, update
as

if exists(select * from inserted where inserted.grupanadid is null)
	begin
	update dbo.asogrupa
	set grupanadid = dbo.asogrupa.sifra
	from inserted
		inner join dbo.asogrupa on inserted.sifra = dbo.asogrupa.sifra and inserted.grupanadid is null
	end