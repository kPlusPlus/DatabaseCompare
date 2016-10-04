create trigger [dbo].[dokstavka_iutrig_kredit] on [dbo].[dokstavka]
after insert, update
as
set nocount on

if exists(select * from inserted)
begin

	if exists (select * from inserted i inner join dbo.analitika a with(nolock) on i.analitikaid = a.id where a.analitikavrsta = 31)
	begin
		if exists(select *
				from inserted
					inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
					inner join dbo.analitika with(nolock) on inserted.analitikaid = dbo.analitika.id and dbo.analitika.analitikavrsta=31
					inner join dbo.kredit with(nolock) on dbo.analitika.vezaid = dbo.kredit.id 
					where inserted.ks = 1 and dbo.dokstart.dokvrsta not in (150,99) 
							and inserted.kontoid <> dbo.kredit.kontoglav 
							and inserted.kontoid <> dbo.kredit.kontokamate )	

				begin
					raiserror 44445 '
			
				the record can''t be updated,
				loan or interest account is wrong! 

				origin: dokstavka_iutrig_kredit'
					rollback transaction
				end
	
	end

end