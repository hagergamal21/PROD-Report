

create database test_env;

use test_env;

select * from [dbo].[Products];

select * from [dbo].[Test Environment Inventory Dataset];

select distinct Order_Date_DD_MM_YYYY from [dbo].[Test Environment Inventory Dataset];

-------------------------------------
select 
	a.Order_Date_DD_MM_YYYY,
	a.Product_ID,
	a.Availability,
	a.Demand,
	b.Product_Name,
	b.Unit_Price
from [dbo].[Test Environment Inventory Dataset] as a
left join [dbo].[Products] as b 
	on a.Product_ID = b.Product_ID;

--------------------------------------

select * into New_table from
	(select 
		a.Order_Date_DD_MM_YYYY,
		a.Product_ID,
		a.Availability,
		a.Demand,
		b.Product_Name,
		b.Unit_Price
	from [dbo].[Test Environment Inventory Dataset] as a
	left join [dbo].[Products] as b 
		on a.Product_ID = b.Product_ID) x;

---------------------------------------

select * from New_table

---------------------------------------

create database PROD;

USE PROD;

select * from [dbo].[Prod Env Inventory Dataset];

select 
	distinct Order_Date_DD_MM_YYYY
from [dbo].[Prod Env Inventory Dataset]
where Order_Date_DD_MM_YYYY is null or Order_Date_DD_MM_YYYY = '';

-- 21 --> 7
-- 22 --> 11

select 
	distinct Product_ID
from [dbo].[Prod Env Inventory Dataset]
order by Product_ID;
--where Order_Date_DD_MM_YYYY is null or Order_Date_DD_MM_YYYY = ''

update [dbo].[Prod Env Inventory Dataset]
set Product_ID = 7
where Product_ID = 21;

update [dbo].[Prod Env Inventory Dataset]
set Product_ID = 11
where Product_ID = 22;

--------------------------------------

select * into New_table from
	(select 
		a.Order_Date_DD_MM_YYYY,
		a.Product_ID,
		a.Availability,
		a.Demand,
		b.Product_Name,
		b.Unit_Price
	from [dbo].[Prod Env Inventory Dataset] as a
	left join [dbo].[Products] as b 
		on a.Product_ID = b.Product_ID) x;
