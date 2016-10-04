
DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 

DECLARE @KorisnikID int
SET @KorisnikID = (SELEK) WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
 begin 

	IK) WHERE Pod = 1 And KoRes = 1 And Sifra = @tiType) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And vLookupAnalitika.Type
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END
		END

	ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
ELSE
 begin 
	IK) WHERE Pod = 0 And KoRes = 1 And Sifra = @tiType) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			K)
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.ode 
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
				BEGIN
				SELECT TOP 100 vLookupAnalitika.ID, [Name]
				K)
					INNER JOIN dbo.AnalitKorisnik WITH(NOLOCK) ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
					INNER JOIN G.dbo.Korisnik.ID
				WHERE vLookupAnalitika.[Name] LIKE @nvName
					And vLookupAnalitika.Type = @tiType
					And G.dbo.Korisnik.ID = @KorisnikID
					AND vLookupAnalitika.Koristi = 1
				ORDER BY vLookupAnalitika.[Name]
				END

		end 
		ELSE
		begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE (vLookupAnalitika.[ID] = @inID) 
			END

		Iode IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELEode
				K)
				WHERE (vLookupAnalitika.ode) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				K)
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) 
					AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				K)
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
 end 
