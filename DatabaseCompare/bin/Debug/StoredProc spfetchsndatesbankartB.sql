
BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END

BEGIN

	if @snDatum is null
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
	else
		SELECT
			dbo.Dokum.Datum,
			dbo.Dokum.DatumPI,
			dbo.BanKart.ID BanKartID		
	
		FROM				dbo.DokStart
		INNER JOIN	dbo.Dokum ON dbo.DokStart.ID = dbo.Dokum.DokumID
		INNER JOIN	dbo.Analitika ON dbo.Dokum.Analitika2ID = dbo.Analitika.ID
		INNER JOIN	dbo.Racun ON dbo.Analitika.VezaID = dbo.Racun.ID
		INNER JOIN	dbo.BanKart ON dbo.Racun.BanKartID = dbo.BanKart.ID
	
		WHERE
			dbo.Dokum.DokumID = @inNalogID AND dbo.DokStart.DokVrsta = 86
			and dbo.Dokum.DatumPI >= @snDatum

END
