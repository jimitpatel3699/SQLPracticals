--Create table product.
create table Product(Id int identity(1,1) primary key,
ProductName nvarchar(500),Category nvarchar(50),Price money);
--Alter table product and add constraint
alter table Product add Description nvarchar(100);
alter table Product alter column ProductName nvarchar(500) not null;
alter table Product add constraint CHK_Product_Price check(Price>0);
--Insert data into product.
insert into Product values
('Dabar chyawanprash','Health',350,'Ayurvedic health supplement with natural herbs and spices to boost immunity.'),
('Himalaya Liv.52','Health',225,'Herbal medicine for liver support and detoxification.'),
('Amway Nutrilite','Health',1749,'Nutritional supplement with vitamins and minerals to support overall health and well-being.'),
('Omron Blood Pressure Monitor','Health',2699,'Automatic blood pressure monitor with cuff and digital display.'),
('Ensure Nutritional Drink','Health',699,'Complete and balanced nutritional drink with vitamins and minerals'),
('Philips Air Purifier','Home Appliances',12999,'High-efficiency air purifier with HEPA filter.'),
('Fastrack Analog Watch','Fashion Accessories',2499,'Trendy and stylish watch with leather strap.'),
('LG 55 inch Smart TV','Electronics',79999,'55 inch OLED TV with 4K resolution and webOS smart TV platform'),
('Sony WH-1000XM4 Headphones','Electronics',24990,'Premium noise-cancelling headphones with Bluetooth connectivity.'),
('Samsung Galaxy Watch 4','Smart Watches',23999,'Smartwatch with advanced fitness and health tracking features.'),
('Titan Raga Analog Watch','Fashion Accessories',5995,'Elegant and feminine watch with mother-of-pearl dial.');
--Write a query to list all the products belonging to health category.
select Id,ProductName,Category,Price,Description from Product where Category = 'health';
--Write a query to get total price of all products.
select sum(Price) TotalPrice from Product;
--Write a query to get total price of all products category wise.
select Category,sum(Price) from Product group by Category;
--Write a query to display product in descending order of price
select Id,ProductName,Category,Price,Description from Product order by Price desc;
--Write a query to display category wise product count having price greater than  10000.
select Category,count(Category) ProductCount from Product where Price > 10000 group by Category;