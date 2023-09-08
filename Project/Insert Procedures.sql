CREATE PROCEDURE InsertRank
    @ID INT,
    @Name VARCHAR(30)
AS
BEGIN
    INSERT INTO ranks (ID, Name)
    VALUES (@ID, @Name)
END

CREATE PROCEDURE InsertUser
    @ID VARCHAR(15),
    @Name VARCHAR(35),
    @Password VARCHAR(128),
    @Email VARCHAR(50),
    @ContactNo VARCHAR(13),
    @Address VARCHAR(100),
    @Image INT = 0,
    @Rank INT = 0
AS
BEGIN
    INSERT INTO users (ID, Name, Password, Email, ContactNo, Address, Image, Rank)
    VALUES (@ID, @Name, @Password, @Email, @ContactNo, @Address, @Image, @Rank)
END

CREATE PROCEDURE InsertLog
    @User VARCHAR(15),
    @Details VARCHAR(200),
    @Rank INT
AS
BEGIN
    INSERT INTO logs ([User], Details, Rank)
    VALUES (@User, @Details, @Rank)
END

CREATE PROCEDURE InsertSeason
    @Year INT,
    @Season INT
AS
BEGIN
    INSERT INTO seasons (Year, Season)
    VALUES (@Year, @Season)
END

CREATE PROCEDURE InsertParty
    @Name VARCHAR(50),
    @ContactNo VARCHAR(13),
    @Address VARCHAR(100)
AS
BEGIN
    INSERT INTO parties (Name, ContactNo, Address)
    VALUES (@Name, @ContactNo, @Address)
END

CREATE PROCEDURE InsertProductType
    @Name VARCHAR(20)
AS
BEGIN
    INSERT INTO product_type (Name)
    VALUES (@Name)
END

CREATE PROCEDURE InsertVariety
    @Type VARCHAR(20),
    @Name VARCHAR(20),
    @Size VARCHAR(20),
    @Rate INT
AS
BEGIN
    INSERT INTO varieties (Type, Name, Size, Rate)
    VALUES (@Type, @Name, @Size, @Rate)
END

CREATE PROCEDURE InsertStock
    @Season INT,
    @Date DATE,
    @Party VARCHAR(50),
    @Variety INT,
    @Quantity INT,
    @Price INT,
    @Expiry DATE
AS
BEGIN
    INSERT INTO stock (Season, [DATE], Party, Variety, Quantity, Price, Expiry)
    VALUES (@Season, @Date, @Party, @Variety, @Quantity, @Price, @Expiry)
END

CREATE PROCEDURE InsertSale
    @Season INT,
    @Name VARCHAR(35),
    @Address VARCHAR(256),
    @Date DATE,
    @ContactNo VARCHAR(13),
    @Paid BIT,
    @ReturnOf INT = NULL
AS
BEGIN
    INSERT INTO sale (Season, Name, Address, [Date], ContactNo, Paid, returnOf)
    VALUES (@Season, @Name, @Address, @Date, @ContactNo, @Paid, @ReturnOf)
END

CREATE PROCEDURE InsertSold
    @Sale INT,
    @Stock INT,
    @Quantity INT,
    @Rate FLOAT
AS
BEGIN
    INSERT INTO sold (Sale, Stock, Quantity, Rate)
    VALUES (@Sale, @Stock, @Quantity, @Rate)
END

CREATE PROCEDURE InsertExpense
    @Season INT,
    @Type VARCHAR(50),
    @Party VARCHAR(50),
    @Date DATE,
    @Amount INT = 0,
    @Description VARCHAR(128)
AS
BEGIN
    INSERT INTO expenses (Season, Type, Party, [Date], Amount, Description)
    VALUES (@Season, @Type, @Party, @Date, @Amount, @Description)
END

CREATE PROCEDURE InsertPayment
    @Season INT,
    @Date DATE,
    @Bank VARCHAR(30),
    @Account VARCHAR(50),
    @Amount INT,
    @Description VARCHAR(128)
AS
BEGIN
    INSERT INTO payments (Season, [Date], Bank, Account, Amount, Description)
    VALUES (@Season, @Date, @Bank, @Account, @Amount, @Description)
END





