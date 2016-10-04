create  trigger [ole_dtrig] on dbo.ole 
for delete not for replication
as
set nocount on

delete ubs21ole.dbo.oleobjekt
from deleted 
inner join dbo.firma on deleted.firmaid = dbo.firma.id
inner join ubs21ole.dbo.oleobjekt oleo on dbo.firma.sifra = oleo.firmasifra
where deleted.id = oleo.oleid