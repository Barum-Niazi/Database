CREATE TRIGGER partyHistoryTrigger
ON parties
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    INSERT INTO party_history (Name, ContactNo, Address, Operation, ModifiedDate)
    SELECT Name, ContactNo, Address, 'INSERT', GETDATE()
    FROM inserted;

    INSERT INTO party_history (Name, ContactNo, Address, Operation, ModifiedDate)
    SELECT Name, ContactNo, Address, 'UPDATE', GETDATE()
    FROM deleted;

    INSERT INTO party_history (Name, ContactNo, Address, Operation, ModifiedDate)
    SELECT Name, ContactNo, Address, 'DELETE', GETDATE()
    FROM deleted;
END

SELECT * FROM party_history
SELECT * FROM parties
UPDATE parties
SET Name = 'viva' WHERE ID = 2

CREATE TRIGGER varietyHistoryTrigger
ON varieties
AFTER INSERT, DELETE
AS
BEGIN
    INSERT INTO varieties_history
        (Type, Name, Size, Rate, Operation, ModifiedDate)
    SELECT Type, Name, Size, Rate, 'INSERT', GETDATE()
    FROM inserted;

    INSERT INTO varieties_history
        (Type, Name, Size, Rate, Operation, ModifiedDate)
    SELECT Type, Name, Size, Rate, 'DELETE', GETDATE()
    FROM deleted;
END


CREATE TRIGGER stockHistoryTrigger
ON stock
AFTER INSERT, DELETE
AS
BEGIN
    INSERT INTO stock_history
        (Season, [Date], Party, Variety, Quantity, Price, Expiry, Operation, ModifiedDate)
    SELECT Season, [Date], Party, Variety, Quantity, Price, Expiry, 'INSERT', GETDATE()
    FROM inserted;

	INSERT INTO stock_history (Season, [Date], Party, Variety, Quantity, Price, Expiry, Operation, ModifiedDate)
    SELECT Season, [Date], Party, Variety, Quantity, Price, Expiry, 'UPDATE', GETDATE()
    FROM deleted;

    INSERT INTO stock_history
        (Season, [Date], Party, Variety, Quantity, Price, Expiry, Operation, ModifiedDate)
    SELECT Season, [Date], Party, Variety, Quantity, Price, Expiry, 'DELETE', GETDATE()
    FROM deleted;
END

CREATE TRIGGER soldHistoryTrigger
ON sold
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    INSERT INTO sold_history (Sale, Stock, Quantity, Rate, Operation, ModifiedDate)
    SELECT Sale, Stock, Quantity, Rate, 'INSERT', GETDATE()
    FROM inserted;

    INSERT INTO sold_history (Sale, Stock, Quantity, Rate, Operation, ModifiedDate)
    SELECT Sale, Stock, Quantity, Rate, 'UPDATE', GETDATE()
    FROM deleted;

    INSERT INTO sold_history (Sale, Stock, Quantity, Rate, Operation, ModifiedDate)
    SELECT Sale, Stock, Quantity, Rate, 'DELETE', GETDATE()
    FROM deleted;
END

CREATE TRIGGER saleHistoryTrigger
ON sale
AFTER INSERT, DELETE
AS
BEGIN
    INSERT INTO sale_history
        (Season, Name, Address, [Date], ContactNo, Paid, returnOf, Operation, ModifiedDate)
    SELECT Season, Name, Address, [Date], ContactNo, Paid, returnOf, 'INSERT', GETDATE()
    FROM inserted;

	INSERT INTO sale_history (Season, Name, Address, [Date], ContactNo, Paid, returnOf, Operation, ModifiedDate)
    SELECT Season, Name, Address, [Date], ContactNo, Paid, returnOf, 'UPDATE', GETDATE()
    FROM deleted;

    INSERT INTO sale_history
        (Season, Name, Address, [Date], ContactNo, Paid, returnOf, Operation, ModifiedDate)
    SELECT Season, Name, Address, [Date], ContactNo, Paid, returnOf, 'DELETE', GETDATE()
    FROM deleted;
END


CREATE TRIGGER expensesHistoryTrigger
ON expenses
AFTER INSERT, DELETE
AS
BEGIN
    INSERT INTO expenses_history
        (Season, Type, Party, [Date], Amount, Description, Operation, ModifiedDate)
    SELECT Season, Type, Party, [Date], Amount, Description, 'INSERT', GETDATE()
    FROM inserted;

	INSERT INTO expenses_history (Season, Type, Party, [Date], Amount, Description, Operation, ModifiedDate)
    SELECT Season, Type, Party, [Date], Amount, Description, 'UPDATE', GETDATE()
    FROM deleted;

    INSERT INTO expenses_history
        (Season, Type, Party, [Date], Amount, Description, Operation, ModifiedDate)
    SELECT Season, Type, Party, [Date], Amount, Description, 'DELETE', GETDATE()
    FROM deleted;
