CREATE DATABASE BookLibrary 
GO
USE BookLibrary 
GO
DROP DATABASE BookLibrary
GO

CREATE TABLE Book(
    BookCode int PRIMARY KEY,
   BookTitle nvarchar(100),
    Author nvarchar(50),
	Edition int, 
	BookPrice money,
	Copies int, 
)
go

CREATE TABLE Member(
    MemberCode int PRIMARY KEY,
   Address nvarchar(100),
   Name nvarchar(50),
	PhoneNumber int, 
)
go
SELECT * FROM Member

CREATE TABLE IssueDetails(
    BookCode int, 
	MemberCode int,
   ReturnDate datetime,
   IssueDate datetime,
   CONSTRAINT KH FOREIGN KEY (MEMBERCODE) REFERENCES MEMBER(MEMBERCODE),
   CONSTRAINT JH FOREIGN KEY (BOOKCODE) REFERENCES BOOK(BOOKCODE)
)
go

ALTER TABLE book ADD CONSTRAINT CHK_RC CHECK(edition >0)
GO

ALTER TABLE member ADD CONSTRAINT CHK_Rf CHECK(phonenumber >0)
GO

ALTER TABLE book ADD CONSTRAINT CHK_Ra CHECK(0< bookprice)
GO

ALTER TABLE book ADD CONSTRAINT CHK_Rb CHECK( bookprice < 200)
GO
