--NAME: Michael Quatrani
--DESCRIPTION: Exercises 15-21 Chapter 7
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








