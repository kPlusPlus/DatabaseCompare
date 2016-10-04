
 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end

 ValutaDo
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
	And ps = 0 And zk = 0 
	And (SKK = 1 OR SKD = 1 OR (DokVrsta.Zatvaranje > 0 And DokStavkaPop.DokStavkaOrg > 0))
	And dbo.DokStavka.AnalitikaID = @inAnalitikaID
	And dbo.DokVrsta.Vrsta <> 101
GROUP BY DokStavka.AnalitikaID 

end
