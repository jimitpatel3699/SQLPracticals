CREATE OR ALTER PROCEDURE usp_GetCustomerData(@SkipRows INT,@NextRows INT)
AS
BEGIN
	DECLARE @MaxRows AS INT;
	SELECT @MaxRows = COUNT(Id) FROM CustomerData;
	IF @SkipRows <= @MaxRows
		BEGIN
			SELECT * FROM CustomerData
			ORDER BY Id 
			OFFSET (@SkipRows) ROWS
			FETCH NEXT @NextRows ROWS ONLY;
		END;
END;