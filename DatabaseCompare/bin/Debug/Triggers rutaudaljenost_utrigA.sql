create   trigger [rutaudaljenost_utrig] on [dbo].[rutaudaljenost] 
for update 
as

	
	if exists(select * from inserted 
		inner join dbo.rutaudaljenost on inserted.rutaid = dbo.rutaudaljenost.rutaid
					and inserted.udaljenostid = rutaudaljenost.udaljenostid
					and inserted.smjer = rutaudaljenost.smjer
		where inserted.id <> rutaudaljenost.id)

	begin
	raiserror 44445 '

you can''t insert same town twice 
in same route direction.

origin: rutaudaljenost_itrig
'
	rollback transaction
	end