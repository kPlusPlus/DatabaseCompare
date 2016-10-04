create trigger [dbo].[list_u_trig] on [dbo].[list]
after update not for replication
as
set nocount on

if exists (select * from inserted)

begin

	if exists(select * from inserted 
				inner join dbo.dokstart with(nolock) on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dokvrsta.list = 1 and dokvrsta.evid = 1 and dokvrsta.cjenik = 1)
	begin
		if exists(select *
				from inserted 
					inner join deleted on inserted.id = deleted.id
					inner join dbo.cjenik c1 with(nolock) on inserted.cjenik = c1.sifra
					inner join dbo.cjenik c2 with(nolock) on deleted.cjenik = c2.sifra
					inner join dbo.dokstart with(nolock) on inserted.id = dbo.dokstart.listid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
					inner join dbo.dokum with(nolock) on dbo.dokstart.id = dbo.dokum.dokumid
					left outer join dbo.evid with(nolock) on inserted.id = dbo.evid.listid
					left outer join dbo.asocjenik with(nolock) on dbo.evid.asokatalogid = dbo.asocjenik.asokatalogid
													and c1.sifra = dbo.asocjenik.cjenik
				where dokvrsta.list = 1 and dokvrsta.evid = 1 and dokvrsta.cjenik = 1 
					and ((checksum(c1.primjvp, c1.primjmp, c1.primjdev)<> checksum(c2.primjvp, c2.primjmp, c2.primjdev) 
							and evid.listid > 0) 
					or (dokvrsta.cijenavrsta = 1 and dokvrsta.iznos = 0 and c1.cjenikvrsta = 2 and c1.osnovni = 0) 
					or (dokvrsta.cijenavrsta = 3 and (mp = 1 or skk = 1 or tk = 1) and (c1.cjenikvrsta = 1 or c1.cjenikvrsta = 100)) 
					or (c1.cjenikvrsta = 100 and c1.osnovni = 0) 
					or (dokvrsta.cijenavrsta = 1 and dokum.valkod <> asocjenik.valkoddob and c1.osnovni = 0) 
					or (dokvrsta.cijenavrsta = 2 and dokum.valkod <> asocjenik.valkodcijena and c1.osnovni = 0) 
					or (c1.start > '19700101' and dokvrsta.iznos = 0 and (c1.stop < dokum.datum or c1.start > dokum.datum)))) 
		begin
			raiserror 44445 '
error reasons:
- items already exists and after that pricelist type is changed!
- wrong type of pricelist for this type of document!
- currency in pricelist is different from currency in document!
- pricelist is out of date range!
origin: list_u_trig'
     		rollback transaction
		end
	end

	if exists (select *  from inserted
			inner join dbo.dokstart with(nolock) on inserted.id = dbo.dokstart.listid
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.listnad with(nolock) on inserted.listnad1id = dbo.listnad.id
			inner join dbo.list list_1 with(nolock) on dbo.listnad.id = list_1.listnad1id 
			inner join dbo.dokstart dokstart_1 with(nolock) on list_1.id = dokstart_1.listid
			inner join dbo.dokvrsta dokvrsta_1 with(nolock) on dokstart_1.dokvrsta = dokvrsta_1.sifra
		where list_1.id > 0 
			and dokstart.id <> dokstart_1.id
			and listnad.skupdogadjaj in (30, 31,32)
			and dokvrsta.sifra <> 76 and dokvrsta_1.sifra <> 76
			and dokvrsta.placanje = 1 and dokvrsta_1.placanje = 1)
		begin
		raiserror 44445 n' 
stavljanje dokumenata u nadzornu knjigu
ne odgovara poslovnoj logici.
origin: list_u_trig'
    			rollback transaction
		end

		

	if exists (select * from inserted 
						inner join dbo.dokstart with(nolock) on inserted.id = dbo.dokstart.listid
			where dbo.dokstart.azuriranje = 1 and dbo.dokstart.kontrola = 1)
	begin

		if exists(select * from	inserted
					inner join dbo.dokstart with(nolock) on inserted.id = dbo.dokstart.listid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				where dokvrsta.evidanalitvrsta > 0)
		begin

			insert dbo.evidpad (evidid, analitikaid) 
			select	evid.id, 
					analitikaid = case when dokvrsta.evidanalitvrsta = dokvrsta.analitika2vrsta
									then dokum.analitika2id
									else evidpad.analitikaid
									end
			from inserted
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
				inner join dbo.evid on inserted.id = dbo.evid.listid
				left outer join dbo.evidpad on dbo.evid.id = dbo.evidpad.evidid
			where dokvrsta.evidanalitvrsta > 0 
				and evidpad.evidid is null
option (keepfixed plan)

			update dbo.evidpad
			set		analitikaid = case when dokvrsta.evidanalitvrsta = dokvrsta.analitika2vrsta 
										and evidpad.analitikaid is null
									then dokum.analitika2id
									else evidpad.analitikaid
									end
			from inserted
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
				inner join dbo.evid on inserted.id = dbo.evid.listid
				inner join dbo.evidpad on dbo.evid.id = dbo.evidpad.evidid
			where dokvrsta.evidanalitvrsta > 0 and evidpad.analitikaid is null
