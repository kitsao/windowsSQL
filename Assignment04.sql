--Name: Michael Quatrani
--Description: Homework assignment 4 Page 230 Exercises 33-42. Use single tables for queries.
--Date: October 7, 2014

/** query to get table information**/
select * from INFORMATION_SCHEMA.TABLES

-- Exercise 33
/**List all sales territories that have more than one salesperson**/
Select SalesTerritoryId as SalesTerritories
From Salesperson_T
Group by SalesTerritoryID
having count(SalespersonID) > 1

-- Exercise 34
/**Which product is ordered most frequently?**/
/**Using top syntax here which is specific to MS SQL Server**/
Select top(1) productID Product, Sum(OrderedQuantity) TotalOrdered
From OrderLine_T
Group by productID
Order by max(OrderedQuantity) desc

-- Exercise 35
/**Display the territory ID and the number of salespersons in the territory 
for all territories that have more than one salesperson.  Label the number of salespersons
NumSalesPersons**/
Select SalesTerritoryID, Count(SalespersonID) AS NumSalesPeople
From Salesperson_T
Group by SalesTerritoryID
having count(SalespersonID) > 1

--Exercise 36
/** Display the SalesPersonID and a count of the number of orders for that salesperson
for all salespersons except salespersons 3,5,9**/
Select CustomerID, count(orderID) as numOrders
From Order_T
where SalespersonID Not in (3,5,9)
Group by SalespersonID

--Number 37 
/**For each salesperson, list the total number of orders by month for the year 2010**/
Select SalespersonID,  count(OrderID) CountOfOrders, OrderDate
From Order_T
Group by OrderDate, SalespersonId
having OrderDate >= '1/1/2010' and OrderDate < '1/1/2011'
order by month(OrderDate)

-- Number 38
/**List MateriaName, Material and Width for raw materials that are not cherry or oak
and whose width is greater than 10 inches**/
Select MaterialName, Material, Width
From RawMaterial_T
Where Material not in ('Cherry', 'Oak') and Width > 10

-- Number 39
/**List ProductID, ProductDescriptin, ProductFinish and ProductStandardPrice for Oak 
Products with a productStandard price greater than 400 or cherry products
and a standardPrice less than 300**/
Select ProductID, ProductDescription, ProductFinish, ProductStandardPrice
From Product_T
Where ProductStandardPrice > 400 or ProductFinish = 'cherry' and ProductStandardPrice < 300

--Number 40
/**For each order, list the OrderId, customer ID, order date, and most recent date among all
orders.**/
Select OrderID, CustomerID, OrderDate, (Select Max(OrderDate) from Order_T) as mostRecent
From Order_T

/** Creating Views: In Microsoft sql server you must use the go delimiter to define
batch boundries.  Run the views first and then run the query.  Drop views to start over
using syntax DROP VIEW view_name(also must be run within go delimiters)**/

--Number 41
/** For each customer, list the customerId, the number of orders from that customer,
and the ratio of the number of orders from that customer to the toal number 
of orders from all customers combined.**/
go
Create View AllOrders 
as
Select count(OrderID) as allOrders
From Order_T
go
/**DROP VIEW AllOrders**/
/**Using view in a nested subquery**/

Select CustomerID, Count(OrderID) AS CustORders, (Select*From allOrders) as TotalOrders,
count(orderID)*100/(Select * From allOrders) as Ratio
From Order_T
Group By CustomerID

--Number 42
/* for Products 1, 2 and 7 list in one row and three respective clumns that products total unit sales
label the three columns prod1, prod2 and prod7**/
/*Views for each product*/
go
Create View VProd1 
AS
Select Sum(OrderedQuantity) as Prod1
From OrderLine_T
Where ProductID = 1
/**DROP VIEW VProd1**/

go
Create View VProd2 As
Select Sum(OrderedQuantity) As Prod2
From OrderLine_T
Where ProductId = 2
/**DROP VIEW VProd2**/

go
Create View VProd7 As
Select Sum(OrderedQuantity) As Prod7
From OrderLine_T
Where ProductID = 7
/**DROP VIEW VProd7**/
go 

/*query combining each view*/

Select Prod1, Prod2, Prod7
From VProd1, VProd2, VProd7

