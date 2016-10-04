create   trigger [dbo].[skladiste_dtrig] on [dbo].[skladiste] 
for delete
as
set nocount on

if exists (select * from deleted)
begin

		update dbo.asosklad
		set staskl = staskl - isnull(kolicina * vrsta,0)
		from deleted
			inner join dbo.zaliha with(nolock) on deleted.zalihaid = dbo.zaliha.id
			inner join dbo.asosklad on deleted.asortid = dbo.asosklad.asortid
							and dbo.zaliha.analitsklid = dbo.asosklad.analitsklid
		where deleted.zalihaid > 0

end