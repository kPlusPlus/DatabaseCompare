create     trigger [dbo].[evid_dtrig] on [dbo].[evid] 
for  delete 
not for replication
as
set nocount on

if exists (select * from deleted
		inner join dbo.dokstart with(nolock) on deleted.listid = dbo.dokstart.listid
		left outer join dbo.dokpoprat with(nolock) on dbo.dokstart.id = dbo.dokpoprat.dokpopratid
		left outer join dbo.dokstart dsp with(nolock) on dbo.dokpoprat.dokumid = dsp.id
	where dokstart.knjizeno = 1 or dokstart.zakljuceno = 1 or dokstart.placeno = 1
		or dsp.knjizeno = 1 or dsp.zakljuceno = 1 or dsp.placeno = 1)
	begin
		raiserror 44445 n'
	the record can''t be deleted, 
	document exists in gl or 
	in payment or in specifications 
	or is sealed !
origin: evid_itrig '
    			rollback transaction
	end

if exists (select * from deleted
		inner join dbo.dokstart dsp with(nolock) on deleted.listid = dsp.listid
		inner join dbo.dokstart with(nolock) on dsp.listid = dbo.dokstart.listid
		where dsp.id <> dbo.dokstart.id) 
	begin
		raiserror 44445 n'
	the record can''t be deleted, 
	this document is not the single 
	in the documentation folder !!!
origin: evid_dtrig '
        		rollback transaction
	end

if exists (select * from deleted
		inner join dbo.dokstart with(nolock) on deleted.listid = dbo.dokstart.listid
		left outer join dbo.dokpoprat with(nolock) on dbo.dokstart.id = dbo.dokpoprat.dokumid 
		left outer join dbo.evidpoprat with(nolock) on dbo.dokpoprat.id = evidpoprat.dokpopid 
	where (deleted.autoins = 1 and evidpoprat.evidpop > 0) 
		or dokstart.knjizeno = 1 or dokstart.zakljuceno = 1 or dokstart.placeno = 1)
	begin
		raiserror 44445 n'
	the record can''t be deleted, 
	it was inserted by automatic,
	or document exists in gl or 
	in payment or is sealed !
origin: evid_dtrig '
        		rollback transaction
	end

if exists (select * from deleted
		inner join dbo.dokstart with(nolock) on deleted.listid = dbo.dokstart.listid
		inner join dbo.asokatalog with(nolock) on deleted.asokatalogid = dbo.asokatalog.id
		inner join dbo.asortiman with(nolock) on dbo.asokatalog.asortid = dbo.asortiman.id
		inner join dbo.asoutrosak with(nolock) on dbo.asortiman.id = dbo.asoutrosak.asortid
	where deleted.autoins = 1 and dokstart.dokvrsta = 73 and deleted.tip = 100)
	begin
		raiserror 44445 n'
	the record can''t be deleted, 
	product stil exists in document !
origin: evid_dtrig '
        		rollback transaction
	end