option (keepfixed plan)
		end

		if exists(select * from	inserted
					inner join dbo.dokstart with(nolock) on inserted.id = dbo.dokstart.listid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				where dokvrsta.limitctrl = 1 or dokvrsta.stavkactrl = 1)
		begin

			insert dbo.verifikacija (verifvrsta, dokumid)
			select 55, dokstart.id 
			from inserted 
				inner join dbo.dokstart with(nolock)on inserted.id = dbo.dokstart.listid 
				inner join dbo.dokvrsta with(nolock)on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.dokum with(nolock)on dbo.dokstart.id = dbo.dokum.dokumid
				inner join dbo.tbsaldopartner() tbsaldopartner on dbo.dokum.analitika1id = tbsaldopartner.analitikaid 
				left outer join dbo.verifikacija with(nolock)on dbo.dokstart.id = dbo.verifikacija.dokumid
									and dbo.verifikacija.verifvrsta = 55
			where dokstart.id > 0
				and tbsaldopartner.limit > 0 and tbsaldopartner.limit < tbsaldopartner.saldo 
				and dokvrsta.limitctrl = 1 and onhold = 0 
				and dbo.verifikacija.dokumid is null 
				and dokstart.azuriranje = 1 and dokstart.kontrola = 1
option (keepfixed plan)

			insert dbo.verifikacija (verifvrsta, dokumid)
			select top 1 50, dokstart.id 
			from inserted 
				inner join dbo.dokstart with(nolock)on inserted.id = dbo.dokstart.listid 
				inner join dbo.dokvrsta with(nolock)on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.dokum with(nolock)on dbo.dokstart.id = dbo.dokum.dokumidinner join dbo.evid with(nolock)on inserted.id = dbo.evid.listid
				inner join dbo.asokatalog with(nolock)on dbo.evid.asokatalogid = dbo.asokatalog.id
				inner join dbo.asosklad with(nolock)on dbo.asokatalog.asortid = dbo.asosklad.asortid
												and dbo.dokum.analitika2id = dbo.asosklad.analitsklid
				left outer join dbo.verifikacija with(nolock)on dbo.dokstart.id = dbo.verifikacija.dokumid
									and dbo.verifikacija.verifvrsta = 50
			where dokvrsta.stavkactrl = 1 and onhold = 0 
				and evid.fakcijena - (evid.fakcijena * evid.fakpopust * 0.01) < asosklad.pondnc * 1.01 
				and verifikacija.dokumid is null 
				and dokstart.azuriranje = 1 and dokstart.kontrola = 1
option (keepfixed plan)
		end

		if exists (select * from inserted
					inner join dbo.dokstart with(nolock) on inserted.id = dbo.dokstart.listid
					inner join dbo.dokvrstastatus with(nolock) on dbo.dokstart.status = dbo.dokvrstastatus.sifra
								and dbo.dokstart.dokvrsta = dbo.dokvrstastatus.dokvrsta 
					inner join dbo.dokvrstastatusakcija with(nolock) on dbo.dokvrstastatus.akcija = dbo.dokvrstastatusakcija.sifra
			where dokvrstastatusakcija.akcijavrsta = 0 
				and dokvrstastatusakcija.sifra > 0
				and dokvrstastatusakcija.autododvk > 0
				and dokstart.azuriranje = 1 and dokstart.kontrola = 1)
		begin

			insert into dokstart (listid, dokvrsta, vk, godina, broj, kontrola, azuriranje, hostid, firmaid, status)
			select inserted.id, dokvk.dokvrsta, dokvk.sifra, dbo.dokstart.godina, 
				 [dbo].[ncautogendoccode] (null, dokvk.dokvrsta, dbo.dokstart.godina, dokvk.sifra, dbo.dokstart.firmaid) as broj, 
				dbo.dokstart.kontrola, dbo.dokstart.azuriranje, dbo.dokstart.hostid, dbo.dokstart.firmaid,
				dbo.dokstart.status
			from   inserted 
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokvrstastatus with(nolock) on dbo.dokstart.status = dbo.dokvrstastatus.sifra 
							and dbo.dokstart.dokvrsta = dbo.dokvrstastatus.dokvrsta
				inner join dbo.dokvrstastatusakcija with(nolock) on dbo.dokvrstastatus.akcija = dbo.dokvrstastatusakcija.sifra
				inner join dbo.dokvk with(nolock) on dbo.dokvrstastatusakcija.autododvk = dbo.dokvk.sifra
				left outer join dbo.dokstart dokstart_1 on inserted.id = dokstart_1.listid 
									and dbo.dokvk.dokvrsta = dokstart_1.dokvrsta 
			where dokvrstastatusakcija.akcijavrsta = 0
				and dokvrstastatusakcija.sifra > 0
				and dokvrstastatusakcija.autododvk > 0
				and dokstart.azuriranje = 1 and dokstart.kontrola = 1
				and dokstart_1.listid is null
