create      trigger [dbo].[dokstavka_iutrig_kredit] on [dbo].[dokstavka] 
for insert, update
as
set nocount on

if exists(select * from inserted)
begin

	

	if exists (select * from inserted i inner join dbo.analitika a on i.analitikaid = a.id where a.analitikavrsta = 31)
	begin
		if exists(select *
				from inserted
					inner join dbo.dokstart with(nolock) on inserted.dokumid = dbo.dokstart.id
					inner join dbo.analitika with(nolock) on inserted.analitikaid = dbo.analitika.id and dbo.analitika.analitikavrsta=31
					inner join dbo.kredit with(nolock) on dbo.analitika.vezaid = dbo.kredit.id 
					inner join dbo.konto with(nolock) on inserted.kontoid = dbo.konto.id 
					inner join dbo.konto kontoglav with(nolock) on dbo.kredit.kontoglav = kontoglav.id
					inner join dbo.konto kontokamate with(nolock) on dbo.kredit.kontokamate=kontokamate.id
					where inserted.ks = 1 and dbo.dokstart.dokvrsta not in (150,99) 

						and 		(left(dbo.konto.sifra,7) <> 
								(case when (inserted.kontoid <> dbo.kredit.kontoglav)
								then left(kontoglav.sifra,7)
								else left(dbo.konto.sifra,7)
								end)
								or inserted.kontoid	<>
								(case when (inserted.kontoid = dbo.kredit.kontoglav)
								then dbo.kredit.kontoglav
								else inserted.kontoid
								end)) 

						and		(left(dbo.konto.sifra,7) <>
								(case when (inserted.kontoid <> dbo.kredit.kontokamate)
								then left(kontokamate.sifra,7)
								else left(dbo.konto.sifra,7)
								end)	
								or inserted.kontoid	<>
									(case when (inserted.kontoid = dbo.kredit.kontokamate)
								then dbo.kredit.kontokamate
									else inserted.kontoid
									end)) )
				begin
					raiserror 44445 '
			
				the record can''t be updated,
				loan or interest account is wrong! 

				origin: dokstavka_iutrig_kredit'
					rollback transaction
				end
	end

end