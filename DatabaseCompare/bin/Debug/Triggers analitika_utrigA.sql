create  trigger [dbo].[analitika_utrig] on [dbo].[analitika] 
for update not for replication

as

if exists (select * from inserted, deleted  where inserted.id = deleted.id 
		and inserted.analitikavrsta <> deleted.analitikavrsta 
		and deleted.analitikavrsta <> 1 and inserted.analitikavrsta <> 1)
   	begin
	raiserror 44445 '
analitika_utrig: 
the record can''t be changed, referential integrity rules would be violated. 
to change analitikavrsta you must delete recort and insert new one! 
origin:analitika_utrig'
        rollback transaction
	end

if exists (select * from inserted where analitikavrsta = 0)
	begin
	if (select count(*) from analitika where (analitikavrsta = 0)) <> 1
        	begin
		raiserror 44445 '
analitika_utrig: 
the record can''t be changed. 
since one record of this type allready exist 
in table ''analitika'', referential 
integrity rules would be violated.
origin:analitika_utrig'
       		rollback transaction
		end
	end

if exists (select * from inserted where inserted.analitikavrsta = 0) 
	begin
	if (select count(*) from dbo.analitika where analitikavrsta = 0) > 1
		begin
		raiserror 44447 n'
analitika_itrig: 
the record can''t be added. 
referential integrity rules require that one and only 
one record of type ''none'' in table ''analitika''.
origin:analitika_utrig'
		rollback transaction
		end
	end

if exists (select * from inserted where inserted.analitikavrsta = 1 and vezaid not in (select id from dbo.cjelina))
begin
	raiserror 44447 n'
analitika_itrig: 
the record can''t be added. 
referential integrity rules require a related 
record in table ''cjelina''.
origin:analitika_utrig'
	rollback transaction
end

if exists (select * from inserted where inserted.analitikavrsta = 4 and vezaid not in (select cjelinaid from dbo.sklpj))
		begin
		raiserror 44447 n'
analitika_itrig: 
the record can''t be added. 
referential integrity rules require a related 
record in table ''cjelina-skladište''.
origin:analitika_utrig'
		rollback transaction
    		end

if exists (select * from inserted where inserted.analitikavrsta = 5 and vezaid not in (select cjelinaid from dbo.blagajna))
		begin
		raiserror 44447 '
analitika_itrig: 
the record can''t be added. 
referential integrity rules require a related 
record in table ''cjelina-blagajna''.
origin:analitika_utrig'
		rollback transaction
    		end

if exists (select * from inserted where inserted.analitikavrsta = 2 and vezaid not in (select id from dbo.partnerstart))
		begin
		raiserror 44447 '
analitika_itrig: 
the record can''t be added or changed. 
referential integrity rules require a related 
record in table ''partnerstart''.
origin:analitika_utrig'
		rollback transaction
    		end

if exists (select * from inserted where inserted.analitikavrsta = 3 and vezaid not in (select id from dbo.bankart))
		begin
		raiserror 44447 '
analitika_itrig: 
the record can''t be added or changed. 
referential integrity rules require a 
related record in table ''bankart''.
origin:analitika_utrig'
		rollback transaction
    		end

if exists (select * from inserted where inserted.analitikavrsta = 99 and vezaid not in (select id from dbo.firma))
		begin
		raiserror 44447 '
analitika_itrig: 
the record can''t be added or changed. 
referential integrity rules require a related 
record in table ''firma''.
origin:analitika_utrig'
		rollback transaction
    		end

if exists (select * from inserted where inserted.analitikavrsta = 6 and vezaid not in (select id from dbo.os))
		begin
		raiserror 44447 '
analitika_itrig: 
the record can''t be added or changed. 
referential integrity rules require a related 
record in table ''os''.
origin:analitika_utrig'
		rollback transaction
    		end

if exists (select * from inserted where inserted.analitikavrsta = 8 and vezaid not in (select sifra from dbo.mlmgrupa))
		begin
		raiserror 44447 '
analitika_itrig: 
the record can''t be added or changed. 
referential integrity rules require a related 
record in table ''mlmgrupa''.
origin:analitika_utrig'
		rollback transaction
    		end

if exists (select * from inserted where inserted.analitikavrsta = 31 and vezaid not in (select id from dbo.kredit))
		begin
		raiserror 44447 '
analitika_itrig: 
the record can''t be added or changed. 
referential integrity rules require a related 
record in table ''kredit''.
origin:analitika_utrig'
		rollback transaction
    		end

if exists (select * from inserted where inserted.analitikavrsta = 21 and vezaid not in (select id from dbo.opcina))
		begin
		raiserror 44447 '
analitika_itrig: 
the record can''t be added or changed. 
referential integrity rules require a related 
record in table ''opcina''.
origin:analitika_utrig'
		rollback transaction
    		end

if exists (select * from inserted where inserted.analitikavrsta = 90 and vezaid not in (select id from dbo.kapacitet))
		begin
		raiserror 44447 '
analitika_itrig: 
the record can''t be added or changed. 
referential integrity rules require a related 
record in table ''kapacitet''.
origin:analitika_utrig'
		rollback transaction
    		end

if exists (select * from inserted where inserted.vezaid is null and analitikavrsta = 0)
	begin
	update analitika
	set analitika.vezaid = analitika.id
	from analitika, inserted 
	where inserted.id = analitika.id and (inserted.analitikavrsta = 0)
	end

if exists(select * from inserted 
	left outer join dbo.analitfirma on inserted.id = dbo.analitfirma.analitikaid
 where  dbo.analitfirma.analitikaid is null)
	begin
	insert analitfirma (analitikaid, firmaid)
	select inserted.id, (select firmascope.firmaid from firmascope where spid = @@spid)as firmaid
	from inserted 
			left outer join dbo.analitfirma on inserted.id = dbo.analitfirma.analitikaid
  where  dbo.analitfirma.analitikaid is null
	
	end

	insert into [dbo].[asosklad] ([asortid],[analitsklid],[staskl],[pondmarza])
	select asortiman.id, inserted.id, 
		stanje = isnull(sum(stskl.stanje),0),
		pondmarza = case when sum(stskl.stanje) > 0 
					then isnull(sum(stskl.marza * stskl.stanje)/sum(stskl.stanje),0)
					else 0
					end
	from inserted
		cross join dbo.asortiman 
		left outer join (select zaliha.asortid, zaliha.id as zalihaid, zaliha.analitsklid, 
							stanje = sum(skladiste.vrsta * skladiste.kolicina),
							marza = max(zaliha.marza)
						from dbo.zaliha
							inner join dbo.skladiste on dbo.zaliha.id = dbo.skladiste.zalihaid
						where zalihaid > 0
						group by zaliha.asortid, zaliha.id, zaliha.analitsklid
						having sum(skladiste.vrsta * skladiste.kolicina) > 0) 
				stskl on dbo.asortiman.id = stskl.asortid and inserted.id = stskl.analitsklid 
		left outer join dbo.asosklad on inserted.id = dbo.asosklad.analitsklid
									and dbo.asortiman.id = dbo.asosklad.asortid
	where inserted.analitikavrsta = 4 and dbo.asosklad.analitsklid is null
		and asortiman.id in (select asortiman.id from dbo.asortiman 
					inner join dbo.asokatalog on dbo.asortiman.id = dbo.asokatalog.asortid
					inner join dbo.asovrsta on dbo.asokatalog.asovrsta = dbo.asovrsta.sifra
				where asokatalog.koristi = 1 and asovrsta.vrsta <> 3) 
	group by inserted.id, asortiman.id