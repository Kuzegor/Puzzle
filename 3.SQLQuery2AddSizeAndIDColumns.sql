USE Puzzle;
ALTER TABLE dbo.ListOfCourses 
ADD SizeMB varchar(100);
ALTER TABLE dbo.ListOfCourses
ADD ID int IDENTITY PRIMARY KEY;