
create      trigger [dbo].[dokum_utrig] on [dbo].[dokum] 
for update 
not for replication
as
set nocount on

if exists (select * from inserted)
begin

		if exists (select * from inserted 
			inner join deleted on inserted.dokumid = deleted.dokumid
			inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid 
		where checksum (inserted.datum, inserted.datumpi, inserted.odgoda, 
					inserted.analitika1id, inserted.analitika2id,  inserted.tecaj) 
			<> 
			checksum (deleted.datum, deleted.datumpi, deleted.odgoda, 
					deleted.analitika1id, deleted.analitika2id, deleted.tecaj))

		begin
		raiserror 44445 n'300444 
		the record can''t be updated, 
		"acounting stamp" exist for this document. 
		delete the "acounting stamp" first, 
		then you can change this record!

		origin: dokum_utrig'
			rollback transaction
		end

		if exists (select * from inserted 
			inner join deleted on inserted.dokumid = deleted.dokumid
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id 
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.dokstart dsp with(nolock) on dbo.dokstart.listid = dsp.listid
			inner join dbo.dokvrsta dvp with(nolock) on dsp.dokvrsta = dvp.sifra
			inner join dbo.dokum dop with(nolock) on dsp.id = dop.dokumid
		where dokstart.id <> dsp.id 
			and((dokvrsta.analitika1vrsta = dvp.analitika1vrsta 
				and dokvrsta.analitika1vrsta > 0 and dvp.analitika1vrsta > 0 
				and inserted.analitika1id <> dop.analitika1id) 
			or (dokvrsta.analitika2vrsta = dvp.analitika2vrsta
				and dokvrsta.analitika2vrsta > 0 and dvp.analitika2vrsta > 0 
				and inserted.analitika2id <> dop.analitika2id)
			or (dokvrsta.analitika3vrsta = dvp.analitika3vrsta 
				and dokvrsta.analitika3vrsta > 0 and dvp.analitika3vrsta > 0 
				and dokvrsta.analitika3 = 1 and dvp.analitika3 = 1 
				and inserted.analitika3id <> dop.analitika3id)))
		begin
		raiserror 44445 n'
	the record can''t be updated! 
	analitics are diferent in 
	documentation folder!!! 
	origin: dokum_utrig'
			rollback transaction
		end

	if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		where dokvrsta.sklad = 1)
	begin
		update dbo.skladiste
		set datumzr = datumpi
		from inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
		where dokvrsta.sklad = 1 and inserted.datumpi <> datumzr
	end

	if exists (select * from inserted 
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
		where dokvrsta.zt = 1 and dokvrsta.zaliha = 1)
	begin

		update dbo.listzt
		set  iznosroba = ar.iznrobafrom dbo.listzt 
			inner join(select dokstart.listid, isnull(round(sum(zaliha.cijena * skladiste.kolicina),2),0) as iznroba
				 from   inserted
					inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
					inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
					inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
					inner join dbo.zaliha on dbo.skladiste.id = dbo.zaliha.skladisteid
					inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				where  dokvrsta.zt = 1 and dokvrsta.zaliha = 1
				group by dokstart.listid) 
				 ar on dbo.listzt.listid = ar.listid

		update dbo.listzt
		set  postocarina = case when isnull(ac.postocar,0) <> 0 
					then  isnull(ac.postocar,0) 
					else listzt.postocarina 
					end, 
			postozt = case when isnull(az.postozav,0) <> 0 
					then  isnull(az.postozav,0) 
					else listzt.postozt 
					end
		from dbo.listzt 
			left outer join (select  dokstart.listid as id, 
						sum(ztdokum.iznos * ztdokum.iznposto * 0.01  listzt.iznosroba * 100) as postozav
					from inserted
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
						inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
						inner join dbo.ztdokum on  dbo.dokstart.listid = dbo.ztdokum.listid
						inner join dbo.listzt on  dbo.dokstart.listid = dbo.listzt.listid
					where dokvrsta.zt = 1 and dokvrsta.zaliha = 1 
						and ztdokum.ztvrsta <> 1 and listzt.iznosroba <> 0 and ztdokum.iznposto > 0
					group by dokstart.listid) 
				az on dbo.listzt.listid = az.id

		update dbo.zaliha
		set  	analitsklid = lz.analitika2id,
			tecaj = lz.tecaj,
			carina = lz.postocarina, 
			zavisni = lz.postozt, 
			prerac = lz.prerac,
			prcijenabez = lz.prcijenabez,
			prcijenasa = lz.prcijenasa,
			marza = lz.marza
		from dbo.zaliha inner join (select dokstart.listid, zaliha.id, inserted.analitika2id,
			listzt.postocarina, listzt.postozt, listzt.prerac,
			prcijenabez =  case 
					when listzt.prerac = 1  
						and (((zaliha.prcijenasa  ((round(cast((1 + ((listzt.postocarina + listzt.postozt) * 0.01)) 
								* (case when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 1
									then (zaliha.inocijena * inserted.tecaj * (1 - (zaliha.popdob * 0.01)))
									when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 0
									then (zaliha.inocijena * (1 - (zaliha.popdob * 0.01)))
									else 0
									end) as money),4))) 
							* 100) > 0
					then  round(cast(((round(cast((1 + ((listzt.postocarina + listzt.postozt) * 0.01)) 
						* (case when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 1
							then (zaliha.inocijena * inserted.tecaj * (1 - (zaliha.popdob * 0.01)))
							when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 0
							then (zaliha.inocijena * (1 - (zaliha.popdob * 0.01)))
							else 0
							end) as money),4))) 
						* (1+ (dbo.zaliha.marza * 0.01)) as money),4)
					when listzt.prerac = 1 
						and (((zaliha.prcijenasa  ((round(cast((1 + ((listzt.postocarina + listzt.postozt) * 0.01)) 
							* (case when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 1
								then (zaliha.inocijena * inserted.tecaj * (1 - (zaliha.popdob * 0.01)))
								when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 0

								then (zaliha.inocijena * (1 - (zaliha.popdob * 0.01)))
								else 0

								end) as money),4)))
							 * 100) <= 0
					then round(cast(((round(cast((1 + ((listzt.postocarina + listzt.postozt) * 0.01)) 
						* (case when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 1
							then (zaliha.inocijena * inserted.tecaj * (1 - (zaliha.popdob * 0.01)))
							when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 0
							then (zaliha.inocijena * (1 - (zaliha.popdob * 0.01)))
							else 0
							end) as money),4))) * (1+ (0 * 0.01)) as money),4)
					else dbo.zaliha.prcijenabez
					end,
			 prcijenasa =  case 
					when listzt.prerac = 1  
						and (((zaliha.prcijenasa  ((round(cast((1 + ((listzt.postocarina + listzt.postozt) * 0.01)) 
								* (case when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 1
									then (zaliha.inocijena * inserted.tecaj * (1 - (zaliha.popdob * 0.01)))
									when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 0
									then (zaliha.inocijena * (1 - (zaliha.popdob * 0.01)))
									else 0
									end) as money),4))) 
							* 100) > 0
					then  round(cast(((round(cast((1 + ((listzt.postocarina + listzt.postozt) * 0.01)) 
						* (case when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 1
							then (zaliha.inocijena * inserted.tecaj * (1 - (zaliha.popdob * 0.01)))
							when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 0
							then (zaliha.inocijena * (1 - (zaliha.popdob * 0.01)))
							else 0
							end) as money),4))) 
						* (1+ (dbo.zaliha.marza * 0.01)) * portarif.koef as money),4)
					when listzt.prerac = 1 
						and (((zaliha.prcijenasa  ((round(cast((1 + ((listzt.postocarina + listzt.postozt) * 0.01)) 
							* (case when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 1
								then (zaliha.inocijena * inserted.tecaj * (1 - (zaliha.popdob * 0.01)))
								when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 0
								then (zaliha.inocijena * (1 - (zaliha.popdob * 0.01)))
								else 0
								end) as money),4)))
							 * 100) <= 0
					then round(cast(((round(cast((1 + ((listzt.postocarina + listzt.postozt) * 0.01)) 
						* (case when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 1
							then (zaliha.inocijena * inserted.tecaj * (1 - (zaliha.popdob * 0.01)))
							when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 0
							then (zaliha.inocijena * (1 - (zaliha.popdob * 0.01)))
							else 0
							end) as money),4))) * (1+ (0 * 0.01)) * portarif.koef as money),4)
					else dbo.zaliha.prcijenasa
					end,
			 marza =  case when  listzt.prerac = 0 
						and (((zaliha.prcijenasa  ((round(cast((1 + ((listzt.postocarina + listzt.postozt) * 0.01)) 
											* (case when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 1
												then (zaliha.inocijena * inserted.tecaj * (1 - (zaliha.popdob * 0.01)))
												when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 0
												then (zaliha.inocijena * (1 - (zaliha.popdob * 0.01)))
												else 0
												end) as money),4))) * 100) > 0
					then cast(((zaliha.prcijenasa  ((round(cast((1 + ((listzt.postocarina + listzt.postozt) * 0.01)) 
											* (case when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 1
												then (zaliha.inocijena * inserted.tecaj * (1 - (zaliha.popdob * 0.01)))
												when zaliha.inocijena <> 0 and inserted.tecaj <> 0 and zaliha.preractecaj = 0
												then (zaliha.inocijena * (1 - (zaliha.popdob * 0.01)))
												else 0
												end) as money),4))) * 100 as numeric (19,12))
					when listzt.prerac = 1 
						and (((zaliha.prcijenasa  zaliha.nabcijena * 100) <= 0
					then 0
					else dbo.zaliha.marza
					end,
				inserted.tecaj
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.listzt on dbo.dokstart.listid = dbo.listzt.listidinner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
				inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
				inner join dbo.zaliha on dbo.skladiste.id = dbo.zaliha.skladisteid
				inner join dbo.portarif on dbo.zaliha.portarifid = dbo.portarif.id
			where dbo.dokvrsta.zt = 1 and dbo.dokvrsta.zaliha = 1 and listzt.iznosroba <> 0)  
			 lz on dbo.zaliha.id = lz.id
	end

	if exists (select * from inserted 
					left outer join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid
				 where dbo.dokstavka.dokumid is null) 
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
						or analitika_3.analitikavrsta = 90) 
						and dokshema.analitika3 = 1 
				then inserted.analitika3id
				when analitpret = 1 and not (analitpret_11.id is null) 
				then analitpret_11.id
				when analitpret = 1 and not (analitpret_22.id is null) 
				then analitpret_22.id
				else (select top 1 id from dbo.analitika where analitikavrsta = 0)
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
			dokshema.dp, dokshema.ps, dokshema.zk, dokshema.ks, 1, dokshema.id 
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
			left outer join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
		where  dbo.dokstavka.dokumid is null and dbo.dokshema.koristi = 1 and dbo.dokshema.pecat = 1
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

		end
	end

	if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
		 where dokvrsta.financ = 1 and dokvrsta.vrsta between 6 and 7)
	begin
		if exists (select * from inserted
				inner join dbo.dokpoprat with(nolock) on inserted.dokumid = dbo.dokpoprat.dokumid)
	 
  		begin
			insert into dokstavka (dokumid, pozicija, kontoid, analitikaid, 
					iznos, iznosval, pozdatum, dp, ps, zk, ks, pecat, protuid)
			select inserted.dokumid, 2800, dp.kontoid, dp.analitikaid, 
				dp.iznos, dp.iznosval, dp.pozdatum, dp.dp, dp.ps, dp.zk, 
				dbo.dokvrsta.knjizenje, 0 , dp.id
			from inserted
				inner join dbo.vproc_sumdokpoprat dp on inserted.dokumid = dp.dokumid 
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				left outer join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid 
						and dbo.dokstavka.pozicija = 2800 
			where dp.pozicija = 1000 
				and dokvrsta.financ = 1 and dokvrsta.vrsta = 6
				and dokstavka.id is null
				

			update dbo.dokstavka
			set dokumid = inserted.dokumid, ks = 1
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join (select inserted.dokumid, dokstavka.id
						from   inserted
							inner join dbo.dokpoprat on inserted.dokumid = dbo.dokpoprat.dokumid 
							inner join dbo.dokstart on dbo.dokpoprat.dokpopratid = dbo.dokstart.id
							inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
							inner join dbo.dokstavka on dbo.dokstart.id = dbo.dokstavka.dokumid
							inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra 
							where pozicija.zatvaranje = 1 
								and (dokvrsta.vrsta < 6 or dokvrsta.vrsta > 7))
					dp on inserted.dokumid = dp.dokumid
				inner join dbo.dokstavka on dp.id  = dbo.dokstavka.id
			where dokvrsta.financ = 1 and dokvrsta.vrsta = 7
		
		

			update dbo.dokstavkaknjiga
			set opis = rtrim(dp.broj) + ' ' + rtrim(dp.izvornik)
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join (select inserted.dokumid, dokstavka.id, 
							rtrim(dbo.dokvrsta.prefiks) + '-' + cast(dbo.dokstart.godina as nvarchar(4)) 
							+ '-' + rtrim(dbo.dokstart.broj) as broj,
							rtrim (dbo.dokstart.izvornik) as izvornik
						from   inserted
							inner join dbo.dokpoprat on inserted.dokumid = dbo.dokpoprat.dokumid 
							inner join dbo.dokstart on dbo.dokpoprat.dokpopratid = dbo.dokstart.id
							inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
							inner join dbo.dokum on  dbo.dokstart.id = dbo.dokum.dokumid 
							inner join dbo.dokstavka on dbo.dokum.dokumid = dbo.dokstavka.dokumid
							inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra 
							where pozicija.plac = 1)
					dp on inserted.dokumid = dp.dokumid
				inner join dbo.dokstavka on dp.id  = dbo.dokstavka.protuid
				inner join dbo.dokstavkaknjiga on dbo.dokstavka.id = dbo.dokstavkaknjiga.dokstavkaid
			where dokvrsta.financ = 1 and dokvrsta.vrsta = 6
		end

		update dbo.dokstavka 
		set 	iznos = isnull(spec.iznos,0),
			iznosval = isnull(spec.iznosval,0)
		from dbo.dokstavka 
			inner join (select  inserted.dokumid, 
						sum(dokstavka.iznos) as iznos,
						sum(dokstavka.iznosval) as iznosval,
						dokstavka.dp, inserted.tecaj
					from  inserted
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
						inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
						inner join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
					 where dokvrsta.financ = 1 and dokvrsta.vrsta between 6 and 7  
						 and dokstavka.pozicija <> 1000
					group by inserted.dokumid, dokstavka.dp, inserted.tecaj) 
			spec on dbo.dokstavka.dokumid = spec.dokumid
		where dbo.dokstavka.pozicija = 1000 and dbo.dokstavka.dp <> spec.dp 

		update dbo.dokstavka 
		set 	iznos = isnull(spec.iznos,0),
			iznosval = isnull(spec.iznosval,0)
		from dbo.dokstavka 
			inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra
			inner join (select  dokstavka.dokumid, 
						sum(dokstavka.iznos) as iznos,
						sum(dokstavka.iznosval) as iznosval,
						dokstavka.dp, pzs.sifra as pozicija
					from  inserted
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
						inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
						inner join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
						inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra
						inner join dbo.pozicija pzs on dbo.pozicija.sifra = pzs.pozsum
					 where dokvrsta.financ = 1 and dokvrsta.vrsta = 7 
					group by dokstavka.dokumid, dokstavka.dp, pzs.sifra) 
			spec on dbo.dokstavka.dokumid = spec.dokumid and dbo.dokstavka.pozicija = spec.pozicija
		where dbo.dokstavka.dp <> spec.dp
	end

	if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
		where dokvrsta.financ = 1 and dokvrsta.vrsta = 8)
	begin
		
		if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid
		where dokvrsta.financ = 1 and dokvrsta.vrsta = 8 and dokvrsta.sifra = 49)
		begin
			declare @dokum int
			declare @iznos money
			declare @iznosval money
			declare @pdvstatus tinyint
			declare @pt tinyint
			declare @pdv tinyint	
			declare @osnpdv tinyint	

			declare pecatobruc cursor for
			select sum (iznos), inserted.dokumid, vproc_sumdokpoprat.pdvstatus, 
				vproc_sumdokpoprat.pt, vproc_sumdokpoprat.pdv,  vproc_sumdokpoprat.osnpdv 
			from inserted, dbo.vproc_sumdokpoprat
			where inserted.dokumid = dbo.vproc_sumdokpoprat.dokumid and (vproc_sumdokpoprat.pdv <> 0 or vproc_sumdokpoprat.osnpdv <> 0)
			group by inserted.dokumid, dbo.vproc_sumdokpoprat.pdvstatus, dbo.vproc_sumdokpoprat.pt,  
					dbo.vproc_sumdokpoprat.pdv,  dbo.vproc_sumdokpoprat.osnpdv		
			open pecatobruc
			fetch next from pecatobruc
			into @iznos, @dokum, @pdvstatus, @pt, @pdv, @osnpdv
			while @@fetch_status = 0
					begin
					update dbo.dokstavka 
					set iznos = @iznos * pozicija.kfc, 
						iznosval = @iznos * pozicija.kfc
					from inserted
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
						inner join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
						inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra
					where dokstavka.dokumid = @dokum and pozicija.pdvstatus = @pdvstatus
						and dokstart.id = @dokum and dokstart.dokvrsta = 49  
						and pozicija.pt = @pt and pozicija.pdv = @pdv
						and pozicija.osnpdv = @osnpdv
					fetch next from pecatobruc
					into @iznos, @dokum, @pdvstatus, @pt, @pdv, @osnpdv
					end
			close pecatobruc
			deallocate pecatobruc 
		end

		if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
		where dokvrsta.financ = 1 and dokvrsta.vrsta = 8 and dokvrsta.sifra = 51)
		begin

		declare @mjobrac tinyint
		declare @godobrac smallint
		declare osparamsc cursor for
			select year(inserted.datum), month(inserted.datum)
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			where dokvrsta.financ = 1 and dokvrsta.vrsta = 8 and dokvrsta.sifra = 51
			
			open osparamsc
			fetch next from osparamsc
			into @godobrac, @mjobrac
			while @@fetch_status = 0
				begin
				if exists (select * from inserted, dbo.dokstart, dbo.dokvrsta, dbo.dokum where dokstart.dokvrsta = dokvrsta.sifra 
				and dokvrsta.financ = 1 and dokvrsta.vrsta = 8 and dokvrsta.sifra = 51 and dbo.dokstart.id = dbo.dokum.dokumid 
				and month(dbo.dokum.datum) = @mjobrac and year(dbo.dokum.datum) = @godobrac 
				and dbo.dokum.analitika2id = inserted.analitika2id and dbo.dokstart.id <> inserted.dokumid)
					begin
					raiserror 44445 n'

	the record can''t be updated, 
	the depreciation already exists
	for this period'

        					rollback transaction
					end
			if not exists (select * from inserted, dbo.dokstart, dbo.dokvrsta, dbo.dokstavka where dokstart.dokvrsta = dokvrsta.sifra 
			and dokvrsta.financ = 1 and dokvrsta.vrsta = 8 and dokvrsta.sifra = 51 and dbo.dokstart.id = inserted.dokumid 
			and inserted.dokumid = dbo.dokstavka.dokumid and dbo.dokstavka.pozicija = 4515 )
			begin	

				insert into [dbo].[osinventura]([osid], [godina], [mjesec], [stanje])
				(select dbo.os.id as osid, @godobrac, @mjobrac, 1
				from inserted
					inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
					inner join dbo.tbfetchfirma() tbfetchfirma on dbo.dokstart.firmaid = tbfetchfirma.firmaid
					inner join dbo.analitika on inserted.analitika2id = dbo.analitika.id
					inner join dbo.cjelina on dbo.analitika.vezaid = dbo.cjelina.id		 
					inner join dbo.lokacija on dbo.cjelina.id = dbo.lokacija.cjelinaid
					inner join dbo.os on dbo.lokacija.id = dbo.os.lokacija
				where dbo.btmozeamort (dbo.os.id, @mjobrac, @godobrac) = 1
					 and not exists(select * from dbo.osinventura where dbo.osinventura.godina = @godobrac 
					and dbo.osinventura.mjesec = @mjobrac and dbo.osinventura.osid = dbo.os.id))

				insert into dbo.dokstavka ([dokumid], [pozicija], [kontoid], [analitikaid], [iznos], 
						[iznosval], [pozdatum], [dp], [ps], [zk], [ks], [pecat], [protuid])
				(select inserted.dokumid, 4515, osvrsta.konto2id, inserted.analitika2id, 
					iznos = round(case 
							when (saldoukamoosnov - saldoakumamo) < (saldoukamoosnov * korkoef  amortkoefm )
								and saldorevvrijed = saldoukamoosnov 
							then 0
							when (saldoukamoosnov - saldoakumamo) < (saldoukamoosnov * korkoef  amortkoefm) * (1 - (saldorevvrijed  amortkoefm
 							end,2),
					iznosval =round(case 
							when (saldoukamoosnov - saldoakumamo) < (saldoukamoosnov * korkoef  amortkoefm )
								and saldorevvrijed = saldoukamoosnov
							then 0
							when (saldoukamoosnov - saldoakumamo) < (saldoukamoosnov * korkoef  amortkoefm) * (1 - (saldorevvrijed  amortkoefm
 							end,2),
					inserted.datum, 1, 0, 0, 1, 0, null
				from inserted
					inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
					inner join dbo.tbfetchfirma() tbfetchfirma on dbo.dokstart.firmaid = tbfetchfirma.firmaid
					inner join dbo.analitika on inserted.analitika2id = dbo.analitika.id
					inner join dbo.cjelina on dbo.analitika.vezaid = dbo.cjelina.id		 
					inner join dbo.lokacija on dbo.cjelina.id = dbo.lokacija.cjelinaid
					inner join dbo.os on dbo.lokacija.id = dbo.os.lokacija
					inner join dbo.osvrsta on dbo.os.osvrstaid = dbo.osvrsta.id
					inner join dbo.analitika analitika_1 on dbo.os.id = analitika_1.vezaid
					inner join (select * from  [dbo].[tbsaldoanaltos] (@mjobrac, @godobrac))
						 tbsaldoanaltos on analitika_1.id = tbsaldoanaltos.analitikaid

				where dbo.btmozeamort (dbo.os.id, @mjobrac, @godobrac) = 1
					and analitika_1.analitikavrsta = 6 
					and (saldoukamoosnov - saldoakumamo) > 0)

				insert into dbo.dokstavka ([dokumid], [pozicija], [kontoid], [analitikaid], [iznos], 
						[iznosval], [pozdatum], [dp], [ps], [zk], [ks], [pecat], [protuid])
				(select inserted.dokumid, 4520, osvrsta.konto4id, inserted.analitika2id, 
					iznos = round(case 
							when (saldoukamoosnov - saldoakumamo) < (saldoukamoosnov * korkoef  amortkoefm )
								and saldorevvrijed = saldoukamoosnov 
							then (saldoukamoosnov - saldoakumamo)
							when (saldoukamoosnov - saldoakumamo) < (saldoukamoosnov * korkoef  amortkoefm) * (saldorevvrijed  amortkoefm
 							end,2),
					iznosval = round(case 
							when (saldoukamoosnov - saldoakumamo) < (saldoukamoosnov * korkoef  amortkoefm )
								and saldorevvrijed = saldoukamoosnov 
							then (saldoukamoosnov - saldoakumamo)
							when (saldoukamoosnov - saldoakumamo) < (saldoukamoosnov * korkoef  amortkoefm) * (saldorevvrijed  amortkoefm
 							end,2),
					inserted.datum, 1, 0, 0, 1, 0, null
				from inserted
					inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
					inner join dbo.tbfetchfirma() tbfetchfirma on dbo.dokstart.firmaid = tbfetchfirma.firmaidinner join dbo.analitika on inserted.analitika2id = dbo.analitika.id
					inner join dbo.cjelina on dbo.analitika.vezaid = dbo.cjelina.id		 
					inner join dbo.lokacija on dbo.cjelina.id = dbo.lokacija.cjelinaid
					inner join dbo.os on dbo.lokacija.id = dbo.os.lokacija
					inner join dbo.osvrsta on dbo.os.osvrstaid = dbo.osvrsta.id
					inner join dbo.analitika analitika_1 on dbo.os.id = analitika_1.vezaid
					inner join (select * from  [dbo].[tbsaldoanaltos] (@mjobrac, @godobrac))
						 tbsaldoanaltos on analitika_1.id = tbsaldoanaltos.analitikaid
				where dbo.btmozeamort (dbo.os.id, @mjobrac, @godobrac) = 1
					and analitika_1.analitikavrsta = 6 
					and (saldoukamoosnov - saldoakumamo) > 0)

				insert into dbo.dokstavka ([dokumid], [pozicija], [kontoid], [analitikaid], [iznos], [iznosval], [pozdatum], [dp], [ps], [zk], [ks], [pecat], [protuid])
				(select inserted.dokumid, 4515, osvrsta.konto1id, analitika_1.id, 
					iznos = round(case 
							when (saldoukamoosnov - saldoakumamo) < (saldoukamoosnov * korkoef  amortkoefm
 							end,2),
					iznos = round(case 
							when (saldoukamoosnov - saldoakumamo) < (saldoukamoosnov * korkoef  amortkoefm
 							end,2),
					inserted.datum, 0, 0, 0, 1, 0, null
				from inserted
					inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
					inner join dbo.analitika on inserted.analitika2id = dbo.analitika.id
					inner join dbo.cjelina on dbo.analitika.vezaid = dbo.cjelina.id		 
					inner join dbo.lokacija on dbo.cjelina.id = dbo.lokacija.cjelinaid
					inner join dbo.os on dbo.lokacija.id = dbo.os.lokacija
					inner join dbo.osvrsta on dbo.os.osvrstaid = dbo.osvrsta.id
					inner join dbo.analitika analitika_1 on dbo.os.id = analitika_1.vezaid

					inner join (select * from  [dbo].[tbsaldoanaltos] (@mjobrac, @godobrac))
						 tbsaldoanaltos on analitika_1.id = tbsaldoanaltos.analitikaid
				where dbo.btmozeamort (dbo.os.id, @mjobrac, @godobrac) = 1
					and analitika_1.analitikavrsta = 6 
					and (saldoukamoosnov - saldoakumamo) > 0)
				end

			fetch next from osparamsc
			into @godobrac, @mjobrac
			end
		close osparamsc
		deallocate osparamsc 
		end

		if exists (select * from inserted
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid 
		 where dokvrsta.financ = 1 and dokvrsta.vrsta = 8 and dokvrsta.sifra = 150
				and (pozicija = 3001 or pozicija = 3002))
		begin
		if not exists (select * from inserted
					inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid
				where dbo.dokstavka.pozicija = 3000) 
		begin
			if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid 
			 where dokvrsta.financ = 1 and dokvrsta.vrsta = 8 and dokvrsta.sifra = 150
					and (pozicija = 3001 or pozicija = 3002) and inserted.tecaj = 1)
			begin

				insert into dbo.dokstavka ([dokumid], [pozicija], [kontoid], [analitikaid], [iznos], 
						[iznosval], [pozdatum], [ps], [zk], [ks], [pecat], [protuid], [dp])
				(select inserted.dokumid, 3000, dbo.dokstavka.kontoid, dbo.dokstavka.analitikaid, 
					iznos = round(abs(dbo.motecrazlika (dbo.dokstavka.id, dbo.dokstavka.dp)),2),
					iznosval =  round(abs(dbo.motecrazlika (dbo.dokstavka.id, dbo.dokstavka.dp)),2), 
					inserted.datum, 0, 0, 1, 0, null,
					dp = case when dbo.motecrazlika (dbo.dokstavka.id, dbo.dokstavka.dp) > 0

						then 1
						else 0
						end
				from inserted
					inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
					inner join dbo.analitika on inserted.analitika2id = dbo.analitika.id
					inner join dbo.dokpoprat on dbo.dokstart.id = dbo.dokpoprat.dokumid
					inner join dbo.dokstart dokstart_1 on dbo.dokpoprat.dokpopratid = dokstart_1.id
					inner join dbo.dokum on dokstart_1.id = dbo.dokum.dokumid
					inner join dbo.dokstavka on dbo.dokum.dokumid = dbo.dokstavka.dokumid
					inner join dbo.dokstavkapop on dbo.dokstavka.id = dbo.dokstavkapop.dokstavkaorg
					inner join dbo.dokstavka dokstavka_1 on dbo.dokstavkapop.dokstavka = dokstavka_1.id
					inner join dbo.dokum dokum_1 on dokstavka_1.dokumid = dokum_1.dokumid		
				where dbo.dokum.tecaj <> 1 and dokum_1.tecaj <> 1 and inserted.tecaj = 1 
					and dbo.motecrazlika (dbo.dokstavka.id, dbo.dokstavka.dp) <> 0)
			end
			if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid 
			 where dokvrsta.financ = 1 and dokvrsta.vrsta = 8 and dokvrsta.sifra = 150
					and (pozicija = 3001 or pozicija = 3002) and inserted.tecaj <> 1)
			begin

				insert into dbo.dokstavka ([dokumid], [pozicija], [kontoid], [analitikaid], [iznos], 
						[iznosval], [pozdatum], [ps], [zk], [ks], [pecat], [protuid], [dp])
				(select inserted.dokumid, 3000, dbo.dokstavka.kontoid, dbo.dokstavka.analitikaid, 
					iznos = round(abs(dbo.mosaldodok (dokstart_1.id) * (inserted.tecaj - dokum.tecaj)),2),
					iznosval =  0, 
		from inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
		where dokstart.dokvrsta = 20
	* inserted.tecaj, 2)
		from dbo.dokstavka dst
		inner join inserted on dst.dokumid = inserted.dokumid
		inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
		inner join ( select case when pozicija = 2993 
				then 1000 
				else pozicija end as pozicija, 
				sum(iznos) as iznos
			from insertedinner join dbo.dokpoprat on inserted.dokumid = dbo.dokpoprat.dokumid 
				inner join dbo.dokstavka on dbo.dokpoprat.dokpopratid = dbo.dokstavka.dokumid 
			group by case when pozicija = 2993
					then 1000
					else pozicija end)  poz on dst.pozicija = poz.pozicija 
		where dokstart.dokvrsta = 123
		
		end

	if  exists (select * from inserted 
			inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid
			inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
		where dokstart.knjizeno = 0 and dokstart.zakljuceno = 0)

	begin

		if  exists (select * from inserted 
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			where dokvrsta.rpcp = 1 and rpcpnacin = 2 
				and dokstart.knjizeno = 0 and dokstart.zakljuceno = 0 
				and dokstart.azuriranje = 1) 
		begin

			delete dbo.evidpopust
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
				inner join dbo.evidpopust on dbo.evid.id = dbo.evidpopust.evidid
			

			insert into dbo.evidpopust(evidid, skalarpcp, postotak)
			(select distinct evid.id, -1, listvrstplac.provizija  
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.list on dbo.dokstart.listid = dbo.list.id
				inner join dbo.listnad on dbo.list.listnadid = dbo.listnad.id
				inner join dbo.listvrstplac on dbo.listnad.listvrstplac = dbo.listvrstplac.sifra
				inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
				left outer join dbo.evidpopust on dbo.evid.id = dbo.evidpopust.evidid
									and dbo.evidpopust.skalarpcp = -1
			where dokstart.knjizeno = 0 
				and dokstart.zakljuceno = 0

				and listvrstplac.provizija <= 0 
				and dokstart.azuriranje = 1 
				and evidpopust.evidid is null)  

			update dbo.dokstavka
			set iznos = 0, iznosval = 0 
			from inserted
				inner join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
			where pozicija = 1252
		

			insert into dbo.evidpopust(evidid, skalarpcp, postotak)
			(select evid.id, 0, partner.dodpop  
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
				inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
				inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.analitika on inserted.analitika1id = dbo.analitika.id
					and dbo.analitika.analitikavrsta = 2
				inner join dbo.partner on dbo.analitika.vezaid = dbo.partner.partnerid
				left outer join dbo.dokpoprat on dbo.dokstart.id = dbo.dokpoprat.dokumid
				left outer join dbo.dokstart dsp on dbo.dokpoprat.dokpopratid = dsp.id
						and dsp.zakljuceno = 1 
			where asovrsta.pop = 1 and dokvrsta.rpcp = 1 and rpcpnacin = 2 
				and partner.dodpop > 0 and dsp.id is null)

			insert into dbo.evidpopust(evidid, skalarpcp, postotak)
			(select evid.id, skalarpcp.sifra,
				popust = (case 

				  when pragvrsta = 1 and kolicina2 >= prag7 then rpcp7
				  when pragvrsta = 1 and kolicina2 >= prag6 and kolicina2 < prag7 then rpcp6
				  when pragvrsta = 1 and kolicina2 >= prag5 and kolicina2 < prag6 then rpcp5
				  when pragvrsta = 1 and kolicina2 >= prag4 and kolicina2 < prag5 then rpcp4
				  when pragvrsta = 1 and kolicina2 >= prag3 and kolicina2 < prag4 then rpcp3
				  when pragvrsta = 1 and kolicina2 >= prag2 and kolicina2 < prag3 then rpcp2
				  when pragvrsta = 1 and kolicina2 >= prag1 and kolicina2 < prag2 then rpcp1

				  when pragvrsta = 2 and evid.kolicina1 >= prag7 then rpcp7
				  when pragvrsta = 2 and evid.kolicina1 >= prag6 and evid.kolicina1 < prag7 then rpcp6
				  when pragvrsta = 2 and evid.kolicina1 >= prag5 and evid.kolicina1 < prag6 then rpcp5
				  when pragvrsta = 2 and evid.kolicina1 >= prag4 and evid.kolicina1 < prag5 then rpcp4
				  when pragvrsta = 2 and evid.kolicina1 >= prag3 and evid.kolicina1 < prag4 then rpcp3
				  when pragvrsta = 2 and evid.kolicina1 >= prag2 and evid.kolicina1 < prag3 then rpcp2
				  when pragvrsta = 2 and evid.kolicina1 >= prag1 and evid.kolicina1 < prag2 then rpcp1

				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag7 then rpcp7
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag6 and kolicina2 * fakcijena < prag7 then rpcp6
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag5 and kolicina2 * fakcijena < prag6 then rpcp5
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag4 and kolicina2 * fakcijena < prag5 then rpcp4
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag3 and kolicina2 * fakcijena < prag4 then rpcp3
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag2 and kolicina2 * fakcijena < prag3 then rpcp2
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag1 and kolicina2 * fakcijena < prag2 then rpcp1

				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag7 then rpcp7
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag6 and evid.kolicina1 * fakcijena < prag7 then rpcp6
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag5 and evid.kolicina1 * fakcijena < prag6 then rpcp5
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag4 and evid.kolicina1 * fakcijena < prag5 then rpcp4
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag3 and evid.kolicina1 * fakcijena < prag4 then rpcp3
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag2 and evid.kolicina1 * fakcijena < prag3 then rpcp2
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag1 and evid.kolicina1 * fakcijena < prag2 then rpcp1

				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag7 then rpcp7
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag6 and kolicina2 * evid.bod < prag7 then rpcp6
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag5 and kolicina2 * evid.bod < prag6 then rpcp5
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag4 and kolicina2 * evid.bod < prag5 then rpcp4
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag3 and kolicina2 * evid.bod < prag4 then rpcp3
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag2 and kolicina2 * evid.bod < prag3 then rpcp2
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag1 and kolicina2 * evid.bod < prag2 then rpcp1

				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag7 then rpcp7
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag6 and evid.kolicina1 * evid.bod < prag7 then rpcp6
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag5 and evid.kolicina1 * evid.bod < prag6 then rpcp5
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag4 and evid.kolicina1 * evid.bod < prag5 then rpcp4
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag3 and evid.kolicina1 * evid.bod < prag4 then rpcp3
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag2 and evid.kolicina1 * evid.bod < prag3 then rpcp2
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag1 andevid.kolicina1 * evid.bod < prag2 then rpcp1

				  when pragvrsta = 125 
					and [dbo].[mosaldopartnersuperpopust](inserted.analitika1id)>= ukpocjeniku * rpcp7 * 0.01 
				  then rpcp7
				  when pragvrsta = 125 
					and [dbo].[mosaldopartnersuperpopust](inserted.analitika1id)>= ukpocjeniku * rpcp6 * 0.01 
				  then rpcp6
				  when pragvrsta = 125
					and [dbo].[mosaldopartnersuperpopust](inserted.analitika1id)>= ukpocjeniku * rpcp5 * 0.01 
				  then rpcp5
				  when pragvrsta = 125 
					and [dbo].[mosaldopartnersuperpopust](inserted.analitika1id)>= ukpocjeniku * rpcp4 * 0.01 
				  then rpcp4
				  when pragvrsta = 125 
					and [dbo].[mosaldopartnersuperpopust](inserted.analitika1id)>= ukpocjeniku * rpcp3 * 0.01 
				  then rpcp3
				  when pragvrsta = 125
					and [dbo].[mosaldopartnersuperpopust](inserted.analitika1id)>= ukpocjeniku * rpcp2 * 0.01 
				  then rpcp2
				  when pragvrsta = 125
					and [dbo].[mosaldopartnersuperpopust](inserted.analitika1id)>= ukpocjeniku * rpcp1 * 0.01 
				  then rpcp1

				  when pragvrsta = 20 and kolicina >= prag7 then rpcp7
				  when pragvrsta = 20 and kolicina  >= prag6 and kolicina < prag7 then rpcp6
				  when pragvrsta = 20 and kolicina  >= prag5 and kolicina < prag6 then rpcp5
				  when pragvrsta = 20 and kolicina  >= prag4 and kolicina < prag5 then rpcp4
				  when pragvrsta = 20 and kolicina  >= prag3 and kolicina < prag4 then rpcp3
				  when pragvrsta = 20 and kolicina  >= prag2 and kolicina < prag3 then rpcp2
				  when pragvrsta = 20 and kolicina  >= prag1 and kolicina < prag2 then rpcp1

				  when pragvrsta = 21 and ukpocjeniku  >= prag7 then rpcp7
				  when pragvrsta = 21 and ukpocjeniku  >= prag6 and ukpocjeniku < prag7 then rpcp6
				  when pragvrsta = 21 and ukpocjeniku  >= prag5 and ukpocjeniku < prag6 then rpcp5
				  when pragvrsta = 21 and ukpocjeniku  >= prag4 and ukpocjeniku < prag5 then rpcp4
				  when pragvrsta = 21 and ukpocjeniku  >= prag3 and ukpocjeniku < prag4 then rpcp3
				  when pragvrsta = 21 and ukpocjeniku  >= prag2 and ukpocjeniku < prag3 then rpcp2
				  when pragvrsta = 21 and ukpocjeniku  >= prag1 and ukpocjeniku < prag2 then rpcp1

				  when pragvrsta = 22 and ukbod >= prag7 then rpcp7
				  when pragvrsta = 22 and ukbod >= prag6 and ukbod < prag7 then rpcp6
				  when pragvrsta = 22 and ukbod >= prag5 and ukbod < prag6 then rpcp5
				  when pragvrsta = 22 and ukbod >= prag4 and ukbod < prag5 then rpcp4
				  when pragvrsta = 22 and ukbod >= prag3 and ukbod < prag4 then rpcp3
				  when pragvrsta = 22 and ukbod >= prag2 and ukbod < prag3 then rpcp2
				  when pragvrsta = 22 and ukbod >= prag1 and ukbod < prag2 then rpcp1

				  when pragvrsta = 23 and es.tezina >= prag7 then rpcp7
				  when pragvrsta = 23 and es.tezina >= prag6 and es.tezina < prag7 then rpcp6
				  when pragvrsta = 23 and es.tezina >= prag5 and es.tezina < prag6 then rpcp5
				  when pragvrsta = 23 and es.tezina >= prag4 and es.tezina < prag5 then rpcp4
				  when pragvrsta = 23 and es.tezina >= prag3 and es.tezina < prag4 then rpcp3
				  when pragvrsta = 23 and es.tezina >= prag2 and es.tezina < prag3 then rpcp2
				  when pragvrsta = 23 and es.tezina >= prag1 and es.tezina < prag2 then rpcp1

				  when pragvrsta = 31 and [dbo].[sivrstplac] (dokstart.listid) = prag7 then rpcp7
				  when pragvrsta = 31 and [dbo].[sivrstplac] (dokstart.listid) = prag6 then rpcp6
				  when pragvrsta = 31 and [dbo].[sivrstplac] (dokstart.listid) = prag5 then rpcp5
				  when pragvrsta = 31 and [dbo].[sivrstplac] (dokstart.listid) = prag4 then rpcp4
				  when pragvrsta = 31 and [dbo].[sivrstplac] (dokstart.listid) = prag3 then rpcp3
				  whenpragvrsta = 31 and [dbo].[sivrstplac] (dokstart.listid) = prag2 then rpcp2
				  when pragvrsta = 31 and [dbo].[sivrstplac] (dokstart.listid) = prag1 then rpcp1

				  when pragvrsta = 7 and asogrupa = prag7 then rpcp7
				  when pragvrsta = 7 and asogrupa = prag6 then rpcp6
				  when pragvrsta = 7 and asogrupa = prag5 then rpcp5
				  when pragvrsta = 7 and asogrupa = prag4 then rpcp4
				  when pragvrsta = 7 and asogrupa = prag3 then rpcp3
				  when pragvrsta = 7 and asogrupa = prag2 then rpcp2
				  when pragvrsta = 7 and asogrupa = prag1 then rpcp1

				  when pragvrsta = 8 and asokolekcija = prag7 then rpcp7
				  when pragvrsta = 8 and asokolekcija = prag6 then rpcp6
				  when pragvrsta = 8 and asokolekcija = prag5 then rpcp5
				  when pragvrsta = 8 and asokolekcija = prag4 then rpcp4
				  when pragvrsta = 8 and asokolekcija = prag3 then rpcp3
				  when pragvrsta = 8 and asokolekcija = prag2 then rpcp2
				  when pragvrsta = 8 and asokolekcija = prag1 then rpcp1
				  else 0
				end)
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
				inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
				inner join dbo.asortiman on dbo.asokatalog.asortid = dbo.asortiman.id
				inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
				inner join dbo.analitika on inserted.analitika1id = dbo.analitika.id
					and dbo.analitika.analitikavrsta = 2
				inner join dbo.partner on dbo.analitika.vezaid = dbo.partner.partnerid
				inner join dbo.partnerskalarpcp on dbo.partner.partnerid = dbo.partnerskalarpcp.partnerid
				inner join dbo.skalarpcp on dbo.partnerskalarpcp.skalarpcp = dbo.skalarpcp.sifra

				inner join (select inserted.dokumid,
						round(sum(fakcijena * inserted.tecaj * kolicina2),2) as ukpocjeniku,
						sum(case when obracjedinica.obrjedgrupa = 2 then kolicina2 * obracjedinica.koef else 0 end) as kolicina,
						sum(case when obracjedinica.obrjedgrupa = 3 then kolicina2 * obracjedinica.koef else 0 end) as tezina,
						sum(bod) as ukbod
					from inserted 
						inner join dbo.dokstart ds on inserted.dokumid = ds.id
						inner join dbo.evid e on ds.listid = e.listid			
						inner join dbo.obracjedinica on e.obracjedinica = dbo.obracjedinica.sifra
					group by inserted.dokumid) es on inserted.dokumid = es.dokumid
				left outer join dbo.dokpoprat on dbo.dokstart.id = dbo.dokpoprat.dokumid
				left outer join dbo.dokstart dsp on dbo.dokpoprat.dokpopratid = dsp.id
						and dsp.zakljuceno = 1 
			where asovrsta.pop = 1 and dokvrsta.rpcp = 1 and rpcpnacin = 2 and dsp.id is null)

			insert into dbo.evidpopust(evidid, skalarpcp, postotak)
			(select evid.id, skrpcp_ac.sifra,
				popust = case

				  when pragvrsta = 1 and kolicina2 >= prag7 then rpcp7
				  when pragvrsta = 1 and kolicina2  >= prag6 and kolicina2 < prag7 then rpcp6
				  when pragvrsta = 1 and kolicina2  >= prag5 and kolicina2 < prag6 then rpcp5
				  when pragvrsta = 1 and kolicina2  >= prag4 and kolicina2 < prag5 then rpcp4
				  when pragvrsta = 1 and kolicina2  >= prag3 and kolicina2 < prag4 then rpcp3
				  when pragvrsta = 1 and kolicina2  >= prag2 and kolicina2 < prag3 then rpcp2
				  when pragvrsta = 1 and kolicina2  >= prag1 and kolicina2 < prag2 then rpcp1

				  when pragvrsta = 2and evid.kolicina1  >= prag7 then rpcp7
				  when pragvrsta = 2 and evid.kolicina1  >= prag6 and evid.kolicina1 < prag7 then rpcp6
				  when pragvrsta = 2 and evid.kolicina1  >= prag5 and evid.kolicina1 < prag6 then rpcp5
				  when pragvrsta = 2 and evid.kolicina1  >= prag4 and evid.kolicina1 < prag5 then rpcp4
				  when pragvrsta = 2 and evid.kolicina1  >= prag3 and evid.kolicina1 < prag4 then rpcp3
				  when pragvrsta = 2 and evid.kolicina1  >= prag2 and evid.kolicina1 < prag3 then rpcp2
				  when pragvrsta = 2 and evid.kolicina1  >= prag1 and evid.kolicina1 < prag2 then rpcp1

				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag7 then rpcp7
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag6 and kolicina2 * fakcijena < prag7 then rpcp6
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag5 and kolicina2 * fakcijena < prag6 then rpcp5
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag4 and kolicina2 * fakcijena < prag5 then rpcp4
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag3 and kolicina2 * fakcijena < prag4 then rpcp3
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag2 and kolicina2 * fakcijena < prag3 then rpcp2
				  when pragvrsta = 3 and kolicina2 * fakcijena >= prag1 and kolicina2 * fakcijena < prag2 then rpcp1

				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag7 then rpcp7
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag6 and evid.kolicina1 * fakcijena < prag7 then rpcp6
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag5 and evid.kolicina1 * fakcijena < prag6 then rpcp5
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag4 and evid.kolicina1 * fakcijena < prag5 then rpcp4
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag3 and evid.kolicina1 * fakcijena < prag4 then rpcp3
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag2 and evid.kolicina1 * fakcijena < prag3 then rpcp2
				  when pragvrsta = 4 and evid.kolicina1 * fakcijena >= prag1 and evid.kolicina1 * fakcijena < prag2 then rpcp1

				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag7 then rpcp7
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag6 and kolicina2 * evid.bod < prag7 then rpcp6
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag5 and kolicina2 * evid.bod < prag6 then rpcp5
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag4 and kolicina2 * evid.bod < prag5 then rpcp4
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag3 and kolicina2 * evid.bod < prag4 then rpcp3
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag2 and kolicina2 * evid.bod < prag3 then rpcp2
				  when pragvrsta = 5 and kolicina2 * evid.bod >= prag1 and kolicina2 * evid.bod < prag2 then rpcp1

				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag7 then rpcp7
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag6 and evid.kolicina1 * evid.bod < prag7 then rpcp6
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag5 and evid.kolicina1 * evid.bod < prag6 then rpcp5
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag4 and evid.kolicina1 * evid.bod < prag5 then rpcp4
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag3 and evid.kolicina1 * evid.bod < prag4 then rpcp3
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag2 and evid.kolicina1 * evid.bod < prag3 then rpcp2
				  when pragvrsta = 6 and evid.kolicina1 * evid.bod >= prag1 and evid.kolicina1 * evid.bod < prag2 then rpcp1
				  else 0
				end
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
				inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
				inner join dbo.asortiman on dbo.asokatalog.asortid = dbo.asortiman.id
				inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.list on dbo.dokstart.listid = dbo.list.id
				inner join dbo.asocjenik on dbo.evid.asokatalogid = dbo.asocjenik.asokatalogid
						and dbo.list.cjenik = dbo.asocjenik.cjenik
				inner join dbo.asocjenikskalarpcp on dbo.asocjenik.id = dbo.asocjenikskalarpcp.asocjenikid 
				inner join dbo.skalarpcp skrpcp_ac on dbo.asocjenikskalarpcp.skalarpcp = skrpcp_ac.sifra
				left outer join dbo.dokpoprat on dbo.dokstart.id = dbo.dokpoprat.dokumid
				left outer join dbo.dokstart dsp on dbo.dokpoprat.dokpopratid = dsp.id
						and dsp.zakljuceno = 1 
			where asovrsta.pop = 1 and dokvrsta.rpcp = 1 and rpcpnacin = 2 and dsp.id is null)

		update dbo.evid
		set fakpopust = case when ep.postotak > 0 
						then isnull(ep.postotak,0)
						else evid.fakpopust
						end,
			fakcijena = case when abs(ep.proviz) > 0 and evid.fakcijena = asocjenik.cijena
					then evid.fakcijena + (evid.fakcijena * abs(ep.proviz)*0.01)
					when abs(ep.proviz) > 0 and evid.fakcijena > asocjenik.cijena
					then evid.fakcijena
					else asocjenik.cijena
					end
		from inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.list on dbo.dokstart.listid = dbo.list.id
			inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
			inner join dbo.asocjenik on dbo.list.cjenik = dbo.asocjenik.cjenik
							and dbo.evid.asokatalogid = dbo.asocjenik.asokatalogid
			inner join (select evid.id, 
							postotak = sum(case when evidpopust.postotak > 0 
									then postotak
									else 0 
									end),
							proviz = sum(case when evidpopust.postotak <= 0 
									then postotak
									else 0 
									end)
				from inserted
					inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
					inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
					inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
					inner join dbo.evidpopust on dbo.evid.id = dbo.evidpopust.evidid
				where dokvrsta.rpcp = 1 and rpcpnacin = 2 
				group by evid.id) ep on dbo.evid.id = ep.id
		where dokvrsta.rpcp = 1 and rpcpnacin = 2

		end

		if exists (select * from inserted
				inner join dbo.isplatastavke with(nolock) on inserted.dokumid = dbo.isplatastavke.dokumid)
		begin

			update dbo.dokstavka
			set 	iznos = isnull(issp.iznos,0),
				iznosval = isnull(issp.iznosval,0)
			from (select inserted.dokumid, dbo.obrsifra.pozicija, 
					round(sum(dbo.isplatastavke.iznos),2) as iznos,
					round(sum(dbo.isplatastavke.iznos  i.tecaj),2) as iznosval
					from inserted i
					inner join dbo.dokstart ds on i.dokumid = ds.id
					inner join dbo.dokvrsta dv on ds.dokvrsta = dv.sifra

					inner join dbo.dokstavka dst on i.dokumid = dst.dokumid
					inner join dbo.isplatastavke ist on i.dokumid = ist.dokumid and dst.pozicija = ist.pozicija
					where ist.pozicija > 0 and ist.pozicija <> 1000 and dst.pozicija <> 1000 and dv.financ = 1 and dv.skupdog1 = 3
					group by ist.dokumid
				) istiz inner join dbo.dokstavka dst on istiz.dokumid = dst.dokumid
				where dst.pozicija = 1000
		end

		if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra

			where dokvrsta.financ = 1 and dokvrsta.evid = 1)
    		begin	

    		declare @tbpec table (dokumid int,pozicija smallint,iznos money,iznosval money, pecat bit)

			insert @tbpec 
			select distinct inserted.dokumid, dokstavka.pozicija, 
					dokstavka.iznos, dokstavka.iznosval, dokstavka.pecat
			from inserted 
				inner join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
				left outer join dbo.dokstavkapop on dbo.dokstavka.id = dbo.dokstavkapop.dokstavkaorg
			where dbo.dokstavkapop.dokstavka is null 

			update tbpec  
			set iznos = case when ukkolicina > 0 then isnull(ukkolicina,0) else 0 end,
				iznosval =  case when ukkolicina > 0 then isnull(ukkolicina,0) else 0 end
				from inserted 
					inner join @tbpec tbpec on inserted.dokumid = tbpec.dokumid
					left outer join (select inserted.dokumid, 
					max(round(cast(dbo.evid.obracjedinica as smallint),-1,1)) as obracjedinica,
					sum(dbo.evid.kolicina2 * obracjedinica.koef) as ukkolicina
					from  inserted
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id 
						inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid
						inner join dbo.obracjedinica on dbo.evid.obracjedinica = dbo.obracjedinica.sifra
					group by inserted.dokumid, obrjedgrupa) seobj
			 			on tbpec.dokumid = seobj.dokumid
	 					and tbpec.pozicija = seobj.obracjedinica
			where tbpec.pozicija between 0 and 255

			if exists (select * from inserted 
						inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid
						inner join dbo.pozicija with(nolock) on dbo.dokstavka.pozicija = dbo.pozicija.sifra
					 where pozicija.sifra between 1000 and 4300 and pozicija.asovrstavrsta is null)
			begin
			update tbpec  
				set iznos = isnull(case 

				when pozicija = 1000 then iznostb
				when pozicija = 1050 then katiznostb
				when pozicija = 1100 then bodtb
				when pozicija = 1150 then  osnovicatb
				when pozicija = 1200 then  osnovicatb + popusttb
				when pozicija = 1250 then  popusttb
				when pozicija = 1300 then neopor
				when pozicija = 1350 then osnovtb0
				when pozicija = 1400 then osnovtb1
				when pozicija = 1450 then osnovtb2
				when pozicija = 1500 then osnovtb3
				when pozicija = 1550 then osnovtb4
				when pozicija = 1600 then porez1tb1
				when pozicija = 1650 then porez1tb2
				when pozicija = 1700 then porez1tb3
				when pozicija = 1750 then porez1tb4
				when pozicija = 1800 then  porez2tb
				when pozicija = 1850 then  porez3tbwhen pozicija = 1900 then  porez4tb
				when pozicija = 1950 then  trosarinatb
				when pozicija = 2993 and pecat = 1 then iznostb 

				when pozicija = 4000 then dobavaiznos
				when pozicija = 4010 then zavisniiznos
				when pozicija = 4020 then carinaiznos
				when pozicija = 4030 then  markupiznos
				when pozicija = 4040 then  dobavaiznos + zavisniiznos + carinaiznos
				when pozicija = 4050 then  prodiznosbez - (dobavaiznos + zavisniiznos + carinaiznos)
				when pozicija = 4060 then  prodiznosbez
				when pozicija = 4080 then  iznpor2
				when pozicija = 4090 then  iznpor3
				when pozicija = 4100 then  iznpor4
				when pozicija = 4110 then  trosarinaiznos
				when pozicija = 4120 then  prodiznosbez + iznpor1 + iznpor2 + iznpor3 + iznpor4
				when pozicija = 4066 then neoporz
				when pozicija = 4061 then osnovtb0z
				when pozicija = 4062 then osnovtb1z
				when pozicija = 4063 then osnovtb2z
				when pozicija = 4064 then osnovtb3z
				when pozicija = 4065 then osnovtb4z
				when pozicija = 4070 then porez1tb1z
				when pozicija = 4071 then porez1tb2z
				when pozicija = 4072 then porez1tb3z
				when pozicija = 4072 then porez1tb4z

				when pozicija = 4201 then iznostb - (prodiznosbez + iznpor1 + iznpor2 + iznpor3 + iznpor4) 

				when pozicija = 4203 then (osnovicatb - (dobavaiznos + zavisniiznos + carinaiznos)) - (prodiznosbez - (dobavaiznos + zavisniiznos + carinaiznos))							
				when pozicija = 4205 then porez1tb1 - porez1tb1z 
				when pozicija = 4207 then porez1tb2 - porez1tb2z 
				when pozicija = 4209 then porez1tb3 - porez1tb3z 
				when pozicija = 4211 then porez1tb4 - porez1tb4z 
				when pozicija = 4221 then porez2tb - iznpor2 
				when pozicija = 4223 then porez3tb - iznpor3 
				when pozicija = 4225 then porez4tb - iznpor4 
				when pozicija = 4251 then tbpec.iznos 
				when pozicija = 4253 then tbpec.iznos
				when pozicija = 4255 then tbpec.iznos

				when pozicija = 4300 then iznostb

				when pozicija = 4200 then osnovicatb - (dobavaiznos + zavisniiznos + carinaiznos)

				else 0
				end,0),
				iznosval = isnull(case 

				when pozicija = 1000 then iznostbval
				when pozicija = 1050 then katiznostbval
				when pozicija = 1100 then  bodtb
				when pozicija = 1150 then  osnovicatbval
				when pozicija = 1200 then  osnovicatbval + popusttbval
				when pozicija = 1250 then  popusttbval
				when pozicija = 1300 then neoporval
				when pozicija = 1350 then osnovtb0val
				when pozicija = 1400 then osnovtb1val
				when pozicija = 1450 then osnovtb2val
				when pozicija = 1500 then osnovtb3val
				when pozicija = 1550 then osnovtb4val
				when pozicija = 1600 then porez1tb1val
				when pozicija = 1650 then porez1tb2val
				when pozicija = 1700 then porez1tb3val
				when pozicija = 1750 then porez1tb4val
				when pozicija = 1800 then  porez2tbval
				when pozicija = 1850 then  porez3tbval
				when pozicija = 1900 then  porez4tbval
				when pozicija = 1950 then  trosarinatbval
				when pozicija = 2993 and pecat = 1 then iznostbval

				when pozicija = 4000 then dobavaiznosval
				when pozicija = 4010 then zavisniiznosval
				when pozicija = 4020 then carinaiznosval
				when pozicija = 4030 then  markupiznosval
				when pozicija = 4040 then  dobavaiznosval + zavisniiznosval + carinaiznosval
				when pozicija = 4050 then  prodiznosbezval - (dobavaiznosval + zavisniiznosval + carinaiznosval)
				when pozicija = 4060 then  prodiznosbezval
				when pozicija = 4080 then  iznpor2val
				when pozicija = 4090 then  iznpor3val
				when pozicija = 4100 then  iznpor4val
				when pozicija = 4110 then  trosarinaiznosval
				when pozicija = 4120 then  prodiznosbezval  + iznpor1val + iznpor2val + iznpor3val + iznpor4val
				when pozicija = 4066 then neoporvalz
				when pozicija = 4061 then osnovtb0valz
				when pozicija = 4062 then osnovtb1valz
				when pozicija = 4063 then osnovtb2valz
				when pozicija = 4064 then osnovtb3valz
				when pozicija = 4065 then osnovtb4valz
				when pozicija = 4070 then porez1tb1valz
				when pozicija = 4071 then porez1tb2valz
				when pozicija = 4072 then porez1tb3valz
				when pozicija = 4072 then porez1tb4valz

				when pozicija = 4201 then iznostbval - (prodiznosbezval + iznpor1val + iznpor2val + iznpor3val + iznpor4val) 

				when pozicija = 4203 then (osnovicatbval - (dobavaiznosval + zavisniiznosval + carinaiznosval)) - (prodiznosbezval - (dobavaiznosval + zavisniiznosval + carinaiznosval))						
				when pozicija = 4205 then porez1tb1val - porez1tb1valz 
				when pozicija = 4207 then porez1tb2val - porez1tb2valz 
				when pozicija = 4209 then porez1tb3val - porez1tb3valz 
				when pozicija = 4211 then porez1tb4val - porez1tb4valz 
				when pozicija = 4221 then porez2tbval - iznpor2val 
				when pozicija = 4223 then porez3tbval - iznpor3val 
				when pozicija = 4225 then porez4tbval - iznpor4val 
				when pozicija = 4251 then tbpec.iznosval 
				when pozicija = 4253 then tbpec.iznosval
				when pozicija = 4255 then tbpec.iznosval

				when pozicija = 4300 then iznostbval

				when pozicija = 4200 then osnovicatbval - (dobavaiznosval + zavisniiznosval + carinaiznosval)
				else 0 
				end,0)
			from inserted 
				inner join @tbpec tbpec on inserted.dokumid = tbpec.dokumid

				inner join (select inserted.dokumid,

					sum(iznostb) as iznostb, sum(katiznostb) as katiznostb, sum(bodtb) as bodtb,
					sum(osnovicatb) as osnovicatb, sum(popusttb) as popusttb, 
					sum(porez2tb) as porez2tb, sum(porez3tb) as porez3tb, sum(porez4tb) as porez4tb, 
					sum(trosarinatb) as trosarinatb,
					sum(iznostbval) as iznostbval, sum(katiznostbval) as katiznostbval,
					sum(osnovicatbval) as osnovicatbval, sum(popusttbval) as popusttbval, 
					sum(porez2tbval) as porez2tbval, sum(porez3tbval) as porez3tbval, sum(porez4tbval) as porez4tbval, 
					sum(trosarinatbval) as trosarinatbval, sum(kolicina) as kolicina,
					porez1tb1 = sum(case when ze.portarifid = 7 then porez1tb else 0 end), 
					porez1tb2 = sum(case when ze.portarifid = 8 then porez1tb else 0 end), 
					porez1tb3 = sum(case when ze.portarifid = 9 then porez1tb else 0 end), 
					porez1tb4 = sum(case when ze.portarifid = 10 then porez1tb else 0 end), 
					porez1tb1val = sum(case when ze.portarifid = 7 then porez1tbval else 0 end), 
					porez1tb2val = sum(case when ze.portarifid = 8 then porez1tbval else 0 end), 
					porez1tb3val = sum(case when ze.portarifid = 9 then porez1tbval else 0 end), 
					porez1tb4val = sum(case when ze.portarifid = 10 then porez1tbval else 0 end), 
					neopor = sum(case when ze.portarifid = 0 then osnovicatb else 0 end), 
					osnovtb0 = sum(case when ze.portarifid = 6 then osnovicatb else 0 end), 
					osnovtb1 = sum(case when ze.portarifid = 7 then osnovicatb else 0 end), 
					osnovtb2 = sum(case when ze.portarifid = 8 then osnovicatb else 0 end), 
					osnovtb3 = sum(case when ze.portarifid = 9 then osnovicatb else 0 end), 
					osnovtb4 = sum(case when ze.portarifid = 10 then osnovicatb else 0 end), 
					neoporval = sum(case when ze.portarifid = 0 then osnovicatbval else 0 end), 

					osnovtb0val = sum(case when ze.portarifid = 6 then osnovicatbval else 0 end), 
					osnovtb1val = sum(case when ze.portarifid = 7 then osnovicatbval else 0 end), 
					osnovtb2val = sum(case when ze.portarifid = 8 then osnovicatbval else 0 end), 
					osnovtb3val = sum(case when ze.portarifid = 9 then osnovicatbval else 0 end), 
					osnovtb4val = sum(case when ze.portarifid = 10 then osnovicatbval else 0 end) 
				from inserted 
					inner join (select inserted.dokumid,  dbo.portarif.id as portarifid,

						iznostb = sum(case when primjmp = 1 
						then round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 *  inserted.tecaj),2)
						else round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 *  inserted.tecaj),2)
						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez4 * 0.01) * kolicina2 *  inserted.tecaj),2)
						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2 *  inserted.tecaj),2)
						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez2 * 0.01) * kolicina2 *  inserted.tecaj),2)
						+ round((round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 * inserted.tecaj),2) + 
							round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2 *  inserted.tecaj),2))
							* (porez1 * 0.01),2)
						end),
						iznostbval = sum(case when primjmp = 1 
						then round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 * 1),2)
						else round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 * 1),2)
						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez4 * 0.01) * kolicina2),2)
						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2),2)
						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez2 * 0.01) * kolicina2),2)
						+ round((round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 ),2) + 
							round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2 ),2))
							* (porez1 * 0.01),2)
						end),
						osnovicatb = sum(case when primjmp = 0 
						then round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 *  inserted.tecaj),2)
						else  round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 *  inserted.tecaj),2)
						- (round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez3 * 0.01) *  inserted.tecaj * kolicina2 ),2)
						+ round((fakcijena * (1- (fakpopust * 0.01))  koef *  inserted.tecaj * kolicina2 ),2) +
							 round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez4 * 0.01) * 1 * kolicina2 ),2)
						+ round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez2 * 0.01) * 1 * kolicina2 ),2)
						+ round((round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez3 * 0.01) * 1 * kolicina2),2))
							* (porez1 * 0.01),2))
						end),
						popusttb = sum(case when primjmp = 0 
						then round((fakcijena * (fakpopust * 0.01) *  kolicina2 *  inserted.tecaj),2)
						else round(( round((fakcijena * kolicina2 *  inserted.tecaj),2)
						- ( round((fakcijena   koef * (porez3 * 0.01) *  inserted.tecaj * kolicina2 ),2)
						+ round((fakcijena  koef *  inserted.tecaj * kolicina2),2) +
						   round((fakcijena   koef * (porez4 * 0.01) * kolicina2 ),2)
						+ round((fakcijena   koef * (porez2 * 0.01) * kolicina2),2)
						+ round(((round((fakcijena   koef * (porez3 * 0.01) * kolicina2),2))) * (porez1 * 0.01),2)))
						* (fakpopust * 0.01),2)
						end),
						porez4tb = sum(case when primjmp = 0 
						then round((fakcijena * (1- (fakpopust * 0.01)) * (porez4 * 0.01) * kolicina2 *  inserted.tecaj),2)
						else round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez4 * 0.01) * 1 * kolicina2 ),2)
						end),
						porez3tb = sum(case when primjmp = 0 
						then round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2 *  inserted.tecaj),2)
						else round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez3 * 0.01) * 1 * kolicina2),2)
						end),
						porez2tb = sum(case when primjmp = 0 
						then round((fakcijena * (1- (fakpopust * 0.01)) * (porez2 * 0.01) * kolicina2 *  inserted.tecaj),2)
						else round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez2 * 0.01) * 1 * kolicina2),2)
						end),
						porez1tb = sum(case when primjmp = 0 
						then round((round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 *  inserted.tecaj),2) + 
							round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2 *  inserted.tecaj),2))
							* (porez1 * 0.01),2)
						else round((round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez3 * 0.01) *  inserted.tecaj * kolicina2 ),2))
							* (porez1 * 0.01),2)
						end),
						porez1tbval = sum(case when primjmp = 0 
						then round((round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 * 1),2) + 
							round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2 * 1),2))
							* (porez1 * 0.01),2)
						else round((round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez3 * 0.01) * 1 * kolicina2),2))
							* (porez1 * 0.01),2)
						end),
						round(sum(faktrosar * inserted.tecaj * kolicina2),2) as trosarinatb, 
						round(sum(faktrosar * kolicina2),2) as trosarinatbval, 
						round(sum(fakcijena * inserted.tecaj * kolicina2),2) as katiznostb, 
						round(sum(fakcijena * kolicina2),2) as katiznostbval,
						sum(evid.bod * cast(kolicina2 as money)) as bodtb,
						sum(kolicina2) as kolicina
					from    inserted
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
						inner join dbo.list on dbo.dokstart.listid = dbo.list.id 
						inner join dbo.cjenik on dbo.list.cjenik = dbo.cjenik.sifra 
						inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
						inner join dbo.evid on dbo.list.id = dbo.evid.listid 
						inner join dbo.portarif on dbo.evid.portarifid = dbo.portarif.id
					group by  inserted.dokumid, dbo.portarif.id) 
					 ze on inserted.dokumid = ze.dokumid
				  group by inserted.dokumid) sze on inserted.dokumid = sze.dokumid
				inner join (select inserted.dokumid,

					sum(trosarinaiznos) as trosarinaiznos, sum(trosarinaiznosval) as trosarinaiznosval, 
					sum(prodiznosbez) as prodiznosbez, sum(prodiznosbezval) as prodiznosbezval, 
					sum(zavisniiznos) as zavisniiznos, sum(zavisniiznosval) as zavisniiznosval,  
					sum(carinaiznos) as carinaiznos, sum(carinaiznosval) as carinaiznosval,
					sum(dobavaiznos) as dobavaiznos, sum(dobavaiznosval) as dobavaiznosval,
					sum(markupiznos) as markupiznos, sum(markupiznosval) as markupiznosval,
					sum(iznpor4) as iznpor4, sum(iznpor4val) as iznpor4val,
					sum(iznpor3) as iznpor3, sum(iznpor3val) as iznpor3val,
					sum(iznpor2) as iznpor2, sum(iznpor2val) as iznpor2val,
					sum(iznpor1) as iznpor1, sum(iznpor1val) as iznpor1val,
					porez1tb1z = sum(case when zr.portarifid = 7 then iznpor1 else 0 end), 
					porez1tb2z = sum(case when zr.portarifid = 8 then iznpor1 else 0 end), 
					porez1tb3z = sum(case when zr.portarifid = 9 then iznpor1 else 0 end), 
					porez1tb4z = sum(case when zr.portarifid = 10 then iznpor1 else 0 end), 
					porez1tb1valz = sum(case when zr.portarifid = 7 then iznpor1val else 0 end), 
					porez1tb2valz = sum(case when zr.portarifid = 8 then iznpor1val else 0 end), 
					porez1tb3valz = sum(case when zr.portarifid = 9 then iznpor1val else 0 end), 
					porez1tb4valz = sum(case when zr.portarifid = 10 then iznpor1val else 0 end), 
					neoporz = sum(case when zr.portarifid = 0 then prodiznosbez else 0 end), 
					osnovtb0z = sum(case when zr.portarifid = 6 then prodiznosbez else 0 end), 
					osnovtb1z = sum(case when zr.portarifid = 7 then prodiznosbez else 0 end), 
					osnovtb2z = sum(case when zr.portarifid = 8 then prodiznosbez else 0 end), 
					osnovtb3z = sum(case when zr.portarifid = 9 then prodiznosbez else 0 end), 
					osnovtb4z = sum(case when zr.portarifid = 10 then prodiznosbez else 0 end), 
					neoporvalz = sum(case when zr.portarifid = 0 then prodiznosbezval else 0 end), 
					osnovtb0valz = sum(case when zr.portarifid = 6 then prodiznosbezval else 0 end), 
					osnovtb1valz = sum(case when zr.portarifid = 7 then prodiznosbezval else 0 end), 
					osnovtb2valz = sum(case when zr.portarifid = 8 then prodiznosbezval else 0 end), 
					osnovtb3valz = sum(case when zr.portarifid = 9 then prodiznosbezval else 0 end), 
					osnovtb4valz = sum(case when zr.portarifid = 10 then prodiznosbezval else 0 end)
				from inserted 
					left outer join (select inserted.dokumid,  dbo.portarif.id as portarifid,

						trosarinaiznos = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.trosarina * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.trosarina * dbo.skladiste.kolicina)
								end,0)),2),
						trosarinaiznosval = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.trosarina * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2),
						prodiznosbez = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.prcijenabez * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.prcijenabez * dbo.skladiste.kolicina)
								end,0)),2),
						prodiznosbezval = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.prcijenabez * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2),
						zavisniiznos = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.cijena * dbo.zaliha.zavisni * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.cijena * dbo.zaliha.zavisni * 0.01 * dbo.skladiste.kolicina)
								end,0)),2),
						zavisniiznosval = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.cijena * dbo.zaliha.zavisni * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2),
						carinaiznos = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.cijena * dbo.zaliha.carina * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.cijena * dbo.zaliha.carina * 0.01 * dbo.skladiste.kolicina)
								end,0)),2),
						carinaiznosval = round(sum(isnull(case when dbo.zaliha.preractecaj = 0
								then (dbo.zaliha.cijena * dbo.zaliha.carina * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2),
						dobavaiznos = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.cijena * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.cijena * dbo.skladiste.kolicina)
								end,0)),2),
						dobavaiznosval = round(sum(isnull(case when dbo.zaliha.preractecaj = 0
								then (dbo.zaliha.cijena * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2),
						markupiznos = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.markup  * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.markup * dbo.skladiste.kolicina)
								end,0)),2),
						markupiznosval = round(sum(isnull(case when dbo.zaliha.preractecaj = 0
								then (dbo.zaliha.markup  * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2),
						iznpor4 = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.prcijenabez  * dbo.portarif.porez4 * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.prcijenabez  * dbo.portarif.porez4 * 0.01 * dbo.skladiste.kolicina)
								end,0)),2),
						iznpor4val = round(sum(isnull(case when dbo.zaliha.preractecaj = 0
								then (dbo.zaliha.prcijenabez  * dbo.portarif.porez4 * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2),
						iznpor3 = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.prcijenabez  * dbo.portarif.porez3 * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.prcijenabez  * dbo.portarif.porez3 * 0.01 * dbo.skladiste.kolicina)
								end,0)),2),
						iznpor3val = round(sum(isnull(case when dbo.zaliha.preractecaj = 0
								then (dbo.zaliha.prcijenabez  * dbo.portarif.porez3 * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2),
						iznpor2 = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.prcijenabez  * dbo.portarif.porez2 * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.prcijenabez  * dbo.portarif.porez2 * 0.01 * dbo.skladiste.kolicina)
								end,0)),2),
						iznpor2val = round(sum(isnull(case when dbo.zaliha.preractecaj = 0
								then (dbo.zaliha.prcijenabez  * dbo.portarif.porez2 * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2),
						iznpor1 = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.prcijenabez  * (1+(dbo.portarif.porez3 * 0.01)))
									* dbo.portarif.porez1 * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj
								else (dbo.zaliha.prcijenabez  * (1+(dbo.portarif.porez3 * 0.01)))
									* dbo.portarif.porez1 * 0.01 * dbo.skladiste.kolicina
								end,0)),2),
						iznpor1val = round(sum(isnull(case when dbo.zaliha.preractecaj = 0
								then (dbo.zaliha.prcijenabez  * (1+(dbo.portarif.porez3 * 0.01))) 
									* dbo.portarif.porez1 * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj
								end,0)),2)
					from    inserted
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
						inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
						inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid 
						inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid 
						inner join dbo.zaliha on dbo.skladiste.zalihaid = dbo.zaliha.id 
						inner join dbo.portarif on dbo.zaliha.portarifid = dbo.portarif.id
					group by  inserted.dokumid, dbo.portarif.id) 
					 zr on inserted.dokumid = zr.dokumid 
				group by inserted.dokumid) szz on inserted.dokumid = szz.dokumid
			where tbpec.pozicija between 1000 and 4300
				
			end	

			if exists (select * from inserted 
						inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid
						inner join dbo.pozicija with(nolock) on dbo.dokstavka.pozicija = dbo.pozicija.sifra
					 where pozicija.asovrstavrsta > 0)
			begin
			update 	tbpec  
				set iznos = isnull(case 

				when (pozicija between 1002 and 1024) then iznostb
				when ((pozicija between 1152 and 1172) or pozicija = 2010) then osnovicatb
				when  (pozicija between 1752 and 1774)  then porez1tb

				when (pozicija between 4152 and 4180) then  dobavaiznos + zavisniiznos + carinaiznos
				else 0 
				end,0),
				iznosval = isnull(case 

				when (pozicija between 1002 and 1024) then iznostbval
				when ((pozicija between 1152 and 1172) or pozicija = 2010) then osnovicatbval
				when (pozicija between 1752 and 1774) then porez1tbval

				when (pozicija between 4152 and4180) then  dobavaiznosval + zavisniiznosval + carinaiznosval
				else 0 
				end,0)
			from inserted 

				inner join @tbpec tbpec on inserted.dokumid = tbpec.dokumid
				inner join dbo.pozicija on tbpec.pozicija = dbo.pozicija.sifra 
				inner join  (select inserted.dokumid, dbo.asovrsta.vrsta,

						iznostb = sum(case when primjmp = 1 
						then round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 *  inserted.tecaj),2)
						else round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 *  inserted.tecaj),2)
						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez4 * 0.01) * kolicina2 *  inserted.tecaj),2)
						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2 *  inserted.tecaj),2)
						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez2 * 0.01) * kolicina2 *  inserted.tecaj),2)
						+ round((round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 * inserted.tecaj),2) + 
							round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2 *  inserted.tecaj),2))
							* (porez1 * 0.01),2)
						end),
						iznostbval = sum(case when primjmp = 1 
						then round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 * 1),2)
						else round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 * 1),2)
						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez4 * 0.01) * kolicina2),2)

						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2),2)
						+ round((fakcijena * (1- (fakpopust * 0.01)) * (porez2 * 0.01) * kolicina2),2)
						+ round((round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 ),2) + 
							round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2 ),2))
							* (porez1 * 0.01),2)
						end),
						osnovicatb = sum(case when primjmp = 0 
						then round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 *  inserted.tecaj),2)
						else  round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 *  inserted.tecaj),2)
						- (round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez3 * 0.01) *  inserted.tecaj * kolicina2 ),2)
						+ round((fakcijena * (1- (fakpopust * 0.01))  koef *  inserted.tecaj * kolicina2 ),2) +
							 round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez4 * 0.01) * 1 * kolicina2 ),2)
						+ round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez2 * 0.01) * 1 * kolicina2 ),2)
						+ round((round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez3 * 0.01) * 1 * kolicina2),2))
							* (porez1 * 0.01),2))
						end),
						porez1tb = sum(case when primjmp = 0 
						then round((round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 *  inserted.tecaj),2) + 
							round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2 *  inserted.tecaj),2))
							* (porez1 * 0.01),2)
						else round((round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez3 * 0.01) *  inserted.tecaj * kolicina2 ),2))
							* (porez1 * 0.01),2)
						end),
						porez1tbval = sum(case when primjmp = 0 
						then round((round((fakcijena * (1- (fakpopust * 0.01)) * kolicina2 * 1),2) + 
							round((fakcijena * (1- (fakpopust * 0.01)) * (porez3 * 0.01) * kolicina2 * 1),2))
							* (porez1 * 0.01),2)
						else round((round((fakcijena * (1- (fakpopust * 0.01))  koef * (porez3 * 0.01) * 1 * kolicina2),2))
							* (porez1 * 0.01),2)
						end)
					from    inserted
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
						inner join dbo.list on dbo.dokstart.listid = dbo.list.id 
						inner join dbo.cjenik on dbo.list.cjenik = dbo.cjenik.sifra 

						inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid 
						inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
						inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
						inner join dbo.portarif on dbo.evid.portarifid = dbo.portarif.id
					group by  inserted.dokumid, dbo.asovrsta.vrsta) 
					 ze on inserted.dokumid = ze.dokumid and dbo.pozicija.asovrstavrsta = ze.vrsta
				left outer join (select inserted.dokumid, dbo.asovrsta.vrsta,

						zavisniiznos = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.cijena * dbo.zaliha.zavisni * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.cijena * dbo.zaliha.zavisni * 0.01 * dbo.skladiste.kolicina)
								end,0)),2),
						zavisniiznosval = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.cijena * dbo.zaliha.zavisni * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2),
						carinaiznos = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.cijena * dbo.zaliha.carina * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.cijena * dbo.zaliha.carina * 0.01 * dbo.skladiste.kolicina)
								end,0)),2),
						carinaiznosval = round(sum(isnull(case when dbo.zaliha.preractecaj = 0
								then (dbo.zaliha.cijena * dbo.zaliha.carina * 0.01 * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2),
						dobavaiznos = round(sum(isnull(case when dbo.zaliha.preractecaj = 0 
								then (dbo.zaliha.cijena * dbo.skladiste.kolicina * dbo.zaliha.tecaj)
								else (dbo.zaliha.cijena * dbo.skladiste.kolicina)
								end,0)),2),
						dobavaiznosval = round(sum(isnull(case when dbo.zaliha.preractecaj = 0
								then (dbo.zaliha.cijena * dbo.skladiste.kolicina * dbo.zaliha.tecaj  inserted.tecaj)
								end,0)),2)
					from    inserted
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id

						inner join dbo.evid on dbo.dokstart.listid = dbo.evid.listid 
						inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid 
						inner join dbo.zaliha on dbo.skladiste.zalihaid = dbo.zaliha.id 
						inner join dbo.portarif on dbo.zaliha.portarifid = dbo.portarif.id
						inner join dbo.skladiste skladistezad on dbo.zaliha.skladisteid = skladistezad.id 
						inner join dbo.evid evidzad on skladistezad.evidid = evidzad.id
						inner join  dbo.asokatalog on evidzad.asokatalogid = dbo.asokatalog.id
						inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
					group by  inserted.dokumid, dbo.asovrsta.vrsta) 
					 zr on inserted.dokumid = zr.dokumid and dbo.pozicija.asovrstavrsta = zr.vrsta
			where pozicija.asovrstavrsta > 0
			end	
			

							inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
					where dokvrsta = 80)
			begin
				update tbpec
				set iznos = tbpecsum.iznos,
					iznosval = tbpecsum.iznosval
				from @tbpec tbpec
					inner join (select tbpec.dokumid, 
									iznos = sum(isnull(tbpec.iznos,0)),
									iznosval = sum(isnull(tbpec.iznosval,0)) 
								from @tbpec tbpec
									inner join dbo.dokstart on tbpec.dokumid = dbo.dokstart.id
									inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
									inner join dbo.pozicija on tbpec.pozicija = dbo.pozicija.sifra 
								where dokvrsta.sifra = 80 and pozicija.portarifid > 0 and pozicija.pdv = 1
								group by tbpec.dokumid)
						tbpecsum on tbpec.dokumid = tbpecsum.dokumid
				where tbpec.pozicija = 1920
			end

			update dbo.dokstavka  
			set iznos = tbpec.iznos, iznosval = tbpec.iznosval
			from @tbpec tbpec
				inner join dbo.dokstavka on tbpec.dokumid = dbo.dokstavka.dokumid 
							and tbpec.pozicija = dbo.dokstavka.pozicija
			where tbpec.pozicija = dbo.dokstavka.pozicija
				and dbo.dokstavka.iznos <> tbpec.iznos 

    		end

		if exists(select * from inserted
			inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid
		where dokstavka.pozicija = 1252)
		begin
		update dbo.dokstavka
		set iznos = isnull(dst.iznos,0),
			iznosval = isnull(dst.iznosval,0)
		from inserted
			inner join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
			inner join (select inserted.dokumid,
			round(sum((evid.fakcijena * (case when cjenik.primjmp = 0 
							then portarif.koef
							else 1 end)
				* evid.kolicina2 * (evidpopust.postotak * 0.01))  1),2) as iznosval

			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.list on dbo.dokstart.listid = dbo.list.id
				inner join dbo.cjenik on dbo.list.cjenik = dbo.cjenik.sifra
				inner join dbo.evid on dbo.list.id = dbo.evid.listid
				inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
				inner join dbo.asortiman on dbo.asokatalog.asortid = dbo.asortiman.id
				inner join dbo.portarif on dbo.asortiman.portarifid = dbo.portarif.id
				inner join dbo.evidpopust on dbo.evid.id = dbo.evidpopust.evidid
			where evidpopust.skalarpcp = 125 and evidpopust.postotak > 0
			group by inserted.dokumid) dst on inserted.dokumid = dst.dokumid
		where dbo.dokstavka.pozicija = 1252 
			and dbo.dokstavka.iznos <> dst.iznos 
		end

		if exists (select * from inserted 
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			where dokvrsta.financ = 1 and dokvrsta.sifra = 36)
		begin

		declare 	@fiznos money,
		 		@fosnpdv money,
		 		@fpdv money

			set @fiznos = isnull((select round(sum(iznoskamate),2) 
						from inserted 
							inner join dbo.kamateobstavka on inserted.dokumid = kamateobstavka.dokumid
						group by inserted.dokumid),0) 		

			set @fosnpdv =round(isnull((select osnovpdv  = sum(case 
					when intkamata>kamata and intkoristi = 1
					then cast(dbo.kamateobstavka.osnovica as float) * 
					cast((dbo.kamata.intkamata-dbo.kamata.kamata) as float) * 
					cast(dbo.kamateobstavka.period as float) 
					 cast(datediff(day, cast(year(dbo.kamata.pocetak) as nvarchar)
					, cast(year(dbo.kamata.pocetak) + 1as nvarchar)) as float) 
					 else 0 end)
				from 	  dbo.kamateobstavka inner join
	               			dbo.kamata on dbo.kamateobstavka.kamataid = dbo.kamata.id
				where	(dbo.kamata.intkoristi = 1)
				group by dbo.kamateobstavka.dokumid
				having      (dbo.kamateobstavka.dokumid = (select dokumid from inserted))),0),2)

			set @fpdv =round(	isnull((select     pdv =sum(case  
					when intkamata>kamata and intkoristi = 1
					then cast(dbo.kamateobstavka.osnovica as float) * 
					cast((dbo.kamata.intkamata-dbo.kamata.kamata) as float) * 
					cast(dbo.kamateobstavka.period as float)*cast((portarif.koef-1) as float) 
					 cast(datediff(day, cast(year(dbo.kamata.pocetak) as nvarchar)
					, cast(year(dbo.kamata.pocetak) + 1 as nvarchar)) as float) 
					 else 0 end)
				from 	  dbo.kamateobstavka inner join
					dbo.kamata on dbo.kamateobstavka.kamataid = dbo.kamata.id inner join
					dbo.portarif on portarif.id=kamata.portarifid
				where	(dbo.kamata.intkoristi = 1)
				group by dbo.kamateobstavka.dokumid
				having      (dbo.kamateobstavka.dokumid = (select dokumid from inserted))),0),2)
		
		if @fpdv <> 0 and (select count(*) from dbo.dokstavka with(nolock) where dokumid = (select dokumid from inserted)
					and pozicija = 1400 ) = 0
		begin
		raiserror 44445 '

		interests include vat!
		delete accounting stamp and 
		change acounting schema !
		origin: dokum_utrig'
		rollback transaction
		end     	

					update dbo.dokstavka 
					set iznos = case 
						when dokstavka.pozicija = 1000 
						then isnull(round(cast(@fiznos+@fpdv as money),2),0)
						when dokstavka.pozicija = 1150
						then isnull(round(cast(@fiznos as money),2),0)
						when dokstavka.pozicija = 1600
						then isnull(round(cast(@fpdv as money),2),0)
						when dokstavka.pozicija = 1400
						then isnull(round(cast(@fosnpdv as money),2),0)
						else 0
						end,
							iznosval = case 
						when dokstavka.pozicija = 1000 
						then isnull(round(cast(@fiznos+@fpdv as money),2),0)
						when dokstavka.pozicija = 1150
						then isnull(round(cast(@fiznos as money),2),0)
						when dokstavka.pozicija = 1600
						then isnull(round(cast(@fpdv as money),2),0)
						when dokstavka.pozicija = 1400
						then isnull(round(cast(@fosnpdv as money),2),0)
						else 0
						end
					from dbo.dokstavka 
						inner join inserted on dbo.dokstavka.dokumid = inserted.dokumid
		end

		if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid
			 where dokvrsta.financ = 1 and dokvrsta.vrsta = 2 and (dokvrsta.sifra = 199 or dokvrsta.sifra = 198))
		begin			

			if exists (select * from inserted
					inner join dbo.analitika with(nolock) on inserted.analitika1id=dbo.analitika.id 
					inner join dbo.kredit with(nolock) on dbo.analitika.vezaid=dbo.kredit.id
					where inserted.valkod<>kredit.valkod) 
			begin
			raiserror 44445 '

		there is differnce between loan contract currency
		and credit currency in basic data!
		origin: dokum_utrig'
        			rollback transaction
			end
				update dbo.dokstavka 
				set iznos=sumaanuiteta * tecaj, iznosval=sumaanuiteta
				from dbo.dokstavka
				inner join (select inserted.dokumid as dokumid, isnull(round(sum(iznosanuitet),2),0) as sumaanuiteta ,inserted.tecaj
							from inserted
							inner join dbo.kamateobstavka on inserted.dokumid=dbo.kamateobstavka.dokumid
							group by inserted.dokumid, inserted.tecaj)
							ktos on dbo.dokstavka.dokumid = ktos.dokumid
							where dokstavka.dokumid = (select dokumid from inserted)
							and dokstavka.pozicija=1000
		end					

		

		if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.list with(nolock) on dbo.dokstart.listid = dbo.list.id
				inner join dbo.listnad with(nolock) on dbo.list.listnad1id = dbo.listnad.id 
				inner join dbo.dokstart ugovororig with(nolock) on dbo.listnad.vezaid = ugovororig.id 
			where dbo.dokstart.dokvrsta in (25, 88) and ugovororig.dokvrsta in (198, 199))
		begin

			if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid 
			where dokvrsta.financ = 1 and dokvrsta.vrsta = 1 and dokvrsta.sifra = 25)
			begin

				if exists (select * from dbo.dokum inserted
							inner join dbo.dokstart with(nolock) on inserted.dokumid=dbo.dokstart.id 
							inner join dbo.list with(nolock) on dbo.dokstart.listid=dbo.list.id
							inner join dbo.listnad with(nolock) on dbo.list.listnad1id=dbo.listnad.id and dbo.listnad.skupdogadjaj=6
							inner join dbo.dokum ugovor with(nolock) on dbo.listnad.vezaid=ugovor.dokumid
							where inserted.valkod<>ugovor.valkod)
				begin
				raiserror 44445 '
		
	there is differnce between currency in
	loan liabilities - outcome
	and currency in loan contract!
	origin: dokum_utrig'
        			rollback transaction

				end
				update dokstavka 
				set iznos =  iznoskamate * tecaj, iznosval =  iznoskamate
				from dbo.dokstavka 
					inner join (select inserted.dokumid, isnull(round(dbo.kamateobstavka.iznoskamate,2),0) as iznoskamate, inserted.tecaj
							from  inserted 
							inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id 
							inner join dbo.list with(nolock) on dbo.dokstart.listid = dbo.list.id 
							inner join dbo.listnad with(nolock) on dbo.list.listnad1id = dbo.listnad.id 
							inner join dbo.dokum ugovororig with(nolock) on dbo.listnad.vezaid = ugovororig.dokumid and dbo.listnad.skupdogadjaj=6  
							inner join dbo.kamateobstavka with(nolock) on ugovororig.dokumid = dbo.kamateobstavka.dokumid 
						where (dateadd(day, dbo.kamateobstavka.period, ugovororig.datum) =inserted.datum))
					ktos on dbo.dokstavka.dokumid = ktos.dokumid
				where dokstavka.dokumid = (select dokumid from inserted) and dokstavka.pozicija=2701

				update dbo.dokstavka 
				set iznos = iznosanuitet * tecaj, iznosval = iznosanuitet
				from dbo.dokstavka 
					inner join (select   inserted.dokumid,
									 isnull(round(dbo.kamateobstavka.iznosanuitet,2),0) as iznosanuitet,
									 inserted.tecaj
									
					from inserted 
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id 
						inner join dbo.list on dbo.dokstart.listid = dbo.list.id 
						inner join dbo.listnad on dbo.list.listnad1id = dbo.listnad.id 
						inner join dbo.dokum ugovororig on dbo.listnad.vezaid = ugovororig.dokumid and dbo.listnad.skupdogadjaj=6
						inner join dbo.kamateobstavka on ugovororig.dokumid = dbo.kamateobstavka.dokumid
					where(dateadd(day, dbo.kamateobstavka.period, ugovororig.datum) =inserted.datum)) 
				ktos on dbo.dokstavka.dokumid = ktos.dokumid 
				where dokstavka.dokumid = (select dokumid from inserted) and dokstavka.pozicija=2702		
			end
		

			if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid
			where dokvrsta.financ = 1 and dokvrsta.vrsta = 1 and dokvrsta.sifra = 88)

			begin   

				if exists (select * from inserted  
							inner join dbo.dokstart with(nolock) on inserted.dokumid=dbo.dokstart.id 
							inner join dbo.list with(nolock) on dbo.dokstart.listid=dbo.list.id
							inner join dbo.listnad with(nolock) on dbo.list.listnad1id=dbo.listnad.id
							inner join dbo.dokum ugovor with(nolock) on dbo.listnad.vezaid=ugovor.dokumid and dbo.listnad.skupdogadjaj=7
							where inserted.valkod<>ugovor.valkod)
				begin
				raiserror 44445 '
		
	there is differnce between currency in
	loan liabilities - outcome
	and currency in loan contract!
	origin: dokum_utrig'
        			rollback transaction
				end

				if exists (select *	from inserted 
								inner join dbo.dokstavka with(nolock) on inserted.dokumid=dbo.dokstavka.dokumid 	
							where dokstavka.pozicija = 2701) 
				begin
						update dokstavka 
						set iznos = case when dokstavka.pozicija=1400 then  round(cast(osnovica * tecaj as smallmoney),2)	
								when dokstavka.pozicija=2701 then  round(cast(osnovica * tecaj as smallmoney),2)	
								when dokstavka.pozicija=1600 then  round(cast((iznspdv - osnovica) * tecaj as smallmoney),2)
								when dokstavka.pozicija=1000 then  round(cast(iznspdv * tecaj as smallmoney),2)
								else 0 end, 
							iznosval = case when dokstavka.pozicija=1400 then  round(cast(osnovica as smallmoney),2)	
								when dokstavka.pozicija=2701 then  round(cast(osnovica as smallmoney),2)	
								when dokstavka.pozicija=1600 then  round(cast(iznspdv - osnovica as smallmoney),2)
								when dokstavka.pozicija=1000 then  round(cast(iznspdv  as smallmoney),2)
								else 0 end 
						from dbo.dokstavka 
							inner join (select inserted.dokumid, 
										dbo.kamateobstavka.iznoskamate * isnull(dbo.portarif.koef,1) as iznspdv,
										dbo.kamateobstavka.iznoskamate as osnovica, inserted.tecaj	
									from inserted 
										inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
										inner join dbo.list on dbo.dokstart.listid = dbo.list.id
										inner join dbo.listnad on dbo.list.listnad1id = dbo.listnad.id 
										inner join dbo.dokum ugovororig on dbo.listnad.vezaid = ugovororig.dokumid and dbo.listnad.skupdogadjaj=7
										inner join dbo.kamateobstavka on ugovororig.dokumid = dbo.kamateobstavka.dokumid
										inner join dbo.kamata on dbo.kamateobstavka.kamataid = dbo.kamata.id 
										left outer join dbo.portarif on dbo.kamata.portarifid = dbo.portarif.id
									where     (dateadd(day, dbo.kamateobstavka.period, ugovororig.datum) =inserted.datum)
										and dokstart.dokvrsta = 88 and inserted.dokumid in (select inserted.dokumid from inserted 
																	inner join dbo.dokstavka on inserted.dokumid=dbo.dokstavka.dokumid 	
																where dokstavka.pozicija = 2701)) 
								ktos on dbo.dokstavka.dokumid = ktos.dokumid 
					end				
					else
						update dbo.dokstavka 
						set iznos = iznosanuitet * tecaj, iznosval = iznosanuitet
						from dbo.dokstavka 
							inner join (select inserted.dokumid, round(dbo.kamateobstavka.iznosanuitet,2) as iznosanuitet, 
										inserted.tecaj
								from inserted 
									inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id 
									inner join dbo.list on dbo.dokstart.listid = dbo.list.id 
									inner join dbo.listnad on dbo.list.listnad1id = dbo.listnad.id and dbo.listnad.skupdogadjaj=7
									inner join dbo.dokum ugovororig on dbo.listnad.vezaid = ugovororig.dokumid 
									inner join dbo.kamateobstavka on ugovororig.dokumid = dbo.kamateobstavka.dokumid
								where     (dateadd(day, dbo.kamateobstavka.period, ugovororig.datum) =inserted.datum)
									and dokstart.dokvrsta = 88) 
							ktos on dbo.dokstavka.dokumid = ktos.dokumid
						where dokstavka.pozicija = 2702 

			end
		end
	end

	if exists (
			select *
			from inserted i
				inner join dbo.dokstavka dst with(nolock) on i.dokumid = dst.dokumid
				inner join dbo.dokshemarasp dsr with(nolock) on dst.protuid = dsr.dokshemaid
		)
	begin
			update dbo.dokstavka
			set iznos = isnull(round(dokstavka_1.iznos * dokshemarasp.posto * 0.01,2),0),
				iznosval = isnull(round(dokstavka_1.iznosval * dokshemarasp.posto * 0.01,2),0)
			from 	inserted
				inner join dbo.dokstavka on  inserted.dokumid = dbo.dokstavka.dokumid 
				inner join dbo.dokshemarasp on dbo.dokstavka.protuid = dbo.dokshemarasp.id
				inner join dbo.dokstavka dokstavka_1 on dbo.dokshemarasp.dokshemaid = dokstavka_1.protuid
					and inserted.dokumid = dokstavka_1.dokumid
			where dokstavka_1.ks = 0 and dokstavka_1.iznos <> 0 
				and dbo.dokstavka.iznos = 0 
				and dbo.dokshemarasp.posto > 0
	end

		if exists (
				select *
				from inserted i
					inner join dbo.dokstart ds with(nolock) on i.dokumid = ds.id
					left outer join dbo.evid e with(nolock) on ds.listid = e.listid
				where e.listid is null
			)
		begin	

			update dbo.dokstavka
			set iznos = isnull(case 
					when op.pdv = 1 and op.izn <> 0 
					then  round(izn * (koef -1),2) 
					when op.osnpdv = 1 and op.izn <> 0 
					then  round(izn  (koef -1),2) 
					else dbo.dokstavka.iznos 
					end,0)
			from inserted
				inner join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
				inner join (select  dokstavka.id, pozicija.osnpdv, pozicija.pdv,
						dokstavka_1.iznos as izn, koef
					from inserted
						inner join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
						inner join dbo.pozicija on dbo.dokstavka.pozicija = dbo.pozicija.sifra 
						inner join dbo.portarif on dbo.pozicija.portarifid = dbo.portarif.id 
						inner join dbo.pozicija pozicija_1 on dbo.portarif.id = pozicija_1.portarifid 
							and pozicija.sifra <> pozicija_1.sifra
						inner join dbo.dokstavka dokstavka_1 on inserted.dokumid = dokstavka_1.dokumid 
							and pozicija_1.sifra = dokstavka_1.pozicija
					where (dbo.pozicija.osnpdv = 1 or pozicija.pdv = 1)
						and dbo.dokstavka.iznos = 0
						and inserted.pdvstatus not in (0, 1,11,12) 
						and inserted.tecaj = 1) 
					op on dbo.dokstavka.id = op.id		end

	if exists (select * from inserted
			inner join dbo.dokstavka with(nolock) on inserted.dokumid = dbo.dokstavka.dokumid 
		 where dokstavka.pozicija = 9999) 
	begin

		update dbo.dokstavka 
		set 	iznos = optem.iznos,
			 iznosval = optem.iznosval
		from dbo.dokstavka 
			inner join (select inserted.dokumid, 
						isnull(sum(dokstavka.iznos),0) as iznos, 
						isnull(sum(dokstavka.iznosval),0) as iznosval,
						dokstavka.dp
					from inserted
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
						inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
						inner join dbo.dokstavka on inserted.dokumid = dbo.dokstavka.dokumid
					 where dokvrsta.financ = 1  and dokvrsta.sifra <> 100
						and (dokstavka.pozicija > 9999 or dokstavka.pozicija < 9999)
						and (dokstavka.ks = 1 or dokvrsta.vrsta >= 101) 
					group by inserted.dokumid, dokstavka.dp) optem 
			on dbo.dokstavka.dokumid = optem.dokumid
		where dbo.dokstavka.pozicija = 9999 
			and dbo.dokstavka.dp <> optem.dp and dbo.dokstavka.ks = 0

		update dbo.dokstavka 
		set 	iznos = atem.iznos,
			 iznosval = atem.iznosval
		from dbo.dokstavka 
			inner join (select inserted.dokumid, 
						isnull(sum(dokstavka.iznos),0) as iznos, 
						isnull(sum(dokstavka.iznosval),0) as iznosval,
						dokstavka.dp
					from inserted
						inner join dbo.dokpoprat on dbo.dokpoprat.dokumid = inserted.dokumid
						inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
						inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
						inner join dbo.dokstavka on dokpoprat.dokpopratid = dbo.dokstavka.dokumid
					 where dokvrsta.financ = 1 and dokvrsta.vrsta = 9 and dokvrsta.sifra = 100
						and dbo.dokstavka.ks = 1
					group by inserted.dokumid, dokstavka.dp) atem 
			on dbo.dokstavka.dokumid = atem.dokumid
		where dbo.dokstavka.pozicija = 9999 
			and dbo.dokstavka.dp <> atem.dp and dbo.dokstavka.ks = 0
	end

		update dbo.dokstavka
		set iznosval = isnull(case 

				when inserted.tecaj = 1 and (iznos > 0 or iznos <0) 
				then round(iznos,2)
				when inserted.tecaj not in (-1,1) and (iznos > 0 or iznos <0) 
				then round(iznos update pnbz ako je dokvrsta.pozivbr = 1 
		if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			 where dbo.dokvrsta.pozivbr = 1)
		begin
			update dbo.dokpozivbr set
				modulpnb = dbo.pnb.model,
				pnb = dbo.nvpozivnabroj(inserted.dokumid,1)	
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.dokvk on dbo.dokstart.vk = dbo.dokvk.sifra
				inner join dbo.placanjeset on dbo.dokvk.placanjeset = dbo.placanjeset.sifra
				inner join dbo.pnb on dbo.placanjeset.sifra = dbo.pnb.placanjeset
				inner join dbo.dokpozivbr on inserted.dokumid = dbo.dokpozivbr.dokumid
			where dbo.dokpozivbr.pozivbrvrsta = 1 and dbo.dokvrsta.pozivbr = 1 
				and dbo.pnb.pozivbrvrsta = 1 and pnb.racunid is null
		
			insert into dokpozivbr (dokumid, modulpnb, pnb, pozivbrvrsta)
			select inserted.dokumid, dbo.pnb.model, [dbo].[nvpozivnabroj] (inserted.dokumid,1), 1
			from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.dokvk on dbo.dokstart.vk = dbo.dokvk.sifra
				inner join dbo.placanjeset on dbo.dokvk.placanjeset = dbo.placanjeset.sifra
				inner join dbo.pnb on dbo.placanjeset.sifra = dbo.pnb.placanjeset
				left outer join dbo.dokpozivbr on inserted.dokumid = dbo.dokpozivbr.dokumid 
								and dbo.dokpozivbr.pozivbrvrsta = 1
			where dbo.dokvrsta.pozivbr = 1 and dbo.pnb.pozivbrvrsta = 1 and dbo.pnb.racunid is null
				and dbo.dokpozivbr.dokumid is null
		end

end