
EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 

EDURE [dbo].[spProcOdobrenje] 
@inVK int,
@sdStartDate smalldatetime, 
@sdStopDate smalldatetime,
@siParGrupa smallint 

AS

DECLARE @inHostID int
DECLARE @siGodina smallint
DEirmaID int
DE)
DECLARE @inNoviDokumID int
DECLARE @inNoviListID int
DECLARE @inDokumID int
DECLARE @inAnalitika1ID int
DECLARE @inAdresaID int
DEID int
DECLARE @tiPDVStatus tinyint
DEjenik smallint
DECLARE @moOdobrenje money
DECLARE @moSaldo money
DECLARE @inDokStavka int
DECLARE @inDokStavkaOrg int
DECLARE @moIznos money
DECLARE @moIznosPorezTB1 money
DE money

DECLARE @tbOdobrenje TABLE
	(DokumID int, 
	Analitika1ID int, AdresaID int, Analitika2ID int, 
	PDVStatus tinyint, Cjenik smallint,
	Iznos money, Saldo money, Odobrenje money, 
	DokStavka int)

INSERT INTO @tbOdobrenje
SELECT
	dbo.DokStart.ID,
	dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID,
	dbo.Dokum.Analitika2ID,
	dbo.Dokum.PDVStatus,
	dbo.List.Cjenik,
	dbo.DokStavka.Iznos,

	dbo.DokStavka.Iznos - SUM(case when DokStavka_Z.dp=0 then DokStavka_Z.Iznos 
							when DokStavka_Z.dp=1 then DokStavka_Z.Iznos*-1 end),
	CASE 
		WHEN DATEDIP.Prag1
			THEN dbo.SkalaRPP1
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag3
			THEN dbo.SkalaRPP3
		WHEN DATEDIP.Prag4
			THEN dbo.SkalaRPP4
		WHEN DATEDI
			THEN dbo.SkalaRP
		WHEN DATEDIP.Prag6
			THEN dbo.SkalaRPP6
		WHEN DATEDIP.Prag7
			THEN dbo.SkalaRPP7
 		ELSE 0
	END,
	dbo.DokStavka.ID
FROM	dbo.DokStart with(nolock)
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStart.ID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.Analitika with(nolock) on dbo.Dokum.Analitika1ID=dbo.Analitika.ID AND dbo.Analitika.AnalitikaVrsta=2 
	INNER JOIN dbo.PartnerStart with(nolock) on dbo.Analitika.VezaID=dbo.PartnerStart.ID 
	INNER JOIN dbo.List with(nolock) ON dbo.DokStart.ListID = dbo.List.ID
	INNER JOIN dbo.ListNad with(nolock) ON dbo.List.ListNadID = dbo.ListNad.ID
	INNER JOIN dbo.ListVrstPlac with(nolock) ON dbo.ListNad.ListVrstPlac = dbo.ListVrstPlac.Sifra
	INNER JOIN dbo.ListVrstPlacSkalaRPP.ListVrstPlac
	INNER JOIN dbo.SkalaRPP.Sifra
	INNER JOIN dbo.DokStavka with(nolock) ON dbo.Dokum.DokumID = dbo.DokStavka.DokumID
	INNER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
	INNER JOIN dbo.DokStavka DokStavka_Z with(nolock) ON dbo.DokStavkaPop.DokStavkaOrg = DokStavka_Z.ID
	INNER JOIN dbo.Dokum Dokum_Z with(nolock) ON DokStavka_Z.DokumID = Dokum_Z.DokumID
WHERE dbo.DokVrsta.SKK = 1 AND dbo.DokVrsta.Vrsta = P.Vrsta = 3 
	AND dbo.PartnerStart.ParGrupa=@siParGrupa AND Dokum_Z.Datum BETWEEN @sdStartDate AND @sdStopDate

	AND dbo.DokStart.ID NOT IN
		(SELECT
			dbo.DokStart.ID
		FROM
			dbo.DokStart with(nolock)
			LEFT OUTER JOIN dbo.DokPoprat with(nolock) ON dbo.DokStart.ID = dbo.DokPoprat.DokPopratID
			LEFT OUTER JOIN dbo.DokStart DokStart_P with(nolock) ON dbo.DokPoprat.DokumID = DokStart_P.ID	
		WHERE DokStart_P.DokVrsta = 30)
	and dbo.DokStart.ID not in (
		select ds.ID
		from dbo.DokStart ds with(nolock)
		inner join dbo.DokStavka dst with(nolock) on ds.ID = dst.DokumID
		inner join dbo.DokStavkaPop dstp with(nolock) on dst.ID = dstp.DokStavka
		inner join dbo.DokStavka dstz with(nolock) on dstp.DokStavkaOrg = dstz.ID
		where dstz.Pozicija = 2993
		)
GROUP BY
	dbo.DokStart.ID, dbo.Dokum.Datum, dbo.DokStavka.Iznos, dbo.Dokum.Analitika1ID,
	dbo.Dokum.AdresaID, dbo.Dokum.Analitikajenik,
	dbo.DokStavka.ID, dbo.SkalaRPP.Prag6,
	dbo.SkalaRPP.Prag4,
	dbo.SkalaRP,
	dbo.SkalaRPP1

SELEGHost WHERE Name = HOST_NAME()

SET @siGodina = YEAR(@sdStopDate) 

SELEirma()

DEOR 
SELECT * 
FROM @tbOdobrenje 
WHERE Saldo <= ROUND(Iznos * Odobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznos * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = -1 * ROUND(@moIznosPorezTB)
							- ROUND(@moIznosPorezTB1 * @moOdobrenje  100, 2),
				IznosVal = ROUND(@moIznos * @moOdobrenje  100, 2)
								 - ROUND(@moIznosPorezTB)
		WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 1150

		IF @moSaldo > 0

	BEGIN		
			UPDATE dbo.DokStavkaPop
			SET	DokStavka = @inDokStavka
			FROM dbo.DokStavkaPop
			INNER JOIN dbo.DokStavka ON dbo.DokStavkaPop.DokStavkaOrg = dbo.DokStavka.ID
			WHERE dbo.DokStavka.DokumID = @inNoviDokumID AND dbo.DokStavka.Pozicija = 2993
		END
	

		UPDATE dbo.Dokum
		SET KampanjaID=KampanjaID
		WHERE dbo.Dokum.DokumID=@inNoviDokumID

		UPDATE dbo.DokStart SET Kontrola = 1, Azuriranje = 1 WHERE ID = @inNoviDokumID 

		INSERT INTO dbo.DokPoprat (DokumID, DokPopratID) VALUES (@inNoviDokumID, @inDokumID)
	TION
	SET XA
	ROM curOdobrenje
	INTO @inDokumID, @inAnalitika1ID, @inAdresaID, @inAnalitikajenik, @moIznos, @moSaldo, @moOdobrenje, @inDokStavka
END
CLOSE curOdobrenje 
DEALLOCATE curOdobrenje 
