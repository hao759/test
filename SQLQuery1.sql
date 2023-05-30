--CREATE PROCEDURE GetAllCourse
--as
--BEGIN
--   SELECT * FROM Courses;
--END;

alter PROCEDURE GetAllUser
as
BEGIN
   SELECT *
   FROM employees
   --ORDER BY HireDay
END;

exec GetAllUser;
go;


--alter PROCEDURE GetUserByid @Id varchar(36)
--AS
--BEGIN
--    SELECT * FROM 
--	employees
--	WHERE id = CAST(@Id AS UNIQUEIDENTIFIER);
--END

alter PROCEDURE GetUserByid @Id uniqueidentifier
AS
BEGIN
    SELECT * FROM 
	employees
	WHERE id = @Id ;
END

DECLARE @myParam varchar(36)
SET @myParam = '6c0ab49a-4639-4de1-93fc-08db406bc025'
exec GetUserByid @myParam;

go;

alter PROCEDURE DeleteEmployee @Id uniqueidentifier
AS
BEGIN
	DELETE FROM employees
	WHERE id = @Id ;
END

DECLARE @myParam uniqueidentifier
SET @myParam = '3d7d8692-34f1-4667-a74c-08db40df32af'
exec DeleteEmployee @myParam;

go;

alter PROCEDURE EditEmployee @Id uniqueidentifier,@Name nvarchar(20),@email nvarchar(20),@salary nvarchar(20)--,@update datetime2(7)

--
AS
BEGIN
	 UPDATE Employees 
	 SET	
		Name = @Name,
		Email = @email,
		Salary= CONVERT(BIGINT, @salary)
		--UpdateDate=@update
	 WHERE Id = @Id;
END


EXEC EditEmployee '5cde9504-9fe2-4f01-be6f-08db40bf34cc','dabf','qhao74154@gmail.com',89;
