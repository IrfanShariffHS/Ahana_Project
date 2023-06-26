create view age
as
select min(age) 
from studentinfo 
where gender='female';

delete from studentinfo where student_id='S852'

delete from studentinfo where student_id='123'


INSERT INTO studentinfo (student_id, username, s_firstname, s_lastname, age, gender, email, phonenumber)
VALUES ('123', 'john_doe', 'John', 'Doe', 25, 'Male', 'john.doe@example.com', '1234567890');

select * delete from studentinfo where student_id='123';


create view agemale
as
select Student_id,S_firstname,age
from studentinfo
where gender='Male';

select * from agemale;


select F1.faculty_id,F1.username,F2.instruct
from facultyinfo F1 join facultyinfo F2 on F1.instruct=F2.faculty_id;