END

CREATE TRIGGER paymentsHistoryTrigger
ON payments
AFTER INSERT, DELETE
AS
BEGIN
    INSERT INTO payments_history
        (Season, ID, [Date], Bank, Account, Amount, Description, Operation, ModifiedDate)
    SELECT Season, ID, [Date], Bank, Account, Amount, Description, 'INSERT', GETDATE()
    FROM inserted;

	INSERT INTO payments_history (Season, ID, [Date], Bank, Account, Amount, Description, Operation, ModifiedDate)
    SELECT Season, ID, [Date], Bank, Account, Amount, Description, 'UPDATE', GETDATE()
    FROM deleted;


    INSERT INTO payments_history
        (Season, ID, [Date], Bank, Account, Amount, Description, Operation, ModifiedDate)
    SELECT Season, ID, [Date], Bank, Account, Amount, Description, 'DELETE', GETDATE()
    FROM deleted;
END


CREATE TRIGGER userHistoryTrigger
ON users
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF EXISTS(SELECT * FROM inserted)
    BEGIN
        INSERT INTO users_history
            (Action, UserID, Name, Password, Email, ContactNo, Address, Image, Rank, DateModified)
        SELECT 'INSERT', ID, Name, Password, Email, ContactNo, Address, Image, Rank, GETDATE()
        FROM inserted;
    END

    IF EXISTS(SELECT * FROM deleted)
    BEGIN
        INSERT INTO users_history
            (Action, UserID, Name, Password, Email, ContactNo, Address, Image, Rank, DateModified)
        SELECT 'DELETE', ID, Name, Password, Email, ContactNo, Address, Image, Rank, GETDATE()
        FROM deleted;
    END

    IF EXISTS(SELECT * FROM inserted i JOIN deleted d ON i.ID = d.ID)
    BEGIN
        INSERT INTO users_history
            (Action, UserID, Name, Password, Email, ContactNo, Address, Image, Rank, DateModified)
        SELECT 'UPDATE', i.ID, i.Name, i.Password, i.Email, i.ContactNo, i.Address, i.Image, i.Rank, GETDATE()
        FROM inserted i
        JOIN deleted d ON i.ID = d.ID;
    END
END


	CREATE TRIGGER trg_UpdateRemainingQuantity
ON sold
AFTER INSERT
AS
BEGIN
    UPDATE stock
    SET Quantity = s.Quantity - i.Quantity
    FROM stock s
        INNER JOIN inserted i ON s.ID = i.Stock;
END;


CREATE TRIGGER trg_UpdateRemainingQuantityOnDelete
ON sold
AFTER DELETE
AS
BEGIN
    UPDATE stock
    SET Quantity = s.Quantity + d.Quantity
    FROM stock s
        INNER JOIN deleted d ON s.ID = d.Stock;
END;

CREATE TRIGGER payment_deletion_trigger
ON payments
AFTER DELETE
AS
BEGIN
    INSERT INTO deletion_log
        (UserID, UserName, TableName, DeletedRecordID, DeletedData)
    SELECT USER_ID(), USER_NAME(), 'payments', deleted.ID, CONCAT(deleted.Season, ',', deleted.ID, ',', deleted.Date, ',', deleted.Bank, ',', deleted.Account, ',', deleted.Amount, ',', deleted.Description)
    FROM deleted;
END;

CREATE TRIGGER expenses_deletion_trigger
ON expenses
AFTER DELETE
AS
BEGIN
    INSERT INTO deletion_log
        (UserID, UserName, TableName, DeletedRecordID, DeletedData)
    SELECT USER_ID(), USER_NAME(), 'expenses', deleted.ID, CONCAT(deleted.ID, ',', deleted.Type, ',', deleted.Party, ',', deleted.Date, ',', deleted.Amount, ',', deleted.Description)
    FROM deleted;
END;


CREATE VIEW vw_TotalSalesBySeason
AS
    SELECT s.Season, COUNT(*) AS TotalSales
    FROM sale s
    GROUP BY s.Season;

CREATE VIEW vw_SoldProductsByParty
AS
    SELECT st.Party, COUNT(*) AS TotalSoldProducts
    FROM stock st
        INNER JOIN sold sd ON st.ID = sd.Stock
    GROUP BY st.Party;

CREATE VIEW vw_TotalRevenueBySeason
AS
    SELECT s.Season, SUM(sld.Quantity * sld.Rate) AS TotalRevenue
    FROM sale s
        INNER JOIN sold sld ON s.ID = sld.Sale
    GROUP BY s.Season;

CREATE VIEW vw_PaymentsByBank
AS
    SELECT p.Bank, SUM(p.Amount) AS TotalPayments
    FROM payments p
    GROUP BY p.Bank;
