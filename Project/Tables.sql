drop database project_db
create database project_db
use project_db

CREATE TABLE ranks
(
    ID INT NOT NULL PRIMARY KEY CHECK (ID>=0 AND ID<100),
    Name VARCHAR(30) NOT NULL
);

INSERT INTO ranks
    (ID, Name)
VALUES
    (0, 'Employee'),
    (1, 'Manager'),
    (2, 'Owner'),
    (3, 'Administrator')

CREATE TABLE users
(
    ID VARCHAR(15) PRIMARY KEY,
    Name VARCHAR(35) NOT NULL,
    Password VARCHAR(128) NOT NULL,
    Email VARCHAR(50),
    ContactNo VARCHAR(13) NOT NULL,
    Address VARCHAR(100),
    Image INT default '0',
    Rank INT default '0',
    FOREIGN KEY (Rank) REFERENCES ranks (ID) ON UPDATE CASCADE
);


--INSERT INTO users (ID, Name, Password, Email, ContactNo, Address, Rank) VALUES ('61101-6839367-5','Barum Niazi','71CD76C3E9C101B44DE6603E7EEEBF951D06BD7E701AAE78A9209976548421121130A9599433CE57110729E9498E8596A7E05B9CA07B246EBC0FAABFEC8E1865','barumkhan123@gmail.com','0316-7000376','M1 74, Lake City, Lahore',3)


CREATE TABLE logs
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Date DATETIME DEFAULT GETDATE(),
    [User] VARCHAR(15),
    Details VARCHAR(200),
    Rank INT,
    FOREIGN KEY ([User]) REFERENCES users (ID) ON UPDATE CASCADE ,
    FOREIGN KEY (Rank) REFERENCES ranks (ID)
);

CREATE TABLE seasons
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Year INT,
    Season INT
);

INSERT INTO seasons
    (Year, Season)
VALUES
    (YEAR(GETDATE()), 1)

CREATE TABLE parties
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) UNIQUE,
    ContactNo VARCHAR(13),
    Address VARCHAR(100)
);

CREATE TABLE product_type
(
    Name VARCHAR(20) PRIMARY KEY
);

INSERT INTO product_type
    (Name)
VALUES
    ('Cotton Seed'),
    ('Mung Bean'),
    ('Wheat Seed'),
    ('Bajra Seed');

CREATE TABLE varieties
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Type VARCHAR(20) NOT NULL,
    Name VARCHAR(20),
    Size VARCHAR(20),
    Rate INT,
    UNIQUE (Name, Size),
    FOREIGN KEY (Type) REFERENCES product_type (Name) ON UPDATE CASCADE
);


CREATE TABLE stock
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Season INT NOT NULL,
    [DATE] DATE,
    Party VARCHAR(50),
    Variety INT NOT NULL,
    Quantity INT NOT NULL,
    Price INT,
    Expiry DATE,
    FOREIGN KEY (Season) REFERENCES seasons (ID) ON UPDATE CASCADE ,
    FOREIGN KEY (Party) REFERENCES parties (Name) ON UPDATE CASCADE ,
    FOREIGN KEY (Variety) REFERENCES varieties (ID) ON UPDATE CASCADE
);

CREATE TABLE sale
(
    Season INT NOT NULL,
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(35) NOT NULL,
    Address VARCHAR(256),
    [Date] DATE,
    ContactNo VARCHAR(13),
    Paid BIT,
    returnOf INT NULL,
    FOREIGN KEY (Season) REFERENCES seasons (ID) ON UPDATE CASCADE,
    FOREIGN KEY (returnOf) REFERENCES sale (ID)
);

CREATE TABLE sold
(
    Sale INT NOT NULL,
    Stock INT NOT NULL,
    Quantity INT,
    Rate FLOAT,
    PRIMARY KEY (Sale, Stock, Rate),
    FOREIGN KEY (Sale) REFERENCES sale (ID) ON UPDATE CASCADE ,
    FOREIGN KEY (Stock) REFERENCES stock(ID)
);

