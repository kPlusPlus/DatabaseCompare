/****** Object:  Stored Procedure dbo.spFetchSaldoPartner    Script Date: 09.03.2005 18:29:28 *****
by mp */
CREATE    PROCEDURE [dbo].[spFetchSaldoPartner] 
@inAnalitikaID int

with recompile
AS

begin
-- isto kao tbSaldoPartner- TREBA DRZATI USKLADJENO
SELECT 
	AnalitikaID,  Max(Analitika) As Analitika,
	SUM (dbo.DokStavka.Iznos * (CASE 

	WHEN dp = 0 And Pozicija.Zatvaranje = 1 THEN -1
--	WHEN dp = 0 And Pozicija.Zatvaranje = 1 And dbo.DokStavka.Iznos < 0  THEN 1
	WHEN dp = 1 And Pozicija.Zatvaranje = 1  THEN 1
	WHEN dp = 1 And Pozicija.Plac = 1  THEN 1
	WHEN dp = 0 And Pozicija.Plac = 1  THEN -1
	ELSE 0 END )) As Saldo, 

	Max(Limit) As Limit, Max(Bonitet) As Bonitet,

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
FROM dbo.DokStavka with (nolock)
	INNER JOIN dbo.Analitika WITH(NOLOCK)ON dbo.DokStavka.AnalitikaID = dbo.Analitika.ID
	INNER JOIN dbo.Pozicija WITH(NOLOCK)ON dbo.DokStavka.Pozicija = dbo.Pozicija.Sifra
	INNER JOIN dbo.Dokum with (nolock) ON dbo.DokStavka.DokumID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokStart with (nolock) ON dbo.DokStavka.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.DokVrsta WITH(NOLOCK)ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.PartnerStart WITH(NOLOCK)ON dbo.Analitika.VezaID = dbo.PartnerStart.ID
												And dbo.Analitika.AnalitikaVrsta = 2
	LEFT OUTER JOIN dbo.Partner WITH(NOLOCK)ON dbo.PartnerStart.ID = dbo.Partner.PartnerID
--	LEFT OUTER JOIN dbo.DokStavkaPop WITH(NOLOCK) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavka
WHERE DokStart.Kontrola = 0 And DokStart.Azuriranje = 0 -- ulaze samo dokumenti koji su kontrolirani - kv 20070518
	And (Pozicija.Plac = 1 OR Pozicija.Zatvaranje = 1) 
	And ps = 0 And zk = 0 -- And ks = 1
	And (SKK = 1 OR SKD = 1 OR Pozicija.Zatvaranje = 1)
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID 
--	And dbo.DokVrsta.Vrsta <> 101 
	And Pozicija.Sifra <> 2994 -- zatvaranja slip
	And DokVrsta.Vrsta < 100
 GROUP BY dbo.DokStavka.AnalitikaID

/* -- stara verzija
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
FROM dbo.DokStavka with(nolock)
	INNER JOIN dbo.Analitika with(nolock) ON dbo.DokStavka.AnalitikaID = dbo.Analitika.ID
	INNER JOIN dbo.Pozicija with(nolock) ON dbo.DokStavka.Pozicija = dbo.Pozicija.Sifra
	INNER JOIN dbo.Dokum with(nolock) ON dbo.DokStavka.DokumID = dbo.Dokum.DokumID
	INNER JOIN dbo.DokStart with(nolock) ON dbo.DokStavka.DokumID = dbo.DokStart.ID
	INNER JOIN dbo.DokVrsta with(nolock) ON dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
	INNER JOIN dbo.PartnerStart with(nolock) ON dbo.Analitika.VezaID = dbo.PartnerStart.ID And dbo.Analitika.AnalitikaVrsta = 2
	LEFT OUTER JOIN dbo.Partner with(nolock) ON dbo.PartnerStart.ID = dbo.Partner.PartnerID
	LEFT OUTER JOIN dbo.DokStavkaPop with(nolock) ON dbo.DokStavka.ID = dbo.DokStavkaPop.DokStavkaOrg
WHERE (Pozicija.Plac = 1 OR Pozicija.Zatvaranje = 1) 
	And ps = 0 And zk = 0 -- And ks = 1
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID -- , DokStart.ID

*/

end


GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO