create    trigger [dbo].[evid_itrig]  on [dbo].[evid] 
for insert 
not for replication
as
set nocount on

if exists (select * from inserted)
begin

	if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
			left outer join dbo.dokpoprat with(nolock) on dbo.dokstart.id = dbo.dokpoprat.dokpopratid
			left outer join dbo.dokstart dsp with(nolock) on dbo.dokpoprat.dokumid = dsp.id
		where dokstart.knjizeno = 1 or dokstart.zakljuceno = 1 or dokstart.placeno = 1
			or dsp.knjizeno = 1 or dsp.zakljuceno = 1 or dsp.placeno = 1)
		begin
			raiserror 44445 n'
	the record can''t be inserted, 
	document exists in gl or 
	in payment or is sealed !
origin: evid_itrig '
        			rollback transaction
		end

		if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join (select inserted.zalihaid, 
							sum(skladiste.vrsta * skladiste.kolicina) as stanje
					from inserted
						inner join dbo.skladiste with(nolock) on inserted.zalihaid = dbo.skladiste.zalihaid
					where inserted.zalihaid > 0
					group by inserted.zalihaid) sz on inserted.zalihaid = sz.zalihaid
		where inserted.zalihaid > 0  and dokvrsta.sklad = 1 and dokvrsta.zaliha = 0 
			and inserted.kolicina2 > (sz.stanje))
		begin
		raiserror 44445 n'

	the record can''t be inserted by manual discharge, 
	qty on the stock missing !

