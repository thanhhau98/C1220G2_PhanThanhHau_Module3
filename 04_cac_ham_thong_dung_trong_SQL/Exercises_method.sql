create database exercises_method;

use exercises_method;

create table statistical(
ID INT NOT NULL auto_increment primary KEY ,
TEN varchar(50),
TUOI INT ,
KHOAHOC varchar(50),
SOTIEN double);

select *
from statistical
where TEN = 'Huong' ;

select sum(SOTIEN) as TONGTIEN
from statistical
where TEN = 'Huong' ;

select distinct TEN
from statistical ;
