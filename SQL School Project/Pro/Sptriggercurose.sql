CREATE TRIGGER insert_student_trigger ON studentinfo
After Insert
as
BEGIN
Declare @Student_id varchar(45);
Declare @Age int;


select @Age=i.age from inserted i;
---Student's age Must Be Less 30 Years.
if @Age>30
	Begin
	print 'Not Eligible : Age is Greather Than 30';
	Rollback
	End
else
	begin
	print'Student details inserted Sucessfully';
	end
end;
-------------------------------------------------------------------------------------
CREATE TRIGGER insert_student_trigger1
ON studentinfo
after INSERT,DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO studentinfo (student_id, username, s_firstname, s_lastname, age, gender, email, phonenumber)
    SELECT i.student_id, i.username, i.s_firstname, i.s_lastname, i.age, i.gender, i.email, i.phonenumber
    FROM inserted AS i
    LEFT JOIN studentinfo AS s ON i.student_id = s.student_id
    WHERE s.student_id IS NULL;
END;


Insert into dbo.studentinfo(student_id, username, s_firstname, s_lastname, age, gender, email, phonenumber)
values('S852','Ashok','Ashok','Kumar',30,'Male','ashok@gmail.com','7485963210');

select * from studentinfo where student_id='S852';



drop table studentHistorty;

Create table [dbo].[studentHistorty]
(
student_id varchar(45) Not Null,
field_name varchar(45) Not Null,
Old_value Varchar(45) Not Null,
New_value Varchar(45) Not Null,
Record_DateTime datetime Not Null);


Create trigger dbo.trgAfterUpdate On dbo.Studentinfo
After Update
as 
declare @student_id varchar(45);
declare @username varchar(45);
declare @s_firstname varchar(45);
declare @s_lastname varchar(45);
declare @age int
declare @gender varchar(45);
declare @email varchar(45);
declare @phonenumber bigint;

declare @old_username varchar(45);
declare @old_s_firstname varchar(45);
declare @old_s_lastname varchar(45);
declare @old_age int;
declare @old_gender varchar(45);
declare @old_email varchar(45);
declare @old_phonenumber bigint;

select @student_id=i.student_id from inserted i;
select @username=i.username from inserted i;
select @s_firstname=i.s_firstname from inserted i;
select @s_lastname=i.s_lastname from inserted i;
select @age =i.age from inserted i;
select @gender=i.gender from inserted i;
select @email =i.email from inserted i;
select @phonenumber=i.phonenumber from inserted i;

select @old_username=i.username from deleted i;
select @old_s_firstname=i.s_firstname from deleted i;
select @old_s_lastname=i.s_lastname from deleted i;
select @old_age=i.age from deleted i;
select @old_gender=i.gender from deleted i;
select @old_email=i.email from deleted i;
select @old_phonenumber=i.phonenumber from deleted i;


if update(username)
begin
insert into studentHistorty(student_id,field_name,Old_value,New_value,Record_DateTime) 
values(@student_id,'username',@old_username,@username,getdate())
end

if update(s_firstname)
begin
insert into studentHistorty(student_id,field_name,Old_value,New_value,Record_DateTime) 
values(@student_id,'s_firstname',@old_s_firstname,@s_firstname,getdate())
end

if update(s_lastname)
begin
insert into studentHistorty(student_id,field_name,Old_value,New_value,Record_DateTime) 
values(@student_id,'s_lastname',@old_s_lastname,@old_s_lastname,getdate())
end

if update(age)
begin
insert into studentHistorty(student_id,field_name,Old_value,New_value,Record_DateTime) 
values(@student_id,'age',@old_age,@age,getdate())
end

if update(gender)
begin
insert into studentHistorty(student_id,field_name,Old_value,New_value,Record_DateTime) 
values(@student_id,'gender',@old_gender,@gender,getdate())
end

if update(email)
begin
insert into studentHistorty(student_id,field_name,Old_value,New_value,Record_DateTime) 
values(@student_id,'email',@old_email,@email,getdate())
end

