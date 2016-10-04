
oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 

oCjenik_I_Trig'
    RETURN 

END

SET XACT_ABORT ON
BEGIN TRAN

IF @inPakListID = 0 OR @inPakListID IS NULL 
BEGIN 
	INSERT INTO dbo.PakList (Posiljalac, AnalitDostavljac)
			VALUES (@nvFirmaNaziv, @inAnalitDost)

	SET @inNoviPakListID = SCOPE_IDENTITY()

	UPDATE pd
	SET PakListID = @inNoviPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL
END
ELSE 
BEGIN

	UPDATE pd
	SET PakListID = @inPakListID
	FROM dbo.Paket p with(nolock)
	INNER JOIN dbo.PakDost pd on p.ID = pd.PaketID
	WHERE pd.DokumID > 0 
			and )) <= @sdDatum
			and pd.PakListID IS NULL

END 

COMMIT TRAN
SET XA

END 
