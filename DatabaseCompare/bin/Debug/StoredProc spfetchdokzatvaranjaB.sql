
E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID

E WHEN dst.dp = dstz.dp THEN Abs(dstz.Iznos) ELSE dstz.Iznos END,
	az.Analitika AnalitikaZ

from dbo.DokStart ds WITH(NOLOCK)
	inner join dbo.DokStavka dst WITH(NOLOCK) on ds.ID = dst.DokumID
	inner join dbo.DokStavkaPop dsp WITH(NOLOCK) on dst.ID = dsp.DokStavka
	inner join dbo.DokStavka dstz WITH(NOLOCK)  on dsp.DokStavkaOrg = dstz.ID
	left outer join dbo.Analitika az WITH(NOLOCK)  on dstz.AnalitikaID = az.ID
	left outer join dbo.DokStart dsz WITH(NOLOCK)  on dstz.DokumID = dsz.ID
	left outer join dbo.Dokum dz WITH(NOLOCK) on dsz.ID = dz.DokumID
	left outer join dbo.DokVrsta dvz WITH(NOLOCK) on dsz.DokVrsta = dvz.Sifra

where ds.ID = @inDokumID