origin: evid_itrig'
        		rollback transaction
		end

	if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dbo.dokvrsta.setovi = 0 and dokvrsta.normativ = 0) 
	begin

		
		insert into dbo.evid  ([listid], [asokatalogid], [tip], [obracjedinica], [kolicina1], [kolicina2], 
				[fakcijena], [fakpopust], [faktrosar], [bod], [portarifid], [autoins], zalihaid)
		select inserted.listid,  asokatalog_1.id, 101, jmj.sifra, 
			kolicina1 = ((inserted.kolicina2 * asonorm.kolicina * obracjedinica.koef) + obracjedinica.offset),
			kolicina2 = ((inserted.kolicina2 * asonorm.kolicina * obracjedinica.koef) + obracjedinica.offset), 
			fakcijena = case when asocjenik.cijenaplkost > 0 and dokvrsta.cijenavrsta = 2 
					then asocjenik.cijenaplkost
					when asocjenik.cijena > 0 and dokvrsta.cijenavrsta = 3 
					then asocjenik.cijena
					else ((inserted.kolicina2 * (inserted.fakcijena - (inserted.fakcijena * inserted.fakpopust *0.01)))
						 inserted.kolicina2 
					end, 
		
			0, 0, 
			bod = case when asocjenik.bod > 0 and dokvrsta.cijenavrsta between 2 and 3
					then asocjenik.bod
					else ((inserted.kolicina2 * inserted.bod)
						 inserted.kolicina2 
					end, 
			
			asortiman.portarifid, 1,
			zalihaid = case when dokvrsta.zaliha = 1 
					then inserted.zalihaid
					else null
					end
		from	inserted
			inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.list on inserted.listid = dbo.list.id
			inner join dbo.obracjedinica on inserted.obracjedinica = dbo.obracjedinica.sifra

			inner join dbo.asonorm on inserted.asokatalogid = dbo.asonorm.katalogid
			inner join dbo.asokatalogasokatalog_1 on dbo.asonorm.komponentid = asokatalog_1.id
			inner join dbo.asortiman on asokatalog_1.asortid = dbo.asortiman.id
			inner join dbo.obracjedinica jmj on dbo.asortiman.obracjedgrupa = jmj.obrjedgrupa

			left outer join dbo.asocjenik on asokatalog_1.id = dbo.asocjenik.asokatalogid
				 and dbo.list.cjenik = dbo.asocjenik.cjenik
		where dbo.dokvrsta.setovi = 0 and dokvrsta.normativ = 0 
			and (inserted.tip < 99 or inserted.tip > 999)
			and jmj.osnovna = 1 and 
			not exists(select * from inserted 
						inner join dbo.evid on inserted.listid = dbo.evid.listid
						inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
			 		where evid.tip in (99, 101) and dokvrsta in (105,107)) 

		update dbo.evid
		set tip = 99 
		where id in (select inserted.id 
			from	inserted
				inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.asokatalog on inserted.asokatalogid = dbo.asokatalog.id
				inner join dbo.asonorm on dbo.asokatalog.id = dbo.asonorm.katalogid
			where dbo.dokvrsta.setovi = 0 and dokvrsta.normativ = 0 
				and (inserted.tip < 99 or inserted.tip > 999) 
				and dokvrsta.sifra in (105,107) and 
				not exists(select * from inserted 
							inner join dbo.evid on inserted.listid = dbo.evid.listid
						 where evid.tip = 99)) 

		if exists (select evid_1.id, (inserted.kolicina2 * asoutrosak.vrijedav) as vrijedav
					from	inserted
						inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
						inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
						inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id
						inner join dbo.asoutrosak with(nolock) on dbo.asokatalog.asortid = dbo.asoutrosak.asortid
						inner join dbo.asokatalog komponent with(nolock) on dbo.asoutrosak.asokompid = komponent.asortid
						left outer join dbo.evid evid_1 with(nolock) on inserted.listid = evid_1.listid and komponent.id = evid_1.asokatalogid
					where dbo.dokvrsta.setovi = 0 
						and dokvrsta.normativ = 0 
						and (inserted.tip < 99 or inserted.tip > 999) 
						and evid_1.tip = 101 
						and dokstart.dokvrsta in (105,107) 
						and utrosvrsta >=200
						and evid_1.asokatalogid is null)
		begin
		raiserror 44445 n'

	wrong mixture, haloooooooooooo !!!

origin: evid_itrig'
        		rollback transaction
		end

		update dbo.evid
		set kolicina2 = (kolicina2 - auts.vrijedav)
		from  (select evid_1.id, (inserted.kolicina2 * asoutrosak.vrijedav) as vrijedav
					from	inserted
						inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
						inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
						inner join dbo.asokatalog on inserted.asokatalogid = dbo.asokatalog.id
						inner join dbo.asoutrosak on dbo.asokatalog.asortid = dbo.asoutrosak.asortid
						inner join dbo.asokatalog komponent on dbo.asoutrosak.asokompid = komponent.asortid
						inner join dbo.evid evid_1 on inserted.listid = evid_1.listid and komponent.id = evid_1.asokatalogid
					where dbo.dokvrsta.setovi = 0 
						and dokvrsta.normativ = 0 
						and inserted.tip = 0 
						and evid_1.tip = 101 
						and dokstart.dokvrsta in (105,107)
						and utrosvrsta >=200)  auts 
			inner join dbo.evid on auts.id = dbo.evid.id

		delete dbo.evid
		from	inserted
			inner join dbo.evid on inserted.id = dbo.evid.id
			inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra

			inner join dbo.asonorm on inserted.asokatalogid = dbo.asonorm.katalogid
		where dbo.dokvrsta.setovi = 0 and dokvrsta.normativ = 0 
			and dokvrsta.sifra <> 105 and dokvrsta.sifra <> 107 
			and (inserted.tip < 99 or inserted.tip > 999)  

	end

	if exists(select * from	inserted
				inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id
			where dokvrsta.bck = 1 and dokvrsta.zaliha = 1 
				and asokatalog.ulkontrola = 1)
	begin

		insert dbo.evidpad (evidid, karantena) 
		select inserted.id, 1
		from inserted
			inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.asokatalog on inserted.asokatalogid = dbo.asokatalog.id
		where dokvrsta.bck = 1 and dokvrsta.zaliha = 1 
				and asokatalog.ulkontrola = 1
	end
		

	if exists (select * from inserted
					inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id 
					inner join dbo.asovrsta with(nolock) on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
					inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				where dbo.dokvrsta.sklad = 1 and dokvrsta.evidanalitvrsta = 0 
					and dbo.asovrsta.vrsta <> 3 and dokvrsta.zaliha = 0)
	begin

				insert into dbo.skladiste (evidid, vrsta, kolicina, asortid, zalihaid, datumzr)
				(select inserted.id, dokvrsta.sklvrst as vrsta, 
					kolicina =  ((inserted.kolicina2 * obracjedinica.koef) + obracjedinica.offset),
					asortid =  asokatalog.asortid,
					zalihaid = case 
						when inserted.zalihaid > 0 then  inserted.zalihaid
						else null
						end,
					datumzr = dokum.datumpi
				from inserted
					inner join dbo.evid on inserted.id = dbo.evid.id
					inner join dbo.asokatalog on inserted.asokatalogid = dbo.asokatalog.id 
					inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
					inner join dbo.obracjedinica on inserted.obracjedinica = dbo.obracjedinica.sifra
					inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
					inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
					inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				where dokvrsta.sklad = 1 
					and ((inserted.kolicina2 > 0 and dokvrsta.sklvrst = -1) 
					or (inserted.kolicina2 < 0 and dokvrsta.sklvrst = 1)) 
					and dokvrsta.normativ = 0 
					and dbo.asovrsta.vrsta <> 3 and evid.tip <> 99)

				insert into dbo.skladiste (evidid, vrsta, kolicina, asortid, zalihaid, datumzr)
				(select inserted.id, dokvrsta.sklvrst as vrsta, 
				kolicina = case 
					when asonorm.kolicina is null 
					then ((inserted.kolicina2 * obracjedinica.koef) + obracjedinica.offset) 
					when asonorm.kolicina > 0 
					then asonorm.kolicina * ((inserted.kolicina2 * obracjedinica.koef) + obracjedinica.offset)
					else 0
					end,
				asortid= case 
					when asonorm.katalogid is null  
					then asokatalog.asortid
					else asokatalog_1.asortid
					end,
				zalihaid = case 
					when inserted.zalihaid > 0 then  inserted.zalihaid
					else null
					end,
					datumzr = dokum.datumpi
				from inserted
					inner join dbo.evid on inserted.id = dbo.evid.id
					inner join dbo.asokatalog on inserted.asokatalogid = dbo.asokatalog.id 
					inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
					inner join dbo.obracjedinica on inserted.obracjedinica = dbo.obracjedinica.sifra
					inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
					inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
					inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
					left outer join dbo.asonorm on dbo.asokatalog.id = dbo.asonorm.katalogid 					left outer join dbo.asokatalog asokatalog_1 on dbo.asonorm.komponentid = asokatalog_1.id
				where dokvrsta.sklad = 1 
					and ((inserted.kolicina2 > 0 and dokvrsta.sklvrst = -1) 
					or (inserted.kolicina2 < 0 and dokvrsta.sklvrst = 1))
					and dokvrsta.normativ = 1 and dbo.dokvrsta.setovi = 1
					and dbo.asovrsta.vrsta <> 3 and evid.tip <> 99)
	end

	if exists (select * from inserted
				inner join dbo.evid with(nolock) on inserted.id = dbo.evid.id 
				inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id 
				inner join dbo.asovrsta with(nolock) on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
				inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dbo.dokvrsta.sklad = 1 and dbo.asovrsta.vrsta <> 3 and dokvrsta.zaliha = 1)
	begin

				insert into dbo.skladiste (evidid, vrsta, kolicina, asortid, datumzr)
				(select inserted.id, dokvrsta.sklvrst as vrsta, 
					kolicina = ((inserted.kolicina2 * obracjedinica.koef) + obracjedinica.offset),
					asortid = asokatalog.asortid,
					datumzr = dokum.datumpi
				from inserted 
					inner join dbo.asokatalog on inserted.asokatalogid = dbo.asokatalog.id 
					inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
					inner join dbo.obracjedinica on inserted.obracjedinica = dbo.obracjedinica.sifra
					inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
					inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
					inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				where dokvrsta.sklad = 1 
					and ((inserted.kolicina2 > 0 and dokvrsta.sklvrst =1) 
					or (inserted.kolicina2 < 0 and dokvrsta.sklvrst =-1)) 
					and dokvrsta.normativ = 0 
					and dbo.asovrsta.vrsta <> 3)

	end

		if exists(select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.dokum with(nolock) on dbo.dokstart.id = dbo.dokum.dokumid 
				inner join dbo.analitika with(nolock) on dbo.dokum.analitika2id = dbo.analitika.id
							and dbo.analitika.analitikavrsta = 4
				inner join dbo.cjelina with(nolock) on dbo.analitika.vezaid = dbo.cjelina.id
				inner join dbo.sklpj with(nolock) on dbo.cjelina.id = dbo.sklpj.cjelinaid
				inner join dbo.skladiste with(nolock) on inserted.id = dbo.skladiste.evidid
			where sklpj.minus = 0 and dokvrsta.sklad = 1 
				and dokvrsta.sklonline = 1 and dokvrsta.sifra <> 105
				and ((inserted.kolicina2 > 0 and dokvrsta.sklvrst = -1) 
				or (inserted.kolicina2 < 0 and dokvrsta.sklvrst = 1))
				and dokvrsta.bck = 0 and skladiste.zalihaid is null 
				and [dbo].[tipredmetbrdok] (inserted.listid) between 1 and 3)
		begin
		raiserror 44445 n'

	qty on the stock is too low !!!
	origin: evid_itrig '
		rollback transaction
		end

	if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
			where dokstart.dokvrsta = 73)
	begin

		if exists (select * from inserted
				inner join dbo.obracjedinica with(nolock) on inserted.obracjedinica = dbo.obracjedinica.sifra
				inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
			where obracjedinica.osnovna = 0 and dokstart.dokvrsta = 73)
		begin
		raiserror 44445 n'

		wrong measurement unit,
		please pick the basic unit !
		origin: evid_itrig'
		rollback transaction
		end

		if exists (select *  from inserted
				inner joindbo.list with(nolock) on inserted.listid = dbo.list.id 
				inner join dbo.listnad with(nolock) on dbo.list.listnadid = dbo.listnad.id
				inner join dbo.list  listrn with(nolock) on dbo.listnad.id = listrn.listnadid 
				inner join dbo.dokstart dokstartrn with(nolock) on listrn.id = dokstartrn.listid
			where dokstartrn.dokvrsta = 73 and dbo.list.cjenik <> listrn.cjenik
				and listrn.id > 0 and  list.id <> listrn.id and listnad.skupdogadjaj = 4)
			begin
			raiserror 44445 n' 
		the price list must be the same as in working order.
		origin: evid_itrig'
        			rollback transaction
			end

		insert into dbo.evid ([listid], [asokatalogid], [tip], [obracjedinica], [kolicina1], 
			[kolicina2], [fakcijena], [fakpopust], [faktrosar], [bod], [portarifid], [autoins])
		(select inserted.listid, asokatalogkompid, 100, asokompjmj, 
			kolicina1 =  case when utrosvrsta = 1
				then (((asortjmj.koef  obracjedinica.koef) * kolicina2 *  (vrijedav * 0.01)) + obracjedinica.offset + asortjmj.offset)
				when utrosvrsta = 100
				then (((asortjmj.koef / obracjedinica.koef) * vrijedav) + obracjedinica.offset + asortjmj.offset)
				else 0
				end, 
			kolicina2 =  0, 
			fakcijena = ((obracjedinica.koef) + obracjedinica.offset) * isnull(ak.cijenaplkost,0),
			0, 0, isnull(ak.bod,0), 0, 1
		from  inserted
			inner join dbo.list on inserted.listid = dbo.list.id
			inner join dbo.dokstart on dbo.list.id = dbo.dokstart.listid
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.asokatalog on inserted.asokatalogid = dbo.asokatalog.id
			inner join dbo.asoutrosak on dbo.asokatalog.asortid = dbo.asoutrosak.asortid
			inner join dbo.asortiman on dbo.asoutrosak.asokompid = dbo.asortiman.id
			inner join dbo.obracjedinica on inserted.obracjedinica = dbo.obracjedinica.sifra
			inner join dbo.obracjedinica asortjmj on dbo.asoutrosak.asortjmj = asortjmj.sifra
			inner join dbo.obracjedinica asokompjmj on dbo.asoutrosak.asokompjmj = asokompjmj.sifra
			left outer join (select asortid, cjenik, max(asokatalog.id) as asokatalogkompid,
						isnull(max(cijenaplkost),0) as cijenaplkost, isnull(max(bod),0) as bod
					from dbo.asokatalog 
						left outer join dbo.asocjenik on dbo.asokatalog.id = dbo.asocjenik.asokatalogid
					group by asortid, cjenik) 
				ak on dbo.asortiman.id = ak.asortid and dbo.list.cjenik = ak.cjenik
		where dokvrsta.sifra = 73 and dokvrsta.sklad = 0 
			and dokvrsta.zaliha = 0 and inserted.tip = 0
			and utrosvrsta < 200) 
	end

		if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid 
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dbo.dokvrsta.kolicina1 = 1)
		begin
			update dbo.evid
			set kolicina1 = inserted.kolicina2 
			from inserted
				inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dbo.evid.id = inserted.id and dokvrsta.kolicina1 = 1 and inserted.tip not in (100, 101, 102)
				and  (dbo.evid.kolicina1 > inserted.kolicina2  or dbo.evid.kolicina1 < inserted.kolicina2)
				and ([dbo].[tipredmetbrdok] ((select top 1 inserted.listid 
								from inserted group by inserted.listid)) = 1)
		end
end