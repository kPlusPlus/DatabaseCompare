
create trigger [dbo].[evid_utrig] on [dbo].[evid] 
for  update
not for replication
as
set nocount on

if exists (select * from inserted)
begin

	if exists (select * from inserted
			inner join deleted on inserted.id = deleted.id
			inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
			left outer join dbo.dokpoprat with(nolock) on dbo.dokstart.id = dbo.dokpoprat.dokpopratid
			left outer join dbo.dokstart dsp with(nolock) on dbo.dokpoprat.dokumid = dsp.id
		where (dokstart.knjizeno = 1 or dokstart.zakljuceno = 1 or dokstart.placeno = 1
			or dsp.knjizeno = 1 or dsp.zakljuceno = 1 or dsp.placeno = 1) and
			checksum (deleted.asokatalogid, deleted.obracjedinica, deleted.kolicina2, 
					deleted.fakcijena, deleted.fakpopust, deleted.faktrosar, deleted.portarifid) <> 
			checksum (inserted.asokatalogid, inserted.obracjedinica, inserted.kolicina2,
					inserted.fakcijena, inserted.fakpopust, inserted.faktrosar, inserted.portarifid))
		begin
			raiserror 44445 n'
		
	the record can''t be updated, 
	document exists in gl or 
	in payment or is sealed !
origin: evid_utrig '
        			rollback transaction
		end

	if exists (select * from  inserted
			inner join deleted on inserted.id = deleted.id
			inner join dbo.dokstart with(nolock) on deleted.listid = dbo.dokstart.listid
			inner join dbo.dokpoprat with(nolock) on dbo.dokstart.id = dbo.dokpoprat.dokumid
			inner join dbo.evidpoprat with(nolock) on dbo.dokpoprat.id = evidpoprat.dokpopid 
		where deleted.autoins = 1 and inserted.autoins = 1
			and (inserted.kolicina2 <> deleted.kolicina2
			or inserted.fakcijena <> deleted.fakcijena 
			or inserted.asokatalogid <> deleted.asokatalogid)
			and dokvrsta not in (73,75))
		begin
		raiserror 44445 n'
	the record can''t be updated, 
	it was inserted by automatic !
origin: evid_utrig'
        		rollback transaction
		end

	if exists (select * from inserted
			inner join deleted on inserted.id = deleted.id
			inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
			inner join dbo.evid with(nolock) on inserted.listid = dbo.evid.listid
		where dokstart.onhold = 0 and dokvrsta = 73
			and (inserted.kolicina2 <> deleted.kolicina2
			or inserted.fakcijena <> deleted.fakcijena
			or inserted.fakpopust <> deleted.fakpopust))
		begin
		raiserror 44445 n'
	the record can''t be updated, 
	document is in on hold status 
	changes will be allowed only
	by automatic processes!
origin: evid_utrig '
        		rollback transaction
		end

		if exists (select * from inserted
				inner join deleted on inserted.id = deleted.id
				inner join (select zalihaid, sum(vrsta * kolicina) as stanje
						from dbo.skladiste with(nolock) 
						where zalihaid > 0
						group by zalihaid) sz on inserted.zalihaid = sz.zalihaid
				inner join dbo.list with(nolock) on inserted.listid=dbo.list.id
				inner join dbo.dokstart with(nolock) on dbo.list.id=dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				left outer join dbo.skladiste with(nolock) on inserted.id = dbo.skladiste.evidid 
						and inserted.zalihaid = dbo.skladiste.zalihaid
			where inserted.zalihaid > 0  
				and inserted.kolicina2 > (case when inserted.zalihaid = skladiste.zalihaid 
							then (sz.stanje + deleted.kolicina2)
							else (sz.stanje)
							end)
				and dokvrsta.sklad = 1)
		begin
		raiserror 44445 n'
	qty on the stock missing !

origin: evid_utrig'
        		rollback transaction
		end

	if exists (select * from inserted
			inner join deleted on inserted.id = deleted.id
			inner join dbo.skladiste with(nolock) on inserted.id = dbo.skladiste.evidid
		where 	checksum(deleted.kolicina2, deleted.asokatalogid,
				deleted.zalihaid, deleted.obracjedinica) <>
			checksum(inserted.kolicina2, inserted.asokatalogid,
				inserted.zalihaid, inserted.obracjedinica))
	begin
		delete dbo.skladiste 
		from inserted
			inner join deleted on inserted.id = deleted.id 
			inner join dbo.skladiste on inserted.id = dbo.skladiste.evidid 
		where 	(skladiste.vrsta * skladiste.kolicina) < 1 and 
			(checksum(deleted.kolicina2, deleted.asokatalogid,
				deleted.zalihaid, deleted.obracjedinica) <>
			checksum(inserted.kolicina2, inserted.asokatalogid,
				inserted.zalihaid, inserted.obracjedinica))
