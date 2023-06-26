Select * from addressinfo
where student_id is NUll;

insert into addressinfo (address_id,city,state,country,pincode,faculty_id)values('A200','Hassan','Karnataka','india','573201','T21');

alter table facultyinfo
add instruct varchar(45) Null;

update facultyinfo
set email='umesh@gmail.com'
where faculty_id ='T21';


select *
from facultyinfo
where instruct IN ( select faculty_id
from facultyinfo
where faculty_id='T12');