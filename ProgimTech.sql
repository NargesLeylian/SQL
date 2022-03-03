
-- Create, Alter and Delete a Database
/*
CREATE DATABASE Testdb
ALTER DATABASE Testdb MODIFY NAME = Testdb1
EXEC sp_renamedb 'Testdb1','Testdb11'
ALTER DATABASE Testdb11 SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE Testdb11
*/

--Create Table And Foregn Key
USE Sample1
Go


CREATE TABLE tblPerson
(
  ID INT NOT NULL PRIMARY KEY,
  Name NVARCHAR(50),
  GenderID INT
)

CREATE TABLE tblGender
(
  ID INT NOT NULL PRIMARY KEY,
  Gender NVARCHAR(20) NOT NULL
)

ALTER TABLE tblPerson ADD CONSTRAINT tblPerson_GenderID_FK
FOREIGN KEY (GenderID) REFERENCES tblGender(ID)

-- Add Default Constraint
ALTER TABLE tblPerson 
ADD CONSTRAINT DF_tblPerson_GenderID
DEFAULT 3 FOR GenderID

-- Add Constraint not null
ALTER TABLE tblPerson
ALTER COLUMN GendeID INT NOT NULL

-- Add Check Constraint
ALTER TABLE tblPerson
ADD CONSTRAINT CK_tblPerson_Age CHECK (Age > 0 AND Age < 150)

-- Drop Check Constraint 
ALTER TABLE tblPerson
DROP CK_tblPerson_Age