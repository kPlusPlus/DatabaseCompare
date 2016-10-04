
opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 

opyDoc] 
@inDokumID int ,
@tiDokVrstaPaste tinyint = NULL, 
@siDokVKPaste smallint = NULL, 
@sdDatePaste smalldatetime = NULL, 
@moFacDiv money = 1, 
@nuTecaj numeric(19, 12) 

AS

SET XACT_ABORT ON
BEGIN TRANSACTION 

	DECLARE @inHostID int
	DECLARE @siGodina smallint
	DEirmaID int
	DECLARE @inAnalitika0ID int
	DECLARE @inAnalitika1ID int
	DEID int
	DECLARE @inAnalitika3ID int
	DECLARE @tiPDVStatus tinyint
	DECLARE @siVK smallint
	DE)
	DECLARE @inNoviListID int
	DECLARE @inNoviDokumID int
	DECLARE @inSkupDog1 int
	DE int
	DEjenik smallint
	DE0)
	declare @siValKod smallint
	declare @siValKodFirma smallint 
	declare @nuTecajSrc numeric(19, 12) 

	

	declare @CopyDokVrstaVrsta tinyint
	declare @PasteDokVrstaVrsta tinyint

	Select @CopyDokVrstaVrsta = DokVrsta.Vrsta
	from dbo.DokStart
	inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
	where dbo.DokStart.ID=@inDokumID

	if @tiDokVrstaPaste=0 or @tiDokVrstaPaste is null Select @tiDokVrstaPaste =DokVrsta FROM dbo.DokStart WHERE DokStart.ID = @inDokumID 

	
	if @sdDatePaste is null Select @sdDatePaste=GETDATE() 
	

	SELECT TOP 1 @inHostID = ID
	GHost
	WHERE Name = HOST_NAME()

	SELECT @siGodina=YEAR(@sdDatePaste)	

	SELEirmaID
	FROM dbo.DokStart
	WHERE ID = @inDokumID

	SELECT TOP 1 @inAnalitika0ID = ID
	FROM dbo.Analitika
	WHERE AnalitikaVrsta = 0

	SELECT 
		@inAnalitika1ID = Analitika1ID,
		@inAnalitikaID,
		@inAnalitika3ID = Analitika3ID,
		@siValKod = ValKod, 
		@nuTecajSrc = Tecaj
	FROM dbo.Dokum
	WHERE DokumID = @inDokumID

	select top 1 @siValKodirmaID
	if (@siValKodirma <> @siValKod and @nuTecaj = 1) or @nuTecaj = 0
	begin
		RAISERROR 44445 '
	
	change rate of the target document.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	end
	
	

	SELECT @inSkupDog1 = dbo.List.ListNadID,
		@inSkupDog2 = dbo.List.ListNad1ID,
		@sijenik
	FROM dbo.DokStart
		INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.DokStart.ID = @inDokumID

	IROM dbo.DokStart
		WHERE dbo.DokStart.ID = @inDokumID and (azuriranje=1 or kontrola=1) ) 
	BEGIN
	RAISERROR 44445 '
	
	Original document did not pass control!.
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
	END 
	ELSE
	BEGIN

		SELEASE WHEN @siDokVKPaste > 0 THEN @siDokVKPaste ELSE VK END
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		SELEASE WHEN @siDokVKPaste > 0 
					THEN DokVK.PDVStatus 
					ELSE (SELEROM dbo.Dokum WHERE DokumID = @inDokumID)
					END
		FROM dbo.DokVK
		WHERE DokVK.Sifra = @siVK

		SELEirmaID)

		SELECT @ncIzvornik = Izvornik 
		FROM dbo.DokStart
		WHERE DokStart.ID = @inDokumID

		if @siCjenik > 0 
		begin 
		INSERT INTO dbo.List 
			(ListNadID, ListNad1ID, Cjenik)
			VALUES (@inSkupDog1, @inSkupDogjenik)
		SET @inNoviListID = SCOPE_IDENTITY()
		end 

		INSERT INTO dbo.DokStart
			(ListID, DokVrsta, VK, Godina, Broj, Izvornik, HostID, FirmaID)
			VALUES (@inNoviListID,@tiDokVrstaPaste, @siVK, @siGodina, @ncNoviBroj, @ncIzvornik, @inHostID, @inFirmaID)
		

			
	SET @inNoviDokumID = SCOPE_IDENTITY()

		INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Analitika3ID, 
					PDVStatus, Datum, DatumPI, Odgoda, ValKod, Tecaj)
			SELEID, @inAnalitika3ID, 
					@tiPDVStatus, @sdDatePaste, @sdDatePaste, Odgoda, @siValKod, @nuTecaj
			FROM dbo.Dokum
			WHERE Dokum.DokumID = @inDokumID 

		INSERT INTO dbo.DokPad ([DokumID], [Koment], [Odobrio], [Tekst], [Transport], [Paritet], 
						[KontOsoba], [KontTel], [Pakiranje], [Tezina], [Prilozi], [Ostalo])
		SELECT @inNoviDokumID, Koment, Odobrio, Tekst, Transport, Paritet, 
						KontOsoba, KontTel, Pakiranje, Tezina, Prilozi, Ostalo
		FROM dbo.DokPad
		WHERE DokumID = @inDokumID

		Select @PasteDokVrstaVrsta = DokVrsta.Vrsta
		from dbo.DokStart
		inner join dbo.DokVrsta on dbo.DokStart.DokVrsta=dbo.DokVrsta.Sifra
		where dbo.DokStart.ID=@inNoviDokumID		

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)
		BEGIN

		
		declare @cEvidID int 
		declare @cAsoKatalogID int
		declare @cObracJedinica tinyint
		declare @ckolicina1 money
		declare @cKolicina2 money
		declare @cijena money
		declare @cFakPopust smallmoney
		declare @cFakTrosar money
		declare @cBod smallint
		declare @cPorTarifID smallint
		declare @inNoviEvidID int

		declare cur1 cursor for 
		SELECT dbo.Evid.ID as EvidID,  dbo.Evid.AsoKatalogID, dbo.Evid.ObracJedinica, 
			acDiv <= 0 
				THEN Kolicina1
				ELSE ROUND(Kolicina1  @mo) 
				END As Kolicina2,
			dbo.Evid.akTrosar, dbo.Evid.Bod, dbo.Evid.PorTarifID

		FROM	dbo.DokStart
			INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
		WHERE dbo.DokStart.ID = @inDokumID
		open cur1
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID

		while @@fetch_status = 0
		begin
		INSERT INTO dbo.Evid (ListID, AsoKatalogID, ObracJedinica, Kolicina1, Kolicina2,
											 akTrosar, Bod,  PorTarifID )
				VALUES (@inNoviListID, @cAsoKatalogID, @cObracJedinica, @ckolicina1, @cKolicina2, 
									@cakTrosar, @cBod, @cPorTarifID)
		set @inNoviEvidID = scope_identity()
		
		insert into dbo.EvidPad (EvidID, Opis)
				Select @inNoviEvidID , ep.Opis
				from dbo.EvidPad ep Where EvidID = @cEvidID
	
		fetch ne, 
									@cakTrosar, @cBod, @cPorTarifID
		end
		close cur1
		deallocate cur1

		END

		IROM	dbo.DokStart
				INNER JOIN dbo.Evid ON dbo.DokStart.ListID = dbo.Evid.ListID
			      WHERE dbo.DokStart.ID = @inDokumID)

			IopyDokVrstaVrsta 
			BEGIN

						IF @siVK = 0 
						BEGIN

					
						INSERT INTO dbo.DokStavka (DokumID, Pozicija, KontoID, AnalitikaID, Iznos, IznosVal, PozDatum, 
														dp, ps, zk, ks)
						SELECT @inNoviDokumID,Pozicija, KontoID, AnalitikaID, Iznos=0, IznosVal=0, 
												PozDatum= CASE WHEN DokStavka.PozDatum IS NULL 
															THEN NULL
															ELSE @sdDatePaste end,
														dp, ps, zk, ks 
						FROM dbo.DokStavka		
						WHERE DokStavka.DokumID=@inDokumID AND 
							DokStavka.Pozicija NOT IN (SELEROM dbo.DokStavka WHERE DokumID=@inNoviDokumID)
						GROUP BY Pozicija, KontoID, AnalitikaID, PozDatum, dp, ps, zk, ks
						END

				UPDATE dbo.DokStavka
				SET Iznos = DSO.Iznos, IznosVal = DSO.IznosVal, 
					ks = 00 THEN 0 ELSE DokStavka.ks END
				FROM dbo.DokStavka
				INNER JOIN (SELECT Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks,  

							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END) * @nuTecaj,2) As Iznos, 
							round(SUM(acDiv <= 0 
								THEN IznosVal 

								END),2) As IznosVal
						FROM dbo.DokStavka 
						WHERE dbo.DokStavka.DokumID = @inDokumID
						GROUP BY Pozicija,KontoID,AnalitikaID,dp,ps,zk,ks)
					DSO ON dbo.DokStavka.Pozicija = DSO.Pozicija
				WHERE dbo.DokStavka.DokumID = @inNoviDokumID and (dokStavka.KontoID = DSO.KontoID or DSO.KontoID is null)
					AND (DokStavka.AnalitikaID=DSO.AnalitikaID OR DSO.AnalitikaID is null) 
					AND DokStavka.dp=DSO.dp and DokStavka.ps=DSO.ps and DokStavka.zk=DSO.zk and DokStavka.ks=DSO.ks 		
			END	

			ELSE 

			BEGIN
	RAISERROR 44445 '
	
	CopyDokVrstaVrsta<>PasteDokVrstaVrsta
	Origin: spProcCopyDoc
	'
			ROLLBATION
			goto lExit
			END	

		UPDATE DokStart
		SET Kontrola = 1, Azuriranje = 1
		WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) 
		VALUES (@inNoviDokumID, @inDokumID)
	END

TION

lExit:
SET XA
return 
