----Complex Queries

-- creating database
create database School_Management;
use School_Management;

-- creating table
create table Student
(
studentid int primary key identity,
name varchar(20) not null,
standard int not null,
section char not null
);

select * from Student;

create table marks
(
tamil int not null,
english int not null,
maths int not null,
science int not null,
Social int not null
);
select * from marks;

insert into student(name,standard,section) values ('Sunil','10','A'),('Suresh','10','B'),('Gowri','10','C');
insert into student(name,standard,section) values ('Bharath','10','D'),('Kapil','10','A'),('Nikita','10','E'),('Vel','10','B');
insert into marks(tamil,english,maths,science,Social) values('98','89','76','98','87'),('76','66','66','75','78'),('45','65','54','65','43');
alter table marks add id int primary key identity;
alter table marks add studentid int;

-- one to one relationship 
alter table marks add foreign key(studentid) references student(studentid);

update marks set studentid = 1 where id = 1;

update marks set studentid = 2 where id = 2;

update marks set studentid = 5 where id = 6;

insert into marks(tamil,english,maths,science,Social,studentid) values('65','65','66','66','65','5'),('76','76','56','65','76','6');

--joins
--inner join

select * from Student inner join marks on marks.id = student.studentid;

--left join

select * from Student left join marks on marks.id = student.studentid;
--right join
select * from Student right join marks on marks.id = student.studentid;

--full join
select * from Student full join marks on marks.id = student.studentid;

--self join
select A.name as nameA, B.name as nameB from Student A,student B where A.studentid <> B.studentid and A.section = B.section;

--subquery

select m.tamil, m.english, m.maths,m.science,m.Social from marks m where m.id in (select studentid from student where studentid <5);

--functions
--aggregate functions
---date functions
-- string functions
--numeric functions

select count(id) as Number_of_students from marks;

select min(english) as last_mark_english from marks;

select max(tamil) as first_mark_tamil from marks;

select GETDATE();

--index

create index idx_studentname on student(name);

drop index student.idx_studentname;

--view

CREATE VIEW [student_details] AS
select * from Student where studentid>0;

--triggers
CREATE TRIGGER studentTrigger
on student
after insert
AS
BEGIN
INSERT INTO student(name)values('Ajith');
end

-- stored procedure
create procedure Student_Procedure
as
Select * from Student;
go

--complex queries
select s.studentid,s.name,s.standard,s.section,m.tamil,m.english,m.maths,m.science,m.Social from student s right join marks m on s.studentid =m.id order by name asc;
