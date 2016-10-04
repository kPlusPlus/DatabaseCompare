
create       trigger [listvrstplac_utrigg] on [dbo].[listvrstplac] 
for update
as

if exists(select * from inserted 
			left outer join dbo.pozicija on inserted.pozicijazat = dbo.pozicija.sifra
			left outer join dbo.analitika on inserted.analitzat = dbo.analitika.id
		where (inserted.analitzat > 0 and analitikavrsta <> 3) 
			or (inserted.analitzat > 0 and pozicija.zatvaranje = 0)
			or (inserted.analitzat > 0 and pozicija.analitvrstadod is null)
			or (inserted.analitzat is null and pozicijazat > 0 and pozicija.zatvaranje = 0)) 
	begin
		raiserror 44447 n'
listvrstplac_utrig:

the record can''t be inserted. 
analitic or pozition is wrong!'
		rollback transaction
	end

begin
	update dbo.listnad
	set skupdogadjaj = inserted.skupdogadjaj, 
		listvrstplac = inserted.sifra, 
		analitikaid = inserted.analitzat,
		koristi = inserted.koristi
	from inserted 
		inner join deleted on inserted.sifra = deleted.sifra
		inner join dbo.listnad on deleted.sifra = dbo.listnad.listvrstplac 

	insert into dbo.listnad (skupdogadjaj, listvrstplac, analitikaid, koristi)
	select inserted.skupdogadjaj, inserted.sifra, 
		inserted.analitzat, inserted.koristi
	from inserted 		
		left outer join dbo.listnad on inserted.sifra = dbo.listnad.listvrstplac 
	where dbo.listnad.listvrstplac is null

end