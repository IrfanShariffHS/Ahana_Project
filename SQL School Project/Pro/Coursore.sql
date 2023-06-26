DECLARE @student_id varchar(45),
@username Varchar(45),
@couresname varchar(maX),
@marks1 VARCHAR(45),
@marks int,
@Marks_total int,
@Percentage int;

DECLARE Student_Cursor CURSOR FOR SELECT student_id, username, coures_id, marks FROM Studentcouesinfo;

OPEN Student_Cursor;

FETCH NEXT FROM Student_Cursor INTO @student_id, @username, @couresname, @marks;

WHILE @@FETCH_STATUS = 0
BEGIN
 
    PRINT CONCAT('Name:', @username);
    PRINT CONCAT('RollNo:', @student_id);
    SET @couresname = (SELECT  Count(*) FROM Studentcouesinfo WHERE student_id =@student_id);
    PRINT CONCAT('Number of Course:',@Couresname );

	set @couresname =(SELECT STRING_AGG(couresname, ', ')
	FROM Studentcouesinfo
	WHERE student_id = @student_id
	GROUP BY student_id);

	PRINT 'Course Names: ' + @couresname;

	set @marks1=(Select STRING_AGG(cast(marks as varchar),',')
	from Marksinfo
	where student_id=@student_id
	group by student_id);

	PRINT 'Marks: ' + @marks1;
	
    SET @Marks_total = (SELECT SUM(marks) FROM Studentcouesinfo WHERE student_id = @student_id);
    PRINT CONCAT('Total:', @Marks_total);

    SET @Percentage = @Marks_total / (SELECT COUNT(student_id) FROM Studentcouesinfo WHERE student_id = @student_id);
    PRINT CONCAT('Percentage:', @Percentage, '%');

    IF @Percentage > 80
    BEGIN
        PRINT 'Grade: A';
    END
    ELSE IF @Percentage > 60 AND @Percentage < 80
    BEGIN
        PRINT 'Grade: B';
    END
    ELSE
    BEGIN
        PRINT 'Grade: C';
    END



	
    PRINT('===============================================================================================================================================================================================================================================');

    FETCH NEXT FROM Student_Cursor INTO @student_id, @username, @couresname, @marks;
END

CLOSE Student_Cursor;
DEALLOCATE Student_Cursor;