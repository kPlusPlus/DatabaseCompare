
EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off

EDURE [dbo].[spProcPromKupSponzor_Email]
@inAnalitika3ID int, 
@inAnalitika2ID int = NULL, 
@sdDatum smalldatetime = NULL 

AS

set nocount on

declare 
	@nvDatum1PM nvarchar(14),
	@nvDatum1 nvarchar(14),
	@nvDatum2 nvarchar(14),
	@sdDatum1PM smalldatetime,
	@sdDatum1 smalldatetime,
	@sdDatum2 smalldatetime,

	@nvMjesecPM nvarchar(7),
	@nvMjesec nvarchar(7)

exec dbo.spProcResolveDefaults N'$(BLM)', @nvDatum1PM  output , @sdDatum 
exec dbo.spProcResolveDefaults N'$(BOM)', @nvDatum1  output , @sdDatum 
e  output , @sdDatum 

select
	@sdDatum1PM = cast(substring(@nvDatum1PM,3,10) as smalldatetime),
	@sdDatum1 = cast(substring(@nvDatum1,3,10) as smalldatetime),
	@sdDatum,3,10) as smalldatetime)

select 
	@nvMjesecPM = substring(@nvDatum1PM, 3,7),	
	@nvMjesec = substring(@nvDatum1, 3,7)

declare @tbP table (
	AnalitikaSponzorID int,
	Sponzor nvarchar(100),
	Partner nvarchar(200) null ,
	AdresaDostave nvarchar(400) null,
	KanalProdaje nvarchar(100) null,
	KolicinaPM money null, 
	UkupnoPM money null, 
	UkupnoValPM money null, 
	UkPoCjenikuPM money null, 
	UkBezPorPM money null, 
	UkPopustPM money null, 
	Kolicina money null, 
	Ukupno money null, 
	UkupnoVal money null, 
	UkPoCjeniku money null, 
	UkBezPor money null, 
	UkPopust money null, 
	grp tinyint null
)

insert @tbP
SELECT   

	(a3.ID) AnalitikaSponzorID,

	(a3.Analitika) Analitika,
	POSN.Naziv + ', ' + POSN.ParMB Partner,
	AdresaDostave = CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje,
	KolicinaPM = sum (0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkupnoPM = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoValPM = Sum (993) And ks = 1 and dbo.Dokum.Datum < @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPorPM = Sum (010) 
							And ks = 1  and dbo.Dokum.Datum < @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopustPM = sum (0  and dbo.Dokum.Datum < @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END) ,
	Kolicina =  sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	Ukupno = Sum (993
					or Pozicija BETWEEN 1004) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.Iznos ELSE 0 END),

	UkupnoVal = Sum (993) And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN dbo.DokStavka.IznosVal ELSE 0 END),
	UkPo0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	UkBezPor = Sum (010) 
							And ks = 1 and dbo.Dokum.Datum >= @sdDatum1 THEN (dbo.DokStavka.Iznos) ELSE 0 END),
	UkPopust = sum (0 and dbo.Dokum.Datum >= @sdDatum1 THEN  (dbo.DokStavka.Iznos) ELSE 0 END),
	1 grp

