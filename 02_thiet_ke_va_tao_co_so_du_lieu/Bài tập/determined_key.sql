create database determined_key;
use determined_key;

create table customer(
customer_number int(5) AUTO_INCREMENT primary key unique ,
fullname varchar(30),
address varchar(50),
email varchar(20),
phone int(10));

create table `account`(
account_number int(5) AUTO_INCREMENT primary key,
account_type varchar(30),
`date` varchar(50),
balance int(15),
customer_numbers int(5),
foreign key (customer_numbers) references customer(customer_number)
);

create table transactions(
tran_number int(5) AUTO_INCREMENT primary key ,
account_numbers int(5),
foreign key (account_numbers) references `account`(account_number),
`date` varchar(50),
amounts int(10),
descriptions varchar(50));

