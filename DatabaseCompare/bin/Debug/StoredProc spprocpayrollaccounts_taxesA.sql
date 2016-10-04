
es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END

es]
@inListNadID int = NULL,
@inDokumID int = NULL,
@inRadRasporedID int = NULL,
@inPartnerID int = NULL,
@sdDatum smalldatetime = NULL,
@sdStart smalldatetime = NULL,
@sdStop smalldatetime = NULL,
@moOsnOsobOdb money = NULL,
@moProsjPlaca money = NULL,
@nuKoefMinOsn numeric(7,4) = NULL,
@nuKoefMaxOsn numeric(7,4) = NULL,
@ncOO nchar(5) = NULL,
@tiOd tinyint = NULL,
@tiDo tinyint = NULL

AS

BEGIN

  DECLARE @inReturn int 

  DECLARE @inAnalitikaID_Opcina int
  DECLARE @inAnalitikaID_Partner int
  DECLARE @siPozicija smallint
	declare @siPozicijaRazl smallint
	DECLARE @siPozicijaPorez smallint
	DECLARE @siPozicijaPrirez smallint
  DECLARE @moPlaca money,
					@moPlacaUNaravi money
  DECLARE @moNaknada money
  DECLARE @moTrosak money
  DECLARE @moDoprinosi money
  DECLARE @moDohodak money
  DECLARE @siObrSifraID int
	declare @siObrSifraIDRazl int
	DECLARE @siObrSifraIDPorez int
	DECLARE @siObrSifraIDPrirez int
  DECLARE @moOdbitak money
  DECLARE @moOsnovica money
  DECLARE @moPragIspod money 
  DECLARE @moPrag money
  DECLARE @tiPorKritVrsta tinyint 
  DECLARE @moPosto smallmoney
  DECLARE @moKoefOsn smallmoney
  DECLARE @moOsnRazred money
  DECLARE @moPorRazred money
  DECLARE @moPorez money
  DECLARE @moPrirez money
  DECLARE @smKoefPrirez smallmoney
  DECLARE @moUmanjenje money
  DECLARE @moUmanjenjePorez money
  DECLARE @moUmanjenjePrirez money
  DECLARE @moNeto money
  DECLARE @moObustave money
  DECLARE @moZaIsplatu money
  DECLARE @btOlaksice bit
  DECLARE @btPorez bit

		@moNaknada = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 2100)
  IENT
		@moTrosak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM	dbo.IsplataStavke
	INNER JOIN	dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN	dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN 	dbo.RadRaspored ON 	dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																	dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      	dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      	dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.ObrSifraVrsta ON dbo.ObrSifra.ObrSifraVrsta = dbo.ObrSifraVrsta.Sifra
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND
				(ObrSifraVrsta.Sifra = 3100)
  IENT
		@moDohodak = ROUND(ISNULL(SUM(dbo.IsplataStavke.Iznos), 0), 2)
	FROM dbo.IsplataStavke
	INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
	INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
	INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
	INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
					                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
					                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
	INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
	INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
	INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
	INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
  WHERE (IsplataStavke.DokumID = @inDokumID) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL) AND 
        (ObrSifraDatum_1.Prag = 807' AS money))
  IF @@ERROR <> 0 RETURN -1* 100),
				dbo.RadPorDoh.KoefOsn,
				dbo.ObrSifra.Pozicija
			FROM dbo.IsplataStavke
			INNER JOIN dbo.ObrSifraDatum ON dbo.IsplataStavke.ObrSifraID = dbo.ObrSifraDatum.ID
			INNER JOIN dbo.Primanja ON dbo.ObrSifraDatum.ID = dbo.Primanja.ObrSifraID
			INNER JOIN dbo.RadPrimanja ON dbo.Primanja.ObrSifraID = dbo.RadPrimanja.ObrSifraID
			INNER JOIN dbo.RadVrsteDatum ON dbo.RadPrimanja.RadVrstaID = dbo.RadVrsteDatum.ID
			INNER JOIN dbo.RadRaspored ON dbo.IsplataStavke.RadRasporedID = dbo.RadRaspored.ID AND
																		dbo.RadPrimanja.RadInvalid = dbo.RadRaspored.RadInvalid AND 
							                      dbo.RadPrimanja.RadZdravOsiguranje = dbo.RadRaspored.RadZdravOsiguranje AND 
							                      dbo.RadPrimanja.RadnikVrsta = dbo.RadRaspored.RadnikVrsta
			INNER JOIN dbo.RadVrsta ON dbo.RadVrsteDatum.RadVrsta = dbo.RadVrsta.Sifra
			INNER JOIN dbo.RadPorDoh ON dbo.RadVrsteDatum.ID = dbo.RadPorDoh.RadVrstaID
			INNER JOIN dbo.PorDoh ON dbo.RadPorDoh.PorDohID = dbo.PorDoh.ObrSifraID
			INNER JOIN dbo.ObrSifraDatum ObrSifraDatum_1 ON dbo.PorDoh.ObrSifraID = ObrSifraDatum_1.ID
			INNER JOIN dbo.ObrSifra ON ObrSifraDatum_1.ObrSifra = dbo.ObrSifra.Sifra
			WHERE     (dbo.IsplataStavke.DokumID = @inDokumID)

								and (ObrSifraDatum_1.Start <= @sdDatum) AND (ObrSifraDatum_1.Stop >= @sdDatum OR ObrSifraDatum_1.Stop IS NULL)
								and (dbo.RadVrsteDatum.Start <= @sdDatum and (dbo.RadVrsteDatum.Stop >= @sdDatum or dbo.RadVrsteDatum.Stop is null)) 

			order BY 	ObrSifraDatum_1.Prag, dbo.RadPorDoh.PorDohID, (dbo.PorDoh.Porez  100), 2),
						@smKoefPrirez = (ISNULL(dbo.Prirez.Postotak, 0)  100) * -1
				FROM ParOdbit
				INNER JOIN ObrSifraDatum ON ParOdbit.ObrSifraID = ObrSifraDatum.ID
				INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
				INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
				WHERE (ParOdbit.PartnerID = @inPartnerID) AND (ObrSifraVrsta.Sifra = 100) AND
			        (ObrSifraDatum.Start <= @sdDatum) AND (ObrSifraDatum.Stop >= @sdDatum OR ObrSifraDatum.Stop IS NULL)
	

				IF @moUmanjenje < 0
				BEGIN
					SELE),
								 @moUmanjenjePrirez = ROUND(@moPrirez * @moUmanjenje, 2)
	

				  IF (@moUmanjenjePorez <> 0) AND (@moUmanjenjePorez IS NOT NULL) AND
						 (@siObrSifraIDPorez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Koeficjent, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPorez, @siPozicijaPorez, @ncOO, @tiOd, @tiDo, 0, CAST(@moUmanjenje as smallmoney), @moUmanjenjePorez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	

				  IF (@moUmanjenjePrirez <> 0) AND (@moUmanjenjePrirez IS NOT NULL) AND
						 (@siObrSifraIDPrirez IS NOT NULL)
				  BEGIN
				    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
            VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Opcina, @siObrSifraIDPrirez, @siPozicijaPrirez, @ncOO, @tiOd, @tiDo, 0, @moUmanjenjePrirez)
				    IF @@ERROR <> 0 RETURN -1
				  END
	
					SELECT @moPorez = @moPorez + @moUmanjenjePorez,
								 @moPrirez = @moPrirez + @moUmanjenjePrirez
					END
			END
	END
	ELSE
	BEGIN
		SELECT @moPorez = 0, @moPrirez = 0
	END

	SELECT @inAnalitikaID_Partner = dbo.Analitika.ID
	FROM dbo.Analitika
	WHERE dbo.Analitika.VezaID = @inPartnerID	AND dbo.Analitika.AnalitikaVrsta = 2
	

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT 	 
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 17000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELE) - (@moPorez + ISNULL(@moPrirez, 0))

  IF (@moNeto <> 0) AND (@moNeto IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moNeto)
    IF @@ERROR <> 0 RETURN -1
  END

	IOUNT(*)
			FROM dbo.Isplata
			INNER JOIN IsplataVrsta ON Isplata.IsplataVrsta = IsplataVrsta.Sifra
			WHERE (Isplata.ListNadID = @inListNadID) ) > 0
		BEGIN
		  EXEC dbo.spProcPayrollAccounts_Retention  @inListNadID, @inDokumID, @inRadRasporedID, @inPartnerID, @inAnalitikaID_Partner, 
																							 	@sdStart, @sdStop, @moPlaca, @moNeto, @ncOO, @tiOd, @tiDo
		  IF @@ERROR <> 0 RETURN -1

			SELECT @moObustave = SUM(IsplataStavke.Iznos)
			FROM dbo.IsplataStavke
			INNER JOIN ObrSifraDatum ON IsplataStavke.ObrSifraID = ObrSifraDatum.ID
			INNER JOIN ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
			INNER JOIN ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
			WHERE (IsplataStavke.DokumID = @inDokumID) AND (ObrSifraVrsta.Sifra BETWEEN 18100 AND 18600)
		  IF @@ERROR <> 0 RETURN -1
		END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19000) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  SET @siObrSifraID = NULL
  IF @@ERROR <> 0 RETURN -1

  SELECT	
		@siObrSifraID = max(ObrSifraDatum.ID),
		@siPozicija = max(dbo.ObrSifra.Pozicija)
	FROM dbo.ObrSifraDatum
  INNER JOIN dbo.ObrSifra ON ObrSifraDatum.ObrSifra = ObrSifra.Sifra
  INNER JOIN dbo.ObrSifraVrsta ON ObrSifra.ObrSifraVrsta = ObrSifraVrsta.Sifra
  WHERE (ObrSifraVrsta.Sifra = 19500) AND
        (ObrSifraDatum.Start <= @sdStart) AND (ObrSifraDatum.Stop >= @sdStop OR ObrSifraDatum.Stop IS NULL)
				and PartnerID is null
  IF @@ERROR <> 0 RETURN -1

  SELECT @moZaIsplatu = ISNULL(@moNeto, 0) - ISNULL(@moObustave, 0) + ISNULL(@moNaknada, 0) + ISNULL(@moTrosak, 0)

  IF (@moZaIsplatu <> 0) AND (@moZaIsplatu IS NOT NULL) AND (@siObrSifraID IS NOT NULL)
  BEGIN
    INSERT INTO dbo.IsplataStavke (DokumID, RadRasporedID, AnalitikaID, ObrSifraID, Pozicija, OO, alDayDo, Osnovica, Iznos)
    VALUES (@inDokumID, @inRadRasporedID, @inAnalitikaID_Partner, @siObrSifraID, @siPozicija, @ncOO, @tiOd, @tiDo, 0, @moZaIsplatu)
    IF @@ERROR <> 0 RETURN -1
  END

  RETURN 0 
END
