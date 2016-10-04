
e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	

e when @btAnalitika3 = 1 and @inAna3ID is null then ParNad else @inAna3ID end
	from #tbDD tbDD 

	drop table #tbDD

	create table #tbDG ( 
		Grace smallint null	
	)

	insert into #tbDG
	eetchDocumentGrace @inDokPredmetID, @inListNadID

	select top 1 
		@siGrace = isnull(Grace, 0)
	from #tbDG

	drop table #tbDG

	insert dbo.Dokum (
		[DokumID]
		,[Analitika1ID]
		,[AdresaID]
		,[Analitika2ID]
		,[Analitika3ID]
		,[PDVStatus]
		,[Datum]

		,[DatumPI]

		,[Odgoda]

		,[ValKod]
		,[Tecaj]
	 )
	select
		@inDokPredmetID
		,@inAna1ID
		,@inAdresaID
		,@inAna2ID
		,@inAna3ID
		,vk.PDVStatus
		,@sdDatum

		,@sdDatum

		,@siGrace

		,@siValKod
		,@nuTecaj
	from dbo.DokVK vk 
	where vk.Sifra = @siVK

	update dbo.Dokum set
		KampanjaID = KampanjaID
	where DokumID = @inDokPredmetID

	update dbo.DokStart set
		Broj = Broj.Broj,
		Azuriranje = 1,
		Kontrola = 1
	from dbo.DokStart,
	(
		select dbo.ncAutoGenDocirmaID) Broj
	) Broj
	where ID = @inDokPredmetID

	commit tran
	set xact_abort off

	select @inDokPredmetID DokumID
end
else
	raiserror(N'
	
Documents are incompatible for same folder.

Origin: spIntInsertDocFolder
',16,1)
	
