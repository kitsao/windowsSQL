--Michael Quatrani
--Stored Procedures


 /**********************************Exercise 1**************************************************/

 --Name the first one “usp_Total_Cost_Order”.
    --a.  This stored procedure should output the Total Cost of a specific order.
    --b.  The input to this stored procedure should be a single order number.
    --c.  This stored procedure is based on Exercise 20 in Chapter 7 of your textbook.

/**The original Query**/
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
--to drop table
/**DROP View Order_1**/

/**Using a temporary file instead of a view**/
Select OL.ProductID, P.ProductStandardPrice, Sum(OL.OrderedQuantity * P.ProductStandardPrice) As Total
Into HoldOrders
From Product_T P INNER JOIN OrderLine_T OL
ON P.ProductID = OL.ProductID
Group by OL.ProductID, P.ProductStandardPrice, OL.OrderID
Having OL.OrderID = 1

/**Use alter if stored procedure has been previously created. Create if creating new procedure**/
go
  Alter Procedure usp_Total_Cost_Order
  (
    @Order_ID char(11)   
  )
  As
  Begin
    --to insure that HoldOrders is not in db otherwise error
    IF OBJECT_ID('dbo.HoldOrders', 'U') IS NOT NULL
    DROP TABLE dbo.HoldOrders
    Select  OL.ProductID, P.ProductStandardPrice, Sum(OL.OrderedQuantity * P.ProductStandardPrice) As totalOrders
    Into HoldOrders
    From Product_T P INNER JOIN OrderLine_T OL
    ON P.ProductID = OL.ProductID
    Group by OL.ProductID, P.ProductStandardPrice, OL.OrderID
    Having OL.OrderID = @Order_ID
    SELECT SUM(HoldOrders.totalOrders) AS TotalCost FROM HoldOrders
  End
go

/**To Execute. 48 is the order id**/
EXECUTE usp_Total_Cost_Order 48

/**Sample output**/
--OrderID 1 - 6900; OrderID 2 - 9950; OrderID 3 - 400; OrderID 4 - 3975; OrderID 5 - 1675; OrderID 48 - 1810

/**Sample output is correct**/
/*****************************Exercise 2**************************************************************************/

--2.  Name the second one “ups_Total_Raw_Mat_Cost”.
  --a.	This stored procedure should output the Product ID, Product Description, Standard Price, and the Total Cost.
  --b.	The input to this stored procedure should be a single Product ID.
  --c.	This stored procedure is based on Exercise 21 in Chapter 7 of your textbook.

/**The original query**/
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

/**Stored procedure.. Use Alter or Create**/
go
  Create Procedure usp_Total_Raw_Mat_Cost
    (
	  @input int,
      @ProdID int Output,
	  @ProdDesc varchar(50) Output,
	  @StdPr money Output,
	  @TotCt money Output
    )
  As
  Begin
    --just assign the appropriate input and output variables here
    Select @ProdID = P.ProductID, @ProdDesc = P.ProductDescription, @StdPr = P.ProductStandardPrice,
	@TotCt=Sum(U.QuantityRequired * R.MaterialStandardPrice) 
	From Product_T P, RawMaterial_T R, Uses_T U
	Where 
		P.ProductID=@input and
	    P.ProductID = U.ProductID
		And U.MaterialID = R.MaterialID
	Group by P.ProductID, P.ProductDescription, P.ProductStandardPrice
  End
go

/**to test procedure**/
DECLARE @ProdID int, @ProdDesc varchar(50), @StdPr money, @TotCt money
EXECUTE usp_Total_Raw_Mat_Cost 6, @ProdID OUTPUT, @ProdDesc OUTPUT, @StdPr OUTPUT, @TotCt OUTPUT
SELECT @ProdId AS Product, @ProdDesc AS Description, @StdPr AS StandardPrice, @TotCt AS TotalCost

/**Sample output appears correct for all products.**/

--Example output from six
/******************************************************
   Product  Description       StandardPrice  TotalCost
1  6        8-Drawer Dresser  750.00         231.25
*******************************************************/

/**
   NOTE: The parameter variables I choose when running your Stored Procedures do NOT have to agree with the
   NOTE: The input parameter shown in the above example is "1" for ProductID 1.  I will test for 1, 2, 3, 4, 6, and 18.

   Why do we get results for only ProductID's 1, 2, 3, 4, 6, and 18 ?  Check the "Uses_T" table for the answer. 
   Apparently these 6 products are the only ones we assemble from raw materials.Maybe all of the other products
   we sell come to us from other manufacturers.
**/