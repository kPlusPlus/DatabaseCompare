
create  trigger [dbo].[dokstavka_dtrig] on [dbo].[dokstavka] 
for delete 
not for replication
as
set nocount on

if exists (select *  from deleted where iznos <> 0)
begin

	if exists (select * from deleted 
			inner join dbo.dokstart ds with(nolock) on deleted.dokumid = ds.id
			left outer join dbo.glavknjiga with(nolock) on deleted.id = dbo.glavknjiga.dokstavkaid
			left outer join dbo.dokpoprat with(nolock) on deleted.dokumid = dbo.dokpoprat.dokpopratid
			left outer join dbo.dokstart with(nolock) on dbo.dokpoprat.dokumid = dbo.dokstart.id 
			left outer join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
		where (dbo.dokvrsta.vrsta in (6,8,9)			
			or (ds.knjizeno = 1 or ds.zakljuceno = 1 or ds.placeno = 1 or glavknjiga.dokstavkaid > 0)))
			begin
	    	    	raiserror 44445 n'
	the record can''t be deleted, 
	since exist in general ledger 
	or in payment or in specification 
	or in calculation or it is closed.
	
	origin: dokstavka_dtrig'
	      	  	rollback transaction
			end
end

if exists (select * from deleted 
		inner join  dbo.dokstart with(nolock) on deleted.dokumid = dbo.dokstart.id
		inner join  dbo.dokstart dsp with(nolock) on dbo.dokstart.listid = dsp.listid
	      where dokstart.id <> dsp.id)
begin

		delete dbo.dokstavka
		from deleted 
			inner join  dbo.dokstart on deleted.dokumid = dbo.dokstart.id
			inner join dbo.dokstart dsp on dbo.dokstart.listid = dsp.listid
			inner join dbo.dokstavka on dsp.id = dbo.dokstavka.dokumid
			left outer join dbo.dokstavka dokstavka_1 on dbo.dokstart.id = dokstavka_1.dokumid
		where dokstart.id <> dsp.id and dokstavka_1.dokumid is null 
			and dsp.knjizeno = 0 and dsp.zakljuceno = 0
end

if exists (select * from deleted 
				inner join dbo.dokstavkapop dsp with(nolock) on deleted.id = dsp.dokstavkaspec)
begin
	update dsp
	set dokstavkaspec = null
	from dbo.dokstavkapop dsp
		inner join deleted on dsp.dokstavkaspec=deleted.id
end

if exists (
	select * 
	from deleted del
		inner join dbo.dokstavkapop dstp with(nolock) on del.id = dstp.dokstavkaorg			
	where dstp.dokstavka > 0 
)
begin
	update dbo.dokstart set
		placeno = 0
	from deleted del
		inner join dbo.dokstavkapop dstp on del.id = dstp.dokstavkaorg
		inner join dbo.dokstavka dstd on dstp.dokstavka = dstd.id
		inner join dbo.dokstart ds on dstd.dokumid = ds.id
	where
		ds.placeno = 1
		
end