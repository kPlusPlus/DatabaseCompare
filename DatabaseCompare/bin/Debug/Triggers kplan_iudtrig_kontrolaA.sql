create  trigger [dbo].[kplan_iudtrig_kontrola] on [dbo].[kplan]
for insert,update,delete
as

if  (select hierarchy 
		from cfg.dbo.korisnik 
		where loginname = suser_sname()) < 3 

begin
        	raiserror ( '
the record can''t be 
updated, inserted or deleted!
your hierarchy level is to low.

origin: kplan_iudtrig_kontrola', 11, 2)
        	rollback transaction
end