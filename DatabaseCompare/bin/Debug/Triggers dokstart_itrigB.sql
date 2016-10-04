create trigger [dbo].[dokstart_itrig] on [dbo].[dokstart]
after insert not for replication
as
set nocount on

if exists(select * from inserted)
begin

	if exists (select * from inserted
				inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
			where inserted.listid > 0 and inserted.id > dbo.dokstart.id)
	begin
		if exists (select * from inserted 
			inner join dbo.dokstart with(nolock) on inserted.listid = dbo.dokstart.listid
			inner join dbo.dokvrsta with(nolock) on dbo.dokstart.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.dokvrsta dokvrsta_1 with(nolock) on inserted.dokvrsta = dokvrsta_1.sifra
			left outer join dbo.verifikacija with(nolock) on dbo.dokstart.id = dbo.verifikacija.dokumid
		 where inserted.id > dbo.dokstart.id 
				and (dokvrsta_1.predmet = 0 
				or inserted.dokvrsta = dbo.dokstart.dokvrsta 
				or (dbo.dokvrsta.sklad = 1 and dokvrsta_1.sklad = 1) 
				or (dbo.dokvrsta.zadrazd = 1 and dokvrsta_1.zadrazd = 1)
				or (dbo.dokvrsta.zt = 1 and dokvrsta_1.zt = 1)
				or (dbo.verifikacija.dokumid > 0 and dbo.verifikacija.verificirao is null)
				or (dbo.dokvrsta.mp = 1 and dokvrsta_1.mp = 1) 

				)) 
		begin
		raiserror 44445 '

	document can''t be added in to existed folder, 
	business logic would be violated,
	or document did not pass controll,
	or verification missing.
	origin: dokstart_itrig'
		rollback transaction
		end
	end

	if exists (select * from inserted where listid is null)
	begin
		insert dbo.list (analitikaid)
		select id
		from inserted
		where inserted.listid is null
option (keepfixed plan)

		update dbo.dokstart
		set listid = dbo.list.id 
		from inserted
			inner join dbo.list on inserted.id = dbo.list.analitikaid
			inner join dbo.dokstart on inserted.id = dbo.dokstart.id
		where dbo.dokstart.listid is null
option (keepfixed plan)
	end

	if exists (select *  from inserted
				inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra 
			where dbo.dokvrsta.pozivbr = 1)
	begin
		insert into dbo.dokpozivbr (dokumid, modulpnb, pnb, pozivbrvrsta)
		(select inserted.id, dbo.pnb.model, [dbo].[nvpozivnabroj] (inserted.id,1), 
			dbo.pnb.pozivbrvrsta
		from inserted
			inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra
			inner join dbo.dokvk with(nolock) on inserted.vk = dbo.dokvk.sifra
			inner join dbo.placanjeset with(nolock) on dbo.dokvk.placanjeset = dbo.placanjeset.sifra
			inner join dbo.pnb with(nolock) on dbo.placanjeset.sifra = dbo.pnb.placanjeset
		where dokvrsta.pozivbr = 1 and pnb.pozivbrvrsta = 1 and pnb.racunid is null)
option (keepfixed plan)
	end

	if exists (select * from inserted
			inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra 
		where dokvrsta.zt = 1 )
	begin
		insert into dbo.listzt (listid)
		select inserted.listid 
		from inserted 
			inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra
			left outer join dbo.listzt on inserted.listid = dbo.listzt.listid 
		where dbo.listzt.listid is null and dbo.dokvrsta.zt = 1
option (keepfixed plan)
	end

				inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra  
			where dbo.dokvrsta.autoskupdog1 > 0 or dbo.dokvrsta.autoskupdog2 > 0)
	begin
		insert into dbo.listnad (skupdogadjaj, sifra, vezaid)
		select dokvrsta.autoskupdog1, 
			sifra = isnull(rtrim(inserted.izvornik),'') +' (' +rtrim (dbo.dokvrsta.prefiks) + n'-' + cast(inserted.godina as nvarchar(4)) + n'-' + rtrim(inserted.broj) + ')',
			inserted.id  
		from inserted
			inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra 
		where dbo.dokvrsta.autoskupdog1 > 0
option (keepfixed plan)

		insert into dbo.listnad (skupdogadjaj, sifra, vezaid)
		select dokvrsta.autoskupdog2, 
			sifra =  isnull(rtrim(inserted.izvornik),'') +' (' +rtrim (dbo.dokvrsta.prefiks) + n'-' + cast(inserted.godina as nvarchar(4)) + n'-' + rtrim(inserted.broj) + ')',
			inserted.id  
		from inserted
			inner join dbo.dokvrsta with(nolock) on inserted.dokvrsta = dbo.dokvrsta.sifra 
		where dbo.dokvrsta.autoskupdog2 > 0
option (keepfixed plan)
	end

end