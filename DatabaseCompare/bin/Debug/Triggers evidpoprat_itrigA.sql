create   trigger [dbo].[evidpoprat_itrig] on [dbo].[evidpoprat] 
for insert
not for replication
as
set nocount on

if exists (select * from inserted
			inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id 
			inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.evid with(nolock) on inserted.evidpop =  dbo.evid.id 
			left outer join dbo.skladiste with(nolock) on  dbo.evid.id = dbo.skladiste.evidid
			inner join dbo.dokstart dokstart_1 with(nolock) on dbo.evid.listid = dokstart_1.listid 
			inner join dbo.dokvrsta dokvrsta_1 with(nolock) on dokstart_1.dokvrsta = dokvrsta_1.sifra 
		where dbo.dokvrsta.sklad = 1  and dbo.skladiste.zalihaid is null 
				and dokvrsta_1.sifra not in(20,105)
				and dokvrsta_1.sklad = 1
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
			inner join dbo.list with(nolock) on dbo.dokstart.listid = dbo.list.id 
			inner join dbo.cjenik with(nolock) on dbo.list.cjenik = dbo.cjenik.sifra 
			inner join dbo.dokstart dokstart_1 with(nolock) on dbo.dokpoprat.dokpopratid = dokstart_1.id
			inner join dbo.list list_1 with(nolock) on dokstart_1.listid = list_1.id 
			inner join dbo.cjenik cjenik_1 with(nolock) on list_1.cjenik = cjenik_1.sifra 
		where dbo.cjenik.primjmp <> cjenik_1.primjmp) 
	begin
	raiserror 44445 '
documents have different type
of pricelists!!! 
use another pricelist.
origin: evidpoprat_itrig'
	rollback transaction
	end

if exists (select * from inserted
			inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id
			inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		where dokvrsta.evid = 1 and dokvrsta.sklad = 0 and dokvrsta.zaliha = 0)
