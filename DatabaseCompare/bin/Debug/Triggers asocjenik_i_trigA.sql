create   trigger [dbo].[asocjenik_i_trig] on [dbo].[asocjenik]
for insert not for replication
as
set nocount on

if exists ( select *
				from inserted
				inner join dbo.cjenik with(nolock) on inserted.cjenik = dbo.cjenik.sifra
				where dbo.cjenik.primjdev = 0 and inserted.valkodcijena <> dbo.invalkod() )
begin
raiserror 44445 n'
	
	the record can''t be inserted, 
	currency must be domestic.
	origin: asocjenik_i_trig'
        		rollback transaction

end