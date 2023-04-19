--Create table Product.
CREATE TABLE Product(Id INT IDENTITY(1,1) PRIMARY KEY,
ProductName NVARCHAR(500),Category NVARCHAR(50),Price MONEY);
--Alter table product and add constraint.
ALTER TABLE Product ADD Description NVARCHAR(100);
ALTER TABLE Product ALTER COLUMN ProductName NVARCHAR(500) NOT NULL;
ALTER TABLE Product ADD CONSTRAINT CHK_Product_Price CHECK(Price>0);
--Insert data into product.
INSERT INTO Product VALUES
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
SELECT Id,ProductName,Category,Price,Description FROM Product WHERE Category = 'Health';
--Write a query to get total price of all products.
SELECT SUM(Price) TotalPrice FROM Product;
--Write a query to get total price of all products category wise.
SELECT Category,SUM(Price) FROM Product GROUP BY Category;
--Write a query to display product in descending order of price
SELECT Id,ProductName,Category,Price,Description FROM Product ORDER BY Price DESC;
--Write a query to display category wise product count having price greater than  10000.
SELECT Category,COUNT(Category) ProductCount FROM Product WHERE Price > 10000 GROUP BY Category;