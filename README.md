# E-COMMERCE SQL PROJECT
## Project Overview
The e-commerce project investigates the progress of sales, orders, and users buying through a website and their buying patterns over the whole period. This project aims to understand the way products move around on this website and how they can be optimized better.

## Objectives
o	Understanding the performance of different categories
o	Which country had the best sales, profits, and the most users
o	Which age group do our users come from
o	The overall performance of each distribution center.
o	The top-rated users in both units bought and the number of purchases made.
o	Which Customers spend the most amount? 
o	Which are the most frequent items bought? 
o	Which is the most expensive purchase made? 
o	Which Date had the most Orders?
o	Best Performing Products.
o	Find the Country whose Sales were better than the average sales of the Other Country
o	The Sales shown are the sales above the average Sales in each Country

## Data sources
This project was found on Kaggle. It entails the data of sales of an electronic commerce business. It has sales of countries, the invoice of sales made, the orders, it shows hours with most sales. It has six tables each with unique records. It includes users’ information, orders made, and products available in the inventory.

## Data Cleaning/Preparation
The dataset was fairly clean with minimal errors. I deleted several columns in the whole dataset and added aggregations to the data to make it easier for analysis. I also made corrections to the columns.

## Exploratory Data Analysis
This dataset has six tables each with a primary key. They include orders, users, products, distribution centers, inventory items, and ordered items.
The main sources in which the website got traffic were five. Many users used search as their entry point with email and display reporting poorly.

![Traffic Sources](https://github.com/datawithlusaka/E-commerce-SQL/blob/main/images/traffic_source.jpg)

Many users were spread out throughout the age groups but. The age of 50 and above attracted a larger amount than most other age groups and both male and female being relatively equal. This also shows that most people in the search are old which means above the age of fifty.

![Age Group By traffic](https://github.com/datawithlusaka/E-commerce-SQL/blob/main/images/2.jpg)

Higher orders have been completed and shipped but a still big number are being cancelled and returned. This problem must be addressed to save the company money. The company lost over 40k orders and 200k in sales due to canceled and returned orders.

![orders](https://github.com/datawithlusaka/E-commerce-SQL/blob/main/images/orderss.jpg)

The users with the most orders were the smiths. The 4 users led both in orders and quantities of items purchased. Michael Smith has also led in sales recording about 6,646 in sales.
China and the United States led in the number of overall users. China leading with over 34k users. The lowest performing was Deutschland and Austria which only recorded two users each. China has also led in the number of total sales.

The average Sales Were 676,694 in each country and only 3 of the 26 countries made sales above with the best being the us, Brazil, and China respectively. This shows that many countries are still performing below par and need to improve in sales.

The site has been getting average traffic of about 1600 average monthly users. However, There was a large spike in users. In the beginning of December where the site witnessed the use of over 3k users and the spike has been slowly dying as January 2024 approached with the average standing at around 2k.
The site also receives over 19k yearly users

