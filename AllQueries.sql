--  NAME:  John Student
-- DESCRIPTION:  Exercises 19 thru 32 from Chapter 6 on page 228 and page 230
-- DATE:  September 30, 2014

-- Exercise 19
/** 19 a correct**/
/** List number of Work Center Locations **/
SELECT COUNT(WorkCenterLocation)
FROM WorkCenter_T

/** 19b correct**/
/** List work center locations **/
SELECT WorkCenterLocation
FROM WorkCenter_T

-- Exercise 20
/**20** correct**/
/** Employees last names that begin with L **/
SELECT EmployeeName
From Employee_T
Where EmployeeName LIKE '% L%'

-- Exercise 21
/**21 correct**/
/** Employees who were hired in 1999 **/
Select EmployeeName
From Employee_T
Where EmployeeDateHired < '2000' and EmployeeDateHired > '1998'

-- Exercise 22
/**22 seems to be correct but there are no entries for washington in my DB**/
/** Select Customers who are in California or Washington and order by postal code **/
Select CustomerName
From Customer_T
Where CustomerState = 'CA' or CustomerState = 'WA'
Order by CustomerPostalCode

-- Exercise 23
/**23 correct**/
/** Select materials with 12x12 dimensions where material is cherry **/
Select MaterialName
From RawMaterial_T
Where Material = 'Cherry' and Thickness='12' and Width='12'

-- Exercise 24
/**24 correct**/
/** List the MaterialID, MaterialName, Material, MaterialStanardPrice and thickness for all 
raw materials made of cherry, pine or walnut.  Order the listing by Material,
Material Standard Price and Thickness **/
Select MaterialName, MaterialID, Material, MaterialStandardPrice, Thickness
From RawMaterial_T
where material = 'Cherry' or material = 'Pine' or material ='Walnut'
Order by Material, MaterialStandardPrice, Thickness

-- Exercise 25
/**25 is correct but displays no Average Price for 6 and 7 b/c there is no products in the
product line table. Technically this would make the average price for those product lines
0 but again would require working with multiple tables**/

/** Display the product line id and the average standard price for all products in each
product line **/
Select Avg(ProductStandardPrice) as AveragePrice
From Product_T
Group by ProductLineID 

-- Exercise 26
/**26 correct seems to be the same as 29 **/
/** For every product that has been ordered, display the product ID and the total quantity
ordered (label this result total ordered).  List the most popular product first and the
least popular last.**/
/** I find this question to be highly ambiguous.  It says list the most popular product first
which makes me think that I should actually display the product names, but, in the first 
sentance it says to display product ID and total quantity.  If that is the case, I don't see
the difference between this question and number 29.  This is the closest I could get but
I appear to be returning duplicate results. **/
Select PT.ProductDescription, OLT.productID, OrderedQuantity as TotalOrdered
From OrderLine_T OLT
Left Join Product_T PT on
OLT.productID=PT.productID
Order by TotalOrdered DESC

-- Exercise 27
/**Number 27 correct**/
/** For each customer, list the CustomerID and total number of orders placed **/
SELECT Customer_T.CustomerID, COUNT(Order_T.OrderID) orders_per_customer
FROM Customer_T
LEFT OUTER JOIN Order_T ON Customer_T.CustomerID = Order_T.CustomerID
GROUP BY Customer_T.CustomerID
ORDER BY Customer_T.CustomerID

/** How I would do it if We don't require customers that haven't ordered anything **/
Select CustomerID, Count(OrderID) AS Orders_placed
From Order_T
Group by CustomerID

-- Exercise 28
/**number 28 correct I think**/
/** For each salesperson, display a list of CustomerIDs.  This Query is very
confusing b/c of duplicate id's **/
Select Salesperson_T.SalespersonID, Order_T.CustomerID
From Salesperson_T
Left Outer Join Order_T
ON Order_T.SalespersonID=Salesperson_T.SalespersonID
Order by Salesperson_T.SalespersonID

-- Exercise 29
/**number 29 seems to be the same as 26**/
/**Display the product ID and the number of orders placed for each product.
Show the results in decreasing order by the number of times the product has been
ordered and label this result column NumOrders**/
Select productID, OrderedQuantity as NumOrders
From OrderLine_T
Order by NumOrders DESC

