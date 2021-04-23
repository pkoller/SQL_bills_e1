CREATE PROCEDURE sp_addEmployee
	@FName varchar(30),
	@LName varchar(30)
AS
	INSERT INTO Customer (FirstName, LastName)
	VALUES (@FName, @LName)
	SELECT CAST (SCOPE_IDENTITY() AS INT) as employeeNR;