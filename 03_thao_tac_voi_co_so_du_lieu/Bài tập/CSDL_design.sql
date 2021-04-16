create database CSDL_design;

use CSDL_design;

create table Student (
student_number int primary key ,
student_name varchar(45),
address varchar(45),
email varchar(45),
image varchar(45)
);
create table Category(
category_number int primary key 
);

create table Book (
book_number int primary key,
category_number int,
foreign key (category_number) references Category(category_number)
 );
 

create table Student_book (
student_number int,
book_number int,
foreign key (student_number) references Student(student_number),
foreign key (book_number) references Book(book_number)
);
