create trigger [dbo].[dokstart_dtrig] on [dbo].[dokstart]
after delete not for replication
as
set nocount on

if exists (select * from deleted
		inner join dbo.dokvrsta with(nolock) on deleted.dokvrsta = dbo.dokvrsta.sifra
		inner join cfg.dbo.korisnik with(nolock) on cfg.dbo.korisnik.id = deleted.korisnikid
	where deleted.knjizeno = 1 or deleted.placeno = 1
		or ((deleted.azuriranje = 1 or dokvrsta.samovl = 1) and  (rtrim(cfg.dbo.korisnik.loginname) <> suser_sname() and [dbo].[sikorisnikhier] () <= cfg.dbo.korisnik.hierarchy)) 
		or (deleted.zakljuceno = 1 and [dbo].[sikorisnikhier] () <= 3)
		or (dokvrsta.vrsta between 6 and 8 and dokvrsta.zatvaranje > 0 and deleted.onhold = 0)) 
	begin
        	raiserror 44445 '

	the record can''t be deleted. 
	since document exist in general ledger 
	or in payment or it is closed,
	or owner only can make changes,
	or it is in edit mode,
	or document contains payment!  
	origin:  dokstart_dtrig'
        	rollback transaction
	end

if exists (select * from deleted where listid > 0)
begin

	if exists (select * from deleted
				inner join dbo.dokvk with(nolock) on deleted.vk = dbo.dokvk.sifra
				inner join dbo.dokstart with(nolock) on deleted.listid = dbo.dokstart.listid
					and dbo.dokvk.autopredvk = dbo.dokstart.vk
					and deleted.id < dbo.dokstart.id
			where deleted.listid > 0 and dokvk.autopredvk > 0 and dokstart.vk > 0)
	begin
		delete dbo.dokstart
		where dbo.dokstart.id in 
			(select dbo.dokstart.id 
			from deleted
				inner join dbo.dokvk with(nolock) on deleted.vk = dbo.dokvk.sifra
				inner join dbo.dokstart on deleted.listid = dbo.dokstart.listid
					and dbo.dokvk.autopredvk = dbo.dokstart.vk
					and deleted.dokvrsta <> dbo.dokstart.dokvrsta
					and deleted.id < dbo.dokstart.id
			where deleted.listid > 0 and dokvk.autopredvk > 0 and dokstart.vk > 0)
	end
	

	delete from dbo.list
	where list.id not in (select deleted.listid from deleted
					inner join dbo.dokstart on  deleted.listid = dbo.dokstart.listid
				where deleted.listid > 0) 
		and list.id in (select deleted.listid from deleted)

		

	if exists (select * from deleted
				inner join dbo.dokstart with(nolock) on deleted.listid = dbo.dokstart.listid 
						and deleted.id > dbo.dokstart.id
				inner join dbo.dokvk with(nolock) on dbo.dokstart.vk = dbo.dokvk.sifra 
						and deleted.vk = dokvk.autopredvk
			where dokstart.listid > 0 and deleted.vk > 0 and dokvk.autopredvk > 0)
	begin
	raiserror 44445 '
	the record can''t be deleted. 
	since document that generated 
	this document still exist.

	origin:  dokstart_dtrig'
	rollback transaction
	end

	if exists (select * from deleted

				inner join dbo.dokstart with(nolock) on deleted.listid = dbo.dokstart.listid 
							and deleted.id < dbo.dokstart.id
							and deleted.dokvrsta <> dbo.dokstart.dokvrsta)

	begin
	raiserror 44445 '
	the record can''t be deleted. 
	since already used for generating 
	other documents!!!
	origin:  dokstart_dtrig'
	rollback transaction
	end
	

	

	if exists (select * from deleted
				inner join dbo.dokvrsta on deleted.dokvrsta = dbo.dokvrsta.sifra
				innerjoin dbo.evid with(nolock) on deleted.listid = dbo.evid.listid
				inner join dbo.skladiste with(nolock) on evid.id = dbo.skladiste.evidid
			where dokvrsta.sklad = 1 and dbo.skladiste.id > 0 ) 
	begin
		delete from dbo.skladiste
		where evidid in (select evid.id from deleted
				inner join dbo.dokvrsta with(nolock) on deleted.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.evid on deleted.listid = dbo.evid.listid
			where dokvrsta.sklad = 1)
			and dbo.skladiste.id > 0 
		
		update dbo.evid
		set zalihaid = null
		where id in (select evid.id from deleted
				inner join dbo.dokvrsta with(nolock) on deleted.dokvrsta = dbo.dokvrsta.sifra
				inner join dbo.evid on deleted.listid = dbo.evid.listid
			where dokvrsta.sklad = 1)

	end

end

delete from dbo.listnad 
where vezaid in (select id from deleted, dbo.dokvrsta 
			where deleted.dokvrsta = dbo.dokvrsta.sifra 
			and (dbo.dokvrsta.autoskupdog1 <> 0 
			or dbo.dokvrsta.autoskupdog2 <> 0))
			and (skupdogadjaj in (select dbo.dokvrsta.autoskupdog1 
								from deleted
									inner join dbo.dokvrsta with(nolock) on deleted.dokvrsta = dbo.dokvrsta.sifra 
								where deleted.dokvrsta = dbo.dokvrsta.sifra)
			or skupdogadjaj in (select dbo.dokvrsta.autoskupdog2 
								from deleted
									inner join dbo.dokvrsta with(nolock) on deleted.dokvrsta = dbo.dokvrsta.sifra  
								where deleted.dokvrsta = dbo.dokvrsta.sifra))

if exists (select * from deleted where dokvrsta = 123)
begin
	delete dbo.dokpozivbr 
	from deleted	
		inner join dbo.dokpozivbr on deleted.id = cast(rtrim(dbo.dokpozivbr.pnb) as int)
	where deleted.dokvrsta = 123 and dbo.dokpozivbr.modulpnb like n'ob' 
		and dbo.dokpozivbr.pozivbrvrsta = 4
end