create trigger [dbo].[gkperiod_iutrig] on [dbo].[gkperiod]
after insert, update
as
if (select count(*) from dbo.gkperiod where aktiv = 1) > 1
begin
        raiserror 44445 '

the record can''t be inserted, deleted or updated. 
only one accounting period could be "activ" 
origin: gkperiod_iudtrig'
        rollback transaction
end