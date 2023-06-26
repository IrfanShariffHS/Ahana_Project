drop database School
create database School

Create Table studentinfo(
student_id varchar(45) PRIMARY KEY Not Null,
username varchar(45) Null Default Null,
firstname varchar(45) Null Default Null,
lastname varchar(45) Null Default Null,
age Int Null Default Null,
gender varchar(45) Null Default Null,
email VARCHAR(45) NULL DEFAULT NULL,
phonenumber BIGINT NULL DEFAULT NULL);

Select * from studentinfo;
Select * from facultyinfo;

select * from couresinfo;

Create Table facultyinfo(
faculty_id varchar(45) PRIMARY KEY Not Null,
username varchar(45) Null Default Null,
firstname varchar(45) Null Default Null,
lastname varchar(45) Null Default Null,
age Int Null Default Null,
gender varchar(45) Null Default Null,
email VARCHAR(45) NULL DEFAULT NULL,
phonenumber BIGINT NULL DEFAULT NULL);
 
Create  Table addressinfo(
address_id varchar(45) PRIMARY KEY Not Null,
city varchar(45) Null Default Null,
state varchar(45) Null Default Null,
country varchar(45) Null Default Null,
pincode varchar(45) Null Default Null,
student_id varchar(45) Null Default Null,
faculty_id varchar(45) Null Default Null);


alter table addressinfo
add constraint fk_studentinfo_addressinfo
foreign key(student_id)
references studentinfo(student_id)

alter table addressinfo
add constraint fk_addressinfo_facultyinfo
foreign key(faculty_id)
references facultyinfo(faculty_id)
select  * from facultyinfo;

create table couresinfo(
coures_id varchar(45) primary key not null,
couresname varchar(45) null default null,
requirements varchar(45) Null default null,
maxcapacity int null default null,
duration int not null);


create table classroominfo(
classroom_id varchar(45) primary key not null,
capacity int null default null,
roomtype varchar(45) null default null,
facilities varchar(45) null default null);
select * from classroominfo;


create table class(
class_id varchar(45) primary key not null,
classroom_id varchar(45) null default null,
coures_id varchar(45) null default null,
faculty_id varchar(45) null default null,
Days_id int null default null,
period int not null,
startingtime time not null,
endingtime time not null
);

drop table class

select * from couresinfo;
select * from class;
select * from classroominfo;

alter table class
add constraint Fk_class_classroominfo
foreign key(classroom_id)
references classroominfo(classroom_id)

alter table class
add constraint Fk_class_couresinfo
foreign key(coures_id)
references couresinfo(coures_id)

alter table class
add constraint FK_class_facultyinfo
foreign key(faculty_id)
references facultyinfo(faculty_id)


alter table class
add constraint fk_class_Days
foreign key(Days_id)
references Days(Days_id)

select * from studentinfo;

--drop table student_class;

Create table student_class(
class_id varchar(45) Not Null,
Student_id varchar(45) Not Null);

alter table student_class
add constraint fk_studentclass_class
foreign key(class_id)
references class(class_id)

alter table student_class
add constraint fk_studentclass_Studentinfo
foreign key(student_id)
references studentinfo(student_id)



Create Table Days(
Days_id int primary key Not Null,
Weekdays Varchar(45)  null default null);      



select * from marksinfo;
create table Marksinfo(
marks_id varchar(45) primary key not null,
student_id varchar(45) Not Null,
center_id varchar(45) Not Null,
class_id varchar(45) Not Null,
coures_id varchar(45) Not Null,
couresname varchar(45) Not Null,
marks int not null);


alter table marksinfo
add marks int not null;

alter table marksinfo
add constraint fk_marksinfo_examcenter 
foreign key (center_id) references examcenter(center_id);


alter table marksinfo
add constraint fk_marksinfo_student 
foreign key (student_id) references studentinfo(student_id);

alter table marksinfo
add constraint fk_maksinfo_class
foreign key(class_id) references class(class_id);



alter table marksinfo
add constraint fk_maksinfo_couresinfo
foreign key(coures_id) references couresinfo(coures_id);


Create Table examcenter(
center_id varchar(45) primary key Not Null,
centername Varchar(45)  null default null);  

