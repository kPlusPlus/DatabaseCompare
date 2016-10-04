create trigger [dbo].[niz_utrig] on [dbo].[niz]
after update
as

if (select count(*)
    from niz
    where niz.niz in 
	(select n1.niz
	 from inserted as n1, niz as n2
	 where (isnull(n1.dokvrsta, 0) = isnull(n2.dokvrsta, 0) and
		isnull(n1.dogvrsta, 0) = isnull(n2.dogvrsta, 0) and
		isnull(n1.skupdog,0) = isnull(n2.skupdog,0) and
		n1.partner = n2.partner and
		n1.suradnik = n2.suradnik and
		n1.radnik = n2.radnik and
		n1.asortiman = n2.asortiman and
		n1.asokatalog = n2.asokatalog and 
		isnull(n1.firmaid,0) = isnull(n2.firmaid,0) )
	 group by n1.niz
    	 having count(n1.niz) > 1)) > 0
	begin

	raiserror 44445 '

document can''t be added, hostid data doesn''t match 
document code definition found in niz.
origin: niz_utrig
'
	rollback transaction
end