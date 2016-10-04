create trigger [dbo].[dogadjaj_utrig] on [dbo].[dogadjaj]
after update
as

if exists(select * from inserted where inserted.korisnikid <> (select [dbo].[inkorisnik]()))
    and exists(select * from cfg.dbo.korisnik with(nolock)	
		where cfg.dbo.korisnik.id = (select [dbo].[inkorisnik]())
			and cfg.dbo.korisnik.hierarchy <= 3) 
  begin
          raiserror 44445 '

	event can''t be updated, it''s not yours
	or you do not have hierarchy permision.

origin: dogadjaj_utrig'
          rollback transaction
  end

if exists(select * from inserted, niz with(nolock) where (inserted.dogvrsta = niz.dogvrsta 
	and (((niz.duzinahost = 0) and (inserted.hostid is null)) or
    ((niz.duzinahost > 0) and (inserted.hostid is not null)))
          )) 
  begin
          raiserror 44445 '
event can''t be added, hostid data doesn''t 
match event code definition found in niz.
origin: dogadjaj_utrig'
          rollback transaction
  end

if exists (select * from inserted
		inner join dbo.dogvrsta with(nolock) on inserted.dogvrsta = dbo.dogvrsta.sifra
		inner join dbo.list with(nolock) on inserted.listid = dbo.list.id
		left outer join dbo.evid with(nolock) on list.id = dbo.evid.listid
	where dbo.dogvrsta.kontrolagrupa > 0 and dbo.evid.listid is null)

begin
	insert into dbo.evid (listid, asokatalogid, obracjedinica, portarifid, 
		kolicina2, fakpopust, kolicina1, faktrosar, 
		fakcijena)
	select top 100 percent inserted.listid, 
		(select max(id) from asokatalog where asortid = dbo.asokontrola.asortid) as asokatalogid,
		dbo.asokontrola.obracjedinica, 0, 
		1, pragmin, pragmax, 0, 0
	from inserted
		inner join dbo.dogvrsta with(nolock) on inserted.dogvrsta = dbo.dogvrsta.sifra
		inner join dbo.asokontrola with(nolock) on dbo.dogvrsta.kontrolagrupa = dbo.asokontrola.kontrolagrupa
		inner join dbo.asortiman with(nolock) on dbo.asokontrola.asortid = dbo.asortiman.id
		inner join dbo.list with(nolock) on inserted.listid = dbo.list.id
		left outer join dbo.evid with(nolock) on list.id = dbo.evid.listid
	where dbo.dogvrsta.kontrolagrupa > 0 and dbo.evid.listid is null

	order by asortiman.sifra
option (keepfixed plan)
end

if exists (select * from inserted
		inner join dbo.dogvrsta with(nolock) on inserted.dogvrsta = dbo.dogvrsta.sifra
		inner join dbo.list with(nolock) on inserted.listid = dbo.list.id
		inner join dbo.evid with(nolock) on list.id = dbo.evid.listid
		inner join dbo.asokatalog with(nolock) on dbo.evid.asokatalogid = dbo.asokatalog.id
		inner join dbo.asokontrola with(nolock) on dbo.asokatalog.asortid = dbo.asokontrola.asortid
			and dbo.dogvrsta.kontrolagrupa = dbo.asokontrola.kontrolagrupa)
begin
	update dbo.dogadjaj
	set 	ocjena = case when isnull(cnk.izvan,0) > 0 then 0 else 1 end,
		obracjedinica = 90,
		vrijednost = case when isnull(cnk.izvan,0) > 0  
				then 100 
				else round(isnull(cnk.greske,0)  isnull(cast(rtrim(listnad.sifra) as money),1) * 100,4) 
				end
		or dogadjaj.obracjedinica <> 90
option (keepfixed plan)
end

if exists (select * from inserted
		inner join dbo.dogputnal  with(nolock) on inserted.id = dbo.dogputnal.dogadjajid)
