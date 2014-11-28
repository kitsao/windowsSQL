/****** Script for SelectTopNRows command from SSMS  ******/
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

  /**Stored Procedures**/
  /**Example 1**/
  --Use "Alter" if the stored procedure has been previously created...
  --USe "Create" if this is the very first time you are giving birth to this particular stored procedure

  Create Procedure usp_Disp_Rep_Name
  (
  @NumOfRep char(2),
  @NameOfRep char(15) Output
  )
  As
  Begin
  Select @NameOfRep = LAST_NAME
  From REP
  Where REP_NUM = @NumOfRep
  End