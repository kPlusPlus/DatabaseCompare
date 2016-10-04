create trigger [dbo].[asonorm_dtrig] on dbo.asonorm
after delete
as

if exists (select * from deleted
			inner join dbo.evid on deleted.katalogid = dbo.evid.asokatalogid
			inner join dbo.asokatalog on deleted.katalogid = dbo.asokatalog.id 
			inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
			inner join dbo.asokatalog asokatalog_1 on deleted.komponentid = asokatalog_1.id 
			inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
				and asokatalog_1.asortid = dbo.skladiste.asortid
			where asovrsta.vrsta <> 2) 
begin
	raiserror 44447 '

the record can''t be deleted, 
this product was already used with prior definition ! 
origin: asonorm_dtrig
'
	rollback transaction
end

if exists (select * from deleted
			inner join dbo.evid on deleted.katalogid = dbo.evid.asokatalogid
			inner join dbo.asokatalog on deleted.komponentid = dbo.asokatalog.id
			inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
				and dbo.asokatalog.asortid = dbo.skladiste.asortid)
begin
	raiserror 44447 '

the record can''t be deleted, 
this product was already used with prior definition ! 
origin: asonorm_dtrig
'
	rollback transaction
end

delete from dbo.asoutrosak
where asokompid in (select au.asokompid from deleted
			inner join (select asoutrosak.asokompid, asokatalog.id as katalogid, asokomp.id as komponentid
					from dbo.asoutrosak
						inner join dbo.asokatalog on dbo.asoutrosak.asortid = dbo.asokatalog.asortid
						inner join dbo.asokatalog asokomp on dbo.asoutrosak.asokompid = asokomp.asortid
					where utrosvrsta = 1) 
				au on deleted.katalogid = au.katalogid and deleted.komponentid = au.komponentid)
	and  asortid in (select au.asortid from deleted
			inner join (select asoutrosak.asortid, asokatalog.id as katalogid, asokomp.id as komponentid
					from dbo.asoutrosak
						inner join dbo.asokatalog on dbo.asoutrosak.asortid = dbo.asokatalog.asortid
						inner join dbo.asokatalog asokomp on dbo.asoutrosak.asokompid = asokomp.asortid
					where utrosvrsta = 1) 
				au on deleted.katalogid = au.katalogid and deleted.komponentid = au.komponentid)
	and utrosvrsta = 1
	and vrijedav in (select deleted.kolicina from deleted
			inner join (select asoutrosak.asortid, asokatalog.id as katalogid, asokomp.id as komponentid
					from dbo.asoutrosak
						inner join dbo.asokatalog on dbo.asoutrosak.asortid = dbo.asokatalog.asortid
						inner join dbo.asokatalog asokomp on dbo.asoutrosak.asokompid = asokomp.asortid
					where utrosvrsta = 1) 
				au on deleted.katalogid = au.katalogid and deleted.komponentid = au.komponentid)

if exists(select * from deleted
			inner join (select asokatalog.id as katalogid, asokomp.id as komponentid
					from dbo.asoutrosak
						inner join dbo.asokatalog on dbo.asoutrosak.asortid = dbo.asokatalog.asortid
						inner join dbo.asokatalog asokomp on dbo.asoutrosak.asokompid = asokomp.asortid) 
				au on deleted.katalogid = au.katalogid and deleted.komponentid = au.komponentid)
begin
	update [dbo].[asoutrosak]
	set utrosvrsta = 1, asortid = aut.asortid, asortjmj = aut.asortjmj,  
		asokompid = aut.asokompid, asokompjmj = aut.asokompjmj,
		vrijedmin = aut.vrijedmin, vrijedav = aut.vrijedav, vrijedmax = aut.vrijedmax
	from (select  asokatalog.asortid as asortid, obracjedinica.sifra as asortjmj,  
			asokomp.asortid as asokompid, kompjmj.sifra as asokompjmj,
			sum(asonorm.kolicina) as vrijedmin, sum(asonorm.kolicina) as vrijedav, sum(asonorm.kolicina) as vrijedmax
		from deleted
			inner join dbo.asonorm on deleted.katalogid = dbo.asonorm.katalogid
					and deleted.komponentid = dbo.asonorm.komponentid
			inner join dbo.asokatalog on deleted.katalogid = dbo.asokatalog.id
			inner join dbo.asortiman on dbo.asokatalog.asortid = dbo.asortiman.id
			inner join dbo.obracjedinica on dbo.asortiman.obracjedgrupa = dbo.obracjedinica.obrjedgrupa
			inner join dbo.asokatalog asokomp on deleted.komponentid = asokomp.id
			inner join dbo.asovrsta on asokomp.asovrsta = dbo.asovrsta.sifra
			inner join dbo.asortiman asortkomp on asokomp.asortid = asortkomp.id
			inner join dbo.obracjedinica kompjmj on asortkomp.obracjedgrupa = kompjmj.obrjedgrupa
			inner join (select asokatalog.id as katalogid, asokomp.id as komponentid
						from dbo.asoutrosak
							inner join dbo.asokatalog on dbo.asoutrosak.asortid = dbo.asokatalog.asortid
							inner join dbo.asokatalog asokomp on dbo.asoutrosak.asokompid = asokomp.asortid) 
				au on deleted.katalogid = au.katalogid and deleted.komponentid = au.komponentid
		where obracjedinica.osnovna = 1 and kompjmj.osnovna = 1  and asovrsta.vrsta <> 3
		group by asokatalog.asortid, obracjedinica.sifra, asokomp.asortid, kompjmj.sifra)
	       aut inner join dbo.asoutrosak on aut.asortid = dbo.asoutrosak.asortid
							 and aut.asokompid = dbo.asoutrosak.asokompid
end