begin

	update dbo.dogputnal
	set koldogvrijednost = case  
			when (round(cast(datediff (minute, datumod, datumdo) + 
	 			(caltimedo - caltimeod) as money)  60,1)) between 8 and 12 
			then 0.5 
			when (round(cast(datediff (minute, datumod, datumdo) + 
	 			(caltimedo - caltimeod) as money)  60,1)) > 24
			then round((round(cast(datediff (minute, datumod, datumdo) + 
	 			(caltimedo - caltimeod) as money)  24,0) +
				case 
				when (round(cast(datediff (minute, datumod, datumdo) + 
	 			(caltimedo - caltimeod) as money)  60,1))  60,1)) - 
				(round((round(cast(datediff (minute, datumod, datumdo) + 
	 			(caltimedo - caltimeod) as money)  24,0) * 24) > 12
				then 1
				else 0
				end	
			end
	from  inserted
		inner join dbo.dogputnal on inserted.id = dbo.dogputnal.dogadjajid
option (keepfixed plan)

	update dbo.dogputnal
	set ukupnoval = isnull(koldogvrijednost * dogvrijednost.iznos * dogputnal.tecaj, 0) 
	from  inserted
		inner join dbo.dogputnal on inserted.id = dbo.dogputnal.dogadjajid
		inner join dbo.dogvrijednost on dbo.dogputnal.dogvrijednostid = dbo.dogvrijednost.id

	update dbo.dogputtros 
	set iznos = isnull(kolicina * cijena,0)
	from  inserted
		inner join dbo.dogputnal on inserted.id = dbo.dogputnal.dogadjajid
		inner join dbo.dogputtros on inserted.id = dbo.dogputtros.dogadjajid
	where kolicina <> 0 and cijena <> 0
option (keepfixed plan)

	update dbo.dogadjaj
	set vrijednost = isnull(dogputnal.ukupnoval,0) + 
			isnull(dpt.uktros,0) - isnull((ads.iznos),0) 
	from inserted
		inner join dbo.dogadjaj on inserted.id = dbo.dogadjaj.id
		inner join dbo.dogputnal on inserted.id = dbo.dogputnal.dogadjajid
		left outer join dbo.dokstart on dbo.dogputnal.dokakontid = dbo.dokstart.id
		left outer join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid 
		left outer join dbo.valuta akontvaluta on dbo.dokum.valkod = akontvaluta.kod
		left outer join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		left outer join (select dokstavka.dokumid, sum(iznos) as iznos, sum(iznosval) as iznosval
					from dbo.dokstavka 
					where pozicija = 1000
					group by dokumid) 
			ads on dbo.dokum.dokumid = ads.dokumid
		left outer join (select inserted.id, sum(dogputtros.iznos) as uktros
				from inserted
					inner join dbo.dogputtros on inserted.id = dbo.dogputtros.dogadjajid
				group by inserted.id)
			dpt on inserted.id = dpt.id
	where dbo.dogadjaj.vrijednost <> isnull(dogputnal.ukupnoval,0) + isnull(dpt.uktros,0) - isnull((ads.iznos),0)
option (keepfixed plan)
end

if exists (select * from inserted
		inner join dbo.dogvrsta on inserted.dogvrsta = dbo.dogvrsta.sifra
		inner join dbo.obracjedinica on inserted.obracjedinica = dbo.obracjedinica.sifra
	where dogvrsta.obracjedinica = 1 and dogvrsta.caltime =1 
		and obracjedinica.obrjedgrupa = 5 
		and caltimeod > 0
		and caltimedo > 0 )

begin
	update dbo.dogadjaj
	set vrijednost = round(cast(datediff (minute, dogadjaj.datumod, dogadjaj.datumdo) + 
					(dogadjaj.caltimedo - dogadjaj.caltimeod) as money)  koef,1),
 60  60 
	         obracjedinica = case when analitika.analitika like n'%(none)%'
				then dogadjaj.obracjedinica
				else 50
				end
	from inserted
		inner join dbo.dogvrsta on inserted.dogvrsta = dbo.dogvrsta.sifra
		inner join dbo.obracjedinica on inserted.obracjedinica = dbo.obracjedinica.sifra
		inner join dbo.dogadjaj on inserted.id = dbo.dogadjaj.id
		inner join dbo.analitika on inserted.analitika1id = dbo.analitika.id
	where dbo.dogvrsta.obracjedinica = 1 and dbo.dogvrsta.caltime =1
		and obracjedinica.obrjedgrupa = 5  
		and dogadjaj.caltimeod > 0
		and dogadjaj.caltimedo > 0

		and dogadjaj.vrijednost <> round(cast(datediff (minute, dogadjaj.datumod, dogadjaj.datumdo) + 
			(dogadjaj.caltimedo - dogadjaj.caltimeod) as money)  koef,1) 
option (keepfixed plan)

 60  60 		
end

if exists (select * from inserted
		inner join dbo.dogvrsta with(nolock) on inserted.dogvrsta = dbo.dogvrsta.sifra
	where dogvrsta.vrsta = 3)
begin 

	update dbo.dogadjaj
	set zakljuceno = 1
	where 	dogadjaj.dogvrsta = 35 
		and datumod + 7 < getdate() 
		and zakljuceno = 0

	update dbo.dogadjaj
	set zakljuceno = 1
	from inserted
		inner join dbo.dogpoprat on inserted.id = dbo.dogpoprat.dogadjajid
		inner join dbo.dogadjaj on dbo.dogpoprat.dogpopratid = dbo.dogadjaj.id
	where 	inserted.dogvrsta = 35 
		and inserted.zakljuceno = 1

		and dogadjaj.dogvrsta in(30,31)
		and dogadjaj.zakljuceno = 0
end

if exists (select * from inserted
		inner join dbo.dogvrsta with(nolock) on inserted.dogvrsta = dbo.dogvrsta.sifra
	where dogvrsta.vrsta = 200 and evidshort = 1 and inserted.zakljuceno = 1 )
begin 
	delete dbo.evid
	from inserted
		inner join dbo.dogvrsta on inserted.dogvrsta = dbo.dogvrsta.sifra
		inner join dbo.evid on inserted.listid = dbo.evid.listid
		inner join dbo.asokatalog on dbo.evid.asokatalogid = dbo.asokatalog.id
		inner join dbo.asokontrola on dbo.asokatalog.asortid = dbo.asokontrola.asortid
			and dbo.dogvrsta.kontrolagrupa = dbo.asokontrola.kontrolagrupa
	where evid.faktrosar = 0 
		and dogvrsta.vrsta = 200
		and evidshort = 1

		and inserted.zakljuceno = 1 
option (keepfixed plan)
end

if exists (select * 	
				from inserted
				inner join dbo.dogvrsta with(nolock) on inserted.dogvrsta = dbo.dogvrsta.sifra
				inner join dbo.placanjeset with(nolock) on dbo.dogvrsta.placanjeset = dbo.placanjeset.sifra
				inner join dbo.pnb with(nolock) on dbo.placanjeset.sifra = dbo.pnb.placanjeset
				left outer join dbo.dogpozivbr with(nolock) on inserted.id = dbo.dogpozivbr.dogadjajid and dbo.pnb.pozivbrvrsta = dbo.dogpozivbr.pozivbrvrsta
				where  dbo.dogvrsta.pozivbr = 1 
							and (inserted.firmaid = dbo.pnb.firmaid or dbo.pnb.firmaid is null)
							and dbo.dogpozivbr.dogadjajid is null )
begin
	insert into dbo.dogpozivbr (dogadjajid, modulpnb, pnb, pozivbrvrsta)
	select inserted.id,
			 dbo.pnb.model ,
			pnb =  

						replace(	
								replace( 
									replace(
										replace(	
											 replace(dbo.pnb.broj,n'$(doctyp2)', isnull(inserted.dogvrsta, space(2))) , 
													n'$(year4)', isnull(inserted.godina, space(4))
												), n'$(fid)', isnull(inserted.firmaid, n'')
											), n'$(doc6)', isnull(right(rtrim(inserted.broj),6), space(6))
										), n'$(cntrl)', dbo.nvmodulo11(replace(
																			replace( 
																				replace(
																					replace(	
																						 replace(dbo.pnb.broj,n'$(doctyp2)', isnull(inserted.dogvrsta, space(2))) , 
																								n'$(year4)', isnull(inserted.godina, space(4))
																							), n'$(fid)', isnull(inserted.firmaid, n'')
																						), n'$(doc6)', isnull(right(rtrim(inserted.broj),6), space(6))
																					), n'$(cntrl)', n''
																				)
																		)
								),
			dbo.pnb.pozivbrvrsta

	from inserted
	inner join dbo.dogvrsta with(nolock) on inserted.dogvrsta = dbo.dogvrsta.sifra
	inner join dbo.placanjeset with(nolock) on dbo.dogvrsta.placanjeset = dbo.placanjeset.sifra
	inner join dbo.pnb with(nolock) on dbo.placanjeset.sifra = dbo.pnb.placanjeset
	left outer join dbo.dogpozivbr on inserted.id = dbo.dogpozivbr.dogadjajid and dbo.pnb.pozivbrvrsta = dbo.dogpozivbr.pozivbrvrsta
	where  dbo.dogvrsta.pozivbr = 1 
				and (inserted.firmaid = dbo.pnb.firmaid or dbo.pnb.firmaid is null)
				and dbo.dogpozivbr.dogadjajid is null
option (keepfixed plan)
end
