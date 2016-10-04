
create  trigger [dbo].[bankart_utrig_analitika] on [dbo].[bankart]
for update  
not for replication

as

update dbo.analitika
set analitika = rtrim(rtrim(inserted.naziv) + n', ' + cast(inserted.filijala as nvarchar(10)) + n', ' + isnull(rtrim(inserted.racun),'')),
	analitkoristi = inserted.koristi  
from inserted
where analitika.vezaid = inserted.id and analitika.analitikavrsta = 3		

if update (broj)
	begin
	update dbo.analitika
		set analitika = rtrim(rtrim(inserted.broj) + n'-' + rtrim(racun.racun))
		from inserted 
		inner join dbo.racun on inserted.id = dbo.racun.bankartid
		inner join dbo.analitika on dbo.racun.id = dbo.analitika.vezaid
		inner join dbo.analitika analitika_1 on dbo.racun.analitikaid = analitika_1.id
	where ( analitika.analitikavrsta = 11 and analitika_1.analitikavrsta = 99)
	end