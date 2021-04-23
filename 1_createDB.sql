
create DATABASE T4
USE T4

DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS PAYMENTS;
DROP TABLE IF EXISTS PAYMENTMETHODS;

CREATE TABLE CUSTOMER(
	CustomerId INT identity,
	FirstName  nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL ,

	CONSTRAINT pk_Customers PRIMARY KEY (CustomerId)
	);

CREATE TABLE PAYMENTMETHODS(
	PaymentMethodId INT IDENTITY,
	Name nvarchar(30)
	
	CONSTRAINT pk_paymentmethod PRIMARY KEY (PaymentMethodId)
	)

CREATE TABLE Bills(
	BillId INT NOT NULL IDENTITY,
	CustomerID INT NOT NULL, -- foreign key
	PayDay date NOT NULL,
	Amount smallmoney NOT NULL,
	PaymentMethod INT NOT NULL

	CONSTRAINT pk_Payment PRIMARY KEY (BillId),
	CONSTRAINT fk_PaymentCustomer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerId),
	CONSTRAINT fk_PaymentMethod FOREIGN KEY (PaymentMethod) REFERENCES PAYMENTMETHODS(PaymentMethodId)
	);

INSERT INTO Customer (FirstName, LastName)
	VALUES	('Anna', 'Klingberg'),
			('Franz', 'Herbst'),
			('Sebastian', 'Kern');

INSERT INTO PAYMENTMETHODS (Name)
VALUES ('Bar'),
	   ('Bankomat'),
	   ('Paypal');

INSERT INTO Bills (CustomerID, PayDay, Amount, PaymentMethod)
VALUES	(1, DATEFROMPARTS ( 2019, 01, 12 ), 125.00, 1),
		(2, DATEFROMPARTS ( 2019, 01, 13 ), 540.00, 2),
		(3, DATEFROMPARTS ( 2019, 01, 13 ), 125.34, 1),
		(1, DATEFROMPARTS ( 2019, 01, 15 ), 223.66, 3),
		(3, DATEFROMPARTS ( 2019, 01, 16 ), 99.98,  2)
		;

SELECT *
FROM Customer;

SELECT *
FROM BILLS;

SELECT amount, name
FROM Bills p
JOIN PAYMENTMETHODS pm ON pm.PaymentMethodId = p.PaymentMethod;