create trigger [kampanja_iutrig] on dbo.kampanja 
for insert, update
as

if (select count(*) from dbo.kampanja where aktivna =1) > 1
	begin
	raiserror 44445
        	'kampanja_iutrig(9): the record can''t be inserted or updated becouse active campaign allready exist'  
	rollback transaction
	end