option (keepfixed plan)

			insert into dbo.dokum (dokumid, analitika1id, adresaid, analitika2id, analitika3id, pdvstatus, 
					datum, datumpi, odgoda, kampanjaid, valkod, tecaj)
			select dokstart_1.id as dokumid, dokum.analitika1id, dokum.adresaid, 
				dokum.analitika2id, dokum.analitika3id, dokvk.pdvstatus, 
				datum = case when dokvrsta_1.sklad = 1 or dokvrsta_1.mp = 1
						then (convert(smalldatetime,convert(varchar,getdate(),102)))
						else dokum.datum
						end, 
				datumpi = case when dokvrsta_1.sklad = 1 or dokvrsta_1.mp = 1
						then (convert(smalldatetime,convert(varchar,getdate(),102)))
						else dokum.datumpi
						end,  
				odgoda = case when dokvrsta_1.sklad = 1 or dokvrsta_1.mp = 1
						then 0
						else dokum.odgoda
						end, 
				dokum.kampanjaid, 
				dokum.valkod, dokum.tecaj
			from   inserted 
				inner join dbo.dokstarton inserted.id = dbo.dokstart.listid
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokvrstastatus with(nolock) on dbo.dokstart.status = dbo.dokvrstastatus.sifra 
								and dbo.dokstart.dokvrsta = dbo.dokvrstastatus.dokvrsta
				inner join dbo.dokvrstastatusakcija with(nolock) on dbo.dokvrstastatus.akcija = dbo.dokvrstastatusakcija.sifra
				inner join dbo.dokvk with(nolock) on dbo.dokvrstastatusakcija.autododvk = dbo.dokvk.sifra
				inner join dbo.dokstart dokstart_1 on inserted.id = dokstart_1.listid 
									and dbo.dokvk.dokvrsta = dokstart_1.dokvrsta 
				inner join dbo.dokvrsta dokvrsta_1 with(nolock) on dokstart_1.dokvrsta = dokvrsta_1.sifra
				left outer join dbo.dokum dokum_1 on dokstart_1.id = dokum_1.dokumid
			where dokvrstastatusakcija.akcijavrsta = 0
				and dokvrstastatusakcija.sifra > 0
				and dokvrstastatusakcija.autododvk > 0
				and dokstart.azuriranje = 1 and dokstart.kontrola = 1
				and dokstart_1.id > dbo.dokstart.id
				and dokum_1.dokumid is null
option (keepfixed plan)
		end

		if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.id = dbo.dokstart.listid 
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokvk with(nolock) on dbo.dokstart.vk = dbo.dokvk.sifra 

			where dokvk.autopredvk > 0) 

		begin

			insert into dokstart (listid, dokvrsta, vk, godina, broj, kontrola, 
								azuriranje, hostid, firmaid, autopredmet, status)
			select   dbo.dokstart.listid, dsvk.dokvrsta as dokvrsta, 
				vk = dokvk.autopredvk,
				dbo.dokstart.godina, 
				 [dbo].[ncautogendoccode] (null, dsvk.dokvrsta, dbo.dokstart.godina, dokvk.autopredvk, dbo.dokstart.firmaid) as broj, 
				dbo.dokstart.kontrola, dbo.dokstart.azuriranje, dbo.dokstart.hostid, dbo.dokstart.firmaid, 1, dbo.dokstart.status
			from   inserted 
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid 
				inner join dbo.dokvrsta with(nolock)on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokvk with(nolock) on dbo.dokstart.vk = dbo.dokvk.sifra
				inner join dbo.dokvk dsvk with(nolock) on dbo.dokvk.autopredvk = dsvk.sifra 
				inner join dbo.dokvrsta dokvrsta_1 with(nolock) on dsvk.dokvrsta = dokvrsta_1.sifra
				left outer join dbo.dokstart dokstart_1 on inserted.id = dokstart_1.listid 
							and dsvk.dokvrsta = dokstart_1.dokvrsta  
			where dokvk.autopredvk > 0

				and dokstart.azuriranje = 1 and dokstart.kontrola = 1
				and dokstart_1.listid is null
option (keepfixed plan)

			insert into dbo.dokum (dokumid, analitika1id, adresaid, analitika2id, analitika3id, pdvstatus, 
					datum, datumpi, odgoda, kampanjaid, valkod, tecaj)
			select dokstart_1.id as dokumid, dbo.dokum.analitika1id, dbo.dokum.adresaid, 
				dbo.dokum.analitika2id, dbo.dokum.analitika3id, dokvk.pdvstatus, 
				datum = case when dokvrsta_1.sklad = 1 or dokvrsta_1.mp = 1
						then (convert(smalldatetime,convert(varchar,getdate(),102)))
						else dokum.datum
						end, 
				datumpi = case when dokvrsta_1.sklad = 1 or dokvrsta_1.mp = 1
						then (convert(smalldatetime,convert(varchar,getdate(),102)))
						else dokum.datumpi
						end,  
				odgoda = case when dokvrsta_1.sklad = 1 or dokvrsta_1.mp = 1
						then 0
						else dokum.odgoda
						end,  
				dbo.dokum.kampanjaid, dbo.dokum.valkod, dbo.dokum.tecaj
			from   inserted 
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokvk dsvk with(nolock) on dbo.dokstart.vk = dsvk.sifra 
				inner join dbo.dokstart dokstart_1 on inserted.id = dokstart_1.listid 
							and dsvk.autopredvk = dokstart_1.vk 
				inner join dbo.dokvk with(nolock) on dokstart_1.vk = dbo.dokvk.sifra 
				inner join dbo.dokvrsta dokvrsta_1 with(nolock) on dokstart_1.dokvrsta = dokvrsta_1.sifra
				left outer join dbo.dokum dokum_1 on dokstart_1.id = dokum_1.dokumid
			where dsvk.autopredvk > 0
				and dokstart.azuriranje = 1 and dokstart.kontrola = 1
				and dokum_1.dokumid is null
