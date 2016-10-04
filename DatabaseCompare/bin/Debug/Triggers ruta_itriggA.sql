create trigger [ruta_itrigg] on [dbo].[ruta] 
for insert 
as

	begin
	insert into dbo.listnad (skupdogadjaj, vezaid)
	select 21, inserted.id
	from inserted where inserted.koristi = 1
	end