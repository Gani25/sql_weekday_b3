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