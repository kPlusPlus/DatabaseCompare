create trigger [dbo].[glavknjiga_dtrig] on [dbo].[glavknjiga]
after delete not for replication
as
set nocount on

if  exists (select * from deleted where (select  [dbo].[sikorisnikhier] ()) < 3)
	begin
        	raiserror 44445 '
glavknjiga_dtrig: 

the record can''t be deleted. 
document exist in gl
and user don''t have permision
for delete gl entry!

origin: glavknjiga_dtrig'
         	rollback transaction
	end

if exists (select * from deleted where knjiga < (select zakljucak from dbo.firma with(nolock) 
			inner join dbo.tbfetchfirma() tbfetchfirma on dbo.firma.id = tbfetchfirma.firmaid)
		or knjiga2 < (select zakljucak2 from dbo.firma with(nolock) 
			inner join dbo.tbfetchfirma() tbfetchfirma on dbo.firma.id = tbfetchfirma.firmaid))
	begin
        raiserror 44445 n'

the record can''t be deleted. 
since gl entry date <  limit date.

origin: glavknjiga_dtrig'
        rollback transaction
	end
