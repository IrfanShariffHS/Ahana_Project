--1.Retrieve the names of all faculty members who teach a specific course:
Select F.faculty_id,F.f_firstname,C1.coures_id,C1.couresname
from class C
inner join facultyinfo F on F.faculty_id=C.faculty_id
inner join couresinfo C1 on C1.coures_id=C.coures_id
where F.faculty_id='T03';

--2.Retrive the List of Student along with their coures enrollement count
select S.s_firstname,Count(S.Student_id) as 'Enrollement Coures'
from studentinfo S
left join Marksinfo M on S.student_id =M.student_id
left join couresinfo C on C.coures_id=M.coures_id
group by S.student_id,S.s_firstname;

select * from studentinfo;

--3.Retrive the Total marks oBtained by Each student in a specific class
select S.s_firstname,Sum(M.marks) as 'Total Marks'
from Marksinfo M
join studentinfo S on S.student_id=M.student_id
join Class C on C.class_id=M.class_id
where S.student_id='S89'
group by S.s_firstname,S.student_id;


--4.Retrive the Student Who have Not Ennrollement in any class
Select S.s_firstname,S.student_id
from studentinfo S
left join student_class S1 on S.Student_id=S1.Student_id
Where S1.Student_id is Null


--5.Retrive the coures That have Not  been assigned to faculty
SELECT f.f_firstname
FROM facultyinfo f
Left join class C  on f.faculty_id=C.faculty_id
WHERE C.class_id IS NULL;

--6.Retrive the courses that have not been assigned any class
select C.roomtype
from class C1
right join classroominfo C on C.classroom_id=C1.classroom_id
where C1.class_id is null

--7.Retrive the total Marks obtained by each student in a Specific class.
Create Procedure SpSpecificclass(
@couresname varchar(45))
as
begin
Select S.s_firstname,sum(M.marks) as 'total marks'
from studentinfo S
inner join Marksinfo M on M.student_id=S.student_id
inner join Class C on C.class_id=M.class_id
inner join couresinfo C1 on C1.coures_id=M.coures_id
where C1.couresname=@couresname
group by S.s_firstname,S.student_id
end;


select * from cou


exec SpSpecificclass 'Java';
---faculty taking the class 
SELECT f_firstname
FROM facultyinfo
WHERE faculty_id IN (
    SELECT faculty_id
    FROM class
    GROUP BY faculty_id
    HAVING COUNT(DISTINCT coures_id)=3
);

select S_firstname
from studentinfo
where student_id in (select student_id
from Marksinfo
group by student_id
having Count(Distinct coures_id)=1);


delete from Marksinfo
where marks_id='M256'


--Student Were Not Taking the Exam
select *
from studentinfo C
right join Marksinfo M on M.student_id=C.student_id
where M.coures_id is Null;

---List the Student deatails Who Were Taking The Coures Java,SQL and AWS 
select *
from studentinfo
where student_id In (select student_id 
from Marksinfo
where coures_id In (select coures_id
from couresinfo
where couresname in ('Java','AWS','SQL')))

--List the faculty who where Reporting to faculty T20 and T21


select *
from studentinfo
where student_id='S01'