-- Exercise 30
/**number 30 not working**/
/**For each customer, list the CustomerID and the total number of orders placed in 2010 **/
/** Lists number of orders placed by customers in 2010 but fails to include customers with 0
orders.  IMO fails to satisfy the query b/c it asks for "each customer" and doesn't specify a 
table**/
Select CustomerID, Count(OrderID) as OrdersPlaced
From Order_T
Where OrderDate >= '1/1/2010' and OrderDate < '1/1/2011'
Group By CustomerID

-- Exercise 31
/**number 31 missing 9 and 10 **/
/** For each salesperson, list the total number of orders **/
Select OT.SalespersonID, count(OrderId) as numberOfOrders
From Order_T OT
Left Outer Join Salesperson_T ST on OT.SalespersonID=St.SalespersonID
Group by OT.SalespersonID

-- Exercise 32
/**32 correct**/
/**For each customer who had more than two orders, list the CustomerID and the total number of 
orders placed.**/
Select CustomerID, count(*) as order_count
From Order_T
Group by CustomerID
having count(*) > 2


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

--NAME: Michael Quatrani
--DESCRIPTION: Exercises 15-29 Chapter 7
--DATE: October 24, 2014
--*******************************************

/**Excercise 15**/
/**Write a sql command that will find any customers who have not placed orders**/

/**subquery (do this first it is easier)
Select CustomerID
From Order_T**/

Select CustomerID
From Customer_T
Where CustomerID Not IN
	(Select CustomerID
From Order_T)
 
 /**Exercise 16**/
 /**List the names and number of employees supervised(Label this value HeadCount) for each supervisor
 who supervises more than two employees**/
 Select S.EmployeeName, Count(E.EmployeeID) as HeadCount
 From Employee_T S, Employee_T E
 Where S.EmployeeID=E.EmployeeSupervisor
 Group by S.EmployeeName
 Having Count(E.EmployeeID)>2

 /**Exercise 17**/
 /**List the name of each employee, his or her birth date, the name of his/her manager
 and the manager's birth date for those employees who were born before their manager was
 born; label the managers data Manager and Manager Birth.**/
 Select E1.EmployeeName, E1.EmployeeBirthDate, E2.EmployeeName As Manager, E2.EmployeeBirthDate As ManagerBirth
From Employee_T E1, Employee_T E2
Where E1.EmployeeSupervisor = E2.EmployeeID
And E1.EmployeeBirthDate < E2.EmployeeBirthDate

/**Exercise 18**/
/**Write a SQL command to display the order number, customer number, order date and items
ordered for some particular customer**/
Select OT.OrderID, OT.CustomerID, OL.ProductID, PT.ProductDescription, OL.OrderedQuantity
From Product_T PT, OrderLine_T OL, Order_T OT
Where OT.OrderID = OL.OrderID
  And OL.ProductID = PT.ProductID
  And OT.CustomerID = 6

/**Exercise 19**/
/**Write a SQL command to display each item ordered for order number 1, its standard price and
the total price for each item ordered**/
Select OL.ProductID, P.ProductStandardPrice, Sum(OL.OrderedQuantity * P.ProductStandardPrice) As Total
From Product_T P INNER JOIN OrderLine_T OL
ON P.ProductID = OL.ProductID
Group by OL.ProductID, P.ProductStandardPrice, OL.OrderID
Having OL.OrderID = 1

/**Exercise 20**/
/**Write a SQL command to total the cost of order number 1**/
go
Create View Order_1 As
(Select OL.ProductID, P.ProductStandardPrice, Sum(OL.OrderedQuantity * P.ProductStandardPrice) As Total
From Product_T P INNER JOIN OrderLine_T OL
ON P.ProductID = OL.ProductID
Group by OL.ProductID, P.ProductStandardPrice, OL.OrderID
Having OL.OrderID = 1
)
go
Select Sum(Order_1.Total) As TotalCost
From Order_1
/**DROP View Order_1**/

/**Exercise 21**/
/**Calculate the total raw material cost (label TotCost) for each product compared to its 
standard product price.  Display product ID, product description, standard price and the 
total cost in the result**/
Select P.ProductID, P.ProductDescription, P.ProductStandardPrice,
	Sum(U.QuantityRequired * R.MaterialStandardPrice) As TotCost