option (keepfixed plan)
		end

		if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.evid with(nolock) on inserted.id = dbo.evid.listid
			where dokvrsta.sklad = 1)
		begin
			update dbo.evid 
			set kolicina1 = dbo.evid.kolicina1
			from inserted
					inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
					inner join dbo.evid on inserted.id = dbo.evid.listid
					left outer join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
			where dokvrsta.sklad = 1 and dokvrsta.zaliha = 0
					and dbo.skladiste.evidid is null 
option (keepfixed plan)

			if exists (select * from inserted
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
				inner join dbo.analitika with(nolock) on dbo.dokum.analitika2id = dbo.analitika.id
				inner join dbo.cjelina with(nolock) on dbo.analitika.vezaid = dbo.cjelina.id 
							and dbo.analitika.analitikavrsta = 4
				inner join dbo.sklpj with(nolock) on dbo.cjelina.id = dbo.sklpj.cjelinaid
				inner join dbo.evid on inserted.id = dbo.evid.listid
				inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
			where dokvrsta.sklad = 1 and dokvrsta.sklonline = 1
				and dokvrsta.zaliha = 0	and sklpj.minus = 0 
				and (skladiste.kolicina * skladiste.vrsta) < 0
				and (skladiste.zalihaid is null or (evid.zalihaid > 0 and skladiste.zalihaid <> evid.zalihaid))) 
			begin
				raiserror 44445 '
	qty on the stock is missing
	check the items grid!!!
	origin: list_u_trig'
     			rollback transaction
			end
		end

		insert into dbo.verifikacija (verifvrsta, dokumid)
		(select dbo.dokvrstaverif.verifvrsta, dbo.dokstart.id
		from inserted
			inner join dbo.dokstart with(nolock) on inserted.id = dbo.dokstart.listid 
			inner join dbo.dokvrstaverif with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrstaverif.dokvrsta 
			left outer join dbo.dokvk with(nolock) on dbo.dokstart.vk = dbo.dokvk.sifra
					and dbo.dokvrstaverif.verifvrsta = dbo.dokvk.autoverif
			left outer join dbo.verifikacija with(nolock) on dbo.dokstart.id = dbo.verifikacija.dokumid
							and dbo.dokvrstaverif.verifvrsta = dbo.verifikacija.verifvrsta
		where (dokvrstaverif.[auto] = 1 or (dokvk.autoverif > 0 and dokstart.autopredmet = 0))
			and verifikacija.dokumid is null
			and dokstart.azuriranje = 1 and dokstart.kontrola = 1)
option (keepfixed plan)

		

		update dbo.dokum
		set analitika1id = case when dvs > 0 
						then  dp.analitika1id
						else dbo.dokum.analitika1id
						end,
			analitika2id =  case when dvs > 0 
						then  dp.analitika2id
						else dbo.dokum.analitika2id
						end,
			analitika3id = case when dvs > 0  and analitika3vrsta > 0 and analitika3 = 1
						then  dp.analitika3id

						when dvs > 0 and ( analitika3vrsta = 0 or analitika3 = 0)
						then null
						else dbo.dokum.analitika3id
						end,
			datum =		dbo.dokum.datum,

			datumpi =	dbo.dokum.datumpi,

			odgoda =	dbo.dokum.odgoda,

			kampanjaid = case when dbo.dokum.kampanjaid > 0 
						then 	dbo.dokum.kampanjaid 
						else 1 
						end, 
			valkod =	case when dvs > 0 
						then  dp.valkod
						else dbo.dokum.valkod
						end,
			tecaj =		case when dvs > 0 
						then  dp.tecaj
						else dbo.dokum.tecaj
						end,
			pdvstatus = dokvk.pdvstatus
		from inserted 
			inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
			inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid  
			inner join dbo.dokvk with(nolock) on dbo.dokstart.vk = dbo.dokvk.sifra
			left outer join (select inserted.id,
					dokvk.autopredvk as dvs, 
					analitika1id, analitika2id, analitika3id, 
					datumpi, odgoda, 
					kampanjaid, valkod, 
					tecaj, knjizeno, zakljuceno,
					analitika3vrsta, analitika3,
					pdvstatus = dokvk.pdvstatus
				from inserted
					inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
					inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid 
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
					inner join dbo.dokvk with(nolock) on dbo.dokstart.vk = dbo.dokvk.sifra
				where dokstart.autopredmet = 0 and dokvk.autopredvk > 0) 
			dp on inserted.id = dp.id and dbo.dokstart.vk = dp.dvs
		where dokstart.azuriranje = 1 and dokstart.kontrola = 1
