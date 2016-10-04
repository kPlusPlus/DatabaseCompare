create trigger [dbo].[cjenik_dtrig] on [dbo].[cjenik]
after delete
as

if exists (select * from deleted where deleted.osnovni = 1)
	begin
		begin
		raiserror 44447 n' 300548 
cjenik_dtrig(8): 
the record can''t be deleted. 
referential integrity rules require 
min. one record for "basic pricelist".'
		rollback transaction
		end
	end