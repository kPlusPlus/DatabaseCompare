create trigger [dbo].[dogpoglavlja_iutrig] on dbo.dogpoglavlja
after insert, update
as

if exists(select * from inserted where inserted.nadid is null)
	begin
	update dbo.dogpoglavlja
	set nadid = inserted.id
	from inserted
		inner join dbo.dogpoglavlja on inserted.id = dbo.dogpoglavlja.id
	where dbo.dogpoglavlja.nadid is null
	end

if exists(select * from inserted
			inner join dbo.dogpoglavlja on inserted.nadid = dbo.dogpoglavlja.id 
	where inserted.id <> inserted.nadid and inserted.nadid > 0 
		and inserted.nivo <= dbo.dogpoglavlja.nivo) 
begin
        		raiserror 44445 '

connection on wrong level !!!.

origin: dogpoglavlja_iutrig'
        		rollback transaction
end