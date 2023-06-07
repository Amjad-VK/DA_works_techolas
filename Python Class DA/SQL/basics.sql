use da;
create table student(id varchar(25),name varchar(10),mark int(5));
create table subject(sid int,subname varchar(20));

-- INSERT QUERY
insert into student values('A1','AMJAD',90);
insert into subject values(101,'Physics');

select * from students;
select * from subject;
show tables;
desc subject;

-- ALTER 
alter table subject add dep varchar(30);

-- after a column 
alter table subject add staffid int after sid;

-- first position  
alter table subject add depid int first;


-- modify
alter table subject modify depid varchar(100);

-- drop column
alter table subject drop depid;

-- change column name
alter table subject change subname subjname varchar(30); 

-- rename table
alter table student rename to  students; 

-- drop table
drop table students; 

 -- insert into table
 insert into students(id,mark,name) values('A2',96,'Ramu');
 
 insert into students(id,mark,name) values('A2',96,'Ramu'),('A6',76,'Raju'),('A9',56,'Aju');
 
 
 -- select query
 select * from students;
 select name,mark from students;
 select * from students where mark>50;
 select * from students where mark>90 or grade='A';
 select * from students where mark=90 and name='AMJAD';
 
-- Update query
update students set name='Fidha' where id='A2';

-- Delete query
delete from students where mark=76; 


-- Auto Increment 
create table officers(officerid int not null auto_increment primary key,officername varchar(30),address varchar(20));
insert into officers(officername,address) values('Amjad','CLT'),('Raju',"TVM");
select * from officers;
-- To set  Autoincrement starting values use 'auto_increment=5'
alter table officers auto_increment=101;
insert into officers(officername,address) values('Jaya','CLT'),('Rani',"TVM");

-- Where clause with AND and OR
select * from officers where(address='CLT' and officername='Amjad') OR (officerid<100);


-- DISTINCT to remove duplicates
select distinct name,id from students; 
select * from students;
select distinct name from students;

-- ORDER BY(asce and desc)
select * from students where mark>50 order by mark desc;
select * from students where mark>50 order by mark asc;

-- COUNT FUNC
select count(*) from students where mark>50; 
select count(name) from students where mark>50; 
select count(*) from students;

-- AVG
select avg(mark) from students; 

-- MIN
 select min(mark) from students; 
 
 -- MAX
 select max(mark) from students; 
 
 -- SUM
 select sum(mark) from students; 
 
 
 
 -- GROUP BY
 select name,sum(mark) from students group by name;

-- AS (to rename column in o/p)  
select name,sum(mark) as 'Total Mark' from students group by name;
 
 
 -- HAVING clause
 select name,sum(mark) from students group by name having sum(mark)>=90;
 
 
 -- LIMIT restrict no of rows
 select * from students limit 2;



 
-- LIKE operator
-- start with A
select * from students where name like 'A%';

-- end letter A
select * from students where name like '%A';

-- Letter in b/w 
select * from students where name like '%mj%';


-- second letter m 
select * from students where name like '_m%';


-- start with a and have 3 letters atleast
select * from students where name like 'A__%';

-- start with a and end with d
select * from students where name like 'A%d';

-- NOT LIKE
select * from students where name not like 'A%';
 
 




 -- CONSTRAINTS(rules)
 -- NOT NULL 
 create table college(id int not null,cname varchar(30));
 insert into college values(null,'JDT2');
 insert into college(cname) values('ST Marys');

-- UNIQUE
create table colleges(id int unique,coname varchar(30)); 
insert into colleges values(101,'JDT');
insert into colleges values(101,'Farook');


-- PRIMARY KEY
create table college1(id int primary key,cname varchar(30)); 
insert into college1 values(101,'JDT');
insert into college1 values(101,'Farook');
alter table colleges add primary key(id);

-- #1 
create table persons2(id int not null,fname varchar(20),lname varchar(20),constraint PK_persons2 primary key(id,fname));
 insert into persons2 values(100,'Amjad','V K');
  insert into persons2 values(100,'Ramu','P');
  
-- #2 
create table persons3(id int not null,fname varchar(20),lname varchar(20),constraint primary key(id,fname));

-- #3 
create table persons4(id int not null,fname varchar(20),lname varchar(20),primary key(id,fname));

-- DROP PRIMARY KEY
alter table persons4 drop primary key;

-- FOREIGN KEY
create table customer(cid int primary key,name varchar(20));
create table orders(oid int,product varchar(20),cid int,FOREIGN KEY(cid) references customer(cid));

insert into customer values(100,'Shibin');
insert into orders values(001,'Mobile',100);
select * from orders;
desc orders;

-- CHECK (constraint is used to limit the value range that can be placed in a column)
create table licence(pid int,name varchar(20),age int,check(age>=18));
insert into licence values(1001,"Manu",12);
desc licence;


-- DEFAULT (constraint is used to set a default value for a column)
create table mvd(pid int,name varchar(20),age int,type varchar(20) default "NO LICENCE");
insert into mvd values(1,"Raju",17,"Under 18"),(2,"Jayan",22,null);
select * from mvd;
insert into mvd(pid,name,age) values(3,"ShibinK",30);


-- IN
select * from mvd where age in(17); 
select name from mvd where age in(17,22); 

-- IS NOT NULL
 select * from mvd where type is not null;
 
 -- IS NULL
 select * from mvd where type is null;

-- BETWEEN
  select * from mvd where age between 10 and 30;
  
  
  
  
  -- JOIN (is used to combine rows from two or more tables)
   select * from students;
   
create table t1(id int,name varchar(20));
insert into t1 values(1,'Raju'),(2,'Jayan');
insert into t1 values(3,'Rani');
insert into t1 values(4,'Aju');
select * from t1;

create table t2(id int,age int,address varchar(20));
insert into t2 values(1,20,"CLT"),(2,30,"MLP"),(3,25,"KNR");
insert into t2 values(4,27,"TVM");
insert into t2 values(6,22,"KNR");


-- INNER JOIN 

select t1.name,t2.age,t2.address from t1 inner join t2 on t1.id=t2.id;

select t1.id,t1.name,t2.age,t2.address from t1 inner join t2 on t1.id=t2.id;

select * from t1 inner join t2 on t1.id=t2.id;


  
-- LEFT OUTER JOIN (returns all records from the left table (table1), and the matching records from the right table (table2))
select t1.name,t2.age,t2.address from t1 left outer join t2 on t1.id=t2.id;

select t1.name,t2.age,t2.address from t1 left join t2 on t1.id=t2.id;
  
  
-- RIGHT OUTER JOIN (returns all records from the right table (table2), and the matching records from the left table (table1).)
 select t1.id,t1.name,t2.age,t2.address from t1 right outer join t2 on t1.id=t2.id;

select t1.name,t2.age,t2.address from t1 right join t2 on t1.id=t2.id;
  
  
 select * from t1 full join t2 on t1.id=t2.id order by t1.name;
 
 
 
-- RIGHT JOIN 
SELECT t1.name, t2.age
FROM t1
FULL JOIN t2 ON t1.id=t2.id
ORDER BY t1.name;


create table emply(id int,name varchar(20),salary int,depid int);
create table deptmnt(id int,name varchar(20));

select * from  deptmnt;
insert into emply values(1,"Anu",35000,100),(2,"Ramu",36600,101);
insert into emply values(3,"Anil",37000,102);

insert into deptmnt values(1000,"CS"),(1001,"Maths"),(1002,'ENG');
insert into deptmnt values(100,"CS2");


-- SUBQUERY
select name from emply where depid=(select id from deptmnt where name="CS2");

insert into deptmnt(select id,name from emply);