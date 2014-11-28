--Name: Michael Quatrani
--Description: Assignment 9 Exercises 33-40 (Except 39), p 266
--Date: November 16th, 2013


/**Exercise 34**/
/**Rewrite your answer to 33 for each cusomer -- Display the name of each customer and the names of all customers in zip code**/

/**Correct**/
SELECT C1.CustomerName, C2.CustomerName AS CName2, C1.CustomerPostalCode
FROM Customer_T C1, Customer_T C2
WHERE C1.CustomerPostalCode = C2.CustomerPostalCode 
	AND C2.CustomerID != C1.CustomerID;

/**my attempt incorrect
Select distinct b.Customername
from Customer_T a, Customer_T b
where a.CustomerPostalCode=b.CustomerPostalCode
**/

/**Exercise 35**/
/**Display the customer ID, name, and order ID for all customer orders.
For those customers who do not have any orders, include them in the display once, with a 0 value for OrderID:**/
/**Correct**/
SELECT Customer_T.CustomerID, CustomerName, OrderID
FROM Customer_T, Order_T
WHERE Customer_T.CustomerID = Order_T.CustomerID
UNION
SELECT CustomerID, CustomerName, 0
FROM Customer_T
WHERE NOT EXISTS (
		SELECT * 
		FROM Order_T 
		WHERE Order_T.CustomerID = Customer_T.CustomerID)

/**My Attempt also correct**/
Select Customer_T.CustomerID, CustomerName, Order_T.OrderID
as 'OrderID' from Customer_T
left outer join Order_T
on Customer_T.CustomerID=Order_T.CustomerID


/**Exercise 36**/
/**Show the customer ID and name for all the customers who have ordered
both products with IDs 3 and 4 on the same order:**/
/**Correct**/
SELECT 	C.CustomerID, CustomerName
FROM 	Customer_T C, Order_T O1, OrderLine_T OL1
WHERE 	C.CustomerID = O1.CustomerID AND 
		O1.OrderID = OL1.OrderID AND 
		OL1.ProductID = 3 AND 
		O1.OrderID IN (
			SELECT OrderID 
			FROM OrderLine_T OL2
            WHERE OL2.ProductID = 4
		);

/**mine not correct
select Customer_T.CustomerID, CustomerName 
from Customer_T, Order_T, OrderLine_T 
where Customer_T.CustomerID=Order_T.CustomerID 
	and OrderLine_T.OrderID=Order_T.OrderID 
	and ProductID=3
union
select Customer_T.CustomerID, CustomerName 
from Customer_T, Order_T, OrderLine_T 
where Customer_T.CustomerID=Order_T.CustomerID 
	and OrderLine_T.OrderID=Order_T.OrderID 
	and ProductID=4
**/

/**Exercise 37**/
/**Display the customer names of all customer who have
ordered (on the same or different orders) both products
with IDs 3 and 4.**/
/**my attempt also correct!**/ 
select Customer_t.CustomerID, CustomerName 
from Customer_t, Order_t, OrderLine_t 
where Customer_t.CustomerID=Order_t.CustomerID 
	and OrderLine_t.OrderID=Order_t.OrderID 	
	and ProductID=3

intersect

select Customer_t.CustomerID, CustomerName 
from Customer_t, Order_t, OrderLine_t 
where Customer_t.CustomerID=Order_t.CustomerID 
	and OrderLine_t.OrderID=Order_t.OrderID 
	and ProductID=4

/**Hint Answer**/
SELECT C.CustomerID, CustomerName
FROM Customer_T C, Order_T O1, OrderLine_T OL1
WHERE C.CustomerID = O1.CustomerID 
	AND O1.OrderID = OL1.OrderID 
	AND OL1.ProductID = 3

INTERSECT

SELECT C.CustomerID, CustomerName
FROM Customer_T C, Order_T O1, OrderLine_T OL1
WHERE C.CustomerID = O1.CustomerID 
	AND O1.OrderID = OL1.OrderID 
	AND OL1.ProductID = 4;

/**Exercise 39**/
/**39. Write an SQL query to list the order number and order
quantity for all customer orders for which the order quantity
is greater than the average order quantity of that product.
(Hint: This involves using a correlated subquery.)**/
/**Correct**/
SELECT Order11.OrderID, Order11.OrderedQuantity, 
Order11.ProductID
FROM PRODUCT_T INNER JOIN OrderLine_T AS Order11 ON 
PRODUCT_T.ProductID = Order11.ProductID
WHERE (  (Order11.OrderedQuantity >
	(SELECT AVG(OrderedQuantity) FROM OrderLine_T x1 
	WHERE x1.ProductID = Order11.ProductID))
	 AND
	(PRODUCT_T.ProductID=[Order11].[ProductID])  );

/**Mine Incorrect
select OrderID, OrderedQuantity 
from OrderLine_T 
where OrderedQuantity >
	(Select avg (OrderedQuantity) 
	from OrderLine_T)
**/

/**Exercise 40**/
/**40. Write an SQL query to list the salesperson who has sold the
most computer desks. **/
/**Correct**/
CREATE VIEW Tsales
AS
SELECT Salesperson_T.SalespersonID, SUM(OrderedQuantity) 
	AS totsales
FROM OrderLine_T,Order_T, Product_T, DoesBusinessIn_T ,Salesperson_T
WHERE Order_T.OrderID = OrderLine_T.OrderID
	AND OrderLine_T.ProductID = Product_T.ProductID
	AND ProductDescription = 'Oak Computer Desk'
	AND	Order_T.CustomerID = DoesBusinessIn_T.CustomerID 
	AND Salesperson_T.SalesTerritoryID = DoesBusinessIn_T.TerritoryID
GROUP BY Salesperson_T.SalespersonID;

-- ..if we now look to see what this view produces like the following:
SELECT *
FROM Tsales

/*	we get the following;
SalespersonID	totsales
	3				12
	4				5
	9				5
*/

-- ...so next let's just try to get the SalespersonID with the most (MAX) sales of this product...

SELECT SalespersonID 
FROM Tsales 
WHERE totsales = (SELECT MAX(totsales) FROM Tsales)

/**need to drop to start over**/
/**Drop View TSales**/

/**my pitiful attempt
select SalespersonName, max(count(orderID)) 
from Salesperson_T, Order_T 
where Salesperson_T.SalespersonID=Order_T.SalespersonID
group by SalespersonName
**/