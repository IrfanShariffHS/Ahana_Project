create view Studentcouesinfo
as
select S.student_id,S.username,C.class_id,C1.coures_id,C1.couresname,M.marks
from markSinfo M
inner join Studentinfo S on S.student_id=M.student_id
inner join Couresinfo C1 on C1.coures_id=M.coures_id
inner join Class C on C.class_id=M.class_id;

select Couresname from Studentcouesinfo where student_id='S01'


select *
from marksinfo;

select * from marksinfo
where student_id='S01';


select  S.s_firstname,s.student_id,C1.class_id,C.couresname,M.marks,Avg(marks) as Percentage
from studentinfo S
inner join marksinfo M on M.student_id=S.student_id
inner join couresinfo C on M.coures_id=C.coures_id
inner join class C1 on C1.class_id=M.class_id
group by S.s_firstname,s.student_id,C1.class_id,C.couresname,M.marks
having Count(S.student_id)>=1;

select * from examcenter;

alter procedure spmarksinfo(
@student_id as varchar(45))
as
begin
select S.Student_id,S.s_firstname,C.Couresname,E.centername,f.faculty_id,F.f_firstname
from marksinfo M
inner join studentinfo S on M.student_id=S.student_id
inner join couresinfo C on C.coures_id=M.Coures_id
inner join examcenter E on E.center_id=M.center_id
inner join class C1 on M.class_id=C1.class_id
inner join facultyinfo F on F.faculty_id=C1.faculty_id
group by S.Student_id,S.s_firstname,C.Couresname,E.centername,f.faculty_id,F.f_firstname
having Count(S.student_id)>=1
where S.student_id=@student_id
end;

create view vwhassanstudent
as
select *
from studentinfo 
where student_id In (select student_id
from addressinfo
where city='hassan');


select *from vwhassanstudent


select * from addressinfo


exec spmarksinfo 'S89';

select * from marksinfo where student_id='S88';
order by student_id asc;

select student_id,sum(marks) as 'Sum of Marks',Avg(marks) as 'Percentage'
from marksinfo
group by Student_id;

select * 
from marksinfo
where Student_id='S10';

