
E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END

E WHEN DokStavkaKnjiga.FirmaID IS NULL
			THEN DokStart.FirmaID
			ELSE DokStavkaKnjiga.FirmaID
			END, 
			dbo.DokStavka.ps,
			dbo.DokStavkaKnjiga.AnalitPCID 
	  IF @@ERROR <> 0 GOTO lRollback

		SELECT @nvTekst = 'formirana godišnja arhiva za dopunski kontni plan poduzeća'
	  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	END

	GOTO lCommit
lRollback:
  ROLLBATION
  RAISERROR 50004 'Undefined error while preparing accounting payrolls! '
	GOTO ExitError
lCommit:

  TION

	GOTO ExitSucces
ExitError:

	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = getdate(), 
			ErrorLevel = 
	WHERE ID = @inObradaID

	INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)

	RETURN -1

ExitSucces:

	SELECT @nvTekst = 'ZAVRŠETAK BEZ GREŠKE'
	PRINT @nvTekst

  UPDATE dbo.Obrada
	SET Stop = GETDATE(), 
			ErrorLevel = @tiErrorLevel
	WHERE ID = @inObradaID

  INSERT INTO dbo.ObradaLog (ObradaID, Tekst) VALUES (@inObradaID, @nvTekst)
	RETURN 1
END