option (keepfixed plan)

		if exists (select * from inserted
				inner join deleted on inserted.id = deleted.id
				inner join dbo.skladiste with(nolock) on inserted.id = dbo.skladiste.evidid
				inner join dbo.zaliha with(nolock) on dbo.skladiste.id = zaliha.skladisteid
				inner join dbo.skladiste sklr with(nolock) on dbo.zaliha.id = sklr.zalihaid
			where (deleted.kolicina2 > inserted.kolicina2 
				or deleted.asokatalogid <> inserted.asokatalogid
				or deleted.zalihaid <> inserted.zalihaid)
				and dbo.skladiste.id <> sklr.id) 
			begin
			raiserror 44445 n'

	the record can''t be updated
	discharging documents exists 
	on this stock !

origin: evid_utrig'
        			rollback transaction
			end

			update dbo.skladiste
			set kolicina = inserted.kolicina2
			from  inserted
				inner join deleted on inserted.id = deleted.id
				inner join dbo.skladiste on inserted.id = dbo.skladiste.evidid
			where  ((dbo.skladiste.vrsta = 1 and dbo.skladiste.kolicina > 0)  
				or (dbo.skladiste.vrsta = -1 and dbo.skladiste.kolicina < 0))
				and deleted.kolicina2 <> inserted.kolicina2
				and deleted.asokatalogid = inserted.asokatalogid

				and (deleted.zalihaid = inserted.zalihaid or deleted.zalihaid is null and inserted.zalihaid is null)
option (keepfixed plan)
	end

	if exists(select * from	inserted
				inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id
				left outer join dbo.evidpad with(nolock) on inserted.id = dbo.evidpad.evidid
			where dokvrsta.bck = 1 and dokvrsta.zaliha = 1 
				and asokatalog.ulkontrola = 1 and evidpad.evidid is null)
	begin

		insert dbo.evidpad (evidid, karantena) 
		select inserted.id, 1
		from inserted
			inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id
			left outer join dbo.evidpad on inserted.id = dbo.evidpad.evidid
		where dokvrsta.bck = 1 and dokvrsta.zaliha = 1 
			and asokatalog.ulkontrola = 1 and evidpad.evidid is null
option (keepfixed plan)
	end

		if exists (select * from inserted
					inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id 
					inner join dbo.asovrsta with(nolock) on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
					inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
					left outer join dbo.skladiste with(nolock) on inserted.id = dbo.skladiste.evidid
				where dokvrsta.sklad = 1 and dokvrsta.zaliha = 0 and skladiste.evidid is null
					and asovrsta.vrsta <> 3)
		begin

				insert into dbo.skladiste (evidid, vrsta, kolicina, asortid, zalihaid, datumzr)
				(select inserted.id, dokvrsta.sklvrst as vrsta, 
					kolicina =  ((inserted.kolicina2 * obracjedinica.koef) + obracjedinica.offset),
					asortid =  asokatalog.asortid,
					zalihaid = case 
						when inserted.zalihaid > 0 and inserted.kolicina2 <= isnull(zs.kolicina,0)
						then  inserted.zalihaid
						else null
						end,
					datumzr = dokum.datumpi
				from inserted	
					inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id 
					inner join dbo.asovrsta with(nolock) on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
					inner join dbo.obracjedinica with(nolock) on inserted.obracjedinica = dbo.obracjedinica.sifra
					inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
					inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
					left outer join dbo.skladiste on inserted.id = dbo.skladiste.evidid 
					left outer join (select inserted.id, sum(vrsta * kolicina) as kolicina
								from inserted
									inner join dbo.skladiste on inserted.zalihaid = dbo.skladiste.zalihaid
								where inserted.zalihaid > 0
								group by inserted.id)
						zs on inserted.id = zs.id
				where dokvrsta.sklad = 1 and dokvrsta.zaliha = 0
					and ((inserted.kolicina2 > 0 and dokvrsta.sklvrst = -1) 
					or (inserted.kolicina2 < 0 and dokvrsta.sklvrst = 1)) and dokvrsta.normativ = 0
					and dbo.asovrsta.vrsta <> 3 and dbo.skladiste.evidid is null
					 and inserted.tip <> 99)
option (keepfixed plan)

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
					inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id 
					inner join dbo.asovrsta with(nolock) on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
					inner join dbo.obracjedinica with(nolock) on inserted.obracjedinica = dbo.obracjedinica.sifra
					inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
					inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
					left outer join dbo.skladiste on inserted.id = dbo.skladiste.evidid 
					left outer join dbo.asonorm with(nolock) on dbo.asokatalog.id = dbo.asonorm.katalogid 					left outer join dbo.asokatalog asokatalog_1 with(nolock) on dbo.asonorm.komponentid = asokatalog_1.id
				where dokvrsta.sklad = 1 and dokvrsta.zaliha = 0
					and ((inserted.kolicina2 > 0 and dokvrsta.sklvrst = -1) 
					or (inserted.kolicina2 < 0 and dokvrsta.sklvrst = 1))  and dokvrsta.normativ = 1
					and dbo.asovrsta.vrsta <> 3 and dbo.skladiste.evidid is null
					 and inserted.tip <> 99)
