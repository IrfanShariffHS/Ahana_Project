DECLARE @facultyid varchar(45),
@firstname Varchar(45),
@lastname varchar(45),
@couresname varchar(max),
@classroom varchar(45),
@days varchar(45),
@period varchar(45),
@startingtime time,
@endingtime Time;

DECLARE Faculty_Cursor CURSOR FOR
SELECT faculty_id, f_firstname, f_lastname, couresname, classroom_id, weekdays, period, startingtime, endingtime
FROM facultyclass;

OPEN Faculty_Cursor;

FETCH NEXT FROM Faculty_Cursor INTO @facultyid, @firstname, @lastname, @couresname, @classroom, @days, @period, @startingtime, @endingtime;

DECLARE @currentDay varchar(45);
SET @currentDay = '';

WHILE @@FETCH_STATUS = 0
BEGIN

    IF @currentDay <> @days
    BEGIN
        PRINT '=====================================';
        PRINT CONCAT('Day:', @days);
        PRINT '=====================================';
        SET @currentDay = @days;
    END
	

    PRINT CONCAT('Name:', @firstname + ' ' + @lastname);
    PRINT CONCAT('Faculty ID:', @facultyid);
    PRINT CONCAT('Course Name:', @couresname);
    PRINT CONCAT('Classroom:', @classroom);
    PRINT CONCAT('Period:', @period);
    PRINT CONCAT('Class Starting Time:', @startingtime);
    PRINT CONCAT('Class Ending Time:', @endingtime);
	print'-----------------------------------------------------------------------------------------------------------------'

    FETCH NEXT FROM Faculty_Cursor INTO @facultyid, @firstname, @lastname, @couresname, @classroom, @days, @period, @startingtime, @endingtime;
END

CLOSE Faculty_Cursor;
DEALLOCATE Faculty_Cursor;