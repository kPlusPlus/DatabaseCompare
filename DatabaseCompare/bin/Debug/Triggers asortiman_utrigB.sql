create trigger [dbo].[asortiman_utrig] on dbo.asortiman
after update not for replication
as
set nocount on

if exists (select * from inserted where inserted.azuriranje = 1 and inserted.kontrola = 1 )
begin

	if exists (select * from inserted
				inner join deleted on inserted.id = deleted.id 
				inner join dbo.asokatalog on inserted.id = dbo.asokatalog.asortid
			where inserted.sifra <> deleted.sifra)
	begin
	raiserror 44447 '300563 

the field sifra can''t be changed, 
this asortment exist in katalog ! 
origin: asortiman_utrig'
	rollback transaction
	end

	if exists (select * from inserted
				inner join deleted on inserted.id = deleted.id 
				inner join dbo.asokatalog on inserted.id = dbo.asokatalog.asortid
				inner join dbo.evid on dbo.asokatalog.id = dbo.evid.asokatalogid
			where (inserted.sifra <> deleted.sifra 
				or inserted.naziv <> deleted.naziv 
				or inserted.ident <> deleted.ident))
	begin
	raiserror 44447 '300564 

the fields sifra, name, ident can''t be changed, 
this asortment exist in documents ! 
origin: asortiman_utrig'
	rollback transaction
	end

	if exists (select * from inserted
					left outer join dbo.asokatalog on inserted.id = dbo.asokatalog.asortid
			where asokatalog.asortid is null)
	begin
		insert [dbo].[asokatalog]([analitikaid], [kampid], [asortid], [katbroj], [barcode], [asovrsta], 
						[asomerchand], [merchuvjet1], [merchuvjet2])
		(select (select min(analitika.id) from dbo.analitika where analitikavrsta = 7), 1, inserted.id, 
			inserted.sifra, null, (select min(sifra) from asovrsta where vrsta = 1), null, null, null
		from inserted
		where inserted.id in (select inserted.id from inserted
						left outer join dbo.asokatalog on inserted.id = dbo.asokatalog.asortid
					  where asokatalog.asortid is null))
	end

	if exists (select * from inserted 
			inner join asokatalog on inserted.id = dbo.asokatalog.asortid 
			left outer join dbo.asocjenik on dbo.asokatalog.id = dbo.asocjenik.asokatalogid 
		where dbo.asocjenik.id is null)
	begin
		insert asocjenik ([cjenik], [asokatalogid], [cijenadob], [valkoddob], [cijenaplkost], 
			[cijena], [valcijenabez], [valkodval], [bod], [valprerac], [jednokrat], [samokol1], [koristi])
		(select (select top 1 sifra from dbo.cjenik where osnovni = 1) as cjenik, dbo.asokatalog.id, 
			0, (select valkod 
				from dbo.firma
				inner join dbo.tbfetchfirma() tbfetchfirma on dbo.firma.id = tbfetchfirma.firmaid), 
			0, 0, 0, (select top 1 valkod 
				from dbo.firma
				inner join dbo.tbfetchfirma() tbfetchfirma on dbo.firma.id = tbfetchfirma.firmaid), 
			0, 0, 0, 0, 1
		from inserted 
			inner join asokatalog on inserted.id = dbo.asokatalog.asortid 
			left outer join dbo.asocjenik on dbo.asokatalog.id = dbo.asocjenik.asokatalogid 
		where dbo.asocjenik.id is null)
	end

	if exists ( select * from inserted
						 left outer join dbo.asokolekcija on inserted.asokolekcija = dbo.asokolekcija.sifra
						 left outer join  dbo.asogrupa  on inserted.asogrupa = dbo.asogrupa.sifra
				where (dbo.asokolekcija.analitnabkomid > 0 or dbo.asogrupa.analitnabkomid > 0)
					and isnull(inserted.analitkomercid,0) <> isnull(coalesce(dbo.asokolekcija.analitnabkomid, dbo.asogrupa.analitnabkomid),0)) 
	begin

	update dbo.asortiman
	set analitkomercid = coalesce(dbo.asokolekcija.analitnabkomid, dbo.asogrupa.analitnabkomid)
	from inserted
	inner join dbo.asortiman on inserted.id = dbo.asortiman.id
	left outer join  dbo.asokolekcija on asortiman.asokolekcija = dbo.asokolekcija.sifra
	left outer join  dbo.asogrupa on asortiman.asogrupa = dbo.asogrupa.sifra
	where (dbo.asokolekcija.analitnabkomid > 0 or dbo.asogrupa.analitnabkomid > 0)
		and isnull(dbo.asortiman.analitkomercid,0) <> isnull(coalesce(dbo.asokolekcija.analitnabkomid, dbo.asogrupa.analitnabkomid),0)

	end

	if not exists(select * from inserted, dbo.asokatalog, dbo.asocjenik 
			where inserted.id = dbo.asokatalog.asortid 
				and asokatalog.id = dbo.asocjenik.asokatalogid)
		begin
		raiserror 44447 '300565 

the record can''t be changed, 
data in table asokatalog or 
in table asocjenik are missing! 
origin: asortiman_utrig'
		rollback transaction
		end

delete from dbo.asosklad
where asortid in (select inserted.id from inserted 
					inner join dbo.asokatalog on inserted.id = dbo.asokatalog.asortid
					inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
				where asokatalog.koristi = 0 or asovrsta.vrsta = 3)

	insert into [dbo].[asosklad] ([asortid],[analitsklid],[staskl],[pondmarza])
	select inserted.id, analitika.id, 
		stanje = isnull(sum(stskl.stanje),0),
		pondmarza = case when sum(stskl.stanje) > 0 
					then isnull(sum(stskl.marza * stskl.stanje)*
update asortiman
set azuriranje = 1, kontrola = 1 
*/

	update asortiman
	set kontrola = 0, azuriranje = 0 
	from inserted, asortiman where asortiman.id = inserted.id

end