create   trigger [dbo].[asogrupa_iutrig] on [dbo].[asogrupa] 
for insert, update
as

if exists(select * from inserted where inserted.grupanadid is null)
	begin
	update dbo.asogrupa
	set grupanadid = dbo.asogrupa.sifra
	from inserted
		inner join dbo.asogrupa on inserted.sifra = dbo.asogrupa.sifra and inserted.grupanadid is null
	end

if exists (select * from inserted 
					inner join deleted on inserted.sifra = deleted.sifra
					inner join dbo.asortiman on inserted.sifra = dbo.asortiman.asogrupa
					inner join dbo.asokolekcija on dbo.asortiman.asokolekcija = dbo.asokolekcija.sifra
				where  isnull(inserted.analitnabkomid,0) <> isnull(deleted.analitnabkomid,0) 
						and dbo.asokolekcija.analitnabkomid is null) 
begin

update dbo.asortiman
set analitkomercid = inserted.analitnabkomid
from inserted 
inner join deleted on inserted.sifra = deleted.sifra
inner join dbo.asortiman on inserted.sifra = dbo.asortiman.asogrupa
inner join dbo.asokolekcija on dbo.asortiman.asokolekcija = dbo.asokolekcija.sifra
where isnull(inserted.analitnabkomid,0)<> isnull(deleted.analitnabkomid,0)
		and dbo.asokolekcija.analitnabkomid is null

end