--Name: Michael Quatrani
--Description: Assignment 8 Exercises 30-33, p 266
--Date: November 9th, 2013

/**Exercise 30**/
/**Write an SQL query to produce a list of all the products(i.e. product description) and the number of times
each product has been ordered.**/
/**I think I am doing this correctly, I am not sure if this question is looking for an aggregate function**/
Select PT.productDescription, OL.productID, OL.orderedQuantity
From Product_T PT, OrderLine_T OL
where OL.productID=PT.productID
order by OL.orderedQuantity

/**Exercise 31**/
/**Display the customer ID, name, and order ID for all customer orders.  For those customers who do not have any
orders, include them in the display only once**/
/**Appears Correct**/
Select CT.CustomerID, CT.CustomerName, OT.OrderID
From Customer_T CT
left outer join Order_t OT on
CT.CustomerID = OT.CustomerID

/**Exercise 32**/
/**Display the EmployeeId and EmployeeName for those employees who do not possess the skill Router. 
Display the results in order by EmployeeName.**/
/**Appears to be correct Assuming RT1 is router**/
Select Emp.EmployeeName, Emp.EmployeeID, ES.EmployeeID, ES.SkillID 
From Employee_T Emp, EmployeeSkills_T ES
Where not(ES.SkillID = 'RT1')
	  and Emp.EmployeeID=ES.EmployeeID
Order by Emp.EmployeeName

/**Exercise 33**/
/**Display the name of customer 16 and the names of all the customers that are in the same zip code as customer
16. (Be sure the query will work for any customer)**/
/**Appears Correct**/
Select CT.CustomerName, CT.CustomerID
From Customer_T CT
Where CT.CustomerID = '16'
      or CT.CustomerPostalCode = '13440'