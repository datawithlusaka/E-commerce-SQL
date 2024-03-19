--DATA CLEANING

--Finding duplicates(--None)
Select id,COUNT(id)
From order_items
Group by id
Having COUNT(id) > 1;

Select distinct status,SUM(sale_price) as sales
From order_items
group by status

Alter table orders
Drop column returned_at
--changing data types

alter table  order_items
alter column sale_price float;

--Changing Date tables
alter table  order_items
alter column created_at datetime;


Alter table order_items
drop column returned_at

Alter table order_items
drop column delivered_at

-------------------------------------------------------------
--Finding duplicates(--None)
Select product_id,COUNT(product_id)
From inventory_items
Group by product_id
Having COUNT(product_id) > 1;


Select Distinct product_category
From inventory_items

--changing data types
alter table inventory_items
alter column cost float;

alter table inventory_items
alter column product_retail_price float;

select *
From inventory_items
Where cost is null

Alter Table inventory_items
Drop Column sold_at

-----------------------------------------------------------


--Finding duplicates(--None)
Select id,COUNT(id)
From users
Group by id
Having COUNT(id) > 1;

--changing data types
alter table users
alter column age float;

alter table inventory_items
alter column product_retail_price float;


Alter Table inventory_items
Drop Column sold_at

--Converting into one name
Alter table users
Add Full_Name nvarchar(150);

Update users
Set Full_Name = first_name + ' ' + last_name

Alter Table users
Drop column first_name

Alter Table users
Drop column last_name

-------------------------------------------------------

--Finding duplicates(--None)
Select order_id,COUNT(order_id)
From orders
Group by order_id
Having COUNT(order_id) > 1;

--changing data types
alter table orders
alter column num_of_item float;

------------------------------------------------------------
--Finding duplicates(--None)
Select id,COUNT(id)
From products
Group by id
Having COUNT(id) > 1;

--changing data types
alter table products
alter column cost float;

alter table products
alter column retail_price float;

--------------------------------------------------------------------------------------------------------
--Finding duplicates(--None)
Select order_id,COUNT(order_id)
From orders
Group by order_id
Having COUNT(order_id) > 1;

--changing data types
alter table orders
alter column num_of_item float;

-----------------------------------------------------------------------------------------------
Select Distinct gender,COUNT(num_of_item) as items
From orders
Group by gender
order by items


---DATA EXPLORATION
---Join Orders and orders_items data by user_id or order_id
Select m.order_id,m.user_id,m.status,m.gender,m.num_of_item,n.sale_price
From orders m
inner join order_items n on
m.order_id=n.order_id;

--Which Traffic source has the most users and in which country
Select Distinct traffic_source,COUNT(id) as users
From users
Group by traffic_source
order by users desc;

--Group the users by age group
Select id,age,
Case  
	When age >= 12 then 'Very Young'
	When age >= 18 then 'Young'
	When age >= 26 then 'Average Adult'
	When age >= 41 then 'Old'
	Else 'Very Old'
End As Age_Group
From users;

Alter Table users
Add Age_Group varchar(150);

Update users
Set Age_Group = Case  
			When age >= 50 then 'Old'
			When age >= 35 then 'Average Adult'
			When age >= 22 then 'Young'
			When age >= 12 then 'Very Young'
			End;

Select distinct Age_Group,COUNT(id) as [user]
From users
Group by Age_Group
Order by [user] desc;

Select Distinct gender,COUNT(id) as [user]
From users
Group by gender
order by [user] desc;



--Orders by status
Select distinct [status],COUNT(order_id) as orders
From orders
Group by  [status]
Order by orders desc;

--- How many orders were cancelled and the financial effect
Select distinct status,SUM(sale_price) as sales,COUNT(order_id) as orders
From order_items
Group by status
Order by sales desc;


