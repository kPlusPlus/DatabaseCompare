create trigger [dbo].[evidpoprat_itrig] on [dbo].[evidpoprat]
after insert not for replication
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
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.list with(nolock) on dbo.dokstart.listid = dbo.list.id 
			inner join dbo.cjenik with(nolock) on dbo.list.cjenik = dbo.cjenik.sifra 
			inner join dbo.dokstart dokstart_1 with(nolock) on dbo.dokpoprat.dokpopratid = dokstart_1.id
			inner join dbo.list list_1 with(nolock) on dokstart_1.listid = list_1.id 
			inner join dbo.cjenik cjenik_1 with(nolock) on list_1.cjenik = cjenik_1.sifra 
		where dbo.cjenik.primjmp <> cjenik_1.primjmp 
			and dokvrsta.cijenavrsta <> 2 and dokvrsta.cjenik = 1) 
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
				inner join dbo.evid with(nolock) on inserted.evidpop = dbo.evid.id
				inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id
				inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id
				inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.evid evidd with(nolock) on dbo.dokstart.listid = evidd.listid
											and dbo.evid.asokatalogid = evidd.asokatalogid 
			where dokvrsta.evid = 1 and dokvrsta.sklad = 0 and dokvrsta.zaliha = 0
					and evidd.autoins = 0)
		epu on dbo.evid.id = epu.id

	insert into dbo.evid (listid, asokatalogid, obracjedinica, tip, kolicina2, 
			fakcijena, fakpopust, faktrosar, portarifid, bod, autoins, zalihaid, takstros)
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
		fakcijena = case when dokvrsta.cijenavrsta = 2 and asocjenik.id > 0
					then asocjenik.cijenaplkost
					else dbo.evid.fakcijena
					end,
		fakpopust= case when dokvrsta.cijenavrsta = 2 and asocjenik.id > 0
					then 0
					else dbo.evid.fakpopust
					end,
		dbo.evid.faktrosar,
		portarifid = case 	when dokum.pdvstatus > 0 and evid.portarifid = 0 
					then asortiman.portarifid
					else evid.portarifid
					end,
		dbo.evid.bod, 
		autoins = case when dokvrsta.vrsta >= 101
				then 0 else 1 end,
		null,
		dbo.evid.takstros
	from inserted 
		inner join dbo.evid with(nolock) on inserted.evidpop = dbo.evid.id
		inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id
		inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.dokum with(nolock) on dbo.dokstart.id = dbo.dokum.dokumid
		inner join dbo.list with(nolock) on dbo.dokstart.listid = dbo.list.id
		inner join dbo.cjenik with(nolock) on dbo.list.cjenik = dbo.cjenik.sifra
		inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id
		inner join dbo.asortiman with(nolock) on dbo.asokatalog.asortid = dbo.asortiman.id
		left outer join dbo.asocjenik with(nolock) on dbo.asokatalog.id = dbo.asocjenik.asokatalogid
								and dbo.cjenik.sifra = dbo.asocjenik.cjenik

	where dokvrsta.evid = 1 and dokvrsta.sklad = 0 and dokvrsta.zaliha = 0)

	insert into dbo.evidpad (evidid, opis)
	(select distinct evidd.id, max(dbo.evidpad.opis)
	from inserted
		inner join dbo.evid with(nolock) on inserted.evidpop = dbo.evid.id
		inner join dbo.evidpad with(nolock) on dbo.evid.id = dbo.evidpad.evidid	
		inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id
		inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.evid evidd with(nolock) on dbo.dokstart.listid = evidd.listid
			and dbo.evid.asokatalogid = evidd.asokatalogid 
			and inserted.kolicina = evidd.kolicina2
		left outer join dbo.evidpad evidpadd with(nolock) on evidd.id = evidpadd.evidid	
	where dokvrsta.evid = 1 and dokvrsta.sklad = 0 and dokvrsta.zaliha = 0
		and evidpadd.evidid is null
		group by evidd.id)

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
			fakcijena, fakpopust, faktrosar, portarifid, bod, autoins, takstros)
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
		dbo.evid.bod, 1,
		dbo.evid.takstros
	from inserted 
		inner join dbo.evid with(nolock) on inserted.evidpop = dbo.evid.id
		inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id
		inner join dbo.asortiman with(nolock) on dbo.asokatalog.asortid = dbo.asortiman.id
		inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id
		inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.dokum with(nolock) on dbo.dokstart.id = dbo.dokum.dokumid
		inner join dbo.dokstart dokstart_1 with(nolock) on dbo.dokpoprat.dokpopratid = dokstart_1.id
		inner join dbo.dokvrsta dokvrsta_1 with(nolock) on dokstart_1.dokvrsta = dokvrsta_1.sifra 
	where dokvrsta.evid = 1 
		and dbo.dokvrsta.zaliha = 0 and dokvrsta_1.sklad = 0 and dokvrsta_1.zaliha = 0
		and dokvrsta.normativ = 0 and dokvrsta_1.normativ = 0)

	insert into dbo.evidpad (evidid, opis)
	(select evidd.id, dbo.evidpad.opis
	from inserted
		inner join dbo.evid with(nolock) on inserted.evidpop = dbo.evid.id
		inner join dbo.evidpad with(nolock) on dbo.evid.id = dbo.evidpad.evidid	
		inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id
		inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.evid evidd with(nolock) on dbo.dokstart.listid = evidd.listid
			and dbo.evid.asokatalogid = evidd.asokatalogid 
			and inserted.kolicina = evidd.kolicina2
		left outer join dbo.evidpad evidpadd with(nolock) on evidd.id = evidpadd.evidid	
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
			fakcijena, fakpopust, faktrosar, portarifid, bod, autoins, zalihaid, takstros)
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
		skladiste.zalihaid, 
		dbo.evid.takstros
	from inserted 
		inner join dbo.evid with(nolock) on inserted.evidpop = dbo.evid.id
		inner join dbo.skladiste with(nolock) on dbo.evid.id = dbo.skladiste.evidid
		inner join dbo.zaliha with(nolock) on dbo.skladiste.id = dbo.zaliha.skladisteid 
		inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id
		inner join dbo.asortiman with(nolock) on dbo.asokatalog.asortid = dbo.asortiman.id
		inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id
		inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
		inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		inner join dbo.dokum with(nolock) on dbo.dokstart.id = dbo.dokum.dokumid
		inner join dbo.dokstart dokstart_1 with(nolock) on dbo.dokpoprat.dokpopratid = dokstart_1.id
		inner join dbo.dokvrsta dokvrsta_1 with(nolock) on dokstart_1.dokvrsta = dokvrsta_1.sifra 
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
			fakcijena, fakpopust, faktrosar, portarifid, bod, autoins, zalihaid, takstros)
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
					else dbo.evid.fakcijena  epz.nabcijena)
					when dokvrsta.sifra = 127 and asocjenik.cijena > 0 and cjenik.primjmp = 1
						then ((isnull(asocjenik.cijena  epz.nabcijena)-1) * 100 

				

					else epz.marza
					end, 
			prcijenabez = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then  isnull(asocjenik.cijenaplkost,0)
					when dokvrsta.sifra = 127 and asocjenik.cijena > 0 and cjenik.primjmp = 0
					then isnull(asocjenik.cijena,0)
					when dokvrsta.sifra = 127 and asocjenik.cijena > 0 and cjenik.primjmp = 1

					then isnull(asocjenik.cijena  max(evid.kolicina2*oj.koef + oj.offset) as cijena,

					avg(dbo.zaliha.marza * skladiste.kolicina)  max(evid.kolicina2*oj.koef + oj.offset) as prcijenabez,
					sum(dbo.zaliha.prcijenasa * skladiste.kolicina)  max(evid.kolicina2*oj.koef + oj.offset) as trosarina, 

					min(zaliha.datnab) as datnab, max(zaliha.zaltip) as zaltip
				from inserted	
					inner join dbo.skladiste with(nolock) on inserted.evidpop = dbo.skladiste.evidid 
					inner join dbo.evid with(nolock) on dbo.skladiste.evidid = dbo.evid.id
					inner join dbo.zaliha with(nolock) on dbo.skladiste.zalihaid = dbo.zaliha.id
					inner join dbo.obracjedinica oj with(nolock) on dbo.evid.obracjedinica = oj.sifra
				group by inserted.evidpop) 
			epz on dbo.evid.zalihaid = epz.evidpop 
		where   dbo.zaliha.skladisteid is null and dbo.dokvrsta.zaliha = 1 
			and dokvrsta_1.sifra <> 105 and (dokvrsta.setovi = 1 or dokvrsta.normativ = 1))

 inserted.kolicina) as cijena, 

					avg(dbo.zaliha.markup * skladiste.kolicina  inserted.kolicina) as carina, 
					avg(dbo.zaliha.zavisni * skladiste.kolicina  inserted.kolicina) as nabcijena, 
					avg(dbo.zaliha.marza * skladiste.kolicina  inserted.kolicina) as prcijenabez, 
					sum(dbo.zaliha.prcijenasa * skladiste.kolicina  inserted.kolicina) as trosarina,
					avg(abs(inserted.kolicina)) as zaliha,
					min(zaliha.datnab) as datnab
				from inserted
					inner join dbo.skladiste on inserted.evidpop = dbo.skladiste.evidid 
					inner join dbo.zaliha on dbo.skladiste.zalihaid = dbo.zaliha.id
				group by inserted.evidpop) 
			epz on dbo.evid.zalihaid = epz.evidpop 
		where   dbo.zaliha.skladisteid is null and dbo.dokvrsta.zaliha = 1 
			and dokvrsta_1.sifra <> 105 and (dokvrsta.setovi = 1 or dokvrsta.normativ = 1))

