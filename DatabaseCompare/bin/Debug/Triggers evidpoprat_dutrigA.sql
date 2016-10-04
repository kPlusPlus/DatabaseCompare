create     trigger [dbo].[evidpoprat_dutrig] on [dbo].[evidpoprat] 
for update, delete 
as

if exists (select * from inserted
			inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id 
			inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.evid with(nolock) on inserted.evidpop =  dbo.evid.id 
			left outer join dbo.skladiste with(nolock) on dbo.evid.id = dbo.skladiste.evidid
			inner join dbo.dokstart dokstart_1 with(nolock) on dbo.evid.listid = dokstart_1.listid
			inner join dbo.dokvrsta dokvrsta_1 with(nolock) on dokstart_1.dokvrsta = dokvrsta_1.sifra 
		where dbo.dokvrsta.sklad = 1 and dbo.skladiste.zalihaid is null 
			and dokvrsta_1.sifra not in(20,105) and dokvrsta_1.sklad = 1
			and evid.tip <> 99) 
	begin
	raiserror 44445 '
the record can''t be inserted since 
related inventory record don''t exist 
in acompanied document.
origin: evidpoprat_itrig'
	rollback transaction
	end

if exists (select * from inserted
			inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id
			inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		where dokvrsta.evid = 1 and dokvrsta.sklad = 0 and dokvrsta.zaliha = 0)
begin
	insert into evid (listid, asokatalogid, obracjedinica, tip, kolicina2, 
			fakcijena, fakpopust, faktrosar, portarifid, bod, autoins, zalihaid)
	(select dbo.dokstart.listid, 
		dbo.evid.asokatalogid, 
		dbo.evid.obracjedinica, 
		dbo.evid.tip,
		kolicina = case 	when dokvrsta.iznos = 0 and inserted.kolicina >= 0 
					then  inserted.kolicina
					when dokvrsta.iznos = 1 and inserted.kolicina < 0  
					then  inserted.kolicina 
					else inserted.kolicina * -1
					end,
		dbo.evid.fakcijena,
		dbo.evid.fakpopust,
		dbo.evid.faktrosar,
		portarifid = case 	when dokum.pdvstatus > 0 and evid.portarifid = 0 
					then asortiman.portarifid
					else evid.portarifid
					end,
		dbo.evid.bod, 
		autoins = case when dokvrsta.vrsta >= 101
				then 0 else 1 end,
		null
	from inserted 
		inner join dbo.evid on inserted.evidpop = dbo.evid.id
		inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
		inner join dbo.asortiman on dbo.asokatalog.asortid = dbo.asortiman.id
		inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id
		inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
	where dokvrsta.evid = 1 and dokvrsta.sklad = 0 and dokvrsta.zaliha = 0)
end

 inserted.kolicina) as cijena, 

					avg(dbo.zaliha.markup * skladiste.kolicina  inserted.kolicina) as carina, 
					avg(dbo.zaliha.zavisni * skladiste.kolicina  inserted.kolicina) as nabcijena, 
					avg(dbo.zaliha.marza * skladiste.kolicina  inserted.kolicina) as prcijenabez, 
					sum(dbo.zaliha.prcijenasa * skladiste.kolicina  inserted.kolicina) as trosarina,
					avg(abs(inserted.kolicina)) as zaliha
				from inserted
					inner join dbo.skladiste on inserted.evidpop = dbo.skladiste.evidid 
					inner join dbo.zaliha on dbo.skladiste.zalihaid = dbo.zaliha.id
				group by inserted.evidpop) 
			epz on dbo.evid.zalihaid = epz.evidpop 
		where   dbo.zaliha.skladisteid is null and dbo.dokvrsta.zaliha = 1 
			and dokvrsta_1.sifra <> 105)

		insert into dbo.zaliha (analitsklid, analitparid, skladisteid, asortid, valkod, 
			tecaj, cartar, portarifid, trosarina, inocijena, popdob, 
			markup,  carina, zavisni, marza, prcijenabez, prcijenasa, prerac, preractecaj, zaliha) 
		(select distinct dokum.analitika2id, 
			dokum.analitika1id,skladiste.id, skladiste.asortid, 
			dokum.valkod, dokum.tecaj, asortiman.cartarif, 
			asortiman.portarifid, asortiman.trosarina, 
			inocijena = case when dokvrsta.cijenavrsta = 2 
					then  asocjenik.cijenaplkost
					else epz.nabcijena  evid.kolicina2
					end,  
			prcijenasa = case when dokvrsta.cijenavrsta = 2 
					then  round(asocjenik.cijenaplkost * portarif.koef,2)
					else round(epz.nabcijena 