option (keepfixed plan)

		update dbo.dokstart 
		set godina = case when dvs > 0
					then  dps.godina
					else dbo.dokstart.godina
					end,
			broj = case when dvs > 0 and dokstart.godina <> dps.godina
					then  [dbo].[ncautogendoccode] (null, dokstart.dokvrsta, dokstart.godina, dokstart.vk, dokstart.firmaid) 
					else dbo.dokstart.broj
					end,
			izvornik = case when dvs > 0
					then  isnull(dps.izvornik,'')
					else isnull(dbo.dokstart.izvornik,'')
					end,
			autopredmet = case when dvs > 0
					then  1
					else 0
					end, 
			korisnikid = case when dvs > 0
					then  dps.korisnikid
					else dbo.dokstart.korisnikid
					end,
			kontrola = 0,
			azuriranje = 0,
			zadrazd = case when dbo.btdischarge(inserted.id) = 1
					then 0
					else 1 
					end,
			zakljuceno = case when dbo.dokvrsta.autozkcn = 1 
					and (dokvrsta.bck = 0 or dbo.btdischarge(inserted.id) = 0) 
					then 1
					else dbo.dokstart.zakljuceno
					end 
		from inserted
			inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			left outer join 
				(select  inserted.id, 
					dokvk.autopredvk as dvs, 
					godina, izvornik, korisnikid
				from inserted 
					inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
					inner join dbo.dokvk with(nolock) on dbo.dokstart.vk = dbo.dokvk.sifra
				where dokstart.autopredmet = 0 and dokvk.autopredvk > 0) 
			dps on inserted.id = dps.id and dbo.dokstart.vk = dps.dvs
		where dokstart.azuriranje = 1 and dokstart.kontrola = 1
option (keepfixed plan)

		if exists (select * from inserted
					inner join dbo.dokstart with(nolock)on inserted.id = dbo.dokstart.listid
					inner join dbo.dokvrsta dv with(nolock)on dbo.dokstart.dokvrsta = dv.sifra
				where dv.zaliha = 1 and dv.zadrazd = 1)
		begin

			update dbo.zalserbr
			set dobavljac = case when zalserbr.dobavljac is null or len(zalserbr.dobavljac) < 3
							then rtrim(left(adob.analitika, 99))
							else zalserbr.dobavljac
							end,
				racundobav = case when zalserbr.racundobav is null or len(zalserbr.racundobav) < 3
							then rtrim(left(izvornik, 20)) 
							else zalserbr.racundobav
							end,
				datnab = zaliha.datnab,
				proizvodjac = case when zalserbr.proizvodjac is null or len(zalserbr.proizvodjac) < 3
							then rtrim(left(apr.analitika, 99))
							else zalserbr.proizvodjac
							end
			from inserted
				inner join dbo.dokstart with(nolock)on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta dv with(nolock)on dbo.dokstart.dokvrsta = dv.sifra
				inner join dbo.evid with(nolock)on inserted.id = dbo.evid.listid
				inner join dbo.skladiste with(nolock)on dbo.evid.id = dbo.skladiste.evidid
				inner join dbo.zaliha with(nolock)on dbo.skladiste.id = dbo.zaliha.skladisteid
				inner join dbo.analitika adob with(nolock)on dbo.zaliha.analitparid = adob.id
				left outer join dbo.zalihadod with(nolock)on dbo.zaliha.id = dbo.zalihadod.zalihaid
				left outer join dbo.analitika apr with(nolock)on dbo.zalihadod.analitproizid = apr.id
				inner join dbo.zalserbr on dbo.zaliha.id = dbo.zalserbr.zalihaid
			where dokstart.azuriranje = 0 and dokstart.kontrola = 0 

				and dv.zadrazd = 1 and dv.zaliha = 1
				and zaliha.id = zalserbr.zalihaid
option (keepfixed plan)

		update dbo.evidpad
		set karantena = 0
		from inserted
			inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join (select inserted.id as listid, verificirao, verificirano
						from inserted
							inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
							inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
							inner join dbo.verifikacija on dbo.dokstart.id = dbo.verifikacija.dokumid
						where  (verifvrsta = 2 or verifvrsta = 3)
							and dokvrsta.bck = 1 and dokvrsta.zaliha = 1
							and not(verifikacija.verificirao is null) 
						) verifikacija on inserted.id = verifikacija.listid
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
			inner join dbo.evidpad on dbo.evid.id = dbo.evidpad.evidid
		where (dokstart.knjizeno = 1 or dokstart.zakljuceno = 1) 
			and evidpad.karantena = 1 
			and dokvrsta.zaliha = 1
			and verifikacija.verificirano >= evidpad.datumk 
			and ((asokatalog.sb = 1 and len(rtrim(evidpad.barcodeaso))>2 
					and len(rtrim(evidpad.barcodebach))>3)
			or (asokatalog.sb = 0 and len(rtrim(evidpad.barcodeaso))>3))
			and evid.kolicina2 = evidpad.kolicina 
