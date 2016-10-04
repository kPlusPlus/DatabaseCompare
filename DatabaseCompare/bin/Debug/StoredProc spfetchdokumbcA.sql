
 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID

 nvarchar) + N'-' + rtrim(ds.Broj) + N' (' + isnull(rtrim(ds.Izvornik),N'') + N')' DokBroj
	,dpb.PNB
	,d.Datum
	,d.DatumPI
	,a1.Analitika Analitika1
	,a
	,a3.Analitika Analitika3
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) DokumIznos
	,dbo.[moDokStavkaIznos](dpb.DokumID,1000,null) - dbo.moSaldoDok(dpb.DokumID) DokumPlaceno
	,dpad.Koment
from dbo.DokStart ds  with (nolock) 
	left outer join dbo.DokPozivBr dpb  with (nolock) on ds.ID = dpb.DokumID 
	inner join dbo.DokVrsta dv on ds.DokVrsta = dv.Sifra
	inner join dbo.Dokum d  with (nolock) on dpb.DokumID = d.DokumID
	inner join dbo.Analitika a1  with (nolock) on d.Analitika1ID = a1.ID
	inner join dbo.Analitika a.ID
	left outer join dbo.Analitika a3  with (nolock) on d.Analitika3ID = a3.ID
	left outer join dbo.DokPad dpad  with (nolock) on dpb.DokumID = dpad.DokumID
where ds.ID = @inDokumID
