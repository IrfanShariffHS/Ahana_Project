
---Display the Student_id,First and Last name and Student address like City,state,Pincode

select S.student_id,S.firstname,S.lastname,A.city,A.state,A.pincode
from studentinfo S
inner join addressinfo A
on S.student_id=A.student_id
where city='Hassan'
;

--Display the faculty_id,First and Last name and Faculty address like City,state,Pincode

select F.faculty_id,F.firstname,F.lastname,A.city,A.state,A.pincode
from facultyinfo F
inner join addressinfo A
on F.faculty_id=A.faculty_id;

Select S.Student_id,S.s_firstname,F.f_firstname,C.coures_id,C1.Couresname,C2.roomtype,C.startingtime,c.endingtime,C.period,D.Weekdays
from student_class S1
inner join studentinfo S on S.student_id=S1.Student_id
inner join class C on C.class_id=S1.class_id
inner join couresinfo C1 on C1.coures_id=C.coures_id
inner join classroominfo C2 on c2.classroom_id=C.classroom_id
inner join Days D on D.Days_id=C.Days_id
inner join facultyinfo F on F.faculty_id=C.faculty_id
where  period in (1,3,5);


;

alter table studentinfo
modify firstname to s_firstname varchar(45)


select * from days

select * from couresinfo;
update couresinfo
set requirements='Degree'
where coures_id='P26'

update couresinfo
set maxcapacity=45
where coures_id='P26'

update couresinfo
set duration=3
where coures_id='P26'