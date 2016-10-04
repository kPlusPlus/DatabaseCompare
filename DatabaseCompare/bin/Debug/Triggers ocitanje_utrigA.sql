
create    trigger [ocitanje_utrig] on [dbo].[ocitanja]
for  update
not for replication

as 

if exists (select * from inserted 
			inner join deleted on inserted.id = deleted.id
			inner join dbo.ocitanja on inserted.analitikaid = dbo.ocitanja.analitikaid
		where ocitanja.calstanje >= inserted.calstanje and inserted.id <> ocitanja.id
			and inserted.stanje <> deleted.stanje)
begin
		raiserror 44447 n'

only last readings can be updated!

origin: ocitanja_utrig'
		rollback transaction
end

if exists (select * from inserted 
			inner join deleted on inserted.id = deleted.id
			inner join dbo.ocitanja on inserted.analitikaid = dbo.ocitanja.analitikaid
		where ocitanja.calstanje >= inserted.calstanje and inserted.id <> ocitanja.id
			and inserted.calstanje <> deleted.calstanje)
begin
		raiserror 44447 n'
chronology of readings will 
be destructed - wrong date !.
origin: ocitanja_utrig'
		rollback transaction
end
