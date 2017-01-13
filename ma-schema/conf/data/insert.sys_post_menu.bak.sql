
-- mysql
-- delete from sys_post_menu where post_id = '6e49a1ad757611e585df902b34947e43';
insert into sys_post_menu(id,post_id,menu_id,memo,creates,creater,created,modifier,modified)
select replace(uuid(), '-', ''),'6e49a1ad757611e585df902b34947e43',t.id,t.memo,t.creates,t.creater,t.created,t.modifier,t.modified 
from sys_menu t;

-- oracle
-- delete from sys_post_menu where post_id = '6e49a1ad757611e585df902b34947e43';
-- insert into sys_post_menu(id,post_id,menu_id,memo,creates,creater,created,modifier,modified)
-- select sys_guid(),'6e49a1ad757611e585df902b34947e43',t.id,t.memo,t.creates,t.creater,t.created,t.modifier,t.modified 
-- from sys_menu t;
