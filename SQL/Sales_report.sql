SELECT
    o.OrderID,
    c.CustomerID,
    c.CustomerName,
    c.City,
    p.ProductID,
    p.ProductName,
    p.Category,
    o.Quantity,
    p.Price,
    (o.Quantity * p.Price) AS TotalAmount,
    o.OrderDate
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
INNER JOIN Products p
ON o.ProductID = p.ProductID;