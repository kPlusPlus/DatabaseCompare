create  trigger [dbo].[dokum_itrigpecat] on [dbo].[dokum] 
for insert
not for replication
as
set nocount on

if exists(select * from inserted)
begin

	if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.analitika with(nolock) on inserted.analitika1id =  dbo.analitika.id
				inner join dbo.partnerstart with(nolock) on dbo.analitika.vezaid = dbo.partnerstart.id
				left outer join dbo.partner with(nolock) on dbo.partnerstart.id = dbo.partner.partnerid 
			  where dokvrsta.analitika1vrsta = 2
				and analitika.analitikavrsta = 2 
				and ((dokvrsta.partnerstart = 0 and partnerstart.formalni = 0)
					or (partner.parstatus < 10 and dokvrsta.sifra = 80)
					or (inserted.pdvstatus > 1 and partnerstart.formalni = 0
						and dokvrsta.iznos = 0))) 

	begin
        			raiserror 44445 '

		document can''t be updated, 
		"formal partner" data is mising.
		origin: dokum_itrigpecat'
        			rollback transaction
	end

	if exists (select * from  inserted 
					inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
					inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				where dokvrsta.evid = 0) 
	begin
		insert into dbo.dokstavka (dokumid, pozicija, kontoid, analitikaid, pozdatum, dp, ps, zk, ks, pecat, protuid)
		select  inserted.dokumid, dokshema.pozicija, dokshema.kontoid, 

			analitikaid = case  
				when analitpret = 0 and (dokshema.analitikavrsta = analitika_1.analitikavrsta 
						or analitika_1.analitikavrsta = 90) 
				then inserted.analitika1id
				when analitpret = 0 and (dokshema.analitikavrsta = analitika_2.analitikavrsta 
						or analitika_2.analitikavrsta = 90) 
				then inserted.analitika2id
				when analitpret = 0 and (dokshema.analitikavrsta = analitika_3.analitikavrsta  
						or analitika_3.analitikavrsta = 90) and dokshema.analitika3 = 1 
				then inserted.analitika3id
				when analitpret = 1 and not (analitpret_11.id is null) 
				then analitpret_11.id
				when analitpret = 1 and not (analitpret_22.id is null) 
				then analitpret_22.id
				else (select id from dbo.analitika where analitikavrsta = 0)
				end,

			datum = case
				when datumvrsta = 0 then null
				when datumvrsta = 1 then inserted.datum
				when datumvrsta = 2 then inserted.datumpi
				when datumvrsta = 3 and datplac = 0 then inserted.datumpi
				when datumvrsta = 3 and datplac = 1 then null
				when datumvrsta = 4 and dokvrsta < 201 then dateadd(day, inserted.odgoda, inserted.datumpi)
				when datumvrsta = 4 and dokvrsta between 201 and 222 then inserted.datum
				when datumvrsta = 5 then datumpi
				when datumvrsta = 6 and dokvrsta < 201 then dateadd(day, inserted.odgoda, inserted.datumpi)
				when datumvrsta = 6 and dokvrsta between 201 and 222 then inserted.datum
				else null
				end,
			dp, ps, zk, ks, 1, dokshema.id 
		from  inserted 
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokshema on dbo.dokstart.vk = dbo.dokshema.vk 
			inner join dbo.pozicija on dbo.dokshema.pozicija = dbo.pozicija.sifra 
			inner join dbo.analitika analitika_1 on inserted.analitika1id = analitika_1.id 
			inner join dbo.analitika analitika_2 on inserted.analitika2id = analitika_2.id 
			inner join dbo.pdvstatus on inserted.pdvstatus = dbo.pdvstatus.sifra 
			left outer join dbo.analitika analitika_3 on inserted.analitika3id = analitika_3.id
			left outer join dbo.analitpret analitpret_1 on analitika_1.id = analitpret_1.analitikaid 
			left outer join dbo.analitika analitpret_11 on analitpret_1.analitpretid = analitpret_11.id 
			left outer join dbo.analitpret analitpret_2 on analitika_2.id = analitpret_2.analitikaid 
			left outer join dbo.analitika analitpret_22 on analitpret_2.analitpretid = analitpret_22.id 
		where     (dbo.dokshema.koristi = 1) and (dbo.dokshema.pecat = 1)
		order by dbo.dokshema.redbr

		if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id 
			inner join dbo.dokshema with(nolock) on dbo.dokstart.vk = dbo.dokshema.vk
			inner join dbo.dokshemarasp with(nolock) on dbo.dokshema.id = dbo.dokshemarasp.dokshemaid)
		begin
			insert into dbo.dokstavka (dokumid, pozicija, kontoid, analitikaid, pozdatum, dp, ps, zk, ks, pecat, protuid)
			select inserted.dokumid, 
				pozicija = case when pozicijarasp > 0
					then pozicijarasp 
					else dokshema.pozicija
					end, 
				kontoid = case when kontoraspid > 0
					then kontoraspid 
					else dokshema.kontoid
					end, 
				analitikaid = case 

					when analitrasp.id > 1 and vrstaanalit = 0
					then analitrasp.id 

					when analitrasp.id > 1 and vrstaanalit = 1 
						and (analitrasp.analitikavrsta = analitika_1.analitikavrsta 
						or analitika_1.analitikavrsta = 90) 
					then inserted.analitika1id
					when analitrasp.id > 1 and vrstaanalit = 1 
						and (analitrasp.analitikavrsta = analitika_2.analitikavrsta 
						or analitika_2.analitikavrsta = 90) 
					then inserted.analitika2id
					when analitrasp.id > 1 and vrstaanalit = 1 
						and (analitrasp.analitikavrsta = analitika_3.analitikavrsta 
						or analitika_3.analitikavrsta = 90) 
						and dokshema.analitika3 = 1 
					then inserted.analitika3id

					when analitrasp.id is null and vrstaanalit = 1
						and (dokshema.analitikavrsta = analitika_1.analitikavrsta 
						or analitika_1.analitikavrsta = 90) 
					then inserted.analitika1id
					when analitrasp.id is null and vrstaanalit = 1
						and (dokshema.analitikavrsta = analitika_2.analitikavrsta 
						or analitika_2.analitikavrsta = 90) 
					then inserted.analitika2id
					when analitrasp.id is null and vrstaanalit = 1
						and (dokshema.analitikavrsta = analitika_3.analitikavrsta  
						or analitika_3.analitikavrsta = 90) and dokshema.analitika3 = 1 
					then inserted.analitika3id
					else (select id from dbo.analitika where analitikavrsta = 0)
					end, 
				datum = case
					when pozicija.datumvrsta = 0 then null
					when pozicija.datumvrsta = 1 then inserted.datum
					when pozicija.datumvrsta = 2 then inserted.datumpi
					when pozicija.datumvrsta = 3 and datplac = 0 then inserted.datumpi
					when pozicija.datumvrsta = 3 and datplac = 1 then null
					when pozicija.datumvrsta = 4 and dokvrsta < 201 then dateadd(day, inserted.odgoda, inserted.datumpi)
					when pozicija.datumvrsta = 4 and dokvrsta between 201 and 222 then inserted.datum
					when pozicija.datumvrsta = 5 then datumpi
					when pozicija.datumvrsta = 6 and dokvrsta < 201 then dateadd(day, inserted.odgoda, inserted.datumpi)
					when pozicija.datumvrsta = 6 and dokvrsta between 201 and 222 then inserted.datum
					when pozicija.datumvrsta = 8 and dokstart.dokvrsta > 200 and pozds.portarifid > 0
					then (dbo.sdvatdate(inserted.datumpi))
					else null
					end,
				dp = case when dokshemarasp.dp in (0,1)
					then dokshemarasp.dp 
					else dokshema.dp
					end, 
				dokshema.ps, 
				dokshema.zk, 
				ks = case when dokshemarasp.ks in (0,1)
					then dokshemarasp.ks 
					else dokshema.ks
					end, 			
				1, dbo.dokshemarasp.id 
			from     inserted 
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokshema on dbo.dokstart.vk = dbo.dokshema.vk 
				inner join dbo.pozicija pozds on dbo.dokshema.pozicija = pozds.sifra 
				inner join dbo.dokshemarasp on dbo.dokshema.id = dbo.dokshemarasp.dokshemaid 
				left outer join dbo.analitfirma on dbo.dokshemarasp.analitraspid = analitfirma.id 
				left outer join dbo.analitika analitrasp on dbo.analitfirma.analitikaid = analitrasp.id 
				inner join dbo.pozicija on dbo.dokshemarasp.pozicijarasp = dbo.pozicija.sifra 
				inner join dbo.pdvstatus on inserted.pdvstatus = dbo.pdvstatus.sifra
				inner join dbo.analitika analitika_1 on inserted.analitika1id = analitika_1.id 
				inner join dbo.analitika analitika_2 on inserted.analitika2id = analitika_2.id 
				left outer join dbo.analitika analitika_3 on inserted.analitika3id = analitika_3.id
			where  dbo.dokshema.koristi = 1 and dbo.dokshema.pecat = 1

			update dbo.dokstavkaknjiga
			set firmaid = case when kz.firmaid > 0
					then kz.firmaid
					else kz.dsfirmaid
					end
			from (select dbo.dokstavkaknjiga.dokstavkaid, dbo.analitfirma.firmaid, dokstart.firmaid as dsfirmaid
				from inserted
					inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
					inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
					inner join dbo.dokshema on dbo.dokstart.vk = dbo.dokshema.vk 
					inner join dbo.dokshemarasp on dbo.dokshema.id = dbo.dokshemarasp.dokshemaid
					left outer join dbo.analitfirma on dbo.dokshemarasp.analitraspid = analitfirma.id 
					left outer join dbo.analitika analitrasp on dbo.analitfirma.analitikaid = analitrasp.id 
					inner join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
							and dbo.dokshemarasp.id = dbo.dokstavka.protuid
					inner join dbo.dokstavkaknjiga on dbo.dokstavka.id = dbo.dokstavkaknjiga.dokstavkaid 
				where dokstavka.ks = 1) as kz
			where dbo.dokstavkaknjiga.dokstavkaid = kz.dokstavkaid
		end
	end

	if exists (select * from inserted 
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.evid with(nolock) on dbo.dokstart.listid = dbo.evid.listid
			where dokvrsta.sklad = 1)
	begin
		update dbo.evid 		set kolicina1 = kolicina1		from (select evid.id 
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
				left outer join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
			where dokvrsta.sklad = 1 

				and dbo.skladiste.evidid is null ) er 		inner join dbo.evid on er.id = dbo.evid.id

		update dbo.skladiste
		set vrsta = vrsta 
		from (select evid.id from inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta ondbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
					where dokvrsta.sklad = 1) as sr
		where dbo.skladiste.evidid = sr.id and dbo.skladiste.zalihaid is null
		and ((dbo.skladiste.vrsta = -1 and dbo.skladiste.kolicina > 0) 
		or (dbo.skladiste.vrsta = 1 and dbo.skladiste.kolicina < 0)) 
	end

	if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id 
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
		where dbo.dokvrsta.vrsta = 8)
	begin

		if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dokvrsta.sifra = 49)
		begin

			if exists (select * from inserted, dbo.dokstart, dbo.dokum  where (dokstart.dokvrsta = 49 
			and dokstart.id = dokum.dokumid and month(dokum.datumpi) = month(inserted.datumpi)
			and year(dokum.datumpi) = year(inserted.datumpi) and dokum.dokumid <> inserted.dokumid))
			begin
				raiserror 44445 n'
		the record can''t be inserted, 
		vat calculation allready exist for this period. 
		change ending date (datumpi)!
		origin: dokum_itrigpecat'
        			rollback transaction
			end

			if not exists (select * from inserted, dbo.dokstart, dbo.dokum  where (dokstart.dokvrsta = 49 
			and dokstart.id = dokum.dokumid and month(dokum.datumpi) = month(inserted.datumpi)
			and year(dokum.datumpi) = year(inserted.datumpi) and dokum.dokumid <> inserted.dokumid)) 
			begin
			insert into dbo.dokpoprat (dokumid, dokpopratid)
			select    inserted.dokumid as dokobracid, dokum_1.dokumid as dokpopratid
			from    inserted 
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id 
				inner join dbo.dokvrstapoprat on dbo.dokstart.dokvrsta = dbo.dokvrstapoprat.dokvrsta 
				inner join dbo.dokstart dokstart_1 on dbo.dokvrstapoprat.dokvrstapoprat = dokstart_1.dokvrsta 
				inner join dbo.dokum dokum_1  on dokstart_1.id = dokum_1.dokumid 
				inner join dbo.dokstavka on dokum_1.dokumid = dbo.dokstavka.dokumid and inserted.datumpi >= dbo.dokstavka.pozdatum 
				inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra 
				inner join dbo.portarif on dbo.pozicija.portarifid = dbo.portarif.id
			where (dbo.btmozepoprat(dokum_1.dokumid, dbo.dokstart.dokvrsta) = 1) 
				and dokstart.dokvrsta = 49 and(dokum_1.pdvstatus > 1) and (dbo.pozicija.datumvrsta = 3) 
				and (dbo.portarif.porsust = 3) and dbo.dokstavka.pozdatum > n'19700101'
			group by inserted.dokumid, dokum_1.dokumid
			end
		end

		if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id 
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid 
		where dbo.dokvrsta.sifra = 150 and pozicija between 3001 and 3002)
		begin
			insert into dbo.dokpoprat (dokumid, dokpopratid)
			select    inserted.dokumid as dokobracid, dokum_1.dokumid as dokpopratid
			from    inserted 
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id 
				inner join dbo.dokvrstapoprat on dbo.dokstart.dokvrsta = dbo.dokvrstapoprat.dokvrsta 
				inner join dbo.dokstart dokstart_1 on dbo.dokvrstapoprat.dokvrstapoprat = dokstart_1.dokvrsta
				inner join dbo.dokvrsta on dokstart_1.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokum dokum_1  on dokstart_1.id = dokum_1.dokumid 
				inner join dbo.dokstavka on dokum_1.dokumid = dbo.dokstavka.dokumid 
				inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra 
			where (dokum_1.tecaj <> 1 and inserted.datum >= dokum_1.datum
				and dbo.btmozepoprat(dokum_1.dokumid, dbo.dokstart.dokvrsta) = 1 
				and dokstart.dokvrsta = 150 and skk = 0 and skd = 0				and inserted.tecaj = 1 and dbo.pozicija.zatvaranje=1)

			group by inserted.dokumid, dokum_1.dokumid
		
			insert into dbo.dokpoprat (dokumid, dokpopratid)
			select    inserted.dokumid as dokobracid, dokum_1.dokumid as dokpopratid
			from    inserted 
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id 
				inner join dbo.dokvrstapoprat on dbo.dokstart.dokvrsta = dbo.dokvrstapoprat.dokvrsta 
				inner join dbo.dokstart dokstart_1 on dbo.dokvrstapoprat.dokvrstapoprat = dokstart_1.dokvrsta 
				inner join dbo.dokvrsta on dokstart_1.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokum dokum_1  on dokstart_1.id = dokum_1.dokumid 
				inner join dbo.dokstavka on dokum_1.dokumid = dbo.dokstavka.dokumid 
				inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra 
			where (dokum_1.tecaj <> 1 and inserted.datum >= dokum_1.datum

				and dokstart.dokvrsta = 150
				and inserted.tecaj <> 1 and pozicija.plac=1
				and inserted.valkod = dokum_1.valkod 
				and dokstart_1.placeno = 0 and (skk = 1 or skd = 1))
			group by inserted.dokumid, dokum_1.dokumid
		end
	end

	if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id 
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
		where dbo.dokvrsta.sifra = 36 and dokstart.kontrola=0 and dokstart.azuriranje = 1 ) 
	begin
				declare 	
				@datumobrade smalldatetime,		
				@retvalue int,
				@analitika2id int,
				@dokumid int,
				@analitikaid int,
				@graceperiod int,
				@firmaid int,
				@korisnikid smallint ,
				@neiznosmanjiod smallmoney,
				@btzanemari bit ,
				@btplaceno bit

		select	@datumobrade = datum,
				@analitikaid = analitika1id, 
				@analitika2id = analitika2id, 
				@dokumid = dokumid, 
				@graceperiod = odgoda,
				@firmaid = firmaid ,
				@korisnikid = korisnikid
			from inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id 
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
		where dbo.dokvrsta.sifra = 36

		select  @neiznosmanjiod =  cast(tvp.defaultvalue as smallmoney)		
				from dbo.tvsaction tva 
				inner join dbo.tvsactionparams tvp on tva.id = tvp.tvsactionid 
				where tva.code = 25455 and tvp.sortkey = 2
 		select  @btzanemari=  cast(tvp.defaultvalue as bit) 		
				 from dbo.tvsaction tva 
				inner join dbo.tvsactionparams tvp on tva.id = tvp.tvsactionid 
				where tva.code = 25455 and tvp.sortkey = 6
		select  @btplaceno=  cast(tvp.defaultvalue as bit)		
				 from dbo.tvsaction tva 
				inner join dbo.tvsactionparams tvp on tva.id = tvp.tvsactionid 
				where tva.code = 25455 and tvp.sortkey = 7

		execute @retvalue = dbo.spproczatezkamatenew @analitikaid, @datumobrade, @dokumid, @analitika2id,@firmaid, @korisnikid, @graceperiod, 
													@neiznosmanjiod,@btzanemari,@btplaceno  

		if @retvalue > 0
		raiserror 44445 '
	there are some unbound payments from this buyer
	or penalty interest does not exists 
	for some periods!
	origin: dokum_itrig '
			rollback transaction
	end

	if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id 
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
		where dokvrsta.autoskupdog2 > 0 and (dokvrsta.sifra = 199 or dokvrsta.sifra = 198)) 
	begin

		if exists (select * from inserted
				inner join dbo.analitika with(nolock) on inserted.analitika1id=dbo.analitika.id 
				inner join dbo.kredit with(nolock) on dbo.analitika.vezaid=dbo.kredit.id
				where inserted.valkod<>kredit.valkod) 
		begin
			raiserror 44445 '

	there is differnce between loan contract currency
	and credit currency in basic data!
	origin: dokum_itrig'
        			rollback transaction
		end

		if not exists (select * from kamateobstavka with(nolock) where dokumid = (select dokumid from inserted))
		begin
			declare @inkreditid int, @startdate smalldatetime		
			set @inkreditid=(select vezaid from analitika where id = (select analitika1id from inserted)) 
			select @startdate = datum ,  @dokumid = dokumid  from inserted 

			insert into dbo.kamateobstavka (dokumid, dokpopratid, kamataid, osnovica, period, kamgodstopa,iznoskamate, iznosanuitet)	
			select inserted.dokumid,dokpopratid, kamataid, osnovica, period, kamgodstopa, iznoskamate, iznosanuitet 
			from inserted
				inner join dbo.tbkamatekredit(@dokumid, @inkreditid,@startdate) tbkk on inserted.dokumid = tbkk.dokumid

		
		end
	end

	if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id 
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
		where dokvrsta.sifra = 102 
				and dbo.dokstart.azuriranje = 1 and dbo.dokstart.kontrola = 0) 
	begin
		declare @dokid int
		declare @datumpi smalldatetime
		declare @analit2id int 
		declare @retval smallint

		declare inventura cursor for
		select  inserted.dokumid, inserted.datumpi , inserted.analitika2id 
		from  inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id 
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
		where dokvrsta.sifra = 102 
			and dokvrsta.kolicina1 = 1 
		open inventura
		fetch next from inventura
		into @dokid, @datumpi, @analit2id 
		while @@fetch_status = 0
		begin
		exec @retval = dbo.spprocdokinventura @dokid, @datumpi, @analit2id
		if @retval > 0
		begin
		raiserror 44445 '
	wrong analitics type!
	chose warehouse.
	origin: dokum_itrig'
			rollback transaction	
		end
		
		fetch next from inventura
		into  @dokid, @datumpi, @analit2id
		end
		close inventura
		deallocate inventura
	end
		

		if exists (select * from inserted
					inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id 
				where dokstart.dokvrsta = 123)
		begin
			if exists (select * from inserted
						inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id	
						inner join dbo.dokstart ds with(nolock) on dbo.dokstart.dokvrsta = ds.dokvrsta 
						inner join dbo.dokum dokum_1 with(nolock) on ds.id = dokum_1.dokumid
					where dokstart.dokvrsta=123
						and inserted.dokumid <> dokum_1.dokumid
						and inserted.datumpi<= dokum_1.datumpi)
			begin
		raiserror 44445 n'
		the record can''t be inserted, 
		turnover calculation allready exist for this date. 
		change ending date (datumpi)!
		origin: dokum_itrig'
	        			rollback transaction
			end

			insert into dbo.dokpoprat (dokumid, dokpopratid)
			select 	 inserted.dokumid as dokobracid,
					dokum_1.dokumid as dokpopratid
			from  inserted 
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id 
			inner join dbo.dokvrstapoprat on dbo.dokstart.dokvrsta = dbo.dokvrstapoprat.dokvrsta 
			inner join dbo.dokstart dokstart_1 on dbo.dokvrstapoprat.dokvrstapoprat = dokstart_1.dokvrsta 
			inner join dbo.dokum dokum_1  on dokstart_1.id = dokum_1.dokumid 
			left outer join dbo.dokpozivbr on dokstart_1.id = dbo.dokpozivbr.dokumid 
				and dbo.dokpozivbr.modulpnb like n'ob' and dbo.dokpozivbr.pozivbrvrsta = 4
			where dbo.dokpozivbr.dokumid is null
				and dokstart.dokvrsta = 123
				and dokum_1.datum <= inserted.datumpi 

		

			insert into dbo.dokpozivbr([dokumid], [modulpnb], [pnb], [pozivbrvrsta])
			select 	dokum_1.dokumid, n'ob', 

				cast(dbo.dokstart.id as nvarchar(22)),
				4
			from  inserted 
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokpoprat on inserted.dokumid = dbo.dokpoprat.dokumid 
				inner join dbo.dokstart dokstart_1 on dbo.dokpoprat.dokpopratid = dokstart_1.id
				inner join dbo.dokum dokum_1 on dokstart_1.id = dokum_1.dokumid 
				left outer join dbo.tbsaldodok() tbsaldodok on dokstart_1.id =tbsaldodok.id 
			where dokstart.dokvrsta = 123 
				and (tbsaldodok.saldo <= 5 or dokstart_1.dokvrsta = 30) 
		end
end