option (keepfixed plan)
		end

		if exists (select * from inserted
					inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id 
					inner join dbo.asovrsta with(nolock) on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
					inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
					left outer join dbo.skladiste with(nolock) on inserted.id = dbo.skladiste.evidid
					left outer join dbo.zaliha z with(nolock) on dbo.skladiste.id = z.skladisteid 
				where dokvrsta.sklad = 1 and dokvrsta.zaliha = 1 and (skladiste.evidid is null or z.id is null)
					and dbo.asovrsta.vrsta <> 3)
		begin

				insert into dbo.skladiste (evidid, vrsta, kolicina, asortid, datumzr)
				(select inserted.id, dokvrsta.sklvrst as vrsta, 
					kolicina = ((inserted.kolicina2 * obracjedinica.koef) + obracjedinica.offset),
					asortid = asokatalog.asortid,
					datumzr = dokum.datumpi
				from inserted 
					inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id 
					inner join dbo.asovrsta with(nolock) on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
					inner join dbo.obracjedinica with(nolock) on inserted.obracjedinica = dbo.obracjedinica.sifra
					inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
					inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
					left outer join dbo.skladiste on inserted.id = dbo.skladiste.evidid 
				where dokvrsta.sklad = 1 and dokvrsta.zaliha = 1
					and ((inserted.kolicina2 > 0 and dokvrsta.sklvrst =1) 
					or (inserted.kolicina2 < 0 and dokvrsta.sklvrst =-1)) and dokvrsta.normativ = 0
					and dbo.asovrsta.vrsta <> 3 and dbo.skladiste.evidid is null)
option (keepfixed plan)

				insert into [dbo].[zaliha]([analitsklid], [analitparid], [skladisteid], 
						[asortid], [cartar], [valkod], [tecaj], 
						[inocijena], [popdob], 
						[markup], [carina], [zavisni], 
						[marza], [prcijenabez], [portarifid], [trosarina], [prcijenasa], 
						[prerac], [preractecaj], [zaliha])
				select dokum.analitika2id, dokum.analitika1id, skladiste.id, 
						skladiste.asortid, asortiman.cartarif, dokum.valkod, dokum.tecaj, 
						inserted.fakcijena, inserted.fakpopust, 
						0, 0, 0, 
						marza = case 
								when asocjenik.cijena > inserted.fakcijena 
									and dokvrsta.cijenavrsta = 1 and cjenik.primjmp = 0
									and asocjenik.valkodcijena = dokum.valkod
								then (1 - (asocjenik.cijena  portarif.koef)  portarif.koef
								else (inserted.fakcijena -(inserted.fakcijena * inserted.fakpopust * 0.01)) * dokum.tecaj
								end, 
						inserted.portarifid, inserted.faktrosar, 
						prcijenasa = case
								when asocjenik.cijena > inserted.fakcijena 
									and dokvrsta.cijenavrsta = 1 and cjenik.primjmp = 0
									and asocjenik.valkodcijena = dokum.valkod
								then asocjenik.cijena * dokum.tecaj * portarif.koef
								when asocjenik.cijena > inserted.fakcijena 
									and dokvrsta.cijenavrsta = 1 and cjenik.primjmp = 1
									and asocjenik.valkodcijena = dokum.valkod
								then asocjenik.cijena * dokum.tecaj
								else (inserted.fakcijena - (inserted.fakcijena * inserted.fakpopust * 0.01)) * dokum.tecaj * portarif.koef
								end, 
						0, 1, skladiste.kolicina
				from inserted 

					inner join dbo.list on inserted.listid = dbo.list.id
					inner join dbo.cjenik on dbo.list.cjenik = dbo.cjenik.sifra
					inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
					inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
					inner join dbo.asokatalog with(nolock) on inserted.asokatalogid = dbo.asokatalog.id 
					inner join dbo.asortiman with(nolock) on dbo.asokatalog.asortid = dbo.asortiman.id
					inner join dbo.asovrsta with(nolock) on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
					inner join dbo.portarif with(nolock) on inserted.portarifid = dbo.portarif.id
					inner join dbo.asocjenik on dbo.asokatalog.id = dbo.asocjenik.asokatalogid
									and dbo.list.cjenik = dbo.asocjenik.cjenik
					inner join dbo.skladiste on inserted.id = dbo.skladiste.evidid 
					left outer join dbo.zaliha on dbo.skladiste.id = dbo.zaliha.skladisteid
				where zaliha.skladisteid is null and dokvrsta.sklad = 1 and dokvrsta.zaliha = 1
					and ((skladiste.kolicina > 0 and skladiste.vrsta =1) 
					or (skladiste.kolicina < 0 and skladiste.vrsta =-1)) 
					and dokvrsta.normativ = 0 and dbo.asovrsta.vrsta <> 3
option (keepfixed plan)

		end

		if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				 where  dbo.dokvrsta.kolicina1 = 1)
		begin
			update dbo.evid
			set kolicina1 = inserted.kolicina2 
			from inserted
				inner join dbo.dokstart on inserted.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dbo.evid.id = inserted.id and dbo.dokvrsta.kolicina1=1 
				and  dbo.evid.kolicina1 <> inserted.kolicina2 and dokvrsta.sifra <> 73 
				and ( [dbo].[tipredmetbrdok] ((select top 1 inserted.listid 
								from inserted group by inserted.listid)) = 1) 
option (keepfixed plan)
		end
end