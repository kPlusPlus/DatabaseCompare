create   trigger [dbo].[skladiste_itrig] on [dbo].[skladiste] 
for insert
not for replication
as
set nocount on

if exists (select * from inserted)
begin

	if exists (select * from  inserted
 				inner join dbo.evid with(nolock) on inserted.evidid = dbo.evid.id
				inner join dbo.dokstart with(nolock) on dbo.evid.listid = dbo.dokstart.listid 
				inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra 
		where inserted.zalihaid is null 
			and dbo.dokvrsta.sklad = 1 and dbo.dokvrsta.sklonline = 1 
			and ((inserted.vrsta = -1 and inserted.kolicina > 0) 
			or (inserted.vrsta = 1 and inserted.kolicina < 0))) 
	begin
			declare @skladisteid int
			declare @asortid int
			declare @analitsklid int
			declare @datumpi smalldatetime
			declare @sklnacin tinyint
			declare @kronologija bit
			declare @sdmindatumzad smalldatetime 
			declare @sdmaxdatumzad smalldatetime 
					
			declare sklrazic cursor fast_forward 
			for
			select top 100 percent inserted.id, inserted.asortid, 
				analitsklid = case when evidpad.analitikaid > 0 
								then evidpad.analitikaid 
								else dokum.analitika2id
								end, 
				dbo.dokum.datumpi, dbo.sklpj.sklnacin, dbo.sklpj.kronologija, 
				case dbo.sklpj.razdgodina when 1 
				then cast(year(dbo.dokum.datumpi) as nvarchar) + n'0101' else n'19000101' 
				end,
				case dbo.sklpj.razdgodina when 1 
				then cast(year(dbo.dokum.datumpi) as nvarchar) + n'1231' else n'20790606' 
				end
			from inserted
				inner join dbo.evid on inserted.evidid = dbo.evid.id
				inner join dbo.dokstart on dbo.evid.listid = dbo.dokstart.listid
				inner join dbo.dokum on dbo.dokstart.id = dbo.dokum.dokumid
				inner join dbo.dokvrsta on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.analitika on dbo.dokum.analitika2id = dbo.analitika.id
				inner join dbo.cjelina on dbo.analitika.vezaid = dbo.cjelina.id
				inner join dbo.sklpj on dbo.cjelina.id = dbo.sklpj.cjelinaid
				left outer join dbo.evidpad on dbo.evid.id = dbo.evidpad.evidid
				left outer join dbo.analitika aep on dbo.evidpad.analitikaid = aep.id 
												and aep.analitikavrsta = 4 
			where dokvrsta.analitika2vrsta = 4 
				and inserted.zalihaid is null 
				and dbo.dokvrsta.sklad = 1 and dbo.dokvrsta.sklonline = 1
				and ((inserted.vrsta = -1 and inserted.kolicina > 0) 
				or (inserted.vrsta = 1 and inserted.kolicina < 0))
			order by inserted.asortid, dokum.datumpi
			open sklrazic
			fetch next from sklrazic
			into @skladisteid, @asortid, @analitsklid, @datumpi, @sklnacin, @kronologija, @sdmindatumzad, @sdmaxdatumzad
			while @@fetch_status = 0
	  			begin

				if (@kronologija =1) and (@sklnacin = 1)
				begin		
				update dbo.skladiste
				set 	zalihaid = case when zzr.zalihaid > 0
						then  zzr.zalihaid
						else null
						end, 

					kolicina = case  when abs(kolicina) > zzr.stanje and zzr.zalihaid > 0

						then sign(kolicina) * zzr.stanje
						else kolicina
						end
				from   (select  top 1 dbo.zaliha.id as zalihaid, zs.stanje, dbo.zaliha.asortid
						from  dbo.zaliha 
							inner join (select zalihaid, sum(vrsta * kolicina) as stanje
								from dbo.skladiste
								where zalihaid > 0 and asortid = @asortid
								group by zalihaid
								having sum(vrsta * kolicina) > 0) zs on dbo.zaliha.id = zs.zalihaid 
							inner join dbo.skladiste on dbo.zaliha.skladisteid = dbo.skladiste.id
							left outer join dbo.evidpad on dbo.skladiste.evidid = dbo.evidpad.evidid
						where   zaliha.asortid = @asortid 
							and zaliha.analitsklid = @analitsklid 
							and datumzr between @sdmindatumzad and @datumpi 
							and (evidpad.karantena = 0 or evidpad.karantena is null) 
						order by datumzr, zaliha.id) as zzr 
				where dbo.skladiste.id = @skladisteid

					fetch next from sklrazic
					into @skladisteid, @asortid, @analitsklid, @datumpi, @sklnacin, @kronologija, @sdmindatumzad, @sdmaxdatumzad
					end

				if (@kronologija =0) and (@sklnacin = 1)
				begin		
				update dbo.skladiste
				set 	zalihaid = case when zzr.zalihaid > 0
						then  zzr.zalihaid
						else null
						end, 

					kolicina = case  when abs(kolicina) > zzr.stanje and zzr.zalihaid > 0

						then sign(kolicina) * zzr.stanje
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
						and datumzr between @sdmindatumzad and @sdmaxdatumzad 
						and (evidpad.karantena = 0 or evidpad.karantena is null) 
					order by datumzr, zaliha.id) as zzr 
				where dbo.skladiste.id = @skladisteid 

					fetch next from sklrazic
					into @skladisteid, @asortid, @analitsklid, @datumpi, @sklnacin, @kronologija, @sdmindatumzad, @sdmaxdatumzad
					end

				if (@kronologija =1) and (@sklnacin = 2)
				begin		
				update dbo.skladiste
				set 	zalihaid = case when zzr.zalihaid > 0
						then  zzr.zalihaid
						else null
						end, 

					kolicina = case  when abs(kolicina) > zzr.stanje and zzr.zalihaid > 0

						then sign(kolicina) * zzr.stanje
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
					order by datumzr, zaliha.id desc) as zzr 
				where dbo.skladiste.id = @skladisteid

					fetch next from sklrazic
					into @skladisteid, @asortid, @analitsklid, @datumpi, @sklnacin, @kronologija, @sdmindatumzad, @sdmaxdatumzad
					end

					if (@kronologija =0) and (@sklnacin = 2)
					begin		
					update dbo.skladiste
				set 	zalihaid = case when zzr.zalihaid > 0
						then  zzr.zalihaid
						else null
						end, 

					kolicina = case  when abs(kolicina) > zzr.stanje and zzr.zalihaid > 0

						then sign(kolicina) * zzr.stanje
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
					where  zaliha.asortid = @asortid and zaliha.analitsklid = @analitsklid 
						and datumzr  between @sdmindatumzad and @sdmaxdatumzad  
						and (evidpad.karantena = 0 or evidpad.karantena is null) 
					order by datumzr, zaliha.id desc) as zzr 
				where dbo.skladiste.id = @skladisteid 

					fetch next from sklrazic
					into @skladisteid, @asortid, @analitsklid, @datumpi, @sklnacin, @kronologija, @sdmindatumzad, @sdmaxdatumzad
					end
				end
		close sklrazic
		deallocate sklrazic

		insert into  dbo.skladiste (vrsta, evidid, asortid, kolicina, datumzr)
		select inserted.vrsta, inserted.evidid, inserted.asortid,
			kolicina = case when dbo.skladiste.vrsta = -1 and dbo.skladiste.kolicina > 0 
						and dbo.skladiste.kolicina < inserted.kolicina  
					then  inserted.kolicina - dbo.skladiste.kolicina
					when dbo.skladiste.vrsta = 1 and dbo.skladiste.kolicina < 0 
						and dbo.skladiste.kolicina > inserted.kolicina 
					then (abs(inserted.kolicina) - abs(dbo.skladiste.kolicina)) * -1
					else null 
					end,
			inserted.datumzr
		from inserted
			inner join dbo.skladiste on dbo.skladiste.id = inserted.id
		where dbo.skladiste.kolicina < inserted.kolicina or dbo.skladiste.kolicina > inserted.kolicina
	end
end