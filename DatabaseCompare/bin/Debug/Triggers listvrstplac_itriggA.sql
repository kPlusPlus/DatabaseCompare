
create       trigger [listvrstplac_itrigg] on [dbo].[listvrstplac] 
for insert
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
	listvrstplac_itrig:
	 
	the record can''t be inserted. 
	analitic or pozition is wrong!'
		rollback transaction
	end

begin
	insert into dbo.listnad (skupdogadjaj, listvrstplac, analitikaid, koristi)
	select inserted.skupdogadjaj, inserted.sifra, 
		inserted.analitzat, inserted.koristi
	from inserted 		
		left outer join dbo.listnad on inserted.sifra = dbo.listnad.listvrstplac 
	where dbo.listnad.listvrstplac is null
end