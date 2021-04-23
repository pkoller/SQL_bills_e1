USE T4
SELECT BillID, CONCAT( c.FirstName,' ',c.LastName) as Customer , PayDay, Amount, pm.name
FROM BILLS p 
JOIN PAYMENTMETHODS pm ON pm.PaymentMethodId = p.PaymentMethod
JOIN CUSTOMER c ON c.CustomerId = p.CustomerID
ORDER BY PayDay
