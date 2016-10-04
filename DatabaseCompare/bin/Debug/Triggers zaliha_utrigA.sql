create  trigger [dbo].[zaliha_utrig] on [dbo].[zaliha] 
for  update 
as
set nocount on

if exists (select * from inserted)
begin

	if exists (select * from inserted
				inner join dbo.skladiste with(nolock) on inserted.skladisteid = dbo.skladiste.id
			where inserted.asortid <> dbo.skladiste.asortid)
		begin
		raiserror 44445 n'
	the record can''t be changed!
	since asortment is different !!!
	origin: zaliha_utrig'
        		rollback transaction
		end

		if exists (select * from inserted
				inner join dbo.skladiste with(nolock) on inserted.skladisteid = dbo.skladiste.id
			where ((dbo.skladiste.vrsta = 1 and dbo.skladiste.kolicina > 0) 
				or (dbo.skladiste.vrsta = -1 and dbo.skladiste.kolicina < 0))
		 		and dbo.skladiste.zalihaid is null)
		begin
			update dbo.skladiste
			set zalihaid =  inserted.id 
			from inserted
				inner join dbo.skladiste on inserted.skladisteid = dbo.skladiste.id
			where ((dbo.skladiste.vrsta = 1 and dbo.skladiste.kolicina > 0) 
				or (dbo.skladiste.vrsta = -1 and dbo.skladiste.kolicina < 0))
		 		and dbo.skladiste.zalihaid is null
		end

	update [dbo].[asosklad]
	set staskl = sp.stanje,
		pondmarza = sp.pondmarza,
		pondnc = sp.pondnc		
	from inserted 
		inner join 
			(select inserted.asortid, inserted.analitsklid, 
				stanje = isnull(sum(stskl.stanje),0),
				pondmarza = case when sum(stskl.stanje) > 0 
							then isnull(sum(stskl.marza * stskl.stanje)sum(stskl.stanje),0)
							else 0
							end
			from inserted
				left outer join (select zaliha.asortid, zaliha.id as zalihaid, zaliha.analitsklid, 
									stanje = sum(skladiste.vrsta * skladiste.kolicina),
									marza = max(zaliha.marza),
									nabcijena = max(zaliha.nabcijena)
								from inserted 
									inner join dbo.zaliha on inserted.asortid = dbo.zaliha.asortid
														and inserted.analitsklid = dbo.zaliha.analitsklid
									inner join dbo.skladiste on dbo.zaliha.id = dbo.skladiste.zalihaid
								where skladiste.id <= zaliha.skladisteid 
								group by zaliha.asortid, zaliha.id, zaliha.analitsklid
								having sum(skladiste.vrsta * skladiste.kolicina) > 0) 
						stskl on inserted.asortid = stskl.asortid and inserted.analitsklid = stskl.analitsklid 
			group by inserted.asortid, inserted.analitsklid) 
		sp on  inserted.asortid = sp.asortid and inserted.analitsklid = sp.analitsklid
				

	
end