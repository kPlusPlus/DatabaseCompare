
create    trigger dokpozivbr_itrig on dbo.dokpozivbr
for insert
as

if exists(select * from inserted where pozivbrvrsta in (2,3))
begin

	if not exists (select *  from inserted
				inner join dbo.dokstart on inserted.dokumid = dbo.dokstart.id
				inner join dbo.dogadjaj on rtrim(inserted.pnb) = cast(dbo.dogadjaj.godina as nvarchar) + n'-' + dbo.dogadjaj.broj
				left outer join dbo.dokdogveza on dbo.dogadjaj.id = dbo.dokdogveza.dogadjajid
			where ((pozivbrvrsta = 2 and dogadjaj.dogvrsta = 90 and dokdogveza.dogadjajid is null)
				or (pozivbrvrsta = 3 and dogadjaj.dogvrsta = 91 and dokdogveza.dogadjajid is null)))
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
		inner join dbo.dogadjaj on rtrim(inserted.pnb) = cast(dbo.dogadjaj.godina as nvarchar) + n'-' + dbo.dogadjaj.broj
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
		inner join dbo.dogadjaj on rtrim(inserted.pnb) = cast(dbo.dogadjaj.godina as nvarchar) + n'-' + dbo.dogadjaj.broj 
					and pozivbrvrsta = 3 and dogadjaj.dogvrsta = 91
		left outer join dbo.dokdogveza on dbo.dogadjaj.id = dbo.dokdogveza.dogadjajid
	where dokdogveza.dogadjajid is null
end

end