begin

	update dbo.evid
	set kolicina2 = kolicina2 + kolicina
	from dbo.evid 
		inner join (select evidd.id, 
				kolicina = case when dokvrsta.iznos = 0 and inserted.kolicina >= 0 
					then  inserted.kolicina
					when dokvrsta.iznos = 1 and inserted.kolicina < 0  
					then  inserted.kolicina 
					else inserted.kolicina * -1
					end
			from inserted 
				inner join dbo.evid on inserted.evidpop = dbo.evid.id
				inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
				inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id
				inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.evid evidd on dbo.dokstart.listid = evidd.listid
					and dbo.evid.asokatalogid = evidd.asokatalogid 
			where dokvrsta.evid = 1 and dokvrsta.sklad = 0 and dokvrsta.zaliha = 0
					and evidd.autoins = 0)
		epu on dbo.evid.id = epu.id

	insert into dbo.evid (listid, asokatalogid, obracjedinica, tip, kolicina2, 
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

	insert into dbo.evidpad (evidid, opis)
	(select evidd.id, dbo.evidpad.opis
	from inserted
		inner join dbo.evid on inserted.evidpop = dbo.evid.id
		inner join dbo.evidpad on dbo.evid.id = dbo.evidpad.evidid	
		inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id
		inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.evid evidd on dbo.dokstart.listid = evidd.listid
			and dbo.evid.asokatalogid = evidd.asokatalogid 
			and inserted.kolicina = evidd.kolicina2
		left outer join dbo.evidpad evidpadd on evidd.id = evidpadd.evidid	
	where dokvrsta.evid = 1 and dokvrsta.sklad = 0 and dokvrsta.zaliha = 0
		and evidpadd.evidid is null)

end

if exists (select * from inserted
			inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id
			inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.dokstart dokstart_1 with(nolock) on dbo.dokpoprat.dokpopratid = dokstart_1.id
			inner join dbo.dokvrsta dokvrsta_1 with(nolock) on dokstart_1.dokvrsta = dokvrsta_1.sifra 
		where dokvrsta.evid = 1 and dokvrsta.sklad = 1
			and dbo.dokvrsta.zaliha = 0 and dokvrsta_1.sklad = 0 and dokvrsta_1.zaliha = 0
			and dokvrsta.normativ = 0 and dokvrsta_1.normativ = 0) 
begin
	insert into evid (listid, asokatalogid, obracjedinica, tip, kolicina2, 
			fakcijena, fakpopust, faktrosar, portarifid, bod, autoins)
	(select dbo.dokstart.listid, 
		dbo.evid.asokatalogid, 
		dbo.evid.obracjedinica, 
		dbo.evid.tip,
		kolicina = case when dokvrsta.iznos = 0 and inserted.kolicina >= 0 
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
		dbo.evid.bod, 1
	from inserted 
		inner join dbo.evid on inserted.evidpop = dbo.evid.id
		inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
		inner join dbo.asortiman on dbo.asokatalog.asortid = dbo.asortiman.id
		inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id
		inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
		inner join dbo.dokstart dokstart_1 on dbo.dokpoprat.dokpopratid = dokstart_1.id
		inner join dbo.dokvrsta dokvrsta_1 on dokstart_1.dokvrsta = dokvrsta_1.sifra 
	where dokvrsta.evid = 1 
		and dbo.dokvrsta.zaliha = 0 and dokvrsta_1.sklad = 0 and dokvrsta_1.zaliha = 0
		and dokvrsta.normativ = 0 and dokvrsta_1.normativ = 0)

	insert into dbo.evidpad (evidid, opis)
	(select evidd.id, dbo.evidpad.opis
	from inserted
		inner join dbo.evid on inserted.evidpop = dbo.evid.id
		inner join dbo.evidpad on dbo.evid.id = dbo.evidpad.evidid	
		inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id
		inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.evid evidd on dbo.dokstart.listid = evidd.listid
			and dbo.evid.asokatalogid = evidd.asokatalogid 
			and inserted.kolicina = evidd.kolicina2
		left outer join dbo.evidpad evidpadd on evidd.id = evidpadd.evidid	
	where len(dbo.evidpad.opis) > 2 
		and evidpadd.evidid is null)
end

if exists (select * from inserted
			inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id
			inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.dokstart dokstart_1 with(nolock) on dbo.dokpoprat.dokpopratid = dokstart_1.id
			inner join dbo.dokvrsta dokvrsta_1 with(nolock) on dokstart_1.dokvrsta = dokvrsta_1.sifra 
		where dokvrsta.evid = 1 and dokvrsta.sklad = 1
			and dbo.dokvrsta.zaliha = 0 and dokvrsta_1.zaliha = 1 
			and dokvrsta.normativ = 0 and dokvrsta_1.normativ = 0) 
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
		dbo.evid.bod, 1,
		skladiste.zalihaid 
	from inserted 
		inner join dbo.evid on inserted.evidpop = dbo.evid.id
		inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
		inner join dbo.zaliha on dbo.skladiste.id = dbo.zaliha.skladisteid 
		inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
		inner join dbo.asortiman on dbo.asokatalog.asortid = dbo.asortiman.id
		inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id
		inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
		inner join dbo.dokstart dokstart_1 on dbo.dokpoprat.dokpopratid = dokstart_1.id
		inner join dbo.dokvrsta dokvrsta_1 on dokstart_1.dokvrsta = dokvrsta_1.sifra 
	where dokvrsta.evid = 1 
		and dbo.dokvrsta.zaliha = 0 and dokvrsta_1.zaliha = 1 
		and dokvrsta.normativ = 0 and dokvrsta_1.normativ = 0)
end

if exists (select * from inserted
			inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id
			inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		where dokvrsta.evid = 1 and dokvrsta.sklad = 1
				and dbo.dokvrsta.zaliha = 1 and dbo.dokvrsta.normativ = 0)