option (keepfixed plan)

			update dbo.dokum
			set kampanjaid = kampanjaid
			from (select distinct dokstart_1.id
				from inserted
					inner join dbo.dokstart with(nolock)on inserted.id = dbo.dokstart.listid
					inner join dbo.dokvrsta dv with(nolock)on dbo.dokstart.dokvrsta = dv.sifra
					inner join dbo.evid with(nolock)on inserted.id = dbo.evid.listid
					inner join dbo.skladiste with(nolock)on dbo.evid.id = dbo.skladiste.evidid
					inner join dbo.zaliha with(nolock)on dbo.skladiste.id = dbo.zaliha.skladisteid
					inner join dbo.skladiste as sklad_1 with(nolock)on dbo.zaliha.id = sklad_1.zalihaid
					inner join dbo.evid evid_1 with(nolock)on sklad_1.evidid = evid_1.id
					inner join dbo.dokstart dokstart_1 with(nolock)on evid_1.listid = dokstart_1.listid
					inner join dbo.dokvrsta with(nolock)on dokstart_1.dokvrsta = dbo.dokvrsta.sifra
				 where dbo.dokstart.azuriranje = 0 and dbo.dokstart.kontrola = 0 
					and dokstart.zadrazd = 1 and dv.zadrazd = 1 and dv.zaliha = 1 and dv.knjizenje = 1
					and dbo.dokvrsta.zadrazd = 1 and dbo.dokvrsta.sklad = 1 
					and dbo.dokvrsta.zaliha = 0 
					and sklad_1.zalihaid > 0 and (sklad_1.kolicina * sklad_1.vrsta) < 1
					and dokstart_1.azuriranje = 0 and dokstart_1.kontrola = 0) dr
			inner join dbo.dokum with(nolock)on dr.id = dbo.dokum.dokumid 
option (keepfixed plan)
		end

		if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.id = dbo.dokstart.listid 
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			where (dokvrsta.autodokpop > 0 or dokvrsta.autoevidpop > 0)
				and (dokvrsta.bck = 0 or (dokvrsta.bck = 1 and dokstart.zadrazd = 1)) 
				and dokstart.azuriranje = 0 and dokstart.kontrola = 0) 
		begin

			insert into dbo.list (analitikaid, listnadid, listnad1id, cjenik)
			select dokstart.id, inserted.listnadid, inserted.listnad1id, inserted.cjenik
			from inserted
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid 
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokvk with(nolock) on dbo.dokstart.vk = dbo.dokvk.sifra
				left outer join dbo.list on dbo.dokstart.id = dbo.list.analitikaid
			where dokvk.autopopratvk > 0
				and (dokvrsta.bck = 0or (dokvrsta.bck = 1 and dokstart.zadrazd = 1)) 
				and dokstart.azuriranje = 0 and dokstart.kontrola = 0
				and dbo.list.id is null
option (keepfixed plan)
			

			insert into dbo.dokstart (listid, dokvrsta, vk, godina, broj, kontrola, azuriranje, hostid, firmaid, autopredmet)
			select   dbo.list.id, 
				dsvk.dokvrsta as dokvrsta, 
				vk = dokvk.autopopratvk, 
				dbo.dokstart.godina, 
				 [dbo].[ncautogendoccode] (null, dsvk.dokvrsta, dbo.dokstart.godina, dokvk.autopopratvk, dbo.dokstart.firmaid) as broj, 
				dbo.dokstart.kontrola, dbo.dokstart.azuriranje, dbo.dokstart.hostid, dbo.dokstart.firmaid, 1
			from   inserted 
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid 
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.list on dbo.dokstart.id = dbo.list.analitikaid
				inner join dbo.dokvk with(nolock) on dbo.dokstart.vk = dbo.dokvk.sifra
				inner join dbo.dokvk dsvk with(nolock) on dbo.dokvk.autopopratvk = dsvk.sifra 
				left outer join dbo.dokstart dokstart_1 on dbo.list.id = dokstart_1.listid 
							and dbo.dokvk.autopopratvk = dokstart_1.vk 
			where dokvk.autopopratvk > 0 
				and (dokvrsta.bck = 0 or (dokvrsta.bck = 1 and dokstart.zadrazd = 1)) 
				and dokstart.azuriranje = 0 and dokstart.kontrola = 0
				and dokstart_1.id is null
option (keepfixed plan)

			insert into dbo.dokum (dokumid, analitika1id, adresaid, analitika2id, analitika3id, pdvstatus, 
					datum, datumpi, odgoda, kampanjaid, valkod, tecaj)
			select dokstart_1.id as dokumid, dbo.dokum.analitika1id, dbo.dokum.adresaid, 
				dbo.dokum.analitika3id, dbo.dokum.analitika2id, dokvk.pdvstatus, 
				dbo.dokum.datumpi as datum, dbo.dokum.datumpi, 0 as odgoda, dbo.dokum.kampanjaid, 
				dbo.dokum.valkod, dbo.dokum.tecaj
			from   inserted 
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.list on dbo.dokstart.id = dbo.list.analitikaid
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
				inner join dbo.dokvk dsvk with(nolock) on dbo.dokstart.vk = dsvk.sifra 
				inner join dbo.dokstart dokstart_1 on dbo.list.id = dokstart_1.listid 
							and dsvk.autopopratvk = dokstart_1.vk 
				inner join dbo.dokvk with(nolock) on dokstart_1.vk = dbo.dokvk.sifra 
				left outer join dbo.dokum dokum_1 on dokstart_1.id = dokum_1.dokumid
			where dsvk.autopopratvk > 0
				and (dokvrsta.bck = 0 or (dokvrsta.bck = 1 and dokstart.zadrazd = 1)) 
				and dokstart.azuriranje = 0 and dokstart.kontrola = 0
				and dokum_1.dokumid is null
