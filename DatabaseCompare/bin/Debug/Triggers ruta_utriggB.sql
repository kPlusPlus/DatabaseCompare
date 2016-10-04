
create  trigger [ruta_utrigg] on [dbo].[ruta] 
for update 
as

if not exists (select * from inserted
			inner join dbo.listnad on inserted.id = dbo.listnad.vezaid
		where dbo.listnad.skupdogadjaj = 21 and inserted.koristi = 1)
	begin
	insert into dbo.listnad (skupdogadjaj, vezaid)
	select 21, inserted.id
	from inserted where inserted.koristi = 1
	end