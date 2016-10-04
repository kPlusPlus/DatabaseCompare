
create      trigger [dbo].[dokpoprat_itrig] on [dbo].[dokpoprat] 
for insert
as

if  exists (select * from inserted
			inner join dbo.dokstart ds on inserted.dokumid = ds.id
		 where (ds.knjizeno = 1 or ds.zakljuceno = 1 or ds.placeno = 1)
			and ds.dokvrsta <> 100)
	begin
        raiserror 44445 '

	the record can''t be inserted
	specification is closed!

	origin: dokpoprat_itrig'
        rollback transaction
	end

if  exists (select * from inserted
            inner join dbo.dokstart on inserted.dokpopratid = dbo.dokstart.id
			left outer join dbo.verifikacija on inserted.dokpopratid = dbo.verifikacija.dokumid
		 where (dbo.verifikacija.dokumid > 0 and dbo.verifikacija.verificirao is null
				and dokstart.dokvrsta not in (112,110,136))  
				or azuriranje = 1 or kontrola = 1  
				) 
	begin
        raiserror 44445 '

	the document can''t be inserted.
	some of accompanied documents 
	didn''t pass control or
	verification missing!

	origin: dokpoprat_itrig'
       rollback transaction
	end