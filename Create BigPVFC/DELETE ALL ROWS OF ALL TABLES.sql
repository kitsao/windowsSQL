-- Tables need to be deleted in this order
-- 19 TABLES
delete from Shipped_T;
delete from Payment_T;
delete from PaymentType_T;
delete from OrderLine_T;
delete from Order_T;
delete from CustomerShipAddress_T;
delete from ProducedIn_T;
--insert delete Uses Table here
DELETE Uses_T
delete from Product_T;
delete from ProductLine_T;
delete from WorksIn_T;
delete from WorkCenter_T;
delete from EmployeeSkills_T;
delete from Skill_T;
delete from Employee_T;
delete from Salesperson_T;
delete from DoesBusinessIn_T;
delete from Territory_T;
delete from Customer_T;
--
-- 3 TABLES
DELETE Supplies_T
DELETE Vendor_T
DELETE RawMaterial_T