begin
	insert into evid (listid, asokatalogid, obracjedinica, tip, kolicina2, 
			fakcijena, fakpopust, faktrosar, portarifid, bod, autoins, zalihaid)
	(select dbo.dokstart.listid, 
		dbo.evid.asokatalogid, 
		jmj.sifra, 
		tip = case when dokvrsta_1.sifra = 105 
				then 102 

				else dbo.evid.tip end,
		kolicina = case when dokvrsta.iznos = 0 and inserted.kolicina >= 0 
				then  ((inserted.kolicina * obracjedinica.koef) + obracjedinica.offset) 
				when dokvrsta.iznos = 1 and inserted.kolicina < 0  
				then ((inserted.kolicina * obracjedinica.koef) + obracjedinica.offset) 
				else ((inserted.kolicina * obracjedinica.koef) + obracjedinica.offset) * -1
				end,
		fakcijena = case when dokstart.dokvrsta = 110 
					then asocjenik.cijena
					else dbo.evid.fakcijena
					end, 
		dbo.evid.fakpopust,
		dbo.evid.faktrosar,
		portarifid = case when dokum.pdvstatus > 0 and evid.portarifid = 0 
					then asortiman.portarifid
					else evid.portarifid
					end,
		dbo.evid.bod, 
		autoins = case when dokvrsta.setovi = 0 and dokvrsta.normativ = 0 
				then 0 else 1 end,
		inserted.evidpop  
	from inserted 
		inner join dbo.evid on inserted.evidpop = dbo.evid.id
		inner join dbo.list on dbo.evid.listid = dbo.list.id
		inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
		inner join dbo.asocjenik on dbo.list.cjenik = dbo.asocjenik.cjenik
						and dbo.asokatalog.id = dbo.asocjenik.asokatalogid		
		inner join dbo.obracjedinica on dbo.evid.obracjedinica = dbo.obracjedinica.sifra
		inner join dbo.asortiman on dbo.asokatalog.asortid = dbo.asortiman.id
		inner join dbo.obracjedinica jmj on dbo.asortiman.obracjedgrupa = jmj.obrjedgrupa
				and jmj.osnovna = 1
		inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id
		inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
		inner join dbo.dokstart dokstart_1 on dbo.dokpoprat.dokpopratid = dokstart_1.id
		inner join dbo.dokvrsta dokvrsta_1 on dokstart_1.dokvrsta = dokvrsta_1.sifra 
	where dokvrsta.evid = 1 and dbo.dokvrsta.zaliha = 1 

		and evid.tip = (case when dokvrsta_1.sifra = 105 then 99 else evid.tip end) 
		and dbo.dokvrsta.normativ = 0)

		insert into dbo.zaliha (analitsklid, analitparid, skladisteid, asortid, valkod, 
			tecaj, cartar, portarifid, trosarina, inocijena, popdob, 
			markup,  carina, zavisni, marza, prcijenabez, prcijenasa, prerac, 
			preractecaj, zaliha, datnab, zaltip) 
		(select distinct dokum.analitika2id, 
			epz.analitparid, 
			skladiste.id, skladiste.asortid, 
			dokum.valkod, dokum.tecaj, asortiman.cartarif, 
			asortiman.portarifid, 

			trosarina = takstros.jedizn, 

			inocijena = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then  isnull(asocjenik.cijenaplkost,0)
					else epz.nabcijena
					end, 
			
			0,  
			markup = 0,
			carina = 0,
			zavisni = 0,
			marza = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then 0

					when dokvrsta.sifra = 127 and asocjenik.cijena > 0 and cjenik.primjmp = 0 
					then ((isnull(asocjenik.cijena,0)  isnull(asocjenik.cijena * portarif.revkoef,0))

					else epz.prcijenabez
					end,  
			prcijenasa = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then isnull(round(asocjenik.cijenaplkost * portarif.koef,2),0)
					when dokvrsta.sifra = 127 and asocjenik.cijena > 0 and cjenik.primjmp = 1
					then isnull(asocjenik.cijena,0)
					when dokvrsta.sifra = 127 and asocjenik.cijena > 0 and cjenik.primjmp = 0
					then isnull(asocjenik.cijena * portarif.koef,0)
					else epz.prcijenasa
					end,
			1, 1, evid.kolicina2, epz.datnab, epz.zaltip
		from inserted 
			inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id 
			inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.list on dbo.dokstart.listid = dbo.list.id
			inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid 
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.dokstart dokstart_1 on dbo.dokpoprat.dokpopratid = dokstart_1.id
			inner join dbo.dokvrsta dokvrsta_1 on dokstart_1.dokvrsta = dokvrsta_1.sifra 
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			left outer join dbo.cjenik on dbo.list.cjenik = dbo.cjenik.sifra
			left outer join dbo.asocjenik on dbo.cjenik.sifra = dbo.asocjenik.cjenik
				and dbo.evid.asokatalogid = dbo.asocjenik.asokatalogid
			inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
			inner join dbo.asortiman on dbo.skladiste.asortid = dbo.asortiman.id
			inner join dbo.takstros on dbo.asortiman.trosarina = dbo.takstros.sifra 
			inner join dbo.portarif on dbo.asortiman.portarifid = dbo.portarif.id
			left outer join dbo.zaliha on dbo.skladiste.id = dbo.zaliha.skladisteid
			inner join (select inserted.evidpop, max(zaliha.analitparid) as analitparid, 
					sum(dbo.zaliha.cijena * skladiste.kolicina)  max(evid.kolicina2*oj.koef + oj.offset) as markup, 

					sum (dbo.zaliha.nabcijena * skladiste.kolicina)   max(evid.kolicina2*oj.koef + oj.offset) as marza,   
					sum(dbo.zaliha.prcijenabez * skladiste.kolicina) max(evid.kolicina2*oj.koef + oj.offset) as prcijenasa,

		insert into dbo.zaliha (analitsklid, analitparid, skladisteid, asortid, valkod, 
			tecaj, cartar, portarifid, trosarina, inocijena, popdob, 
			markup,  carina, zavisni, marza, prcijenabez, prcijenasa, prerac, 
			preractecaj, zaliha, datnab) 
		(select distinct dokum.analitika2id, 
			epz.analitparid, 
			skladiste.id, skladiste.asortid, 
			dokum.valkod, dokum.tecaj, asortiman.cartarif, 
			asortiman.portarifid, asortiman.trosarina, 

			inocijena = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then  isnull(asocjenik.cijenaplkost,0)
					else epz.nabcijena
					end, 
			0,  
			markup = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then  0
					else 0 
					end, 
			carina = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then  0
					else 0 
					end, 
			zavisni = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then  0
					else 0 
					end, 
			marza = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then  0
					else epz.marza
					end, 
			prcijenabez = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then  isnull(asocjenik.cijenaplkost,0)
					else epz.prcijenabez
					end,  
			prcijenasa = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then isnull(round(asocjenik.cijenaplkost * portarif.koef,2),0)
					else epz.prcijenasa
					end,
			1, 1, evid.kolicina2, epz.datnab
		from inserted 
			inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id 
			inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.list on dbo.dokstart.listid = dbo.list.id
			inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid 
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.dokstart dokstart_1 on dbo.dokpoprat.dokpopratid = dokstart_1.id
			inner join dbo.dokvrsta dokvrsta_1 on dokstart_1.dokvrsta = dokvrsta_1.sifra 
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			left outer join dbo.asocjenik on dbo.list.cjenik = dbo.asocjenik.cjenik
				and dbo.evid.asokatalogid = dbo.asocjenik.asokatalogid
			inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
			inner join dbo.asortiman on dbo.skladiste.asortid = dbo.asortiman.id
			inner join dbo.portarif on dbo.asortiman.portarifid = dbo.portarif.id
			left outer join dbo.zaliha on dbo.skladiste.id = dbo.zaliha.skladisteid
			inner join (select inserted.evidpop, max(zaliha.analitparid) as analitparid, 
					sum(dbo.zaliha.cijena * skladiste.kolicina  inserted.kolicina) as markup, 
					avg(dbo.zaliha.carina * skladiste.kolicina  inserted.kolicina) as zavisni, 
					sum (dbo.zaliha.nabcijena * skladiste.kolicina  inserted.kolicina) as marza,  
					sum(dbo.zaliha.prcijenabez * skladiste.kolicina  inserted.kolicina) as prcijenasa, 
					sum(dbo.zaliha.trosarina * skladiste.kolicina 

		insert into dbo.zaliha (analitsklid, analitparid, skladisteid, asortid, valkod, 
			tecaj, cartar, portarifid, trosarina, inocijena, popdob, 
			markup,  carina, zavisni, marza, prcijenabez, prcijenasa, prerac, 
			preractecaj, zaliha, datnab, zaltip) 
		(select distinct dokum.analitika2id, 
			epz.analitparid, 
			skladiste.id, skladiste.asortid, 
			dokum.valkod, dokum.tecaj, asortiman.cartarif, 
			asortiman.portarifid, 

			trosarina = dbo.takstros.jedizn, 

			inocijena = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then  isnull(asocjenik.cijenaplkost,0)
					else epz.nabcijena
					end, 
			0,  
			markup = 0,
			carina = 0,
			zavisni = 0,

			marza = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost > 0
					then  0
					else epz.marza
					end, 
			prcijenabez = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost>0
					then  isnull(asocjenik.cijenaplkost,0)
					else epz.prcijenabez
					end,  
			prcijenasa = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost>0
					then isnull(round(asocjenik.cijenaplkost * portarif.koef,2),0)
					else epz.prcijenasa
					end,
			1, 1, evid.kolicina2, epz.datnab, epz.zaltip
		from inserted 
			inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id 
			inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.list on dbo.dokstart.listid = dbo.list.id
			inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid 
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.dokstart dokstart_1 on dbo.dokpoprat.dokpopratid = dokstart_1.id
			inner join dbo.dokvrsta dokvrsta_1 on dokstart_1.dokvrsta = dokvrsta_1.sifra 
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			left outer join dbo.asocjenik on dbo.list.cjenik = dbo.asocjenik.cjenik
				and dbo.evid.asokatalogid = dbo.asocjenik.asokatalogid
			inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
			inner join dbo.asortiman on dbo.skladiste.asortid = dbo.asortiman.id
			inner join dbo.takstros on dbo.asortiman.trosarina = dbo.takstros.sifra 
			inner join dbo.portarif on dbo.asortiman.portarifid = dbo.portarif.id
			left outer join dbo.zaliha on dbo.skladiste.id = dbo.zaliha.skladisteid
			inner join (select inserted.evidpop, zaliha.asortid,
					max(zaliha.analitparid) as analitparid,  
					sum(dbo.zaliha.cijena) as cijena, 

					sum (dbo.zaliha.nabcijena) as nabcijena, 
					sum(dbo.zaliha.prcijenabez) as prcijenabez, 

					from inserted
						inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id
						inner join dbo.dokstart on dbo.dokpoprat.dokpopratid = dbo.dokstart.id
						inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
						inner join (select dbo.evid.id, 
									sum (dbo.zaliha.nabcijena * skladiste.kolicina) as nabcijena
								from inserted
									inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id
									inner join dbo.dokstart on dbo.dokpoprat.dokpopratid = dbo.dokstart.id
									inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
									inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid 
									inner join dbo.zaliha on dbo.skladiste.zalihaid = dbo.zaliha.id
								group by  dbo.evid.id) 
							epzs on dbo.evid.id = epzs.id
						inner join (select inserted.dokpopid, sum (evid.kolicina2) as kolgotpr
								from inserted
									inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id
									inner join dbo.dokstart on dbo.dokpoprat.dokpopratid = dbo.dokstart.id
									inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
									left outer join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid 
								where evid.tip = 99 and skladiste.id is null
								group by inserted.dokpopid) 
						dpegp on inserted.dokpopid = dpegp.dokpopid
					where dokstart.dokvrsta = 105
					group by dbo.dokpoprat.dokpopratid)
				epz on dbo.dokpoprat.dokpopratid = epz.dokpopratid 
		where   dbo.zaliha.skladisteid is null and dbo.dokvrsta.zaliha = 1 
			and dokstart_1.dokvrsta = 105)

	if exists (select *	from inserted
				inner join dbo.evid with(nolock) on inserted.evidpop = dbo.evid.id 
				inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id 
				inner join dbo.skladiste with(nolock) on dbo.evid.id = dbo.skladiste.evidid 
					and dbo.asokatalog.asortid = dbo.skladiste.asortid 
				inner join dbo.zaliha with(nolock) on dbo.skladiste.zalihaid = dbo.zaliha.id
				inner join dbo.zalihadod with(nolock) on dbo.zaliha.id = dbo.zalihadod.zalihaid)
	begin
		insert into [dbo].[zalihadod]([zalihaid], [brutotezina], [netotezina], 
			[tempsklad], [bach], [trajanje], [analitproizid], [napomena])
		(select distinct zaliha.id, epd.brutotezina, epd.netotezina, epd.tempsklad,  
				epd.bach, epd.trajanje, epd.analitproizid, epd.napomena
		from inserted 
			inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id 
			inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid 
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
			inner join dbo.zaliha on dbo.skladiste.id = dbo.zaliha.skladisteid
			left outer join dbo.zalihadod on dbo.zaliha.id = dbo.zalihadod.zalihaid
			inner join (select evidpop, max(brutotezina) as brutotezina, 
					max(netotezina) as netotezina, max(tempsklad) as tempsklad, 
					max(bach) as bach, max(trajanje) as trajanje, 
					max(analitproizid) as analitproizid, max(napomena) as napomena
				from  inserted
					inner join dbo.evid on inserted.evidpop = dbo.evid.id 
					inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id 
					inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid 
						and dbo.asokatalog.asortid = dbo.skladiste.asortid 
					inner join dbo.zaliha on dbo.skladiste.zalihaid = dbo.zaliha.id
					inner join dbo.zalihadod on dbo.zaliha.id = dbo.zalihadod.zalihaid
				group by inserted.evidpop) 
			epd on dbo.evid.zalihaid = epd.evidpop 
		where   dbo.zalihadod.zalihaid is null and dbo.dokvrsta.zaliha = 1)
	end

		insert into [dbo].[zalihadod]([zalihaid], [bach], [napomena])
		(select zaliha.id, 
			left(cast(drn.godina as nvarchar(4)) + '-' + rtrim(drn.broj) 
			+ '  izd'
		from inserted 
			inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id 
			inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.dokstart dp on dbo.dokpoprat.dokpopratid = dp.id
			inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid 
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.list on dbo.dokstart.listid = dbo.list.id
			inner join dbo.listnad on dbo.list.listnadid = dbo.listnad.id
			inner join dbo.dokstart drn on dbo.listnad.vezaid = drn.id
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
			inner join dbo.zaliha on dbo.skladiste.id = dbo.zaliha.skladisteid
			left outer join dbo.zalihadod on dbo.zaliha.id = dbo.zalihadod.zalihaid
		where   dbo.zalihadod.bach is null and dbo.dokvrsta.zaliha = 1 and skupdogadjaj = 4)

end