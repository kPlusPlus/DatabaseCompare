
CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci

CREATE  	procedure dbo.spProcZatezKmtObr

	@sdDatumObrade as smalldatetime,
	@inBrojDanaGrace int,
	@smNeIznosManjiOD money, 
	@inAnalitika2ID int,
	@inFirmaID int,
	@siKorisnikID int
as

declare
@greska int,
@AnalitikaID int,
@siVK smallint,
@ncBroj nchar(15),
@DokumID int,
@Godina smallint,
@opis nchar(20),
@PartnerID int,
@AdresaID int,
@siPdvStat smallint

declare @Evidencija table
(AnalitikaID int,
 PartnerID int,
 Dug money,
 Datum smalldatetime,	
 DokStavkaID int,
 DatumPlacanja smalldatetime,
 Placanje tinyint,
 DatumValute smalldatetime)

insert @evidencija
select analitikaID, PartnerID,IznosDuga,DatumValute,DokstavkaID,DatumValute,0,DatumValute from
dbo.vViewKupciDugovanja			

Declare @ObradaID int,
	@Korak int,
	@Text nvarchar(1000),
	@OK bit,
	@ErrorCount tinyint,
	@rc int,
	@start datetime,
	@stop datetime
DE0)

Set @korak=1
set @ErrorCount=0	

insert @evidencija
SELECT  vViewKupciDugovanja.AnalitikaID, vViewKupciDugovanja.PartnerID, vViewKupciDugovanja.IznosDuga -
        isnull((SELECT     SUM(ISNULL(P1.IznosPlacenog, 0))
        FROM          dbo.vViewKupciPlacanja AS P1
        WHERE      P1.DokStavkaID = P.DokStavkaID AND p1.DatumPlacanja <= p.DatumPlacanja),0)
	, isnull(P.DatumPlacanja,@sdDatumObrade),
	vViewKupciDugovanja.DokstavkaID,vViewKupciDugovanja.DatumValute,1,vViewKupciDugovanja.DatumValute
T OUTER JOIN
                      dbo.vViewKupciPlacanja P ON dbo.vViewKupciDugovanja.DokStavkaID = P.DokStavkaID

insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,
(select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1 order by datum) ,2,DatumValute from
@evidencija as e where placanje=0 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=0 
insert @evidencija
select AnalitikaID,PartnerID,Dug,Datum,DokStavkaID,

isnull((select top 1 Datum from @evidencija as e1 
where e1.DokStavkaID=e.DokstavkaID and e1.placanje=1  and e1.datum>e.datum order by e1.datum) 
,@sdDatumObrade)
,3,DatumValute from
@evidencija as e where placanje=1 
order by dokstavkaID,placanje,datum

delete from @evidencija where placanje=1
delete from @evidencija where Datum=@sdDatumObrade and datumPlacanja=@sdDatumObrade

set @godina= year(@sdDatumObrade)
set @siVk=(select  vk from dbo.dokvrsta where sifra=36)
set @opis=''

declare  SviKupci cursor for
SELECT AnalitikaID,PartnerID
from @evidencija 
where dateadd(day,@inBrojDanaGrace,DatumValute)<DatumPlacanja
and dug>= @smNeIznosManjiOD
group by AnalitikaID,PartnerID

open SviKupci
fetch nerom SviKupci into @AnalitikaID,@PartnerID

while @@Fetch_status=0
begin
set @ncBroj=(Select [dbo].[ncAutoGenDocCode] ((select id from cfg.dbo.host where name=host_name())
, 36, @godina,@siVk , @inFirmaID))
set @start=getdate()

begin transaction obrada
save transaction pocetak
			SET @siVK=13600

	INSERT INTO [dbo].[DokStart]( [ListID], 
		    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
		    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
		    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
	
	VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
		 0, 0, 0, 0,0, @siKorisnikID, 
		@inFirmaID, 0, 1)
	
	set @DokumID=(SELEOPE_IDENTITY())

	EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
	, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID

	eID,@inBrojDanaGrace,@smNeIznosManjiOD
	set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
	(select naziv from PartnerStart where ID=@PartnerID)

if @rc=0
	begin
	set @sipdvstat=24	set @AdresaID=(select top 1 ParAdresa.ID from dbo.ParAdresa where PartnerID=@PartnerID)
		INSERT [dbo].[Dokum]
			([DokumID], [Analitika1ID], [AdresaID], [Analitika2ID], [Analitika3ID], 
			[PDVStatus], [Datum], [alTimePI], [Odgoda], [KampanjaID], 
			[ValKod], [Tecaj])
		VALUES	 (@DokumId, @AnalitikaID, @AdresaID,@inAnalitika2ID , NULL, 
			  24, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1)
		update dbo.dokum set PDVStatus= @siPdvStat where dokumid= @DokumID
		
		set @greska=@@error		
		if @greska>0
 		begin
			rollback transaction pocetak
				SET @siVK=13610
			
				INSERT INTO [dbo].[DokStart]( [ListID], 
					    [DokVrsta], [VK], [Godina], [Broj], [Izvornik], 
					    [Placeno], [ZadRazd], [Zakljuceno], [OnHold], 
					    [Knjizeno], [AutoPredmet], [KorisnikID], [FirmaID], [Azuriranje], [Kontrola])
				
				VALUES (Null, 36, @siVK, year(@sdDatumObrade), @ncBroj, @opis, 0, 
					 0, 0, 0, 0,0, @siKorisnikID, 
					@inFirmaID, 0, 1)
				
				set @DokumID=(SELEOPE_IDENTITY())
			
				EXECUTE spZUpdateDokStart NULL, 36, @siVk, @godina, @ncBroj, @opis
				, 0, 0, 0, 0, 0, 0, @siKorisnikID, null,@inFirmaID, 0, 1, @DokumID
			
				eID,@inBrojDanaGrace,@smNeIznosManjiOD
				set @text='Regular Interests on ' + cast(@sdDatumObrade as nvarchar) + ' Partner :' + 
				(select naziv from PartnerStart where ID=@PartnerID)
			set @siPdvStat=0 
			EXEID , NULL, 0, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1
			EXEID , NULL, @siPdvStat, @sdDatumObrade,null, @sdDatumObrade,null, 0, NULL, 191, 1, @DokumID
			set @greska=@@error
			set @greska=0
		END

	set @tet) + ' succes'
	Set @ok = 1
	set @nvKoment=
	'Data Processing, Date=  '+ cast(@sdDatumObrade as nvarchar) +'
Grace Period = ' + cast(@inBrojDanaGrace as nvarchar) +' day(s), Grace Amount = ' + Cast(@smNeIznosManjiOD as nvarchar)
	EXEC [dbo].[spZInsertDokPad] @DokumID, @nvKoment, null, null, null, null, null, null,null, null,null
			if (select count(*) from dokstavka where dokumid=@dokumid and iznos <>0)>0
			BEGIN
			UPDATE DBO.DOKSTART SET KONTROLA=0
				WHERE ID=@DOKUMID
			        commit transaction obrada
			END
			else
			BEGIN
				rollback transaction obrada
			END
	end
else
	begin
	rollback transaction obrada
	set @tet) + ' failed, reason: Unbound payments'
	set @OK=0
	if @errorcount< set @errorcount=@errorcount+1
	end
set @stop=getdate()

RaisError (@text,0,1)  with LOG
set @Korak=@Korak+1
fetch nerom SviKupci into @analitikaId , @PartnerID

end
close SviKupci
deallocate SviKupci