From Product_T P, RawMaterial_T R, Uses_T U
Where P.ProductID = U.ProductID
And U.MaterialID = R.MaterialID
Group by P.ProductID, P.ProductDescription, P.ProductStandardPrice

/**Exercise 22**/
/**For every order that has been received, display the orderID, the total dollar amount owed
on that order and the amount received in payments on that order.  List the results in decreasing
order of the difference between total due and amount paid.**/
/**Notes: Simplifying query to not include orders in which no payment has been received.  Calculate
total dollar amount from attributes in one or more tables and label total due using Sum (also must
be included in Order by statement**/
Select OL.OrderID, Sum(OrderedQuantity * ProductStandardPrice) as TotalDue, PaymentAmount,
	Sum(OrderedQuantity * ProductStandardPrice)-PaymentAmount as AmountOwed
From OrderLine_T OL, Product_T PR, Payment_T Pa
Where OL.ProductID = PR.ProductID and OL.OrderID =PA.OrderID
Group by OL.OrderID, PaymentAmount
Order by Sum(OrderedQuantity * ProductStandardPrice) - PaymentAmount Desc

/**Exercise 23**/
/**Write a query to list each customer who has bought computer desks and the number of units
sold to each customer.**/
Select C.CustomerID, CustomerName, Sum(OrderedQuantity) as UnitsBought
From OrderLine_T OL, Order_T O, Product_T P, Customer_T C
Where ProductDescription Like '%Computer Desk%'
and O.OrderID = OL.OrderID and P.ProductID = OL.ProductID and C.CustomerID = O.CustomerID
Group by C.CustomerID, CustomerName

/**Exercise 24**/
/**List, in alphabetical order, the names of all employees who are now managing people with 
SKILL ID BS12; list each managers name only once, even if that manager manages several people 
with that skill**/
/**Only once is clue for Distinct.  SQL treats one table as two**/
Select Distinct M.EmployeeName
From Employee_T M, Employee_T E, EmployeeSkills_T ES
Where SkillID = 'BS12'
	And ES.EmployeeID = E.EmployeeID
	And E.EmployeeSupervisor = M.EmployeeID
Order By M.EmployeeName

/**Exercise 25**/
/**Display the salesperson name, product finish, and total quantity sold (label as TotalSales)
for each finish by each salesperson**/
/**Note: Example of query using one table but being treated like two by SQL**/
Select Distinct S.SalespersonName, P.ProductFinish, Sum(OrderedQuantity) As TotalSales
From Salesperson_T S, OrderLine_T OL, Product_T P, Order_T O
Where S.SalespersonID = O.SalespersonID
	And O.OrderID = OL.OrderID
	And OL.ProductID = P.ProductID
Group by SalespersonName, ProductFinish

/**Exercise 26**/
/**Write a query to list the number of products produced in each work center (label as TotalProducts)
If a work center does not produce any products, display the result with a total of 0**/
/**Note: Anytime you see a request to display 0 think left outer join**/
Select W.WorkCenterID, Count(ProductID) As TotalProducts
From WorkCenter_T W Left Outer Join ProducedIN_T P
	On W.WorkCenterID = P.WorkCenterID
Group By W.WorkCenterID

/**Exercise 27**/
/**The production manager at PVFC is concerned about support for purchased parts in products
owned by customers.  A simple analysis he wants done is to determine for each customer
how many vendors are in the same state as that customer. Develop a list of all the PVFC
customers by name with the number of vendors in the same state as that customer. 
(Label NumVendors)**/
/**Note: Another example of Left Outer Join "all customers" is clue here**/
Select CustomerName, Count(VendorID) As NumVendors
From Customer_T C Left Outer Join Vendor_T V
	On C.CustomerState = V.VendorState
Group by Customername

/**Exercise 28**/
/**Display he order IDs for customers who have not made any payment yet on that order.  
Use the set command UNION, INTERSECT or MINUS to write query**/
/**Note: Different for SQL server minus doesn't work use Except**/
Select OrderID
From Order_T
Except
Select OrderID
From Payment_T

/**Exercise 29**/
/**Display the names of the states in which customers reside but for which ther is no salesperson
residing in the state.**/
/**Note: Use except statement again here**/
Select CustomerState
From Customer_T
Except
Select SalespersonState
From Salesperson_T