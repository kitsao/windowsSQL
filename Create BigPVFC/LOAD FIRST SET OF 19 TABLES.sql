/* script name: LOAD1BIGPV_EDM_1E.SQL                    */
/* purpose:     Loads Oracle tables for Big PVFC DB EDM  */
/*             (NOT Raw Materials, Supplies, Uses tbls)  */
/* date:        10 June 2013                             */
/*                                                       */
/* updated:   Modified for SQL Server 17 Sep 2014 by LFE */                                          
/*                                                       */                                                                      
/* make sure tables are empty before adding records      */

/*
delete from Vendor_T;
delete from Shipped_T;
delete from Payment_T;
delete from PaymentType_T;
delete from OrderLine_T;
delete from Order_T;
delete from CustomerShipAddress_T;
delete from ProducedIn_T;
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
*/


/* load all tables but Raw Materials and Supplies and Uses        */

--REM INSERTING into Customer_T
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (1,'Contemporary Casuals','1355 S Hines Blvd','Gainesville','FL','32601-2871');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (2,'Value Furnitures','15145 S.W. 17th St.','Plano','TX','75094-7743');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (3,'Home Furnishings','1900 Allard Ave','Albany','NY','12209-1125');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (4,'Eastern Furniture','1925 Beltline Rd.','Carteret','NJ','07008-3188');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (5,'Impressions','5585 Westcott Ct.','Sacramento','CA','94206-4056');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (6,'Furniture Gallery','325 Flatiron Dr.','Boulder','CO','80514-4432');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (7,'New Furniture','Palace Ave','Farmington','NM',null);
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (8,'Dunkins Furniture','7700 Main St','Syracuse','NY','31590');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (9,'A Carpet','434 Abe Dr','Rome','NY','13440');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (12,'Flanigan Furniture','Snow Flake Rd','Ft Walton Beach','FL','32548');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (13,'Ikards','1011 S. Main St','Las Cruces','NM','88001');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (14,'Wild Bills','Four Horse Rd','Oak Brook','Il','60522');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (15,'Janet''s Collection','Janet Lane','Virginia Beach','VA','10012');
Insert into Customer_T (CustomerID,CustomerName,CustomerAddress,CustomerCity,CustomerState,CustomerPostalCode) values (16,'ABC Furniture Co.','152 Geramino Drive','Rome','NY','13440');


INSERT INTO Territory_T  (TerritoryID, TerritoryName)
	VALUES  (1, 'SouthEast');
INSERT INTO Territory_T  (TerritoryID, TerritoryName)
	VALUES  (2, 'SouthWest');
INSERT INTO Territory_T  (TerritoryID, TerritoryName)
	VALUES  (3, 'NorthEast');
INSERT INTO Territory_T  (TerritoryID, TerritoryName)
	VALUES  (4, 'NorthWest');
INSERT INTO Territory_T  (TerritoryID, TerritoryName)
	VALUES  (5, 'Central');
INSERT INTO Territory_T  (TerritoryID, TerritoryName)
	VALUES  (6, 'Alaska');
INSERT INTO Territory_T  (TerritoryID, TerritoryName)
	VALUES  (12, 'Hawaii');
INSERT INTO Territory_T  (TerritoryID, TerritoryName)
	VALUES  (13, 'Colorado');
INSERT INTO Territory_T  (TerritoryID, TerritoryName)
	VALUES  (15, 'Arizona');


INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)
	VALUES  (1, 1);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)
	VALUES  (2, 2);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)
	VALUES  (3, 3);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)
	VALUES  (4, 4);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)
	VALUES  (5, 5);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)
	VALUES  (6, 6);
INSERT INTO DoesBusinessIn_T  (CustomerID, TerritoryID)
	VALUES  (7, 1);

