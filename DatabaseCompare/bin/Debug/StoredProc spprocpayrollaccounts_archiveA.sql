
tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END

tavke.ObrSifraID = dbo.ObrSifraDatum.ID
	INNER JOIN	dbo.ObrSifra ON dbo.ObrSifraDatum.ObrSifra = dbo.ObrSifra.Sifra
	INNER JOIN	dbo.Obustave ON dbo.ObrSifraDatum.ID = dbo.Obustave.ObrSifraID
	WHERE dbo.ObrSifra.ObrSifraVrsta IN (1800) and dbo.List.ListNadID = @inListNadID
  IitError

	SELECT @nvTekst = 'A×uriran saldo i broj rata kredita'
  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	PRINT @nvTekst

	UPDATE dbo.DokStart
	SET Zakljuceno = 1
	FROM	dbo.DokStart
	INNER JOIN	dbo.List ON dbo.DokStart.ListID = dbo.List.ID
	WHERE	(dbo.List.ListNadID = @inListNadID)
  IitError

	GOTO ExitSucces
ExitError:

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID
	RETURN -1

ExitSucces:

	PRINT 'zavrÜetak bez greÜke'

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  RETURN 0
END
