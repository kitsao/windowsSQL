  /************************************************Stored Procedures************************************************************************/

  --Use "Alter" if the stored procedure has been previously created...
  --USe "Create" if this is the very first time you are giving birth to this particular stored procedure
  /**These are very important for speeding up queries**/

  /**Rep table for manual examination**/
SELECT TOP 1000 [REP_NUM]
      ,[LAST_NAME]
      ,[FIRST_NAME]
      ,[STREET]
      ,[CITY]
      ,[STATE]
      ,[ZIP]
      ,[COMMISSION]
      ,[RATE]
  FROM [PREMIERE_Quatrani].[dbo].[REP]

  /**Example 1**/
  /**Traditional Query**/
  Select LAST_NAME
  FROM REP
  WHERE REP_NUM = 65

/**Stored Procedure**/
go
  Create Procedure usp_Disp_Rep_Name
  (
  @NumOfRep char(2),
  @NameOfRep char(15) Output
  )
  As
  Begin
	Select @NameOfRep = LAST_NAME /**SELECT Statement gets stored in a variable @NameOFRep.  Need to tell executor what gets stored as input**/
	From REP
	Where REP_NUM = @NumOfRep /**Output is backwards (Unless in select statement) and we will use this to tell executor what we are trying to get from query.  I.E. the where**/
  End
go

/**To Execute Stored Procedure**/
Declare @The_Name char(15)
Execute usp_Disp_Rep_Name 65/**this is where rep number gets put corresponds to WHERE REP_NUM**/, @The_Name Output
Select @The_Name As LastName

--65 is perex
--35 is Hull
--20 is Kaiser Soze'

/**Example 2**/
/*Use the PREMIERE Database...
Display the Customer Name and the Total Sales for that Customer.
Use the Quoted_Price column in the Order_Line table.
Note that his Quoted_Price is the price for one item.
Some orders are for multiple items
See the Num_Ordered column in the Order_Line table.*/

/**Traditional SQL Query which we are going to store**/
Select C.CUSTOMER_NAME, Sum(QUOTED_PRICE*NUM_ORDERED) As TotalSales
From ORDER_LINE OL, ORDERS O, CUSTOMER C
Where OL.ORDER_NUM = O.ORDER_NUM
	and O.CUSTOMER_NUM = C.CUSTOMER_NUM
	and O.CUSTOMER_NUM=282
Group by C.CUSTOMER_NAME

/**Stored Procedure**/
go
Create Procedure usp_Disp_TotalSales
(
	@CUST_NUM char(3),
	@CUST_NAME char(35) OUTPUT,
	@TOT_SALES decimal(6,2) OUTPUT
)
AS
BEGIN
	Select @CUST_NAME=C.CUSTOMER_NAME, @TOT_SALES = Sum(QUOTED_PRICE*NUM_ORDERED)
	From ORDER_LINE OL, ORDERS O, CUSTOMER C
	Where OL.ORDER_NUM = O.ORDER_NUM
	and O.CUSTOMER_NUM = C.CUSTOMER_NUM
	and O.CUSTOMER_NUM=@CUST_NUM /**Second Output**/
	Group by C.CUSTOMER_NAME
End
go

/**To execute stored procedure**/
Declare @CUSTOMER char(35), @SALES decimal(6,2)
Execute usp_Disp_TotalSales 148, @CUSTOMER OUTPUT, @SALES OUTPUT
Select @CUSTOMER, @SALES

--282 is Brookings Direct 1190.00
--148 Al's Appliance and Sport 736.45