* inserted.kolicina) as cijena, 

					avg(dbo.zaliha.marza) as marza, 
					sum(dbo.zaliha.prcijenasa) as prcijenasa, 

					min(zaliha.datnab) as datnab, max(zaliha.zaltip) as zaltip
				from inserted
					inner join dbo.skladiste with(nolock) on inserted.evidpop = dbo.skladiste.evidid 
					inner join dbo.zaliha with(nolock) on dbo.skladiste.zalihaid = dbo.zaliha.id
				group by inserted.evidpop, zaliha.asortid) 
			epz on dbo.evid.zalihaid = epz.evidpop and dbo.skladiste.asortid = epz.asortid
		where   dbo.zaliha.skladisteid is null and dbo.dokvrsta.zaliha = 1 
			and dokvrsta_1.sifra <> 105 and dokvrsta.setovi = 0 and dokvrsta.normativ = 0)

		insert into dbo.zaliha (analitsklid, analitparid, skladisteid, asortid, valkod, 
			tecaj, cartar, portarifid, trosarina, inocijena, popdob, 
			markup,  carina, zavisni, marza, prcijenabez, prcijenasa, prerac, 
			preractecaj, zaliha, datnab) 
		(select distinct dokum.analitika2id, 
			dokum.analitika1id, 
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
			carina =  0, 
			zavisni = 0, 
			marza = 0, 
			prcijenabez = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then  isnull(asocjenik.cijenaplkost,0)
					else epz.nabcijena
					end,  
			prcijenasa = case when dokvrsta.cijenavrsta = 2 and asocjenik.cijenaplkost<>0
					then  isnull(round(asocjenik.cijenaplkost * portarif.koef,2),0)
					else round(epz.nabcijena * portarif.koef,2) 
					end,
			1, 1, evid.kolicina2, dokum.datumpi
		from  inserted
			inner join dbo.evid with(nolock) on inserted.evidpop = dbo.evid.zalihaid
			inner join dbo.dokstart with(nolock) on dbo.evid.listid = dbo.dokstart.listid
			inner join dbo.list with(nolock) on dbo.evid.listid = dbo.list.id
			inner join dbo.dokum with(nolock) on dbo.dokstart.id = dbo.dokum.dokumid 
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id 
			inner join dbo.dokstart dokstart_1 with(nolock) on dbo.dokpoprat.dokpopratid = dokstart_1.id
			left outer join dbo.asocjenik with(nolock) on dbo.list.cjenik = dbo.asocjenik.cjenik
				and dbo.evid.asokatalogid = dbo.asocjenik.asokatalogid
			inner join dbo.skladiste with(nolock) on dbo.evid.id = dbo.skladiste.evidid
			inner join dbo.asortiman with(nolock) on dbo.skladiste.asortid = dbo.asortiman.id
			inner join dbo.takstros with(nolock) on dbo.asortiman.trosarina = dbo.takstros.sifra 
			inner join dbo.portarif with(nolock) on dbo.asortiman.portarifid = dbo.portarif.id
			left outer join dbo.zaliha with(nolock) on dbo.skladiste.id = dbo.zaliha.skladisteid
			inner join (select dbo.dokpoprat.dokpopratid, 
						 sum(epzs.nabcijena) *	if exists (select *	from inserted
				inner join dbo.evid on inserted.evidpop = dbo.evid.id 
				inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id 
				inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid 
				inner join dbo.dokpoprat on inserted.dokpopid = dbo.dokpoprat.id 
				inner join dbo.dokstart on dbo.dokpoprat.dokumid = dbo.dokstart.id
				inner join dbo.list on dbo.dokstart.listid = dbo.list.id
				inner join dbo.listnad on dbo.list.listnadid = dbo.listnad.id
				inner join dbo.zaliha on dbo.skladiste.zalihaid = dbo.zaliha.id
				left outer join dbo.zalihadod on dbo.zaliha.id = dbo.zalihadod.zalihaid
		where  dbo.zalihadod.bach is null and skupdogadjaj = 4) 
* ' + case when len(dp.izvornik) > 2 
				then  isnull(rtrim(dp.izvornik),rtrim(dp.broj)) 
				else rtrim(dp.broj)
				end,50) as bach,	
			n'lot = rn / izd'
		from inserted 
			inner join dbo.dokpoprat with(nolock) on inserted.dokpopid = dbo.dokpoprat.id 
			inner join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id
			inner join dbo.dokstart dp with(nolock) on dbo.dokpoprat.dokpopratid = dp.id
			inner join dbo.dokum with(nolock) on dbo.dokstart.id = dbo.dokum.dokumid 
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.list with(nolock) on dbo.dokstart.listid = dbo.list.id
			inner join dbo.listnad with(nolock) on dbo.list.listnadid = dbo.listnad.id
			inner join dbo.dokstart drn with(nolock) on dbo.listnad.vezaid = drn.id
			inner join dbo.evid with(nolock) on dbo.dokstart.listid = dbo.evid.listid
			inner join dbo.skladiste with(nolock) on dbo.evid.id = dbo.skladiste.evidid
			inner join dbo.zaliha with(nolock) on dbo.skladiste.id = dbo.zaliha.skladisteid
			left outer join dbo.zalihadod with(nolock) on dbo.zaliha.id = dbo.zalihadod.zalihaid
		where   dbo.zalihadod.bach is null and dbo.dokvrsta.zaliha = 1 and skupdogadjaj = 4)

end