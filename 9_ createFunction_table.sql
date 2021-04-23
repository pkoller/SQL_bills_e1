ALTER FUNCTION countALLForCustomer()
RETURNS TABLE
AS RETURN
(
	 SELECT SUM(Amount) as amount, CustomerID
	FROM PAYMENTS p
	GROUP BY p.CustomerID
);

