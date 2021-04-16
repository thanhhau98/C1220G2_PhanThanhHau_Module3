create database demo;

use demo;

create table products (
Id int primary key ,
productCode varchar(50) Unique ,
productName varchar(50)  ,
productPrice double  ,
productAmount double,
productDescription varchar(50),
productStatus varchar(50)
);



CREATE INDEX price_name
on products (productName,productPrice);

explain 
select *
from products;

create view view_product
as (
select productCode, productName, productPrice, productStatus
from products);

select* 
from view_product;

drop view view_product;

