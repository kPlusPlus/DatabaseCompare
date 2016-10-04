
DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 

DECLARE @KorisnikID int
		SET @KorisnikID = (SELEG.dbo.Korisnik WHERE RTRIM(LoginName) = suser_sname())

I > 0) 
begin 

	I > 0) 
		BEGIN

		IF NOT (@inID IS NULL) 
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
ELSE
begin 
	IROM dbo.AnalitikaVrsta WHERE KoRes = 1 And Sifra = @tiType ) 
	begin 
		IF NOT (@inID IS NULL)
			BEGIN
			SELECT *
			FROM dbo.vLookupAnalitika
			WHERE vLookupAnalitika.[ID] = @inID
			END

		Iode IS NULL)
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
					INNER JOIN dbo.AnalitKorisnik ON dbo.vLookupAnalitika.ID = dbo.AnalitKorisnik.AnalitikaID
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
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.ode) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.Code
				END
			ELSE
				BEGIN
				SELEode
				FROM dbo.vLookupAnalitika
				WHERE vLookupAnalitika.ode  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.Code
				END

		IF NOT (@nvName IS NULL)
			IF (@tiType IS NULL)
				BEGIN
				SELECT ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName) AND (vLookupAnalitika.Koristi = 1)
				ORDER BY vLookupAnalitika.[Name]
				END
			ELSE
				BEGIN
				SELECT TOP 100 ID, [Name]
				FROM dbo.vLookupAnalitika
				WHERE (vLookupAnalitika.[Name] LIKE @nvName)  
					AND (vLookupAnalitika.Koristi = 1)
					And  (vLookupAnalitika.Type = @tiType OR vLookupAnalitika.Type = 0)
				ORDER BY vLookupAnalitika.[Name]
				END
		end 
end 