from dbo.DokStart
inner join dbo.Dokum on dbo.DokStart.ID = dbo.Dokum.DokumId
inner join dbo.DokStavka on dbo.Dokum.DokumID = dbo.DokStavka.DokumId
inner join dbo.DokVrsta on dbo.DokStart.DokVrsta = dbo.DokVrsta.Sifra
INNER JOIN dbo.tbirmaID 
INNER JOIN dbo.Analitika Analitika_1 ON dbo.Dokum.Analitika1ID = Analitika_1.ID
inner join dbo.PartnerStart on Analitika_1.VezaID=dbo.PartnerStart.ID and Analitika_1.AnalitikaVrsta = 2
INNER JOIN dbo.Analitika Analitika_.ID
LE 
LEFT OUTER JOIN ( 
	SELECT     
		dbo.Analitika.ID AS ParAnalitikaID, 
		dbo.Partner.Sifra,
		RTRIM(dbo.PartnerStart.Naziv) AS Naziv, dbo.Partner.MB AS ParMB,  
		dbo.ParAdresa.ID AS AdresaID, 
		ParGrupa.Tekst As KanalProdaje,
		RTRIM(ISNULL(dbo.ParAdresa.Adresa,' ')) AS ParAdresa, 
		RTRIM(ISNULL(dbo.Posta.Sifra, ' ')) + ' ' + RTRIM(dbo.Posta.Naziv) AS Posta, 
		dbo.ParAdresa.Vrsta AS ParAdresaVrsta,
		SponzorID = CASE WHEN PAS.SponzorAdr IS NULL 
			then Sponzor.ID	
			else PAS.SponzorID
			end,
		Sponzor = CASE WHEN PAS.SponzorAdr IS NULL 
			THEN RTRIM(Sponzor.Naziv)
			ELSE PAS.SponzorAdr
			END,
		AdresaSjediste, PostSjediste, DrzavaSjediste
	FROM  dbo.ParAdresa
	inner join dbo.PartnerStart on dbo.ParAdresa.PartnerID = dbo.PartnerStart.ID
	INNER JOIN dbo.ParGrupa ON dbo.PartnerStart.ParGrupa = dbo.ParGrupa.Sifra 
	INNER JOIN dbo.Analitika ON dbo.PartnerStart.ID = dbo.Analitika.VezaID and dbo.Analitika.AnalitikaVrsta = 2
	INNER JOIN dbo.Partner ON dbo.PartnerStart.ID = dbo.Partner.PartnerID 

	LEFT OUTER JOIN dbo.Naselje ON dbo.ParAdresa.NaseljeID = dbo.Naselje.ID 
	LEFT OUTER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
	LEFT OUTER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID 
	LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.Partner.ParNad = Sponzor.ID 
	LEFT OUTER JOIN ( 
		SELECT  
			dbo.ParAdresa.PartnerID, 
			dbo.ParAdresa.Adresa As AdresaSjediste,
			RTRIM(dbo.Posta.Sifra) + ' ' + RTRIM(dbo.Naselje.Naziv) As PostSjediste,
			RTRIM(dbo.Drzava.Naziv) As DrzavaSjediste,
			Sponzor.ID SponzorID,
			RTRIM(Sponzor.Naziv) AS SponzorAdr
		FROM dbo.ParAdresa
		INNER JOIN dbo.Naselje  ON ParAdresa.NaseljeID = dbo.Naselje.ID 
		INNER JOIN dbo.Posta ON dbo.Naselje.PostaID = dbo.Posta.ID 
		INNER JOIN dbo.Drzava ON dbo.Posta.DrzavaID = dbo.Drzava.ID
		LEFT OUTER JOIN dbo.PartnerStart Sponzor ON dbo.ParAdresa.ParNad = Sponzor.ID 
		WHERE  dbo.ParAdresa.Vrsta = 2 
	) PAS ON dbo.PartnerStart.ID = PAS.PartnerID

) POSN ON dbo.Dokum.AdresaID = POSN.AdresaID 

LEFT OUTER JOIN dbo.Analitika Analitika_3 ON dbo.Dokum.Analitika3ID = Analitika_3.ID
LEFT OUTER JOIN dbo.tbDokDispozicija() tbDokDispozicija ON dbo.DokStart.ID = tbDokDispozicija.DokumID 
WHERE     
	dbo.DokVrsta.SKK = 1
	And Analitika_1.AnalitikaVrsta = 2 
	And DokVrsta.Sifra <> 150
	And Analitika_ID end
	and dbo.Dokum.Datum Between @sdDatum1PM And @sdDatum2
	and dbo.DokVrsta.Knjizenje = 1

GROUP BY 

 	a3.ID,
 	a3.Analitika,
	POSN.Naziv + ', ' + POSN.ParMB,
	CASE WHEN NOT(tbDokDispozicija.AdresaDisp IS NULL)
		THEN RIGHT(tbDokDispozicija.AdresaDisp+', '+tbDokDispozicija.NaseljeDisp, 
		LEN(tbDokDispozicija.AdresaDisp +', ' + tbDokDispozicija.NaseljeDisp)-13)
		ELSE RTRIM (POSN.ParAdresa) + ', ' + RTRIM(POSN.Posta)
		END,
	POSN.KanalProdaje

