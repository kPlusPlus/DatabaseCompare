
create  trigger portarif_utrig on dbo.portarif 
for update
as

if update (porez1) or update (porez2) or update (porez3) or update (porez4) or update (koef) or update (revkoef)
begin	
	if (select count(*) from inserted, evid where (inserted.id = evid.portarifid)) != 0
	begin
       		raiserror 44445 'portarif_utrig(10): the record can''t be deleted or changed. since related records exist in table ''evid'', referential integrity rules would be violated.'
       		rollback transaction
	end
end

if update (porez1) or update (porez2) or update (porez3) or update (porez4) or update (koef) or update (revkoef)
begin	
	if (select count(*) from inserted, zaliha where (inserted.id = zaliha.portarifid)) != 0
	begin
       		raiserror 44445 'portarif_utrig(21): the record can''t be deleted or changed. since related records exist in table ''zaliha'', referential integrity rules would be violated.'
       		rollback transaction
	end
end

if update (koristi)
begin	
	if (select count(*) from inserted, pozicija where (inserted.id = pozicija.portarifid)) <> 0
	begin
	update pozicija
	set pozicija.koristi = inserted.koristi
	from inserted, pozicija 
	where (inserted.id = pozicija.portarifid)
	end
end