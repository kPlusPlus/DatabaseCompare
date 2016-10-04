/*
ozna�io sam sve svoje umotvorevine
*/

-- komentari u liniji


CREATE PROCEDURE CustOrderHist @CustomerID nchar(5)
AS
SELECT ProductName, Total=SUM(Quantity)
FROM Products P, [Order Details] OD, Orders O, Customers C
WHERE C.CustomerID = @CustomerID
AND C.CustomerID = O.CustomerID AND O.OrderID = OD.OrderID AND OD.ProductID = P.ProductID
GROUP BY ProductName

GO

-- komentari u liniji

/*
	ozna�io sam sve svoje umotvorevine
*/