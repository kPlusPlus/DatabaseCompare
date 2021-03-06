SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/****** Object:  Stored Procedure dbo.spFetchSaldoPartner    Script Date: 8.1.2008 14:43:16 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[spFetchSaldoPartner]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[spFetchSaldoPartner]
GO





/****** Object:  Stored Procedure dbo.spFetchSaldoPartner    Script Date: 09.03.2005 18:29:28 *****
by mp */

CREATE    PROCEDURE [dbo].[spFetchSaldoPartner] 
@inAnalitikaID int

with recompile
AS

begin

SELECT 
	AnalitikaID,  Max(Analitika) As Analitika, 
	SUM (dbo.DokStavka.Iznos * (CASE 
	WHEN dp = 0 And Pozicija.Zatvaranje = 1  THEN -1
	WHEN dp = 1 And Pozicija.Zatvaranje = 1  THEN 1
	WHEN dp = 1 And Pozicija.Plac = 1  THEN 1
	WHEN dp = 0 And Pozicija.Plac = 1  THEN -1
	ELSE 0 END )) As Saldo
	, Max(Limit) As Limit, Max(Bonitet) As Bonitet,
	SUM (dbo.DokStavka.Iznos * (CASE 
	WHEN dp = 1 And Pozicija.Zatvaranje = 1  THEN 1
	WHEN dp = 1 And Pozicija.Plac = 1  THEN 1
	ELSE 0 END )) As Duguje,
	SUM (dbo.DokStavka.Iznos * (CASE 
	WHEN dp = 0 And Pozicija.Zatvaranje = 1  THEN 1
	WHEN dp = 0 And Pozicija.Plac = 1  THEN 1
	ELSE 0 END )) As Potrazuje,
	Min(Dokum.Datum) As DatumOd, 
	Max(Dokum.Datum) As DatumDo,
	Min(PozDatum) As ValutaOd, 
	Max(PozDatum) As ValutaDo
FROM dbo.DokStavka 
	INNER JOIN dbo.Analitika ON dbo.DokStavka.AnalitikaID = dbo.Analitika.ID
	INNER JOIN dbo.Pozicija ON dbo.DokStavka.Pozicija = dbo.Pozicija.Sifra
	INNER JOIN dbo.Dokum ON dbo.DokStavka.DokumID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokStart ON dbo.DokStavka.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.DokVrsta ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.PartnerStart ON dbo.Analitika.VezaID = dbo.PartnerStart.ID And dbo.Analitika.AnalitikaVrsta = 2
	LEFT OUTER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID
	LEFT OUTER JOIN dbo.DokStavkaPop ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavkaOrg
WHERE (Pozicija.Plac = 1 OR Pozicija.Zatvaranje = 1) 
	And ps = 0 And zk = 0 -- And ks = 1
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID -- , DokStart.ID



end

--


SELECT * FROM dbo.DokVrsta

GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

