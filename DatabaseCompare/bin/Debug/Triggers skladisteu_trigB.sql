create trigger [dbo].[skladisteu_trig] on [dbo].[skladiste]
after update
as
set nocount on

if exists (select * from inserted)
begin

	if exists (select * from inserted 
				inner join dbo.zaliha with(nolock) on inserted.zalihaid = dbo.zaliha.id
			where inserted.asortid > dbo.zaliha.asortid or  inserted.asortid < dbo.zaliha.asortid)
		begin
		raiserror 44445 n'
	the record can''t be changed!
	since asortment is different !!!
	origin: skladiste_utrig'
        		rollback transaction
		end

	if update (vrsta) 
	begin
			declare @skladisteid int
			declare @asortid int
			declare @analitsklid int
			declare @datumpi smalldatetime 
			declare @sklnacin tinyint
			declare @sdmindatumzad smalldatetime 

		declare sklrazuc cursor fast_forward
		for
		select top 100 percent	inserted.id, inserted.asortid, 
				analitsklid = case when evidpad.analitikaid > 0
								then evidpad.analitikaid 
								else dokum.analitika2id
								end, 
				cast(year(dokum.datumpi) as nvarchar) + n'1231',
				dbo.sklpj.sklnacin, 
				case dbo.sklpj.razdgodina 
				when 1 
				then cast(year(dokum.datumpi) as nvarchar) + n'0101' 
				else n'19000101' 
				end
		from         inserted
				inner join dbo.evid on inserted.evidid = dbo.evid.id
				inner join dbo.dokstart on dbo.evid.listid = dbo.dokstart.listid 
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid 
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.analitika on dbo.dokum.analitika2id = dbo.analitika.id 
				inner join dbo.cjelina on dbo.analitika.vezaid = dbo.cjelina.id 
				inner join dbo.sklpj on dbo.cjelina.id = dbo.sklpj.cjelinaid
				left outer join dbo.evidpad on inserted.evidid = dbo.evidpad.evidid
				left outer join dbo.analitika aep on dbo.evidpad.analitikaid = aep.id 
													and aep.analitikavrsta = 4
			where dokvrsta.analitika2vrsta = 4
				and inserted.zalihaid is null 
				and dokvrsta.sklad = 1 
				and ((inserted.vrsta = -1 and inserted.kolicina > 0) 
				or (inserted.vrsta = 1 and inserted.kolicina < 0))
		order by inserted.asortid, dokum.datumpi
option (keepfixed plan)
		open sklrazuc
		fetch next from sklrazuc
		into @skladisteid, @asortid, @analitsklid, @datumpi, @sklnacin, @sdmindatumzad 
		while @@fetch_status = 0
		begin

			if (@sklnacin = 1)
			begin		
			update dbo.skladiste
			set 	zalihaid = case when zzr.zalihaid > 0
					then  zzr.zalihaid
					else null
					end, 
				kolicina = case  when kolicina > zzr.stanje and zzr.zalihaid > 0
					then zzr.stanje
					else kolicina
					end
			from 	(select  top 1 dbo.zaliha.id as zalihaid, zs.stanje, dbo.zaliha.asortid
				from  dbo.zaliha 
					inner join (select zalihaid, sum(vrsta * kolicina) as stanje
							from dbo.skladiste
							where zalihaid > 0 and asortid = @asortid
							group by zalihaid
							having sum(vrsta * kolicina) > 0) zs on dbo.zaliha.id = zs.zalihaid 
					inner join dbo.skladiste on dbo.zaliha.skladisteid = dbo.skladiste.id 
					left outer join dbo.evidpad on dbo.skladiste.evidid = dbo.evidpad.evidid
				where   zaliha.asortid = @asortid and zaliha.analitsklid = @analitsklid 
					and datumzr between @sdmindatumzad and @datumpi 
					and (evidpad.karantena = 0 or evidpad.karantena is null) 
				order by datumzr, zaliha.id) as zzr 
			where dbo.skladiste.id = @skladisteid 
option (keepfixed plan)

			fetch next from sklrazuc
			into  @skladisteid, @asortid, @analitsklid, @datumpi, @sklnacin, @sdmindatumzad 
			end

			if (@sklnacin = 2)
			begin		
			update dbo.skladiste
			set 	zalihaid = case when zzr.zalihaid > 0
					then  zzr.zalihaid
					else null
					end, 
				kolicina = case  when kolicina > zzr.stanje and zzr.zalihaid > 0
					then zzr.stanje
					else kolicina
					end
			from 	(select  top 1 dbo.zaliha.id as zalihaid, zs.stanje, dbo.zaliha.asortid
				from  dbo.zaliha 
					inner join (select zalihaid, sum(vrsta * kolicina) as stanje
							from dbo.skladiste
							where zalihaid > 0 and asortid = @asortid
							group by zalihaid
							having sum(vrsta * kolicina) > 0) zs on dbo.zaliha.id = zs.zalihaid 
					inner join dbo.skladiste on dbo.zaliha.skladisteid = dbo.skladiste.id
					left outer join dbo.evidpad on dbo.skladiste.evidid = dbo.evidpad.evidid
				where zaliha.asortid = @asortid and zaliha.analitsklid = @analitsklid 
					and datumzr between @sdmindatumzad and @datumpi 
					and (evidpad.karantena = 0 or evidpad.karantena is null) 
				order by datumzr, zaliha.id desc) as zzr 
			where dbo.skladiste.id = @skladisteid 
option (keepfixed plan)

			fetch next from sklrazuc
			into  @skladisteid, @asortid, @analitsklid, @datumpi, @sklnacin, @sdmindatumzad 
			end
			end
		close sklrazuc
		deallocate sklrazuc
	end

	if update (zalihaid) or update (kolicina)  
	begin
		update dbo.asosklad
		set staskl = staskl + isnull(kolicina * vrsta,0),
			tzalihaid = inserted.zalihaid
		from inserted
			inner join dbo.zaliha on inserted.zalihaid = dbo.zaliha.id
			inner join dbo.asosklad on inserted.asortid = dbo.asosklad.asortid
							and dbo.zaliha.analitsklid = dbo.asosklad.analitsklid
		where inserted.zalihaid > 0
option (keepfixed plan)
	end
	 

end