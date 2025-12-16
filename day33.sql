-- DCL
-- connecting through cmd prompt (CLI) 
-- mysql -u root -h 127.0.0.1 -P 3306 -p
-- mysql -u root -h localhost -P 3306 -p
-- mysql -u root -h 127.0.0.1 -P 3306 -p sprk_morning



SELECT * FROM mysql.user;
SELECT User, Host FROM mysql.user;

create user ashwin@localhost identified by "1234";

SELECT * FROM mysql.user;

grant select
on sprk_morning.*
to ashwin@localhost;

SELECT * FROM mysql.user;

show grants for ashwin@localhost;

revoke select
on sprk_morning.* 
from ashwin@localhost;

show grants for ashwin@localhost;

/*
grant select, update, insert, delete
on *.*
to ashwin@localhost;
*/

grant all
on sprk_morning.*
to ashwin@localhost;

show grants for ashwin@localhost;

grant all
on *.*
to ashwin@localhost;

show grants for ashwin@localhost;

revoke all
on sprk_morning.* 
from ashwin@localhost;

revoke all
on *.* 
from ashwin@localhost;


show grants for ashwin@localhost;

drop user ashwin@localhost;

SELECT * FROM mysql.user;


-- TCL
/*
comit
rollback
savepoint
*/

desc course;
drop table fact_student_course;
show tables;

set autocommit = OFF;

use sprk_morning;

select * from course;

insert into course values(default, "Adv Excel","30 Days");

select * from course;

rollback;

select * from course;

insert into course values(default, "Django","30 Days");

select * from course;

update course set cname = "Adv Excel"
where cid = 1003;

select * from course;

rollback;


select * from course;



update course set cname = "Adv Excel"
where cid = 1003;

commit;

start transaction;

insert into course values(default, "Django","30 Days");

savepoint s1;

select * from course;

update course set cduration = "1 week"
where cid = 1005;

savepoint s2;

select * from course;

delete from course;

select * from course;

rollback;

select * from course;



start transaction;

insert into course values(default, "Django","30 Days");

savepoint s1;

select * from course;

update course set cduration = "1 week"
where cid = 1005;

savepoint s2;

select * from course;

delete from course;

select * from course;

rollback;

select * from course;


start transaction;

insert into course values(default, "AWS","30 Days");

savepoint s1;

select * from course;

update course set cduration = "5 week"
where cid = 1005;

savepoint s2;

select * from course;

delete from course;

select * from course;

rollback to s2;

select * from course;


rollback to s1;

commit;


set autocommit =ON;