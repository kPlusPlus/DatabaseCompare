
create trigger [dbo].[asonorm_iutrig] on [dbo].[asonorm] 
for insert, update
as

if exists (select * from inserted 
			inner join dbo.asokatalog on inserted.katalogid = dbo.asokatalog.id 
			inner join dbo.asokatalog asokatalog_1 on inserted.komponentid = asokatalog_1.id 
				and dbo.asokatalog.asortid = asokatalog_1.asortid)
begin
	raiserror 44447 '
the record can''t be updated, 
definition of the component cose  
circular reference to it self ! 
origin: asonorm_iutrig
'
	rollback transaction
end

if exists (select * from inserted
			inner join dbo.evid on inserted.katalogid = dbo.evid.asokatalogid
			inner join dbo.asokatalog on inserted.katalogid = dbo.asokatalog.id 
			inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
			inner join dbo.asokatalog asokatalog_1 on inserted.komponentid = asokatalog_1.id 
			inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
				and asokatalog_1.asortid = dbo.skladiste.asortid
			where asovrsta.vrsta <> 2) 
begin
	raiserror 44447 '
the record can''t be updated, 
this product was already used with prior definition ! 
origin: asonorm_iutrig
'
	rollback transaction
end

if exists (select * from inserted
			inner join dbo.asokatalog on inserted.komponentid = dbo.asokatalog.id
			inner join dbo.asovrsta on dbo.asokatalog.asovrsta =  dbo.asovrsta.sifra
		where asovrsta.vrsta = 3)
begin
	raiserror 44447 '
the record can''t be inserted, 
this component has definition as service! 
origin: asonorm_iutrig
'
	rollback transaction
end

insert into [dbo].[asoutrosak]([utrosvrsta], [asortid], [asortjmj], 
[asokompid], [asokompjmj], [vrijedmin], [vrijedav], [vrijedmax])
(select 1, asokatalog.asortid, obracjedinica.sifra,  
	asokomp.asortid, kompjmj.sifra,
	 sum(inserted.kolicina), sum(inserted.kolicina), sum(inserted.kolicina) 
from inserted
	inner join dbo.asokatalog on inserted.katalogid = dbo.asokatalog.id
	inner join dbo.asortiman on dbo.asokatalog.asortid = dbo.asortiman.id
	inner join dbo.obracjedinica on dbo.asortiman.obracjedgrupa = dbo.obracjedinica.obrjedgrupa
	inner join dbo.asokatalog asokomp on inserted.komponentid = asokomp.id
	inner join dbo.asovrsta on asokomp.asovrsta = dbo.asovrsta.sifra
	inner join dbo.asortiman asortkomp on asokomp.asortid = asortkomp.id
	inner join dbo.obracjedinica kompjmj on asortkomp.obracjedgrupa = kompjmj.obrjedgrupa
	left outer join (select asokatalog.id as katalogid, asokomp.id as komponentid
				from dbo.asoutrosak
					inner join dbo.asokatalog on dbo.asoutrosak.asortid = dbo.asokatalog.asortid
					inner join dbo.asokatalog asokomp on dbo.asoutrosak.asokompid = asokomp.asortid) 
		au on inserted.katalogid = au.katalogid and inserted.komponentid = au.komponentid
where obracjedinica.osnovna = 1 and kompjmj.osnovna = 1 and asovrsta.vrsta <> 3
	and (au.katalogid is null or au.komponentid is null)
group by asokatalog.asortid, asokomp.asortid, obracjedinica.sifra, kompjmj.sifra)

if exists(select * from inserted
			inner join (select asokatalog.id as katalogid, asokomp.id as komponentid
					from dbo.asoutrosak
						inner join dbo.asokatalog on dbo.asoutrosak.asortid = dbo.asokatalog.asortid
						inner join dbo.asokatalog asokomp on dbo.asoutrosak.asokompid = asokomp.asortid) 
				au on inserted.katalogid = au.katalogid and inserted.komponentid = au.komponentid)
begin
	update [dbo].[asoutrosak]
	set utrosvrsta = 1, asortid = aut.asortid, asortjmj = aut.asortjmj,  		asokompid = aut.asokompid, asokompjmj = aut.asokompjmj,
		vrijedmin = aut.vrijedmin, vrijedav = aut.vrijedav, vrijedmax = aut.vrijedmax
	from (select  asokatalog.asortid as asortid, obracjedinica.sifra as asortjmj,  
			asokomp.asortid as asokompid, kompjmj.sifra as asokompjmj,
			sum(asonorm.kolicina) as vrijedmin, sum(asonorm.kolicina) as vrijedav, sum(asonorm.kolicina) as vrijedmax
		from inserted
			inner join dbo.asonorm on inserted.katalogid = dbo.asonorm.katalogid
					and inserted.komponentid = dbo.asonorm.komponentid
			inner join dbo.asokatalog on inserted.katalogid = dbo.asokatalog.id
			inner join dbo.asortiman on dbo.asokatalog.asortid = dbo.asortiman.id
			inner join dbo.obracjedinica on dbo.asortiman.obracjedgrupa = dbo.obracjedinica.obrjedgrupa
			inner join dbo.asokatalog asokomp on inserted.komponentid = asokomp.id
			inner join dbo.asovrsta on asokomp.asovrsta = dbo.asovrsta.sifra
			inner join dbo.asortiman asortkomp on asokomp.asortid = asortkomp.id
			inner join dbo.obracjedinica kompjmj on asortkomp.obracjedgrupa = kompjmj.obrjedgrupa
			inner join (select asokatalog.id as katalogid, asokomp.id as komponentid
						from dbo.asoutrosak
							inner join dbo.asokatalog on dbo.asoutrosak.asortid = dbo.asokatalog.asortid
							inner join dbo.asokatalog asokomp on dbo.asoutrosak.asokompid = asokomp.asortid) 
				au on inserted.katalogid = au.katalogid and inserted.komponentid = au.komponentid
		where obracjedinica.osnovna = 1 and kompjmj.osnovna = 1  and asovrsta.vrsta <> 3
		group by asokatalog.asortid, obracjedinica.sifra, asokomp.asortid, kompjmj.sifra)
	       aut inner join dbo.asoutrosak on aut.asortid = dbo.asoutrosak.asortid
							 and aut.asokompid = dbo.asoutrosak.asokompid
end