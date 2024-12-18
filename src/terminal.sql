Last login: Tue Dec 17 15:35:06 on ttys000
/Library/PostgreSQL/17/scripts/runpsql.sh; exit
rahmankulzakaev@MacBook-Pro-JR ~ % /Library/PostgreSQL/17/scripts/runpsql.sh; exit
Server [localhost]:
Database [postgres]: lesson_3_sql
Port [5432]:
Username [postgres]: postgres
Password for user postgres:
psql (17.2)
Type "help" for help.

lesson_3_sql=# create table employees(id serial primary key,firs_name varchar(50),last_name varchar(50),hire_date DATE,salary int not null);
CREATE TABLE
    lesson_3_sql=# create table department(department_id intprimary key, department_name varchar(100)not null,manager_id int);
ERROR:  syntax error at or near "key"
LINE 1: create table department(department_id intprimary key, depart...
                                ^
                                lesson_3_sql=# create table department(department_id int intprimary key, department_name varchar(100)not null,manager_id int);
ERROR:  syntax error at or near "intprimary"
LINE 1: create table department(department_id int intprimary key, de...
                                ^
                                lesson_3_sql=# create table department(department_id int primary key, department_name varchar(100)not null,manager_id int);
CREATE TABLE
    lesson_3_sql=# create table customer(ustomer_id, int primary key,name varchar(100),email varchar(100) unique,phone varchar(50));
ERROR:  syntax error at or near "primary"
LINE 1: create table customer(ustomer_id, int primary key,name varch...
                              ^
                              lesson_3_sql=# create table customer(ustomer_id int primary key,name varchar(100),email varchar(100) unique,phone varchar(50));
CREATE TABLE
    lesson_3_sql=# insort into employees(first_name,last_name,hire_date,salary)values('Ariet','Asanbekov','2021-09-05',1800);
ERROR:  syntax error at or near "insort"
LINE 1: insort into employees(first_name,last_name,hire_date,salary)...
        ^
lesson_3_sql=# insert into employees(first_name,last_name,hire_date,salary)values('Ariet','Asanbekov','2021-09-05',1800);
ERROR:  column "first_name" of relation "employees" does not exist
LINE 1: insert into employees(first_name,last_name,hire_date,salary)...
                              ^
lesson_3_sql=# insert into employees(first_name,last_name,hire_date,salary) values('Ariet','Asanbekov','2021-09-05',1800);
ERROR:  column "first_name" of relation "employees" does not exist
LINE 1: insert into employees(first_name,last_name,hire_date,salary)...
                              ^
lesson_3_sql=# insert into employees(firs_name,last_name,hire_date,salary)values('Ariet','Asanbekov','2021-09-05',1800);
INSERT 0 1
lesson_3_sql=# insert into department(department_name,manager_id) values('Кардиология',1);
ERROR:  null value in column "department_id" of relation "department" violates not-null constraint
DETAIL:  Failing row contains (null, Кардиология, 1).
lesson_3_sql=# insert into department(department_name,manager_id) values('Кардиология','1');
ERROR:  null value in column "department_id" of relation "department" violates not-null constraint
DETAIL:  Failing row contains (null, Кардиология, 1).
lesson_3_sql=# insert into department(department_name,manager_id) values(1,'Кардиология',1);
ERROR:  INSERT has more expressions than target columns
LINE 1: ...tment(department_name,manager_id) values(1,'Кардиология',1);
^
lesson_3_sql=# insert into department(department_name,manager_id) values('1','Кардиология','1');
ERROR:  INSERT has more expressions than target columns
LINE 1: ...t(department_name,manager_id) values('1','Кардиология','1');
^
lesson_3_sql=# insert into department(id,department_id,manager_id)values(1,'Кардиология',1);
ERROR:  column "id" of relation "department" does not exist
LINE 1: insert into department(id,department_id,manager_id)values(1,...
                               ^
lesson_3_sql=# insert into department(department_id,department_name,manager_id)values(1,'Кардиология',1);
INSERT 0 1
lesson_3_sql=# insert into customer(customer_id,name,email,phone)values(1,'Azat','azat@gmail.com','996 705 14 02 00');
ERROR:  column "customer_id" of relation "customer" does not exist
LINE 1: insert into customer(customer_id,name,email,phone)values(1,'...
                             ^
lesson_3_sql=# insert into customer(ustomer_id,name,email,phone)values(1,'Azat','azat@gmail.com','996 705 14 02 00');
INSERT 0 1
lesson_3_sql=# create table orders(order_id serial primary key,ustomer_id,order_date date,total_amount int);
ERROR:  syntax error at or near ","
LINE 1: ...able orders(order_id serial primary key,ustomer_id,order_dat...
                                                             ^
lesson_3_sql=# create table orders(order_id serial primary key,ustomer_id,order_date DATE,total_amount int not null);
ERROR:  syntax error at or near ","
LINE 1: ...able orders(order_id serial primary key,ustomer_id,order_dat...
                                                             ^
lesson_3_sql=# create table orders(order_id serial primary key,ustomer_id int not null,order_date date,total_amount int);
CREATE TABLE
lesson_3_sql=# insert into orders(order_id,ustomer_id,order_date,total_amount)values('1',1,''2023-06-23,8765);
ERROR:  syntax error at or near "2023"
LINE 1: ...ustomer_id,order_date,total_amount)values('1',1,''2023-06-23...
                                                             ^
lesson_3_sql=#  insert into orders(order_id,ustomer_id,order_date,total_amount)values('1',1,''2023-06-23,'8765');
ERROR:  syntax error at or near "2023"
LINE 1: ...ustomer_id,order_date,total_amount)values('1',1,''2023-06-23...
                                                             ^
lesson_3_sql=#  insert into orders(order_id,ustomer_id,order_date,total_amount)values(1,1,''2023-06-23,8765);
ERROR:  syntax error at or near "2023"
LINE 1: ...d,ustomer_id,order_date,total_amount)values(1,1,''2023-06-23...
                                                             ^
lesson_3_sql=#  insert into orders(order_id,ustomer_id,order_date,total_amount)values('1',1,'2023-06-23',8765);
INSERT 0 1
lesson_3_sql=# create table products(products_id serial primary key,product_name varchar(50)not null,price int not null,);
ERROR:  syntax error at or near ")"
LINE 1: ...y key,product_name varchar(50)not null,price int not null,);
                                                                     ^
lesson_3_sql=# create table products(product_id serial primary key,product_name varchar(50)not null,price int not null);
CREATE TABLE
lesson_3_sql=# insert into products(product_name,price)values('car',7500);
INSERT 0 1
lesson_3_sql=# create table suppliers(supplier_id serial primary key,supplier_name varchar(100),contakt_name varchar(50),phone varchar(50));
CREATE TABLE
lesson_3_sql=# insert into suppliers(supplier_name,contakt_name,phone)values('Ibo','Beka','996 700 02 20 20');
INSERT 0 1
lesson_3_sql=# sreate table invoices(invoice_id INT PRIMARY KEY,order_id INT NOT NULL,invoice_date DATE,amount int);
ERROR:  syntax error at or near "sreate"
LINE 1: sreate table invoices(invoice_id INT PRIMARY KEY,order_id IN...
        ^
lesson_3_sql=# create table invoices(invoice_id INT PRIMARY KEY,order_id INT NOT NULL,invoice_date DATE,amount int);
CREATE TABLE
lesson_3_sql=# insert into invoices(invoice_id,order_id,invoice_date,amount)values(1,1,'2023-04-03',2345);
INSERT 0 1
lesson_3_sql=# create table payments(payment_id serial PRIMARY KEY,customer_id INT NOT NULL,payment_date DATE,amount int);
CREATE TABLE
lesson_3_sql=# insert into payments(customer_id,payment_date,amount)values(1,'2003-04-12');
ERROR:  INSERT has more target columns than expressions
LINE 1: insert into payments(customer_id,payment_date,amount)values(...
                                                      ^
lesson_3_sql=# insert into payments(customer_id,payment_date,amount)values(1,'2003-04-12',25463);
INSERT 0 1
lesson_3_sql=# create table shipping (shipping_id serial PRIMARY KEY,order_id INT NOT NULL,shipping_date DATE);
CREATE TABLE
lesson_3_sql=# insert into shipping (order_id,shipping_date)values(1,'2015-12-23');
INSERT 0 1

