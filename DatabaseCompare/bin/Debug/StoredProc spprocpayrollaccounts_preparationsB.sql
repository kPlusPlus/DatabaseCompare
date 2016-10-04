
EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END

EDURE [dbo].[spProcPayrollAccounts_Preparations]
@inFirmaID int = NULL,
@siTVS603,
@inListNadID int = NULL,
@tiDokVrsta tinyint = 5,
@inMaxEmployees int = 0

AS

BEGIN
	DECLARE @inReturnStatus int 

  DECLARE @inActionID int
  DECLARE @inObradaID int
  DECLARE @tiErrorLevel tinyint
  DECLARE @inObradaLogID int
  DECLARE @nvTekst nvarchar(1000)
  DECLARE @inNoEmployees int

	declare 
		@siHostID smallint,
		@inKorisnikID int

	select 
		@siHostID = dbo.siHost(),
		@inKorisnikID = dbo.inKorisnik()

	SELECT @inActionID = ID
	FROM dbo.TVSAction
	WHERE (ode)
	PRINT 'izdvojen ID za pripremu podataka za obračun'

  INSERT INTO dbo.Obrada (TVSActionID, irmaID, @siHostID, @inKorisnikID)
	PRINT 'dodan slog obrade'
	SELEOPE_IDENTITY()
	PRINT 'izdvojen ID sloga obrade'

	SET @tiErrorLevel = 0

  DECLARE @siGodina smallint,
  				@siMjesec smallint,
  				@sdDatum smalldatetime,
  				@sdStart smalldatetime,
  				@sdStop smalldatetime,
  				@tiIsplataVrsta tinyint,
  				@moProsjPlaca money,
					@moOsnOsobOdb money,
  				@siVK smallint,
					@smProsjGodSatnica smallmoney

	SELEAST(Mjesec As smallint),
					@siGodina = CAST(Godina As smallint),
					@sdDatum = Datum,
					@sdStart = Start,
					@sdStop = Stop,
					@tiIsplataVrsta = IsplataVrsta,
					@moOsnOsobOdb = OsnOsobOdb,
					@moProsjPlaca = ProsjPlaca,
					@smProsjGodSatnica = case ProsjGodSatnica when 0 then null else ProsjGodSatnica end
	FROM dbo.Isplata
	WHERE (ListNadID = @inListNadID)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci o traženoj isplati'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	SELECT @siVK = VK
	FROM  dbo.DokVrsta
	WHERE (Sifra = @tiDokVrsta)

  IitError

	SELECT @nvTekst = 'izdvojeni podaci o VKu obračuna plaće'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	Ijeline') IS NOT NULL
		DROP TABLE #tbCjeline

	SELEjelinaID
	INTO #tbCjeline
	FROM dbo.Analitika
	WHERE (AnalitikaVrsta = 1)
  IitError

	SELECT @nvTekst = 'izdvojeni podaci mjesta troška'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DECLARE @tbRasporedi TABLE (DokumID int,
															RadRasporedID int,
															PartnerID int,
															AnalitikaID int,
															Start smalldatetime,
															Stop smalldatetime,
				                      RadnikVrsta tinyint,
															RadInvalid nchar(1),
															RadZdravOsiguranje nchar(1),
															MTAnalitikaID int,
															Vrijednost money,
															FondSati smallmoney,
															ParAdresaID int,
															PlatniRazred smallmoney,
															Poslovi smallint,
															ObrVrijedVrsta tinyint)

	INSERT INTO @tbRasporedi
		SELEENT
			NULL,
			RadRaspored.ID,
			RadRaspored.PartnerID,
			Analitika.ID,
			CASE
			WHEN RadRaspored.Start > @sdStart THEN RadRaspored.Start
			ELSE @sdStart
			END,
			CASE
			WHEN RadRaspored.Stop IS NULL THEN @sdStop
			ELSE
				CASE
				WHEN RadRaspored.Stop > @sdStop THEN @sdStop
				ELSE RadRaspored.Stop
				END
			END,
			RadRaspored.RadnikVrsta,
			RadRaspored.RadInvalid,
			RadRaspored.RadZdravOsiguranje, 
			RadRaspored.AnalitikaID,
      RadRaspored.Vrijednost,
 			(	SELEOUNT(ID), 0) * dbo.SatiVrsta.Sati
				alendar
				WHERE	(dbo.ode = 1) AND
							(dbo.alendar.M = MONTH(@sdStart)) AND
							(dbo.))),
			dbo.ParAdresa.ID,
			ISNULL(dbo.IsplataVrijed.Vrijednost, 0),
      RadRaspored.Poslovi,
      Poslovi.ObrVrijedVrsta
		FROM  dbo.RadRaspored
		INNER JOIN dbo.RadUgovorVrsta ON RadRaspored.RadUgovorVrsta = RadUgovorVrsta.Sifra
		INNER JOIN dbo.RadUgovorIsplataVrste ON dbo.RadUgovorVrsta.Sifra = dbo.RadUgovorIsplataVrste.RadUgovorVrsta
		INNER JOIN dbo.SatiVrsta ON dbo.RadUgovorVrsta.SatiVrsta = dbo.SatiVrsta.Sifra
		INNER JOIN dbo.ParOsoba ON RadRaspored.PartnerID = ParOsoba.PartnerID
		INNER JOIN dbo.Partner ON ParOsoba.PartnerID = Partner.PartnerID 
		INNER JOIN dbo.Analitika ON Partner.PartnerID = Analitika.VezaID AND Analitika.AnalitikaVrsta = 2
		INNER JOIN dbo.PartnerStart ON dbo.Partner.PartnerID = dbo.PartnerStart.ID
		INNER JOIN dbo.ParAdresa ON dbo.PartnerStart.ID = dbo.ParAdresa.PartnerID AND dbo.ParAdresa.Vrsta = 2
		INNER JOIN dbo.Poslovi ON dbo.RadRaspored.Poslovi = dbo.Poslovi.Sifra
		inner join dbo.Analitirma.AnalitikaID
		LEFT OUTER JOIN dbo.IsplataVrijed ON	dbo.Poslovi.PlatniRazred = dbo.IsplataVrijed.PlatniRazred AND
																		dbo.IsplataVrijed.ListNadID = @inListNadID
		WHERE (dbo.RadUgovorIsplataVrste.IsplataVrsta = @tiIsplataVrsta) AND
					(dbo.RadRaspored.Start <= @sdStop) AND (dbo.RadRaspored.Stop >= @sdStart OR dbo.RadRaspored.Stop IS NULL)
					and (dbo.AnalitirmaID)
					and dbo.RadRaspored.Raspored <> 100 
		ORDER BY RadRaspored.PartnerID, RadRaspored.Start

  DECLARE @tbBruta TABLE (PartnerID int,
													KOO money,
													OO money,
													Prirez money,
		                      Umanjenje money,

													Placa money,
													UNaravi money,
													Bruto money,
													BrutoUNaravi money,
													ObrVrijedVrsta tinyint)

	INSERT INTO @tbBruta
	SELECT distinct
	

		ParOdbit.PartnerID,
		ParOdbit.Iznos,
		0,
		0,
		0,

		0,
		0,
		0,
		0,
		0
	FROM @tbRasporedi r
	INNER JOIN 	(	select dbo.ParOdbit.PartnerID, SUM(dbo.ParOdbit.Iznos) Iznos
		from dbo.ParOdbit 
		INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		WHERE	(dbo.ObrSifra.ObrSifraVrsta = 14100) AND
					(dbo.ObrSifraDatum.Start <= @sdDatum) AND
					(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL)
		GROUP BY dbo.ParOdbit.PartnerID
	) ParOdbit on r.PartnerID = ParOdbit.PartnerID

  IitError

	IROM @tbBruta)
	BEGIN

		UPDATE @tbBruta
		SET	OO	=	( SELECT ISNULL(SUM(dbo.ParOdbit.Iznos), 0)
								FROM dbo.ParOdbit
								INNER JOIN	dbo.ObrSifraDatum ON dbo.ParOdbit.ObrSifraID = dbo.ObrSifraDatum.ID
								INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
								WHERE	(dbo.ObrSifra.ObrSifraVrsta BETWEEN 14300 AND 14600) AND
											(dbo.ObrSifraDatum.Start <= @sdDatum) AND
											(dbo.ObrSifraDatum.Stop >= @sdDatum OR dbo.ObrSifraDatum.Stop IS NULL) AND
											(dbo.ParOdbit.PartnerID = b.PartnerID))
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
	  IitError
	

		UPDATE @tbBruta
		SET	Prirez	=	ISNULL((
									SELECT	dbo.Prirez.Postotak
									FROM	dbo.ParAdresa
									INNER JOIN	dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID
									INNER JOIN	dbo.Opcina ON dbo.Naselje.OpcinaID = dbo.Opcina.ID
									LEFT OUTER JOIN dbo.Prirez ON dbo.Opcina.ID = dbo.Prirez.OpcinaID
									WHERE	(dbo.ParAdresa.PartnerID = b.PartnerID) AND
												(dbo.Prirez.Start <= @sdDatum) AND
												(dbo.Prirez.Stop >= @sdDatum OR dbo.Prirez.Stop IS NULL) AND
												(dbo.ParAdresa.Vrsta = 2)	AND
												(dbo.ParAdresa.RedBr IN (SELECT MAX(dbo.ParAdresa.RedBr)
																								 FROM dbo.ParAdresa

																								 WHERE dbo.ParAdresa.PartnerID = b.PartnerID and dbo.ParAdresa.Vrsta = 2))), 0)
		FROM	@tbBruta b
		INNER JOIN	dbo.ParOdbit	ON	b.PartnerID	=	dbo.ParOdbit.PartnerID
		IitError

		SELECT @nvTekst = 'formirana tabela za izračun bruto plaće'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
		PRINT @nvTekst
	END

  DECLARE @tbListovi TABLE (AnalitikaID int,
														RadRasporedID int,
														ObrSifraID int,
														OO nchar(5),
														CalDayOd tinyint,
														CalDayDo tinyint,
														Sati smallmoney,
														Iznos money)

	INSERT INTO @tbListovi
		SELECT
			dbo.RadniList.AnalitikaID,
			dbo.RadniList.RadRasporedID,
			dbo.RadniList.ObrSifraID,
			dbo.ncOO(dbo.RadniList.RadRasporedID, dbo.RadniList.ObrSifraID),
			DAY(dbo.RadniList.DatumOd),
			DAY(dbo.RadniList.DatumDo),
			dbo.RadniList.Sati,
			dbo.RadniList.Iznos
		FROM  @tbRasporedi r
		INNER JOIN dbo.RadniList ON r.RadRasporedID = dbo.RadniList.RadRasporedID
		WHERE (dbo.RadniList.RadniListVrsta = 2) AND
					(dbo.RadniList.DatumOd <= @sdStop) AND
					(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL) AND
					(dbo.RadniList.DokumID IS NULL)
		ORDER BY dbo.RadniList.AnalitikaID, dbo.RadniList.RadRasporedID, dbo.RadniList.DatumOd

	SELECT @nvTekst = 'radni listovi izdvojeni u privremenu tabelu'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DE))

  DE),
					@inAnalitikaID int,
					@tiCalDayOd tinyint,
					@tiCalDayDo tinyint

  DECLARE @inAnalitikaIDTrace int,
					@tiOdTrace tinyint,
					@tiDoTrace tinyint

  Iursor_Status('global', 'cOO')) >= 0
  BEGIN
    CLOSE cOO
    DEALLOCATE cOO
  END

  Iursor_Status('global', 'cListovi')) >= 0
  BEGIN
    CLOSE cListovi
    DEALLOCATE cListovi
  END

  DEOR
		SELECT OO
		FROM @tbListovi
		GROUP BY OO

  OPEN cOO
  IitError
  ROM cOO INTO @ncOO
  IitError

  WHILE @@H_STATUS = 0
	BEGIN

		SELECT	@inAnalitikaIDTrace = 0,
						@tiOdTrace = 0,
						@tiDoTrace = 0

	  DEOR
			SELEENT
				AnalitikaID,
				CalDayOd,
				CalDayDo
			FROM @tbListovi
			WHERE OO = @ncOO
			ORDER BY AnalitikaID,	alDayDo

	  OPEN cListovi
	  IitError
	  alDayDo
	  IitError

	  WHILE @@H_STATUS = 0
		BEGIN

			IF	@inAnalitikaID <> @inAnalitikaIDTrace OR
					@tiCalDayOd <> (@tiDoTrace + 1)
			BEGIN
				IF @inAnalitikaIDTrace <> 0
				BEGIN
					UPDATE @tbListovi
					SET CalDayOd = @tiOdTrace,
							CalDayDo = @tiDoTrace
					FROM @tbListovi l
					WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
								l.alDayDo <= @tiDoTrace
				END

				SELECT	@inAnalitikaIDTrace = @inAnalitikaID,
								@tiOdTrace = @tiCalDayOd,
								@tiDoTrace = @tiCalDayDo
			END

			SELEalDayDo

		  alDayDo
		  IitError
	  END

		IF @inAnalitikaIDTrace <> 0
		BEGIN
			UPDATE @tbListovi
			SET CalDayOd = @tiOdTrace,
					CalDayDo = @tiDoTrace
			FROM @tbListovi l
			WHERE l.AnalitikaID = @inAnalitikaIDTrace AND 
						l.alDayDo <= @tiDoTrace
		END

	  CLOSE cListovi
	  IitError
	  DEALLOCATE cListovi
	  IitError

	  ROM cOO INTO @ncOO
	  IitError
  END

  CLOSE cOO
  IitError
  DEALLOCATE cOO
  IitError

	SELECT @nvTekst = 'utvrđeni neprekinuti periodi prema osnovicama obračuna'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  DECLARE @tbPrimanja TABLE (	DokumID int,
															PartnerID int,
															AnalitikaID int,
															RadRasporedID int,
															ObrSifraID int,
															OO nchar(5),
															CalDayOd tinyint,
															CalDayDo tinyint,
															Sati smallmoney,
															Iznos money,
															ImaSat bit,
															ImaIznos bit,
															Koeficjent smallmoney,
															Izracun bit,
															ProsjSatnicaNacin tinyint,
															ObrVrijedVrsta tinyint 
															)

	INSERT INTO @tbPrimanja
		SELECT
			NULL,
			dbo.Analitika.VezaID,
			l.AnalitikaID,
			l.RadRasporedID,
			l.ObrSifraID,
			dbo.ncOO(l.RadRasporedID, l.ObrSifraID),
			l.CalDayOd,
			l.CalDayDo,
			SUM(ISNULL(l.Sati, 0)),
			SUM(ISNULL(l.Iznos, 0)),
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			CASE
			WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
			ELSE 0
			END,
			dbo.Primanja.ProsjSatnicaNacin,	
			r.ObrVrijedVrsta 
		FROM  @tbListovi l
		INNER JOIN dbo.ObrSifraDatum ON l.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		INNER JOIN dbo.Analitika ON l.AnalitikaID = dbo.Analitika.ID
		inner join @tbRasporedi r on l.RadRasporedID = r.RadRasporedID 
		GROUP BY	dbo.Analitika.VezaID, l.AnalitikaID, l.RadRasporedID, l.ObrSifraID,
							dbo.ncOO(l.RadRasporedID, l.ObrSifraID), l.alDayDo, 
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent,
							CASE
							WHEN dbo.Primanja.ImaSat = 1 AND dbo.Primanja.ImaIznos = 1 AND ISNULL(l.Iznos, 0) = 0 THEN 1
							ELSE 0
							END,
							dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	INSERT INTO @tbPrimanja
		SELEENT
			NULL,
			dbo.Analitika.VezaID,
			r.AnalitikaID,
			dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
			dbo.Primanja.ObrSifraID,
			dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
      MIN(coalesce(l.Od,DAY(r.Start))),
 			MAX(coalesce(l.Do,DAY(r.Stop))),
			0,
			dbo.ParIsplataStavke.Vrijednost,
			dbo.Primanja.ImaSat,
			dbo.Primanja.ImaIznos,
			dbo.Primanja.Koeficjent,
			0,	
			dbo.Primanja.ProsjSatnicaNacin,
			r.ObrVrijedVrsta 
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		INNER JOIN dbo.ParIsplataStavke ON dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID
		INNER JOIN dbo.ObrSifra ON dbo.ParIsplataStavke.ObrSifra = dbo.ObrSifra.Sifra
		INNER JOIN dbo.ObrSifraDatum ON dbo.ObrSifra.Sifra = dbo.ObrSifraDatum.ObrSifra
		INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
		left join ( 
			select
				AnalitikaID, OO, Min(alDayDo) Do
			from @tbListovi l
			group by AnalitikaID, OO
		) l on r.AnalitikaID = l.AnalitikaID and l.OO = dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID)
		WHERE (dbo.ObrSifra.ObrSifraVrsta IN (1100, 1600, 3100)) AND 
					(dbo.Analitika.VezaID = dbo.ParIsplataStavke.PartnerID) AND
			    (dbo.ObrSifraDatum.Start <= r.Stop) AND
					(dbo.ObrSifraDatum.Stop >= r.Start OR dbo.ObrSifraDatum.Stop IS NULL) AND
					(dbo.ParIsplataStavke.Start <= r.Stop) AND
					(dbo.ParIsplataStavke.Stop >= r.Start OR dbo.ParIsplataStavke.Stop IS NULL)
		GROUP BY	dbo.Analitika.VezaID, r.AnalitikaID, 
							dbo.inRadRasporedID(dbo.Analitika.VezaID, @sdStart, @sdStop),
							dbo.Primanja.ObrSifraID, dbo.ncOO(r.RadRasporedID, dbo.Primanja.ObrSifraID),
				      dbo.ParIsplataStavke.Vrijednost,
							dbo.Primanja.ImaSat, dbo.Primanja.ImaIznos, dbo.Primanja.Koeficjent, dbo.Primanja.ProsjSatnicaNacin,
							r.ObrVrijedVrsta 

	DELETE FROM @tbListovi

	UPDATE @tbPrimanja
	SET	Sati = CASE p.ImaSat
						 WHEN 1 THEN p.Sati
						 WHEN 0 THEN 0
						 END,

			Iznos = ROUND(CASE
										WHEN  p.ImaIznos = 1 AND dbo.ObrSifra.ObrSifraVrsta = 1100 THEN
											CASE 
											WHEN  p.ObrVrijedVrsta IN (1,2) THEN

												 @smProsjGodSatnica), 0)
												when ondSati , 0)
												when 3 then ISNULL(p.Sati * p.Koeficjent * (ondSati) end, 0)
												end
												* r.FondSati) end, 0)

											WHEN  p.ObrVrijedVrsta IN (3,8) THEN 
												case p.ProsjSatnicaNacin
												when 1 then ISNULL(p.Sati * p.Koeficjent * 
																(ondSati end * @smProsjGodSatnica  @smProsjGodSatnica) , 0)
												else ISNULL(p.Sati * p.Koeficjent * 
																() 

	DELETE FROM @tbBruta

  DE),
					@siGod smallint

  Iursor_Status('global', 'cList')) >= 0
  BEGIN
    CLOSE cList
    DEALLOCATE cList
  END

  DECLARE @inListID int

	SELECT @siGod = DATEPART(year, GETDATE())
  IF @@ERROR <> 0 GOTO lRollback
	

	

  SET XA

  BEGIN TRANSACTION

  INSERT INTO dbo.List (ListNadID, AnalitikaID)
		SELECT
			@inListNadID,
			r.AnalitikaID
		FROM @tbRasporedi r
		INNER JOIN dbo.Analitika ON r.AnalitikaID = dbo.Analitika.ID
		LEFT OUTER JOIN dbo.List ON r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		WHERE dbo.List.ID IS NULL
		GROUP BY dbo.Analitika.Analitika, r.AnalitikaID
		ORDER BY dbo.Analitika.Analitika
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	otvoreni slogovi u tabeli List'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  DEOR
		SELECT ID
		FROM dbo.List
		WHERE dbo.List.ListNadID = @inListNadID
		ORDER BY dbo.List.ID

  OPEN cList
  IF @@ERROR <> 0 GOTO lRollback
  ROM cList INTO @inListID
  IF @@ERROR <> 0 GOTO lRollback

  WHILE @@H_STATUS = 0
	BEGIN

		IROM dbo.DokStart WHERE dbo.DokStart.ListID = @inListID)
		BEGIN
			SELEirmaID)
		  IF @@ERROR <> 0 GOTO lRollback

		  INSERT INTO dbo.DokStart (ListID, DokVrsta, VK, Godina, Broj, KorisnikID, HostID, FirmaID)
			VALUES (@inListID, @tiDokVrsta, @siVK, @siGod, @ncBroj, @inKorisnikID, @siHostID, @inFirmaID)
		  IF @@ERROR <> 0 GOTO lRollback
		END

	  ROM cList INTO @inListID
	  IF @@ERROR <> 0 GOTO lRollBack
  END

  CLOSE cList
  IF @@ERROR <> 0 GOTO lRollBack
  DEALLOCATE cList
  IF @@ERROR <> 0 GOTO lRollBack

	SELECT @nvTekst = '	dodani slogovi u tabelu DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE @tbRasporedi
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbRasporedi r ON dbo.List.AnalitikaID = r.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

	UPDATE @tbPrimanja
	SET DokumID = dbo.DokStart.ID
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN @tbPrimanja p ON dbo.List.AnalitikaID = p.AnalitikaID
	WHERE dbo.List.ListNadID = @inListNadID

  INSERT INTO dbo.Dokum (DokumID, Analitika1ID, AdresaID, Analitika2ID, Datum, DatumPI)
		SELECT
			r.DokumID,
			r.AnalitikaID,
			r.ParAdresaID,
			MAX(r.MTAnalitikaID), 
			@sdDatum,
			@sdDatum
		FROM @tbRasporedi r
		INNER JOIN dbo.List ON	r.AnalitikaID = dbo.List.AnalitikaID AND dbo.List.ListNadID = @inListNadID
		INNER JOIN dbo.DokStart ON	dbo.List.ID = dbo.DokStart.ListID
		LEFT OUTER JOIN dbo.Dokum ON	dbo.DokStart.ID = dbo.Dokum.DokumID
		WHERE dbo.Dokum.DokumID IS NULL
		GROUP BY r.DokumID, r.AnalitikaID, r.ParAdresaID

  IF @@ERROR <> 0 GOTO lRollback
	
	SELECT @nvTekst = '	dodani slogovi u tabelu Dokum'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	UPDATE dbo.RadniList
	SET DokumID = dbo.Dokum.DokumID
	FROM dbo.RadniList
	INNER JOIN dbo.Dokum ON dbo.RadniList.AnalitikaID = dbo.Dokum.Analitika1ID AND (dbo.RadniList.DokumID IS NULL)
	INNER JOIN dbo.DokStart ON dbo.Dokum.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE (dbo.List.ListNadID = @inListNadID) AND
				(dbo.RadniList.DatumOd <= @sdStop) AND
				(dbo.RadniList.DatumDo >= @sdStart OR dbo.RadniList.DatumDo IS NULL)

	SELECT @nvTekst = '	ažurirani slogovi u tabeli RadniList'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

  INSERT INTO dbo.IsplataStavke
	(DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Sati, Koeficjent, Iznos)
		SELECT
			p.DokumID,
			p.RadRasporedID,
			p.AnalitikaID, 
			p.ObrSifraID,
			dbo.ObrSifra.Pozicija,
			p.OO,
			p.CalDayOd,
			p.CalDayDo,
			p.Sati,
			p.Koeficjent,
			p.Iznos
		FROM @tbPrimanja p
		INNER JOIN dbo.ObrSifraDatum ON p.ObrSifraID = dbo.ObrSifraDatum.ID
		INNER JOIN dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
		LEFT OUTER JOIN dbo.IsplataStavke ON	p.DokumID = dbo.IsplataStavke.DokumID AND
																		p.RadRasporedID = dbo.IsplataStavke.RadRasporedID AND
																		p.AnalitikaID = dbo.IsplataStavke.AnalitikaID AND
																		p.ObrSifraID = dbo.IsplataStavke.ObrSifraID AND
																		p.OO = dbo.IsplataStavke.OO AND
																		p.alDayOd

		ORDER BY p.AnalitikaID, p.CalDayOd, p.OO, p.RadRasporedID, p.ObrSifraID
  IF @@ERROR <> 0 GOTO lRollback

	SELECT @nvTekst = '	dodani slogovi u tabelu IsplataStavke'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

				

  TION

	UPDATE dbo.DokStart
	SET Azuriranje = 1,
			Kontrola = 1
	FROM dbo.DokStart
	INNER JOIN dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE dbo.List.ListNadID = @inListNadID

	SELECT @nvTekst = '	završno ažuriranje u tabeli DokStart'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	GOTO ExitSucces
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError

ExitError:

	SELECT 	@nvTekst = 'ZAVRŠETAK S GREŠKOM', @inReturnStatus = -1
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	GOTO TheEnd
ExitSucces:

	SELECT 	@nvTekst = 'ZAVRŠETAK BEZ GREŠKE', @inReturnStatus = 0

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

TheEnd:
  RETURN @inReturnStatus
	RETURN 0

END
