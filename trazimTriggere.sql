select text from syscomments 

select * from syscomments
select * from sysobjects 
select * from sysobjects where xtype = 'tr'


select sc.*,so.* 
	from syscomments sc, sysobjects so
where
	sc.id = so.id
and 
	so.xtype = 'TR'

select name, id from sysobjects where xtype='TR' and category=0
select name, id from sysobjects where xtype='TR' and category=0