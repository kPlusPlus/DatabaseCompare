create   trigger [dbo].[evidpad_iutrig] on [dbo].[evidpad] 
for  insert, update
not for replication
as
set nocount on

if exists (select * from inserted )
begin

	begin
		raiserror 44445 n'300526
	
	barcode missing or checked 
	quantity exceeded item quantity.		
	origin: evidpad_iutrig 
	'
		rollback transaction
	end

	if exists (select * from inserted 
		where len(rtrim(isnull(inserted.barcodeaso,''))+ rtrim(isnull(inserted.barcodebach,''))) > 3)
	begin

		if exists (select * from inserted
					inner join dbo.evid with(nolock) on inserted.evidid = dbo.evid.id
					inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id
				where len(asokatalog.barcode) < 3)
		begin
			update dbo.asokatalog
			set barcode = rtrim(inserted.barcodeaso)
			from inserted
				inner join dbo.evid on inserted.evidid = dbo.evid.id
				inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
			where len(rtrim(isnull(asokatalog.barcode,''))) < 3 
				and len(rtrim(isnull(inserted.barcodeaso,''))) > 3
		end

		if exists (select * from inserted
			inner join dbo.evid with(nolock) on inserted.evidid = dbo.evid.id
			inner join dbo.dokstart with(nolock) on dbo.evid.listid = dbo.dokstart.listid
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
			inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id
			left outer join dbo.dokpozivbr with(nolock) on dbo.dokstart.id = dbo.dokpozivbr.dokumid
						and dbo.dokpozivbr.pozivbrvrsta = 1
		where dokvrsta.bck = 1 
		  and len(rtrim(inserted.barcodeaso)) > 3 
		  and len(rtrim(asokatalog.barcode)) > 3 
		  and rtrim(isnull(asokatalog.barcode,'')) <> rtrim(isnull(inserted.barcodeaso,''))
		  and rtrim(isnull(dokpozivbr.pnb,'')) <> rtrim(isnull(inserted.barcodeaso,''))) 
		begin
			raiserror 44445 n'300524
		
		the control barcode is wrong !!!
		origin: evidpad_iutrig 
		'
			rollback transaction
		end

		if exists (select * from inserted 
					inner join dbo.evid with(nolock) on inserted.evidid = dbo.evid.id
					inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id	
					inner join dbo.dokstart with(nolock) on dbo.evid.listid = dbo.dokstart.listid
					inner join dbo.dokvrsta with (nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 		
				where dokvrsta.bck = 1 and len(rtrim(isnull(inserted.barcodebach,''))) > 3 
					and dokvrsta.serbr = 0 and asokatalog.sb = 1)  
		begin

			update dbo.evid
			set zalihaid = zo.zalihaid
			from inserted
				inner join dbo.evid on inserted.evidid = dbo.evid.id
				inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id	
				inner join dbo.dokstart on dbo.evid.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join (select inserted.evidid,
								min(zaliha.id) as zalihaid

							from inserted
								inner join dbo.evid on inserted.evidid = dbo.evid.id
								inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
								inner join dbo.dokstart on dbo.evid.listid = dbo.dokstart.listid
								inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
								inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 	
								inner join dbo.zaliha on dbo.asokatalog.asortid = dbo.zaliha.asortid 
								inner join dbo.zalihadod on dbo.zaliha.id = dbo.zalihadod.zalihaid
								inner join (select zalihaid
											from dbo.skladiste
											where zalihaid > 0
											group by asortid, zalihaid
											having sum(kolicina * vrsta) > 0)
									zs on dbo.zaliha.id = zs.zalihaid 
							where dokvrsta.bck = 1
								  and dokvrsta.serbr = 0 and asokatalog.sb = 1  
								  and dokvrsta.sklad = 1
								  and dokvrsta.zaliha = 0
								  and evid.zalihaid is null
								  and len(rtrim(inserted.barcodebach)) > 3
								  and rtrim(inserted.barcodebach) = rtrim(zalihadod.bach)
								  and (case when dokvrsta.evidanalitvrsta = dokvrsta.analitika2vrsta
											and inserted.analitikaid > 0
										then inserted.analitikaid
										else dokum.analitika2id
										end) = zaliha.analitsklid
							group by inserted.evidid) 
					zo on inserted.evidid = zo.evidid
			where dokvrsta.bck = 1
			  and dokvrsta.serbr = 0 and asokatalog.sb = 1  

			  and dokvrsta.sklad = 1
			  and dokvrsta.zaliha = 0
			  and evid.zalihaid is null
			  and len(rtrim(inserted.barcodebach)) > 3 

			if exists (select * from inserted
				inner join dbo.evid with(nolock) on inserted.evidid = dbo.evid.id
				inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id	
				inner join dbo.dokstart with(nolock) on dbo.evid.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.skladiste with(nolock) on dbo.evid.id = dbo.skladiste.evidid
				inner join dbo.zaliha with(nolock) on dbo.skladiste.zalihaid = dbo.zaliha.id
				inner join dbo.zalihadod with(nolock) on dbo.zaliha.id = dbo.zalihadod.zalihaid
			where dokvrsta.bck = 1 and dokvrsta.sklad = 1
			  and dokvrsta.serbr = 0 and asokatalog.sb = 1  
			  and len(rtrim(inserted.barcodebach)) > 3 
			  and len(rtrim(zalihadod.bach)) > 3
			  and rtrim(isnull(zalihadod.bach,'')) <> rtrim(isnull(inserted.barcodebach,'')))
			begin
				raiserror 44445 n'300525
			
			the control barcode for bach (lot)
			is diferent from bach (lot)!!!
			origin: evidpad_iutrig 
			'
        				rollback transaction
			end

			insert dbo.zalihadod (zalihaid, bach)
			select zaliha.id,
				bach = rtrim(inserted.barcodebach)
			from inserted
				inner join dbo.evid with(nolock) on inserted.evidid = dbo.evid.id
				inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id
				inner join dbo.dokstart with(nolock) on dbo.evid.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.skladiste with(nolock) on dbo.evid.id = dbo.skladiste.evidid
				inner join dbo.zaliha with(nolock) on dbo.skladiste.id = dbo.zaliha.skladisteid
				left outer join dbo.zalihadod with(nolock) on dbo.zaliha.id = dbo.zalihadod.zalihaid
			where dokvrsta.bck = 1 and dokvrsta.zaliha = 1
				and dokvrsta.serbr = 0 and asokatalog.sb = 1  
				and zalihadod.zalihaid is null
				and len(rtrim(inserted.barcodebach)) > 3 

			update dbo.zalihadod
			set bach = rtrim(inserted.barcodebach)
			from inserted
				inner join dbo.evid on inserted.evidid = dbo.evid.id
				inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
				inner join dbo.dokstart on dbo.evid.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
				inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
				inner join dbo.zaliha on dbo.skladiste.id = dbo.zaliha.skladisteid
				inner join dbo.zalihadod on dbo.zaliha.id = dbo.zalihadod.zalihaid
			where dokvrsta.bck = 1 and dokvrsta.zaliha = 1 
				and dokvrsta.serbr = 0 and asokatalog.sb = 1  
				and len(rtrim(inserted.barcodebach)) > 3 
				and len(rtrim(isnull(zalihadod.bach,''))) < 1
		end

		if exists (select * from inserted 
					inner join dbo.evid  with(nolock) on inserted.evidid = dbo.evid.id
					inner join dbo.asokatalog  with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id	
					inner join dbo.dokstart  with(nolock) on dbo.evid.listid = dbo.dokstart.listid
					inner join dbo.dokvrsta  with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 		
					inner join dbo.dokstart dokstartsb with(nolock) on dbo.evid.listid = dokstartsb.listid
					inner join dbo.dokvrsta dokvrstasb with(nolock) on dokstartsb.dokvrsta = dokvrstasb.sifra					
				where dokvrstasb.bck = 1 and len(rtrim(isnull(inserted.barcodebach,''))) > 3 
					and abs(evid.kolicina2) = abs(inserted.kolicina) 
					and dokvrsta.sklad = 1
					and dokvrstasb.serbr = 1 and asokatalog.sb = 1)  
		begin

			insert into [dbo].[zalserbr] (zalihaid, serija, broj, evidid, napomena)
			select zaliha.id, null, rtrim(inserted.barcodebach), inserted.evidid, null
			from inserted 
				inner join deleted on inserted.evidid = deleted.evidid
				inner join dbo.evid on inserted.evidid = dbo.evid.id
				inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id	
				inner join dbo.dokstart on dbo.evid.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.skladiste on dbo.evid.id = dbo.skladiste.evidid
				inner join dbo.zaliha on dbo.skladiste.id = dbo.zaliha.skladisteid
			where rtrim(isnull(inserted.barcodebach,'')) <> rtrim(isnull(deleted.barcodebach,''))
				and abs(evid.kolicina2) = abs(inserted.kolicina) 
				and dokvrsta.bck = 1 and len(rtrim(isnull(inserted.barcodebach,''))) > 3 
				and dokvrsta.serbr = 1 and asokatalog.sb = 1
				and dokvrsta.sklad = 1 and dokvrsta.zaliha = 1

			update dbo.zalserbr
			set evidid = evid.id
			from inserted 
				inner join deleted on inserted.evidid = deleted.evidid
				inner join dbo.evid on inserted.evidid = dbo.evid.id
				inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id	
				inner join dbo.dokstart dokstartsb on dbo.evid.listid = dokstartsb.listid
				inner join dbo.dokvrsta dokvrstasb on dokstartsb.dokvrsta = dokvrstasb.sifra
				inner join dbo.dokstart on dbo.evid.listid = dbo.dokstart.listid
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra

				inner join ( 
						select zsb.id, z.asortid, zsb.broj
						from dbo.zaliha z
							inner join dbo.zalserbr zsb on zsb.zalihaid = zsb.zalihaid
							inner join dbo.skladiste s on z.skladisteid = s.id
						where zsb.evidid = s.evidid	
					) zsb on dbo.asokatalog.asortid = zsb.asortid and inserted.barcodebach = zsb.broj
			where 
				rtrim(isnull(inserted.barcodebach,'')) <> rtrim(isnull(deleted.barcodebach,''))

				and abs(evid.kolicina2) = abs(inserted.kolicina) 
				and dokvrstasb.bck = 1 and len(rtrim(isnull(inserted.barcodebach,''))) > 3 
				and dokvrstasb.serbr = 1 and asokatalog.sb = 1
				and dokvrsta.sklad = 1 and dokvrsta.zaliha = 0
				and dbo.zalserbr.id = zsb.id

			if exists (select * from inserted 
							inner join dbo.evid with(nolock) on inserted.evidid = dbo.evid.id
							inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id	
							inner join dbo.dokstart with(nolock) on dbo.evid.listid = dbo.dokstart.listid
							inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
							inner join dbo.skladiste with(nolock) on dbo.evid.id = dbo.skladiste.evidid
							inner join dbo.zaliha with(nolock) on dbo.skladiste.id = dbo.zaliha.skladisteid
							inner join dbo.zalserbr with(nolock) on dbo.zaliha.id = dbo.zalserbr.zalihaid
						where dokvrsta.bck = 1 and len(rtrim(isnull(inserted.barcodebach,''))) > 3 
							and dokvrsta.serbr = 1 and asokatalog.sb = 1
							and dokvrsta.sklad = 1 and dokvrsta.zaliha = 1
						group by zalserbr.zalihaid
						having count(zalserbr.id) > max(evid.kolicina2))
			begin
				raiserror 44445 n'
			
			there is more serial numbers then qty!!!
			origin: evidpad_iutrig 
			'
        		rollback transaction
			end

		end

		insert into dbo.izmj (tabela, polje, slog, prije, poslije, dokumid, izmjvrsta)
		select 	n'evidpad', 
			n'datum kontrole' as polje, 
			inserted.evidid as slog, 
			n'' as prije,  
			n'' as poslije,  
			dokstart.id, 
			izmjvrsta.sifra  
		from inserted
			inner join deleted on inserted.evidid = deleted.evidid
			inner join dbo.evid on inserted.evidid = dbo.evid.id
			inner join dbo.dokstart on dbo.evid.listid = dbo.dokstart.listid
			cross join dbo.izmjvrsta
		where izmjvrsta.sifra = 50 and izmjvrsta.koristi = 1 

			and len(rtrim(isnull(inserted.barcodeaso,''))+ rtrim(isnull(inserted.barcodebach,''))) > 3 
			and len(rtrim(isnull(deleted.barcodeaso,''))+ rtrim(isnull(deleted.barcodebach,''))) < 2 
	end
end