CREATE TABLE expenses
(
    Season INT NOT NULL,
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Type VARCHAR(50) NOT NULL,
    Party VARCHAR(50),
    [Date] DATE,
    Amount INT DEFAULT '0',
    Description VARCHAR(128),
    FOREIGN KEY (Season) REFERENCES seasons (ID) ON UPDATE CASCADE,
    FOREIGN KEY (Party) REFERENCES parties (Name) ON UPDATE CASCADE
);


CREATE TABLE payments
(
    Season INT NOT NULL,
    ID INT IDENTITY(1,1),
    [Date] DATE,
    Bank VARCHAR(30) NOT NULL ,
    Account VARCHAR(50),
    Amount INT NOT NULL,
    Description VARCHAR(128),
    PRIMARY KEY (Season, ID),
    FOREIGN KEY (Season) REFERENCES seasons (ID) ON UPDATE CASCADE
);

CREATE TABLE party_history
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    ContactNo VARCHAR(13),
    Address VARCHAR(100),
    Operation VARCHAR(10),
    ModifiedDate DATETIME
);

CREATE TABLE varieties_history
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Type VARCHAR(20) NOT NULL,
    Name VARCHAR(20),
    Size VARCHAR(20),
    Rate INT,
    Operation VARCHAR(10),
    ModifiedDate DATETIME
);


CREATE TABLE stock_history
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Season INT NOT NULL,
    [Date] DATE,
    Party VARCHAR(50),
    Variety INT NOT NULL,
    Quantity INT NOT NULL,
    Price INT,
    Expiry DATE,
    Operation VARCHAR(10),
    ModifiedDate DATETIME
);

CREATE TABLE sale_history
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Season INT NOT NULL,
    Name VARCHAR(35) NOT NULL,
    Address VARCHAR(256),
    [Date] DATE,
    ContactNo VARCHAR(13),
    Paid BIT,
    returnOf INT NULL,
    Operation VARCHAR(10),
    ModifiedDate DATETIME
);


CREATE TABLE sold_history
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Sale INT NOT NULL,
    Stock INT NOT NULL,
    Quantity INT,
    Rate FLOAT,
    Operation VARCHAR(10),
    ModifiedDate DATETIME
);


CREATE TABLE expenses_history
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Season INT NOT NULL,
    Type VARCHAR(50) NOT NULL,
    Party VARCHAR(50),
    [Date] DATE,
    Amount INT DEFAULT '0',
    Description VARCHAR(128),
    Operation VARCHAR(10),
    ModifiedDate DATETIME
);

CREATE TABLE payments_history
(
    Season INT NOT NULL,
    ID INT UNIQUE,
    [Date] DATE,
    Bank VARCHAR(30) NOT NULL ,
    Account VARCHAR(50),
    Amount INT NOT NULL,
    Description VARCHAR(128),
    Operation VARCHAR(10),
    ModifiedDate DATETIME,
    PRIMARY KEY (Season, ID)
);


CREATE TABLE deletion_log
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    UserName VARCHAR(50),
    TableName VARCHAR(50),
    DeletedRecordID INT,
    DeletedData NVARCHAR(MAX),
    DeletedDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE users_history (
    HistoryID INT IDENTITY(1, 1) PRIMARY KEY,
    Action VARCHAR(10),
    UserID VARCHAR(15),
    Name VARCHAR(35),
    Password VARCHAR(128),
    Email VARCHAR(50),
    ContactNo VARCHAR(13),
    Address VARCHAR(100),
    Image INT,
    Rank INT,
    DateModified DATETIME DEFAULT GETDATE()
);

SELECT * FROM users
SELECT * FROM logs
SELECT * FROM parties
SELECT * FROM varieties
SELECT * FROM stock
SELECT * FROM Sale
SELECT * FROM Sold
SELECT * FROM payments
SELECT * FROM expenses