if update(phonenumber)
begin
insert into studentHistorty(student_id,field_name,Old_value,New_value,Record_DateTime) 
values(@student_id,'phonenumber',@old_phonenumber,@phonenumber,getdate())
end


select * from studentHistorty;

update studentinfo
set phonenumber='9148229772'
where student_id='S06';

------------------------------------------------------------
select * from facultyinfo;


drop table facultyHistorty;

Create table [dbo].[facultyHistorty]
(
faculty_id varchar(45) Not Null,
field_name varchar(45) Not Null,
Old_value Varchar(45) Not Null,
New_value Varchar(45) Not Null,
Record_DateTime datetime Not Null);


Alter trigger dbo.tirgAfterUpdate On dbo.facultyinfo
After Update
as 
declare @faculty_id varchar(45);
declare @username varchar(45);
declare @f_firstname varchar(45);
declare @f_lastname varchar(45);
declare @age int
declare @gender varchar(45);
declare @email varchar(45);
declare @phonenumber bigint;
declare @instruct varchar(45);


declare @old_username varchar(45);
declare @old_f_firstname varchar(45);
declare @old_f_lastname varchar(45);
declare @old_age int;
declare @old_gender varchar(45);
declare @old_email varchar(45);
declare @old_phonenumber bigint;
declare @old_instruct varchar(45);


select @faculty_id=i.faculty_id from inserted i;
select @username=i.username from inserted i;
select @f_firstname=i.f_firstname from inserted i;
select @f_lastname=i.f_lastname from inserted i;
select @age =i.age from inserted i;
select @gender=i.gender from inserted i;
select @email =i.email from inserted i;
select @phonenumber=i.phonenumber from inserted i;
select @instruct=i.instruct from inserted i;


select @old_username=i.username from deleted i;
select @old_f_firstname=i.f_firstname from deleted i;
select @old_f_lastname=i.f_lastname from deleted i;
select @old_age=i.age from deleted i;
select @old_gender=i.gender from deleted i;
select @old_email=i.email from deleted i;
select @old_phonenumber=i.phonenumber from deleted i;
select @old_instruct=i.instruct from deleted i;

if update(username)
begin
insert into facultyHistorty(faculty_id,field_name,Old_value,New_value,Record_DateTime) 
values(@faculty_id,'username',@old_username,@username,getdate())
end

if update(f_firstname)
begin
insert into facultyHistorty(faculty_id,field_name,Old_value,New_value,Record_DateTime) 
values(@faculty_id,'s_firstname',@old_f_firstname,@f_firstname,getdate())
end

if update(f_lastname)
begin
insert into facultyHistorty(faculty_id,field_name,Old_value,New_value,Record_DateTime) 
values(@faculty_id,'s_lastname',@old_f_lastname,@f_lastname,getdate())
end

if update(age)
begin
insert into facultyHistorty(faculty_id,field_name,Old_value,New_value,Record_DateTime) 
values(@faculty_id,'age',@old_age,@age,getdate())
end

if update(gender)
begin
insert into facultyHistorty(faculty_id,field_name,Old_value,New_value,Record_DateTime) 
values(@faculty_id,'gender',@old_gender,@gender,getdate())
end

if update(email)
begin
insert into facultyHistorty(faculty_id,field_name,Old_value,New_value,Record_DateTime) 
values(@faculty_id,'email',@old_email,@email,getdate())
end

if update(phonenumber)
begin
insert into facultyHistorty(faculty_id,field_name,Old_value,New_value,Record_DateTime) 
values(@faculty_id,'phonenumber',@old_phonenumber,@phonenumber,getdate())
end

if update(instruct)
begin
insert into facultyHistorty(faculty_id,field_name,Old_value,New_value,Record_DateTime) 
values(@faculty_id,'instruct',@old_instruct,@instruct,getdate())
end

select * from facultyinfo;
select *  from facultyHistorty;

update facultyinfo
set f_lastname='Kumar'
where faculty_id='T01'

where