--REM INSERTING into Salesperson_T
Insert into Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) 
values (1,'Doug Henny','8134445555',null,2,null,null,null,null);
Insert into Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) 
values (2,'Robert Lewis','8139264006',null,13,'124 Deerfield','Lutz','FL','33549');
Insert into Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) 
values (3,'William Strong','3153821212',null,3,'787 Syracuse Lane','Syracuse','NY','33240');
Insert into Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) 
values (4,'Julie Dawson','4355346677',null,4,null,null,null,null);
Insert into Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) 
values (5,'Jacob Winslow','2238973498',null,5,null,null,null,null);
Insert into Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) 
values (6,'Pepe Lepue',null,null,13,null,'Platsburg','NY',null);
Insert into Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) 
values (8,'Fred Flinstone',null,null,2,'1 Rock Lane','Bedrock','Ca','99999');
Insert into Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) 
values (9,'Mary James','3035555454',null,4,'9 Red Line','Denver','CO','55555');
Insert into Salesperson_T (SalespersonID,SalespersonName,SalespersonTelephone,SalespersonFax,SalesTerritoryID,SalespersonAddress,SalespersonCity,SalespersonState,SalespersonZip) 
values (10,'Mary Smithson','4075555555',null,15,'4585 Maple Dr','Orlando','FL','32826');



INSERT INTO Skill_T  (SkillID, SkillDescription)
VALUES  ('BS12', '12in Band Saw');
INSERT INTO Skill_T  (SkillID, SkillDescription)
VALUES  ('QC1', 'Quality Control');
INSERT INTO Skill_T  (SkillID, SkillDescription)
VALUES  ('RT1', 'Router');
INSERT INTO Skill_T  (SkillID, SkillDescription)
VALUES  ('SO1', 'Sander-Orbital');
INSERT INTO Skill_T  (SkillID, SkillDescription)
VALUES  ('SB1', 'Sander-Belt');
INSERT INTO Skill_T  (SkillID, SkillDescription)
VALUES  ('TS10', '10in Table Saw');
INSERT INTO Skill_T  (SkillID, SkillDescription)
VALUES  ('TS12', '12in Table Saw');
INSERT INTO Skill_T  (SkillID, SkillDescription)
VALUES  ('UC1', 'Upholstery Cutter');
INSERT INTO Skill_T  (SkillID, SkillDescription)
VALUES  ('US1', 'Upholstery Sewer');
INSERT INTO Skill_T  (SkillID, SkillDescription)
VALUES  ('UT1', 'Upholstery Tacker');


--REM INSERTING into Employee_T
Insert into Employee_T (EmployeeID,EmployeeName,EmployeeAddress,EmployeeCity,EmployeeState,EmployeeZip,EmployeeDateHired,EmployeeBirthDate,EmployeeSupervisor) values ('123-44-345','Phil Morris','2134 Hilltop Rd','Knoxville','TN',null,'12-JUN-99','05-JAN-57','454-56-768');
Insert into Employee_T (EmployeeID,EmployeeName,EmployeeAddress,EmployeeCity,EmployeeState,EmployeeZip,EmployeeDateHired,EmployeeBirthDate,EmployeeSupervisor) values ('332445667','Lawrence Haley','5970 Spring Crest Rd','Nashville','TN','54545','05-JAN-99','15-AUG-63','454-56-768');
Insert into Employee_T (EmployeeID,EmployeeName,EmployeeAddress,EmployeeCity,EmployeeState,EmployeeZip,EmployeeDateHired,EmployeeBirthDate,EmployeeSupervisor) values ('454-56-768','Robert Lewis','17834 Deerfield Ln','Knoxville','TN','55555','01-JAN-98','25-AUG-64','123-44-345');
Insert into Employee_T (EmployeeID,EmployeeName,EmployeeAddress,EmployeeCity,EmployeeState,EmployeeZip,EmployeeDateHired,EmployeeBirthDate,EmployeeSupervisor) values ('555955585','Mary Smith','75 Jane Lane','Clearwater','FL','33879','15-AUG-00','06-MAY-69','332445667');
Insert into Employee_T (EmployeeID,EmployeeName,EmployeeAddress,EmployeeCity,EmployeeState,EmployeeZip,EmployeeDateHired,EmployeeBirthDate,EmployeeSupervisor) values ('Laura','Laura Ellenburg','5342 Picklied Trout Lane','Nashville','TN','38010','22-FEB-00',null,'454-56-768');



INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('123-44-345', 'BS12','');
INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('123-44-345', 'RT1', '');
INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('123-44-345', 'QC1', '01-JAN-01');
INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('123-44-345', 'TS10', '24-FEB-01');
INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('332445667', 'BS12','20-JAN-99');
INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('332445667', 'TS10','20-JAN-99');
INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('454-56-768', 'BS12', '25-FEB-01');
INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('454-56-768', 'RT1', '10-MAR-01');
INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('454-56-768', 'TS10', '10-MAR-01');
INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('Laura', 'UC1', '22-FEB-00');
INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('Laura', 'US1', '22-FEB-00');
INSERT INTO EmployeeSkills_T  (EmployeeID, SkillID, QualifyDate)
VALUES  ('Laura', 'UT1', '22-FEB-00');



INSERT INTO WorkCenter_T  (WorkCenterID, WorkCenterLocation)
VALUES  ('SM1', 'Main Saw Mill');

INSERT INTO WorkCenter_T  (WorkCenterID, WorkCenterLocation)
VALUES  ('WR1', 'Warehouse and Receiving');

INSERT INTO WorkCenter_T  (WorkCenterID, WorkCenterLocation)
VALUES  ('Tampa1', 'Tampa Warehouse');


INSERT INTO WorksIn_T (EmployeeID, WorkCenterID)
VALUES ('123-44-345', 'SM1');
INSERT INTO WorksIn_T (EmployeeID, WorkCenterID)
VALUES ('454-56-768', 'Tampa1');



INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (1, 'Basic');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (2, 'Antique');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (3, 'Modern');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (4, 'Classical');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (5, 'Rellville');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (6, 'Spanish Style');
INSERT INTO ProductLine_T  (ProductLineID, ProductLineName)
VALUES  (7, 'Gothic');



