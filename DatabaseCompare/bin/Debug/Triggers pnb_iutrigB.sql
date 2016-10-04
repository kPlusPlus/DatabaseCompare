create trigger [dbo].[pnb_iutrig] on [dbo].[pnb]
after insert, update
as

if exists (	select i.id 
						from inserted i
						inner join dbo.pnb p on 
						i.placanjeset = p.placanjeset and i.racunid = p.racunid and i.pozivbrvrsta = p.pozivbrvrsta
						where i.id <> p.id and (i.firmaid is null or p.firmaid is null))
begin
    	    	raiserror 44445 n'
pnb type valid for copmany already exists.
origin: pnb_iutrig'
      	  	rollback transaction

end