create database design_database ;

use design_database;

create table customer(
employeeNumber int not null,
 foreign key (employeeNumber) references employees(employeeNumber),
  customerNumber int(10) not null auto_increment primary key,
  customerName varchar(50) not null,
  contactLastName varchar(50) not null,
  contactFirstName varchar(50) not null,
  phoneaddressLine1 varchar(50) not null,
  addressLine2 varchar(50),
  city varchar(50) not null,
  state varchar(50) not null,
  postalCode varchar(50) not null,
  country varchar(50) not null,
  creditLimit double ) ;
  
 create table OrderDetails (
 orderNumber int not null,
 productCode  varchar(15) not null,
 foreign key (orderNumber) references oders(orderNumber),
 foreign key (productCode) references products(productCode));
  
create table orders (
customerNumber int(10) not null,
foreign key (customerNumber) references customer(customerNumber),
orderNumber int not null primary key,
 orderDate date not null,
 requiredDate date not null,
 shippedDate date,
 `status` varchar (15) not null,
 comments text,
 quantityOrdered int(10) not null,
 priceEach double not null);
 
create table payments (
customerNumber int(10) not null,
foreign key (customerNumber) references customer(customerNumber),
customerNumber int not null primary key,
 checkNumber varchar(50) not null,
 paymentDate date not null,
 amount double not null );
 
create table products  (
productCode  varchar(15) not null primary key,
productLine varchar(50) not null,
foreign key (productLine) references productlines(productLine),
productName  varchar(70) not null,
productScale varchar(10) not null,
productVendor varchar(50) not null,
productDescription text not null,
quantityInStock int not null,
buyPrice double not null,
MSRP double not null );

create table productlines (
productLine varchar(50) not null primary key,
textDescription varchar(50) ,
image varchar(50) );


create table employees  (
officeCode varchar(10) not null,
foreign key (officeCode) references offices(officeCode),
employeeNumber int not null primary key ,
 lastName varchar(50) not null,
 firstName varchar(50) not null,
 email varchar(100) not null,
 jobTitle varchar(50) not null ); 
 
create table offices   (
officeCode varchar(10) not null primary key,
city varchar(50) not null,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50) ,
state varchar(50) ,
country varchar(50) not null,
postalCode varchar(15) not null );
