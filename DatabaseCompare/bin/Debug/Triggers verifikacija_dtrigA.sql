
create trigger dbo.verifikacija_dtrig 
	on dbo.verifikacija
	after delete

as
begin
	set nocount on
	
	insert dbo.izmj (
		[tabela]
		,[polje]
		,[slog]

		,[prije]

		,[izmjvrsta]
	)
	select
		n'verifikacija' 
		,n'vrstaverif, dokumid, zatrazio, zatrazeno, verificirao, verificirano'
		,d.id 

		,cast(vv.sifra as nvarchar(3)) + n'-' + rtrim(vv.tekst) + n', ' + cast(d.dokumid as nvarchar(10)) + n', ' + d.zatrazio + n', ' + cast(d.zatrazeno as nvarchar) + n', ' + d.verificirao + n', ' + cast(d.verificirano as nvarchar)  

		,47 
	from deleted d
		inner join dbo.verifvrsta vv on d.verifvrsta = vv.sifra
end