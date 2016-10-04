create trigger [dbo].[listvrstplacskalarpcp_iutrig] on [dbo].[listvrstplacskalarpcp]
after insert, update
as

if (select count(*)
			from inserted
			inner join dbo.listvrstplacskalarpcp lvp  on inserted.listvrstplac = lvp.listvrstplac
			inner join dbo.skalarpcp on lvp.skalarpcp = dbo.skalarpcp.sifra
			where dbo.skalarpcp.vrsta = 3) > 1 

	begin
		raiserror 44447 n'
the record can''t be added or changed.  
this payment type is allready
bound to cassa sconto discount scale!

origin: listvrstplacskalarpcp_iutrig'
		rollback transaction

	end