---USER BEHAVOIUR ANALYSIS(--orders,items,sales)
SELECT Users.Full_Name, COUNT(DISTINCT Orders.order_id) AS TotalOrders
FROM Users
LEFT JOIN orders ON users.id = Orders.User_id
GROUP BY Users.Full_Name
ORDER BY TotalOrders DESC;

---Users  that ordered the most items
Select distinct(b.Full_Name), Sum(a.num_of_item) as quantity
From orders a
join users b
on a.user_id=b.id
group by b.Full_Name
Order by quantity desc;

--users that made the highest sales
Select d.Full_Name, Sum(c.sale_price) as sales
From order_items c
inner join users d
on c.user_id = d.id
Group by d.Full_Name
order by sales desc;


---Group users by each country
Select distinct country,COUNT(id) as [user]
from users
Group by country
order by [user] desc;

--Which Country has the highest Sales
Select m.country,Sum(n.sale_price) as TotalSales
From users m
inner join order_items n
on m.id = n.user_id
Group by m.country
Order by TotalSales desc;

---The Sales shown are the sales above the avg Sales in each Country
Select *
From users

Select *
From order_items
 --Finding the Countries whose Sales were better than the average sales of  all Countries
Select *
From(SElect SUM(b.sale_price) as TotalSales,a.country
	 From users a
	 join order_items b
	 on a.id=b.user_id
	 Group by country) sales
join (Select AVG(TotalSales) as AvgSales
From(SElect SUM(b.sale_price) as TotalSales,a.country
	 From users a
	 join order_items b
	 on a.id=b.user_id
	 Group by country)x)avg_sales
	 on sales.TotalSales > avg_sales.AvgSales


--PRODUCT BEHAVIOUR ANALYSIS
--Product performance in different categories
Alter table products
Add Profit float;

Update products
Set Profit = retail_price-cost

Select distinct category,SUM(cost) as production_cost,SUM(retail_price) as price,Sum(Profit) as profit
From products
Group by category
Order by profit desc;

--Product performance in different departments
Select Distinct department,Sum(cost) as cost ,Sum(retail_price) as retailPrice,Sum(Profit) as Profit
From products 
Group by department
Order by Profit desc;

select *
from order_items
--The most purchased product
Select distinct a.id,a.brand
From products a
inner join order_items b
on a.id=b.product_id

Select category,MAX(retail_price) as price
From products
Group by category
order by price desc;
---DISTRIBUTION CENTRE ANALYSIS
--Distribution centres with the most products
Select distinct d.name,Count(distinct i.product_id) as products
From distribution_centers d
inner join inventory_items i
on d.id=i.product_distribution_center_id
Group by d.name
Order by products desc;

---Distribution centres with the highest sales 
Select distinct d.name,sum(i.product_retail_price) as retail_price
From distribution_centers d
inner join inventory_items i
on d.id=i.product_distribution_center_id
Group by d.name
Order by retail_price desc;

---Distribution centre with the highest profits
Select distinct d.name,sum(p.Profit) as profit 
From distribution_centers d
join products p
on d.id=p.distribution_center_id
Group by d.name
Order by profit desc;


--INVENTORY ANALYSIS
Alter Table inventory_items
Add  Profit float;

Update inventory_items
Set Profit = product_retail_price-cost

--
Select i.product_id,i.product_name, i.cost,i.product_retail_price,i.Profit,i.product_name,i.product_category,o.sale_price,o.status
From inventory_items i
inner join order_items o
on i.id=o.inventory_item_id

--DESCRIPTIVE ANALYSIS
Select count(name)       --No of distribution centres(10)
From distribution_centers

Select Count(distinct id) as items ---Items in the inventory(490,705)
From inventory_items

Select COUNT(distinct id) as items  ---No of ordered items(181,759)
From order_items

Select COUNT(distinct order_id) as orders ----No of orders(125,226)
From orders

Select COUNT(distinct id) as Products ---No of Products(29,120) 
From products

Select COUNT(distinct id) as users -----No of Users(100,000)
From users

Alter table orders
Drop column returned_at

