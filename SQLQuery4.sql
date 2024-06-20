Select OrderID, OrderDate, OrderTotal From dbo.Orders	
Join dbo.Customers on dbo.Orders.CustomerID = dbo.Customers.CustomerID