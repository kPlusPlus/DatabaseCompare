create trigger [dbo].[dokstavkapop_utrigkontrola] on [dbo].[dokstavkapop]
after update not for replication
as
set nocount on

if exists (select * from inserted)
begin

	if exists (select * from inserted where inserted.dokstavka > 0)
	begin

	if exists (select * from inserted
			inner join dbo.dokstavka with(nolock) on inserted.dokstavkaorg = dbo.dokstavka.id
			inner join dbo.dokstavka dokstavka_1 with(nolock) on inserted.dokstavka = dokstavka_1.id
		where dokstavka.kontoid > 0 
			and dokstavka.analitikaid > 0 
			and inserted.dokstavka > 0
			and dokstavka.protuid is null 
		and (dbo.dokstavka.kontoid <> dokstavka_1.kontoid
		or dbo.dokstavka.analitikaid <> dokstavka_1.analitikaid

		or (dbo.dokstavka.dp = dokstavka_1.dp and ((dbo.dokstavka.iznos < 0 and dokstavka_1.iznos < 0) 
		or (dbo.dokstavka.iznos > 0 and dokstavka_1.iznos > 0)))

		or (dbo.dokstavka.dp <> dokstavka_1.dp and ((dbo.dokstavka.iznos < 0 and dokstavka_1.iznos > 0) 
		or (dbo.dokstavka.iznos > 0 and dokstavka_1.iznos < 0)))))
		begin
        		raiserror 44445 '300561

	the record can''t be updated, 
	credit or debit problem !!!
	origin:  dokstavkapop_utrigkontrola
	'
        		rollback transaction
		end
	end
end