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
