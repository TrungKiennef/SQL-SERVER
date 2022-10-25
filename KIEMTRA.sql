CREATE DATABASE AZbank

USE AZbank

DROP DATABASE AZbank

CREATE TABLE customer(
CustomerID int PRIMARY KEY,
[Name] nvarchar(50),
City nvarchar(50),
Country nvarchar(50),
Phone nvarchar(50),
Email nvarchar(50),
)

CREATE TABLE customeraccount(
Accountnumber char(9) PRIMARY KEY,
CustomerID int,
Balance money,
Minaccount money,
CONSTRAINT ck FOREIGN KEY (CustomerID) REFERENCES customer(customerID),
)

CREATE TABLE customerTransaction(
TraNsationID int PRIMARY KEY,
Accountnumber char(9),
Transactiondate smalldatetime,
Amount money,
Depositorwithdraw bit,
CONSTRAINT fk FOREIGN KEY(Accountnumber) REFERENCES customeraccount(accountnumber),
)

INSERT INTO customer ([name], City, Country) VALUES ('Kien', 'HaNoi', 'VietNam');
INSERT INTO customeraccount (Accountnumber, CustomerID, balance) VALUES (12345678, 'Kien', 100000);
INSERT INTO customerTransaction(TraNsationID, Accountnumber, Transactiondate) VALUES (123, 12345678, 2022);

SELECT * FROM customer
WHERE [Name] LIKE '%Hanoi'

SELECT [Name],Phone, Email, AccountNumber,Balance FROM Customer
JOIN customeraccount 
ON CustomerAccount.CustomerId = Customer.CustomerId

ALTER TABLE CustomerTransaction
ADD CONSTRAINT fk_123 CHECK (DepositorWithdraw > 0 and DepositorWithdraw <= 1000000)

CREATE VIEW CustomerTransactions 
AS
SELECT Name,CustomerAccount.AccountNumber,TransactionDate,Amount,DepositorWithdraw FROM Customer
JOIN CustomerAccount ON
Customer.CustomerId = CustomerAccount.CustomerId
JOIN CustomerTransaction ON
CustomerTransaction.AccountNumber = CustomerAccount.AccountNumber;