option (keepfixed plan)

			insert into dbo.dokpoprat (dokumid, dokpopratid)
			select dokstart_1.id, 
				dbo.dokstart.id 
			from inserted 
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.list on dbo.dokstart.id = dbo.list.analitikaid
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
				inner join dbo.dokvk dsvk with(nolock) on dbo.dokstart.vk = dsvk.sifra 
				inner join dbo.dokstart dokstart_1 on dbo.list.id = dokstart_1.listid 
							and dsvk.autopopratvk = dokstart_1.vk 
				left join dbo.dokpoprat on dbo.dokstart.id = dbo.dokpoprat.dokpopratid
							and dokstart_1.id = dbo.dokpoprat.dokumid
			where dsvk.autopopratvk > 0
				and (dokvrsta.bck = 0 or (dokvrsta.bck = 1 and dokstart.zadrazd = 1)) 
				and dokstart.azuriranje = 0 and dokstart.kontrola = 0
				and dbo.dokpoprat.id is null
option (keepfixed plan)

			insert into dbo.evidpoprat (dokpopid, evidpop, kolicina)
			select dbo.dokpoprat.id, evid.id, evid.kolicina2
			from inserted 
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.evid on inserted.id = dbo.evid.listid 
				inner join dbo.dokpoprat on dbo.dokstart.id = dbo.dokpoprat.dokpopratid
				inner join dbo.dokstart dokstart_1 on dbo.dokpoprat.dokumid = dokstart_1.id
				inner join dbo.dokvrsta dv1 with(nolock) on dokstart_1.dokvrsta = dv1.sifra 
				left outer join dbo.evidpoprat on dbo.dokpoprat.id = dbo.evidpoprat.dokpopid
			where dokvrsta.autoevidpop > 0 and dokvrsta.evid = 1 and dv1.evid = 1
				and dokstart.azuriranje = 0 and dokstart.kontrola = 0
				and dbo.evidpoprat.dokpopid is null
option (keepfixed plan)
			

			update [dbo].[dokstart]
			set	[azuriranje] = 1, 
				[kontrola] = 1
			from inserted 
				inner join dbo.dokstart ds on inserted.id = ds.listid
				inner join dbo.list on ds.id = dbo.list.analitikaid
				inner join dbo.dokstart on dbo.list.id = dbo.dokstart.listid
option (keepfixed plan)
		end

		if exists (select * from inserted
					inner join dbo.dokstart with(nolock)on inserted.id = dbo.dokstart.listid
					inner join dbo.dokvrstastatus with(nolock)on dbo.dokstart.status = dbo.dokvrstastatus.sifra
									and dbo.dokstart.dokvrsta = dbo.dokvrstastatus.dokvrsta
					inner join dbo.dokvrstastatusakcija with(nolock)on dbo.dokvrstastatus.akcija = dbo.dokvrstastatusakcija.sifra
					left outer join dbo.dokpoprat with(nolock)on dbo.dokstart.id = dbo.dokpoprat.dokpopratid
			where dokvrstastatusakcija.sifra > 0
				and dokvrstastatusakcija.akcijavrsta between 1 and 2 
				and dokvrstastatusakcija.autododvk > 0
				and dokstart.azuriranje = 0 and dokstart.kontrola = 0
				and dokpoprat.id is null) 
		begin
				
			begin

			declare	@cjenik smallint, @listnadid int, @listnad1id int, 
					@dokumid int, 
					@dokvrsta tinyint, @vk smallint, @godina smallint, 
					@broj nchar(15),
					@hostid int, @firmaid int, @status smallint,
					@analitika1id int, @adresaid int, 
					@analitika2id int, @analitika3id int, @pdvstatus tinyint, @datum smalldatetime, 
					@datumpi smalldatetime, @odgoda smallint, @kampanjaid smallint, 
					@valkod smallint, @tecaj numeric(19,12),

					@innovidokid int, @innovidokpopratid int, @novibroj nchar(15)
						
			declare cdokbroj cursor fast_forward 
			for
				select inserted.cjenik, inserted.listnadid, inserted.listnad1id,
				dokstart.id as dokid ,
				dokvk.dokvrsta, dokvk.sifra, dokstart.godina, 
				dokstart.broj, 
				dokstart.hostid, dokstart.firmaid, dokstart.status,
				dokum.analitika1id, dokum.adresaid, 
				analitik2id = case when evidanalitvrsta = 4 and epas.id > 0
							then epas.analitikaid 
							else dokum.analitika2id
							end, 
				dokum.analitika2id, 
				dokvk.pdvstatus, 
				dokum.datumpi as datum, dokum.datumpi, 0 as odgoda, dokum.kampanjaid, 
				dokum.valkod, dokum.tecaj
			
			from  inserted 
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokvrstastatus with(nolock) on dbo.dokstart.status = dbo.dokvrstastatus.sifra 
									and dbo.dokstart.dokvrsta = dbo.dokvrstastatus.dokvrsta
				inner join dbo.dokvrstastatusakcija with(nolock) on dbo.dokvrstastatus.akcija = dbo.dokvrstastatusakcija.sifra
				inner join dbo.dokvk with(nolock) on dbo.dokvrstastatusakcija.autododvk = dbo.dokvk.sifra
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
				left outer join dbo.dokpoprat on dbo.dokstart.id = dbo.dokpoprat.dokpopratid
				left outer join (select inserted.id, evidpad.analitikaid 
								from inserted 
									inner join dbo.evid on inserted.id = dbo.evid.listid
									inner join dbo.evidpad on dbo.evid.id = dbo.evidpad.evidid
									inner join dbo.analitika with(nolock) on dbo.evidpad.analitikaid = dbo.analitika.id
								where evidpad.analitikaid > 0 and analitikavrsta = 4
								group by inserted.id, evidpad.analitikaid) epas on inserted.id = epas.id
			where dokvrstastatusakcija.sifra > 0
				and dokvrstastatusakcija.akcijavrsta between 1 and 2 
				and dokvrstastatusakcija.autododvk > 0
				and dokstart.azuriranje = 0 and dokstart.kontrola = 0
				and dokpoprat.id is null
