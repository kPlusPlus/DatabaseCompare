create trigger [dbo].[dokpozivbr_itrig] on [dbo].[dokpozivbr]
after insert
as

if exists(select * from inserted where pozivbrvrsta in (2,3))
begin

	if  exists (select *  from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				left outer join dbo.dogadjaj on rtrim(inserted.pnb) = cast(dbo.dogadjaj.godina as nchar(4)) + n'-' + rtrim(dbo.dogadjaj.broj)
								and dogadjaj.dogvrsta in(90, 91)
				left outer join dbo.dokdogveza on dbo.dogadjaj.id = dbo.dokdogveza.dogadjajid
			where (pozivbrvrsta = 2 and dogadjaj.id is null) 
				or (pozivbrvrsta = 3 and dogadjaj.id is null)
				or (dogadjaj.id > 0 and dokdogveza.dogadjajid > 0))
		begin
	        	raiserror 44445 '

	this post number not
	exists in post book !
	origin: dokpozivbr_itrig'
	        	rollback transaction
		end

	if exists(select * from inserted where pozivbrvrsta = 2)
	begin
		insert into [dbo].[dokdogveza]([dokumid], [dogadjajid])
		select inserted.dokumid, dogadjaj.id
		from inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dogadjaj on rtrim(inserted.pnb) = cast(dbo.dogadjaj.godina as nchar(4)) + n'-' + rtrim(dbo.dogadjaj.broj)
						and pozivbrvrsta = 2 and dogadjaj.dogvrsta = 90
			left outer join dbo.dokdogveza on dbo.dogadjaj.id = dbo.dokdogveza.dogadjajid
		where dokdogveza.dogadjajid is null
	end
	
	if exists(select * from inserted where pozivbrvrsta = 3)
	begin
		insert into [dbo].[dokdogveza]([dokumid], [dogadjajid])
		select inserted.dokumid, dogadjaj.id
		from inserted
			inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
			inner join dbo.dogadjaj on rtrim(inserted.pnb) = cast(dbo.dogadjaj.godina as nchar(4)) + n'-' + rtrim(dbo.dogadjaj.broj)
						and pozivbrvrsta = 3 and dogadjaj.dogvrsta = 91
			left outer join dbo.dokdogveza on dbo.dogadjaj.id = dbo.dokdogveza.dogadjajid
		where dokdogveza.dogadjajid is null
	end

end