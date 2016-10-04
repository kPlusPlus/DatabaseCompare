create   trigger [dbo].[zaliha_itrig] on [dbo].[zaliha] 
for  insert
as
set nocount on

if exists (select * from inserted)
begin

	if exists (select * from inserted
				inner join  dbo.skladiste with(nolock) on inserted.skladisteid = dbo.skladiste.id
			where inserted.asortid <> skladiste.asortid)
		begin
		raiserror 44445 n'
	the record can''t be changed!
	since asortment is different !!!
	origin: zaliha_itrig'
        		rollback transaction
		end

	update dbo.skladiste
	set zalihaid =  inserted.id 
	from inserted
		inner join dbo.skladiste on inserted.skladisteid = dbo.skladiste.id
	where ((dbo.skladiste.vrsta = 1 and dbo.skladiste.kolicina > 0) 
		or (dbo.skladiste.vrsta = -1 and dbo.skladiste.kolicina < 0))
 		and dbo.skladiste.zalihaid is null

	update dbo.zaliha
	set zaltip = dokvrsta.zaltip
	from inserted
		inner join dbo.zaliha on inserted.id = dbo.zaliha.id
		inner join dbo.skladiste on dbo.zaliha.skladisteid = dbo.skladiste.id
		inner join dbo.evid on dbo.skladiste.evidid = dbo.evid.id
		inner join dbo.dokstart on dbo.evid.listid = dbo.dokstart.listid
		inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
	where dokvrsta.zaltip > 0  
	

	insert into [dbo].[asosklad] ([asortid],[analitsklid],[staskl],[pondmarza],[pondnc])
	select inserted.asortid, inserted.analitsklid, 
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
						where zalihaid > 0
						group by zaliha.asortid, zaliha.id, zaliha.analitsklid
						having sum(skladiste.vrsta * skladiste.kolicina) > 0) 
				stskl on inserted.asortid = stskl.asortid and inserted.analitsklid = stskl.analitsklid 
		left outer join dbo.asosklad on inserted.asortid = dbo.asosklad.asortid
						and inserted.analitsklid = dbo.asosklad.analitsklid
	where dbo.asosklad.asortid is null
	group by inserted.asortid, inserted.analitsklid

end