option (keepfixed plan)
		
			
			open cdokbroj
			fetch next from cdokbroj
			into @cjenik, @listnadid, @listnad1id,
				@dokumid, @dokvrsta, @vk, @godina, @broj, @hostid, @firmaid, @status, @analitika1id, @adresaid, @analitika2id, 
				@analitika3id, @pdvstatus, @datum, @datumpi, @odgoda, @kampanjaid, @valkod, @tecaj
			while @@fetch_status = 0
			begin
				select @novibroj = [dbo].[ncautogendoccode] (null, @dokvrsta, @godina, @vk, @firmaid)
											

				insert into dbo.dokstart (dokvrsta, vk, godina, izvornik, broj, hostid, firmaid, [status])
				values (@dokvrsta, @vk, @godina, @broj, @novibroj, @hostid, @firmaid, @status )
				set @innovidokid = scope_identity()
				
				update dbo.list 
				set analitikaid = @dokumid, cjenik =@cjenik, 
					listnadid = @listnadid, listnad1id = @listnad1id
				from dbo.dokstart
					inner join dbo.list on dbo.dokstart.listid = dbo.list.id
				where dokstart.id = @innovidokid
option (keepfixed plan)

				insert into dbo.dokum (dokumid, analitika1id, adresaid, analitika2id, analitika3id, 
									pdvstatus, datum, datumpi, odgoda, kampanjaid, valkod, tecaj)
				values(@innovidokid,@analitika1id, @adresaid, @analitika2id, @analitika3id, 
									@pdvstatus, @datum, @datumpi, @odgoda, @kampanjaid, @valkod, @tecaj)

				insert into dbo.dokpoprat( dokumid, dokpopratid) values ( @innovidokid,@dokumid) 

			fetch next from cdokbroj
			into @cjenik, @listnadid, @listnad1id,
				@dokumid, @dokvrsta, @vk, @godina, @broj, @hostid, @firmaid, @status, @analitika1id, @adresaid, @analitika2id, 
				@analitika3id, @pdvstatus, @datum, @datumpi, @odgoda, @kampanjaid, @valkod, @tecaj
			end		
		
		close cdokbroj
		deallocate cdokbroj 
		end
			

			insert into dbo.evidpoprat (dokpopid, evidpop, kolicina)
			select dbo.dokpoprat.id, evid.id, evid.kolicina2
			from inserted 
				inner join dbo.dokstart on inserted.id = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokvrstastatus with(nolock) on dbo.dokstart.status = dbo.dokvrstastatus.sifra 
								and dbo.dokstart.dokvrsta = dbo.dokvrstastatus.dokvrsta
				inner join dbo.dokvrstastatusakcija with(nolock) on dbo.dokvrstastatus.akcija = dbo.dokvrstastatusakcija.sifra
				inner join dbo.evid on inserted.id = dbo.evid.listid 
				inner join dbo.dokpoprat on dbo.dokstart.id = dbo.dokpoprat.dokpopratid
				inner join dbo.dokstart dokstart_1 on dbo.dokpoprat.dokumid = dokstart_1.id
				inner join dbo.dokvrsta dv1 with(nolock) on dokstart_1.dokvrsta = dv1.sifra 
				left outer join dbo.evidpoprat on dbo.dokpoprat.id = dbo.evidpoprat.dokpopid
			where dokvrstastatusakcija.autododvk > 0
				and dokvrstastatusakcija.sifra > 0
				and akcijavrsta = 1
				and dokvrsta.evid = 1 
				and dv1.evid = 1 and dv1.autoevidpop = 1
				and dokstart.azuriranje = 0 and dokstart.kontrola = 0
				and dbo.evidpoprat.dokpopid is null
option (keepfixed plan)

			update [dbo].[dokstart]
			set	[azuriranje] = 1, 
				[kontrola] = 1
			from inserted 
				inner join dbo.dokstart ds on inserted.id = ds.listid
				inner join dbo.list on ds.id = dbo.list.analitikaid
				inner join dbo.dokstart on dbo.list.id = dbo.dokstart.listid
option (keepfixed plan)

		end

	end

end