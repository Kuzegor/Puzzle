USE Puzzle;
UPDATE dbo.ListOfCourses SET SizeMB = SUBSTRING(Courses,CHARINDEX('"",',Courses),len(Courses));
UPDATE dbo.ListOfCourses SET SizeMB = SUBSTRING(SizeMB,4,len(SizeMB)-10);
UPDATE dbo.ListOfCourses SET SizeMB = 1 WHERE ID = 222;
DELETE FROM dbo.ListOfCourses WHERE ID = 1 OR ID = 281;
ALTER TABLE dbo.ListOfCourses ALTER COLUMN SizeMB int;

DECLARE @count int
SET @count = 0
DECLARE @sum int
SET @sum = 0
WHILE (@sum<5120)
BEGIN
	SET @sum += (SELECT SizeMB FROM dbo.ListOfCourses WHERE ID = @count+2)
	SET @count += 1
END
PRINT 'Нужно удалить минимум ' + Convert(varchar(3),@count) +' курсов'