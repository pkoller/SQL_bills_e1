
USE T4

SELECT *
FROM dbo.f_countALLforcustomer()

-- 
SELECT amount, c.FirstName, c.LastName
FROM dbo.f_countALLforcustomer() cou
RIGHT JOIN CUSTOMER c ON c.CustomerId = cou.CustomerId