if @inAnalitika3ID is null 
begin

	select 
		N'Promet po sponzorima',
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbS table (
		Sponzor nchar(30) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbS
	select	
		N'Sponzor' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec  ,
		N'Uk. bez por. ' +  @nvMjesec  ,
		N'Uk. po cjeniku ' +  @nvMjesec  ,
		N'Uk. popust ' +  @nvMjesec  ,
		N'Kolicina ' +  @nvMjesec  ,
		1

	insert @tbS
	select
		left(isnull(Sponzor, N''),30) Sponzor,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		2
	from @tbP	
	where grp = 1
	group by Sponzor

	insert @tbS
	select
		N'TOTAL' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where grp = 1

	select 
		Sponzor ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbS
	order by grp
end			
else 
begin

	select 
		(select top 1 Analitika from dbo.Analitika where ID = @inAnalitika3ID),
		@nvMjesecPM + N', ' + @nvMjesec

	select
		N'Datum izvješća:',
		convert(nvarchar, getdate(), 104)

	declare @tbSS table (
		Sponzor nchar(30) null,
		Partner nchar(50) null,
		AdresaDostave nchar(50) null,
		KanalProdaje nchar(50) null,
		UkupnoPM nchar(30) null,
		UkupnValPM  nchar(30) null,
		UkBezPorPM nchar(30) null,
		UkPoCjenikuPM nchar(30) null,
		UkPopustPM nchar(30) null,
		KolicinaPM nchar(30) null,
		Ukupno nchar(30) null,
		UkupnoVal nchar(30) null,
		UkBezPor nchar(30) null,
		UkPoCjeniku nchar(30) null,
		UkPopust nchar(30) null,
		Kolicina nchar(30) null	,
		grp tinyint null
	)

	insert @tbSS
	select	
		N'Sponzor' ,
		N'Partner' ,
		N'Adresa dostave' ,
		N'Kanal prodaje' ,
		N'Ukupno ' +  @nvMjesecPM ,
		N'Ukupno val. ' +  @nvMjesecPM ,
		N'Uk. bez por. ' +  @nvMjesecPM ,
		N'Uk. po cjeniku ' +  @nvMjesecPM ,
		N'Uk. popust ' +  @nvMjesecPM ,
		N'Količina ' +  @nvMjesecPM ,
		N'Ukupno ' +  @nvMjesec ,
		N'Ukupno val. ' +  @nvMjesec ,
		N'Uk. bez por. ' +  @nvMjesec ,
		N'Uk. po cjeniku ' +  @nvMjesec ,
		N'Uk. popust ' +  @nvMjesec ,
		N'Kolicina ' +  @nvMjesec ,
		1

	insert @tbSS
	select 
		left(Sponzor,30) Sponzor,
		left(Partner,50) Partner,
		left(AdresaDostave,50) AdresaDostave,
		left(KanalProdaje,50) KanalProdaje,
		cast(UkupnoPM as nvarchar) UkupnoPM, 
		cast(UkupnoValPM as nvarchar) UkupnoValPM, 
		cast(UkBezPorPM as nvarchar) UkBezPorPM, 
		cast(UkPojenikuPM, 
		cast(UkPopustPM as nvarchar) UkPopustPM, 
		isnull(cast( KolicinaPM as nvarchar) , ' ') KolicinaPM,
		cast(Ukupno as nvarchar) Ukupno, 
		cast(UkupnoVal as nvarchar) UkupnoVal, 
		cast(UkBezPor as nvarchar) UkBezPor, 
		cast(UkPojeniku, 
		cast(UkPopust as nvarchar) UkPopust, 
		isnull(cast( Kolicina as nvarchar) , ' ') Kolicina	 ,
		2
	from @tbP
	where AnalitikaSponzorID = @inAnalitika3ID

	

	insert @tbSS
	select
		N'' ,
		N'TOTAL' ,
		Sponzor ,
		N'' ,
		cast(sum(UkupnoPM) as nvarchar) UkupnoPM, 
		cast(sum(UkupnoValPM) as nvarchar) UkupnoValPM, 
		cast(sum(UkBezPorPM) as nvarchar) UkBezPorPM, 
		cast(sum(UkPojenikuPM, 
		cast(sum(UkPopustPM) as nvarchar) UkPopustPM, 
		cast(sum(KolicinaPM) as nvarchar) KolicinaPM,
		cast(sum(Ukupno) as nvarchar) Ukupno, 
		cast(sum(UkupnoVal) as nvarchar) UkupnoVal, 
		cast(sum(UkBezPor) as nvarchar) UkBezPor, 
		cast(sum(UkPojeniku, 
		cast(sum(UkPopust) as nvarchar) UkPopust, 
		cast(sum(Kolicina) as nvarchar) Kolicina,
		3
	from @tbP	
	where AnalitikaSponzorID = @inAnalitika3ID
	group by
		Sponzor
	

	select

		Partner ,
		AdresaDostave ,
		KanalProdaje ,
		UkupnoPM ,
		UkupnValPM  ,
		UkBezPorPM ,
		UkPoCjenikuPM ,
		UkPopustPM ,
		KolicinaPM ,
		Ukupno ,
		UkupnoVal ,
		UkBezPor ,
		UkPoCjeniku ,
		UkPopust ,
		Kolicina 
	from @tbSS	
	order by grp
end

set nocount off
