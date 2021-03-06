--Name: Michael Quatrani
--Description: Exercises 22-29, p226
--Date: November 1, 2014
--*********************************************************************************************

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