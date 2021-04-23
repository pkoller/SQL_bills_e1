CREATE PROCEDURE sp_addPayment
	@CustomerID int,
	@PayDay date,
	@Amount smallmoney,
	@PaymentMethod nvarchar(50)
AS
	INSERT INTO Payments (CustomerID, PayDay, Amount, PaymentMethod)
	VALUES (@CustomerID, @PayDay, @Amount, @PaymentMethod)
	SELECT CAST (SCOPE_IDENTITY() AS INT) as RechnungsNummer;

