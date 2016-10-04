
IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END

IF NOT (@inID IS NULL)
BEGIN
	SELECT *
	FROM dbo.vLookupDogadjajDokPoprat
	WHERE (vLookupDogadjajDokPoprat.[ID] = @inID) 
END
	

Iode IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE IF (@inType6 IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
				 		(vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type6 = @inType6) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
			  	  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
	 				  (vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.ode) AND
	 				  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.ode) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELEode
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.ode) AND 
					  ((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.
		END
	END

END

IF NOT (@nvName IS NULL)
BEGIN
	I IS NOT NULL)
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND 
					  (vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 And @sdType42) AND
				 		(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL) AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND 
						(vLookupDogadjajDokPoprat.Type4 BETWEEN @sdType41 AND @sdType42) AND
					  (vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END
	ELSE
	BEGIN
		I IS NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NOT NULL) AND (@inType3 IS NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
		I IS NULL)  AND (@inType3 IS NOT NULL)
		BEGIN
			SELECT ID, Name
			FROM dbo.vLookupDogadjajDokPoprat
			WHERE (vLookupDogadjajDokPoprat.Type1 = @tiType1) AND
						(vLookupDogadjajDokPoprat.Type3 = @inType3) AND
						(vLookupDogadjajDokPoprat.[Name] LIKE @nvName) AND 
						((@btEclusive = 0)
			ORDER BY vLookupDogadjajDokPoprat.[Name] DESC
		END
	END

END
