USE Puzzle;
UPDATE dbo.ListOfCourses SET Size = SUBSTRING(Courses,CHARINDEX('"",',Courses),len(Courses));
UPDATE dbo.ListOfCourses SET Size = SUBSTRING(Size,4,len(Size)-10);
UPDATE dbo.ListOfCourses SET Size = 1 WHERE ID = 222;
DELETE FROM dbo.ListOfCourses WHERE ID = 1 OR ID = 281;
ALTER TABLE dbo.ListOfCourses ALTER COLUMN Size int;

DECLARE @count int
SET @count = 0
DECLARE @sum int
SET @sum = 0
WHILE (@sum<5120)
BEGIN
	SET @sum += (SELECT Size FROM dbo.ListOfCourses WHERE ID = @count+2)
	SET @count += 1
END
PRINT 'Нужно удалить минимум ' + Convert(varchar(3),@count) +' курсов'