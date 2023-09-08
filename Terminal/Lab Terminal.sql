
SELECT * FROM Branch 
WHERE branchNo NOT IN
(SELECT PropertyForRent.branchNo FROM PropertyForRent)

SELECT *  FROM Staff AS closest_to_retiring ORDER BY DOB 

SELECT * FROM PrivateOwner WHERE address LIKE '%Glasgow%'

SELECT * FROM Client

SELECT * FROM Client WHERE Client.prefType = 'HOUSE' AND Client.eMail LIKE '%gmail%' AND client.clientNo IN
(SELECT Registration.clientNo FROM Registration WHERE staffNo = 'SG37')

CREATE PROCEDURE Flats 
AS
SELECT * FROM PropertyForRent WHERE PropertyForRent.type = 'Flat'

EXEC Flats

CREATE PROCEDURE StaffInBranch @bNo varchar(10)
AS
SELECT * FROM Staff WHERE Staff.branchNo = @bNo

EXEC StaffInBranch 'B005'

CREATE PROCEDURE ClientPropViewed @cNo VARCHAR(10), @mail varchar(50)
AS
SELECT Viewing.clientNo, propertyNO, viewDate, comment FROM Viewing 
JOIN Client ON Client.clientNo = Viewing.clientNo AND Viewing.clientNo = @cNo AND Client.eMail = @mail

EXEC ClientPropViewed 'CR62', 'maryt@hotmail.co.uk'

SELECT * FROM Staff 

SELECT * FROM Branch WHERE branchNo IN
(SELECT branchNo FROM Staff Where staffNo IN(
SELECT MIN(StaffNo) FROM Staff))

SELECT Branch.city From Branch WHERE city IN
(SELECT MAX(CITY) FROM Branch)


CREATE PROCEDURE PropertyInBranch
AS
SELECT * FROM Branch WHERE BranchNo IN
(SELECT PropertyForRent.branchNo FROM PropertyForRent) 

EXEC PropertyInBranch




