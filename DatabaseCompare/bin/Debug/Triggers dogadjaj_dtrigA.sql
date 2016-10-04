
create    trigger [dbo].[dogadjaj_dtrig] on [dbo].[dogadjaj] 
for delete

as

if exists(select * from deleted where deleted.korisnikid <> (select [dbo].[inkorisnik]()))
    and exists(select * from deleted where (select  [dbo].[sikorisnikhier] ()) < 3) 
  begin
          raiserror 44445 '

	event can''t be deleted, it''s not yours
	or you do not have hierarchy permision.

origin: dogadjaj_itrig'
          rollback transaction
  end

delete ov
from dbo.oleveza ov
	inner join deleted d on ov.olevezaid = d.id and ov.olevezavrsta = 17