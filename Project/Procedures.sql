CREATE PROCEDURE Variety_details
AS
SELECT
    s.ID AS Season,
    p.Name AS SupplierName,
    v.Name AS VarietyName,
    so.Quantity AS QuantitySold,
    so.Rate AS SoldRate,
    so.Quantity*so.Rate as [TotalSale],
    p.Address AS PartyAddress
FROM sold so
    JOIN sale sa ON so.Sale = sa.ID
    JOIN stock st ON so.Stock = st.ID
    JOIN parties p ON st.Party = p.Name
    JOIN varieties v ON st.Variety = v.ID
    JOIN seasons s ON st.Season = s.ID;

CREATE PROCEDURE removeBill
    @billID INT
AS
BEGIN
    DELETE FROM sold WHERE Sale = @billID;
    DELETE FROM sale WHERE ID = @billID;
END
GO



CREATE PROCEDURE returnBill
    @billID INT
AS
BEGIN
    INSERT INTO sale
        (Season, Name, Address, Date, ContactNo, Paid, returnOf)
    SELECT Season, Name, Address, GETDATE(), ContactNo, Paid, ID
    FROM sale
    WHERE ID = @billID;
END
GO

create procedure profit
as
select
    varieties.Name,
    sum(varieties.rate*stock.Quantity) as 
total_spent,
    sum(stock.Price*sold.Quantity) 
as total_earned,
    SUM((stock.Price*sold.Quantity)-(varieties.Rate*stock.Quantity)) 
as Profit
from varieties
    join stock on varieties.id=stock.ID
	join sold on sold.Stock=stock.ID
group by varieties.Name

create procedure stockDetail
AS
SELECT
    a.*,
    CONCAT(varieties.Name, '(', varieties.Size, ')') AS Product
FROM (
        SELECT
        stock.Season,
        stock.ID,
        stock.Variety,
        s.Sold,
        Parties.Name,
        stock.[Date],
        stock.Expiry,
        stock.Quantity AS Total,
        stock.Price
    FROM (
            SELECT
            Stock,
            SUM(Quantity) AS Sold
        FROM sold
        GROUP BY Stock
        ) AS s
        RIGHT JOIN stock ON s.Stock = stock.ID
        LEFT JOIN parties ON stock.Party = parties.Name
    ) AS a
    LEFT JOIN varieties ON varieties.ID = a.Variety
where a.Expiry>GETDATE();

EXEC stockDetail

CREATE PROCEDURE ExpiredStockDetail
AS
SELECT
    a.*,
    CONCAT(varieties.Name, '(', varieties.Size, ')') AS Product
FROM (
        SELECT
        stock.Season,
        stock.ID,
        stock.Variety,
        s.Sold,
        Parties.Name,
        stock.[Date],
        stock.Expiry As ExpiredOn,
        stock.Quantity AS Total,
        stock.Price
    FROM (
            SELECT
            Stock,
            SUM(Quantity) AS Sold
        FROM sold
        GROUP BY Stock
        ) AS s
        RIGHT JOIN stock ON s.Stock = stock.ID
        LEFT JOIN parties ON stock.Party = parties.Name
    ) AS a
    LEFT JOIN varieties ON varieties.ID = a.Variety
where a.ExpiredOn<GETDATE();

DROP PROCEDURE StockDetail
EXEC stockDetail
EXEC Variety_details
EXEC returnBill 1
EXEC removeBill 1

EXEC returnBill 2
EXEC removeBill 9002
SELECT * FROM sale