--REM INSERTING into Product_T
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (1,'Cherry End Table','Cherry',175.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (2,'Birch Coffee Tables','Birch',200.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (3,'Oak Computer Desk','Oak',750.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (4,'Entertainment Center','Cherry',1650.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (5,'Writer''s Desk','Oak',325.00,0,2);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (6,'8-Drawer Dresser','Birch',750.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (7,'48 Bookcase','Walnut',150.00,0,3);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (8,'48 Bookcase','Oak',175.00,0,3);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (9,'96 Bookcase','Walnut',225.00,0,3);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (10,'96 Bookcase','Oak',200.00,0,3);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (11,'4-Drawer Dresser','Oak',500.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (12,'8-Drawer Dresser','Oak',800.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (13,'Nightstand','Cherry',150.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (14,'Writer''s Desk','Birch',300.00,0,2);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (17,'High Back Leather Chair','Leather',362.00,0,3);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (18,'6'' Grandfather Clock','Oak',890.00,0,4);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (19,'7'' Grandfather Clock','Oak',1100.00,0,4);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (20,'Amoire','Walnut',1200.00,0,2);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (21,'Pine End Table','Pine',256.00,0,1);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (24,null,null,0.00,0,5);
Insert into Product_T (ProductID,ProductDescription,ProductFinish,ProductStandardPrice,ProductOnHand,ProductLineID) 
values (25,null,null,0.00,0,2);




INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (1, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (2, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (3, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (4, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (5, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (6, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (7, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (8, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (9, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (10, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (11, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (12, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (13, 'Tampa1');
INSERT INTO ProducedIn_T (ProductID, WorkCenterID)
	VALUES (14, 'Tampa1');


--REM INSERTING into CustomerShipAddress_T
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (1,4,13,'35456 Trifly Road','Lutz','FL','33549',null);
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (2,4,13,'1925 Beltline Rd.','Carteret','NJ',null,null);
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (3,1,6,'321 Butterfly Terr','Columbus','OH',null,null);
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (4,1,6,'7744 121 Street','Colubus','OH',null,null);
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (9,8,15,'US Embassy','Mexico City','Me',null,null);
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (10,16,4,'1256 One Lane','San Diego','CA','55555-',null);
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (11,9,1,'17832 Rt 92','Mobil','AL','39889-',null);
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (13,14,5,'303 Drakes Landing','Manhattan','KS','66502-',null);
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (14,13,2,'3400 Amador Ave','Las Cruces','NM','88001-',null);
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (15,4,6,'657 10th st','Kodiak','AK','99878-',null);
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (17,9,5,'100 E. Fletch','Pocahatas','OH','39877-',null);
Insert into CustomerShipAddress_T (ShipAddressID,CustomerID,TerritoryID,ShipAddress,ShipCity,ShipState,ShipZip,ShipDirections) values (19,4,13,'655 Rocky Point','Denver','CO',null,null);



INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (1, '08/Sep/09', 4, '25/Nov/05', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (2, '04/Oct/09', 3, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (3, '19/Jul/09', 1, '', 2, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (4, '01/Nov/09', 6, '', 5, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (5, '28/Jul/09', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (6, '27/Aug/09', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (7, '16/Sep/09', 1, '', 2, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (8, '16/Sep/09', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (9, '16/Sep/09', 6, '', 5, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (19, '05/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (20, '06/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (21, '06/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (22, '06/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (23, '06/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (24, '10/Mar/10', 1, '', 2, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (25, '10/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (26, '10/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (27, '10/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (28, '10/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (29, '11/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (30, '11/Mar/10', 4, '', 3, 4);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (31, '11/Mar/10', 15, '', 4, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (32, '11/Mar/10', 15, '', 4, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (34, '11/Mar/10', 15, '', 4, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (35, '11/Mar/10', 8, '', 5, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (36, '11/Mar/10', 4, '', 3, 1);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (37, '11/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (38, '11/Mar/10', 4, '', 3, 1);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (39, '11/Mar/10', 4, '', 3, 1);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (40, '11/Mar/10', 4, '', 3, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (41, '11/Mar/10', 12, '', 6, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (42, '11/Mar/10', 4, '', 3, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (43, '11/Mar/10', 12, '', 6, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (44, '11/Mar/10', 6, '', 9, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (45, '11/Mar/10', 12, '', 6, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (46, '11/Mar/10', 1, '', 2, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (47, '11/Mar/10', 12, '', 6, NULL);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (48, '11/Mar/10', 1, '', 2, 3);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (49, '11/Mar/10', 4, '', 3, 2);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (50, '11/Mar/10', 8, '', null, 9);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (51, '11/Mar/10', 16, '', null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (52, '11/Mar/10', 16, '', null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (53, '11/Mar/10', 16, '', null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (54, '11/Mar/10', 16, '', 9, 10);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (55, '11/Mar/10', 16, '', null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (56, '11/Mar/10', 9, '', 2, 11);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (57, '11/Mar/10', 9, '', null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (58, '11/Mar/10', 14, '', 5, 13);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (59, '11/Mar/10', 13, '', 8, 14);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (63, '11/Mar/10', 4, '', 6, 15);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (64, '11/Mar/10', 4, '', 6, 2);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (65, '11/Mar/10', 4, '', 6, 1);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (66, '11/Mar/10', 9, '', 5, 17);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (69, '11/Mar/10', 4, '', 2, 2);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (71, '08/Sep/10', 4, '', null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (73, '08/Sep/10', 12, '', null, null);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (75, '08/Sep/10', 1, '', null, 3);

INSERT INTO Order_T (OrderID, OrderDate, CustomerID, FulfillmentDate, SalespersonID, ShipAdrsID) 
VALUES (76, '15/Sep/10', 4, '', null, null);




--REM INSERTING into OrderLine_T
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (1,1,2,18);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (31,1,6,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (2,1,10,9);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (3,2,3,12);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (4,2,8,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (5,2,14,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (17,3,2,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (7,4,3,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (15,4,4,0);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (8,4,5,3);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (16,4,6,3);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (29,5,1,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (9,5,6,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (37,24,1,0);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (39,25,2,5);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (40,26,1,5);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (41,28,1,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (42,32,5,10);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (43,32,14,10);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (46,39,2,3);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (51,48,17,5);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (54,49,1,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (53,50,20,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (55,51,3,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (56,51,4,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (57,52,1,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (58,52,4,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (59,54,2,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (60,54,3,3);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (61,55,1,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (62,55,4,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (63,56,4,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (64,58,3,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (65,59,13,2);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (66,63,3,5);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (67,65,4,0);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (68,66,4,1);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (69,69,7,4);
Insert into OrderLine_T (OrderLineID,OrderID,ProductID,OrderedQuantity) values (70,71,3,0);


--REM INSERTING INTO Shipped_T TABLE
INSERT INTO Shipped_T (OrderLineID, ShippedQuantity, ShippedDate) 
VALUES (1, 1, '16/Sep/10 ');

INSERT INTO Shipped_T (OrderLineID, ShippedQuantity, ShippedDate) 
VALUES (2, 0, '');

INSERT INTO Shipped_T (OrderLineID, ShippedQuantity, ShippedDate) 
VALUES (3, 1, '16/Sep/10 ');

INSERT INTO Shipped_T (OrderLineID, ShippedQuantity, ShippedDate) 
VALUES (5, 2, '16/Sep/10');


--REM INSERTING INTO PaymentType_T TABLE
INSERT INTO PaymentType_T (PaymentTypeID, TypeDescription) 
VALUES ('D', 'Deposit');

INSERT INTO PaymentType_T (PaymentTypeID, TypeDescription) 
VALUES ('R', 'Refund');

INSERT INTO PaymentType_T (PaymentTypeID, TypeDescription) 
VALUES ('T', 'Transfer');


--REM INSERTING INTO Payment_T TABLE
INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) 
VALUES (1, 1, '01/Mar/10', 'D', 1000.0, 'chk101');

INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) 
VALUES (2, 24, '10/Mar/10', 'D', 25.0, 'cash');

INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) 
VALUES (3, 26, '10/Mar/10', 'D', 222.0, 'cash');

INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) 
VALUES (4, 28, '10/Mar/10', 'D', 25.0, 'cash');

INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) 
VALUES (5, 32, '11/Mar/10', 'D', 3000.0, 'Cashiers Check');

INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) 
VALUES (6, 34, '11/Mar/10', 'D', 575.0, 'Chk1201');

INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) 
VALUES (7, 39, '11/Mar/10', 'D', 600.0, 'chk 1003');

INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) 
VALUES (8, 48, '11/Mar/10', 'D', 1000.0, 'chk2301');

INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) 
VALUES (9, 51, '11/Mar/10', 'D', 150.0, 'cash');

INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) 
VALUES (10, 54, '11/Mar/10', 'D', 2650.0, 'Check # 343');

INSERT INTO Payment_T (PaymentID, OrderID, PaymentDate, PaymentTypeID, PaymentAmount, PaymentComment) 
VALUES (11, 69, '11/Mar/10', 'D', 200.0, 'chk3001');




INSERT INTO Vendor_T
(VendorID, VendorName, VendorAddress, VendorCity, VendorState, VendorZipcode, VendorPhone, VendorFax, VendorContact, VendorTaxIDNumber)
Values (1, 'Robert''s Lumber Yard', '1234 Wooded Lane', 'Forest Hill', 'TN', '33333-', '333-333-3333', '', 'Robert', '123456789');
INSERT INTO Vendor_T
(VendorID, VendorName, VendorAddress, VendorCity, VendorState, VendorZipcode, VendorPhone, VendorFax, VendorContact, VendorTaxIDNumber)
Values (2, 'Southern Lumber', '8768 Durgee Rd', 'Jacksonville', 'FL', '25998-', '444-444-4444', '', '', '');
INSERT INTO Vendor_T
(VendorID, VendorName, VendorAddress, VendorCity, VendorState, VendorZipcode, VendorPhone, VendorFax, VendorContact, VendorTaxIDNumber)
Values (3, 'Pebbles Hardware', '2323 Hardrock Rd', 'Bedrock', 'TX', '77777-', '555-555-5555', '', '', '');
