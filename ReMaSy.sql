CREATE DATABASE Restaurant_Management_System;
USE Restaurant_Management_System;

CREATE TABLE Restaurants 
(Restaurant_ID INT AUTO_INCREMENT PRIMARY KEY,
 Restaurant_Name VARCHAR(50),
 Location VARCHAR(50), 
 Cuisine_Type VARCHAR(50));
 
 CREATE TABLE Customers
 (Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
 First_Name VARCHAR(30) NOT NULL,
 Last_Name VARCHAR(30) NOT NULL,
 Mobile_Number VARCHAR(10),
 Email VARCHAR(50) UNIQUE KEY,
 Address TEXT);
 
CREATE TABLE Menu_Items 
 (Item_ID INT AUTO_INCREMENT PRIMARY KEY,
 Restaurant_ID INT NOT NULL,
 Name VARCHAR(100) NOT NULL,
 Description TEXT,
 Price DECIMAL(10,2) NOT NULL,
 Category VARCHAR(100),
FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID));
 
CREATE TABLE Tables
 (Table_ID INT AUTO_INCREMENT PRIMARY KEY,
 Table_number INT NOT NULL,
 Seats INT NOT NULL,
 Status ENUM("Available","Occupied","Reserved") DEFAULT "Available");
 
 CREATE TABLE Reservations
 (Reservation_ID INT AUTO_INCREMENT PRIMARY KEY,
 Customer_ID INT,
 Restaurant_ID INT NOT NULL,
 Table_ID INT,
 Reservation_Date DATETIME,
 Number_of_Guests INT,
 Status ENUM("Confirmed", "Cancelled", "Completed") DEFAULT "Confirmed",
 FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
 FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID),
 FOREIGN KEY (Table_ID) REFERENCES Tables(Table_ID));
 
 CREATE TABLE Orders
 (Order_ID INT AUTO_INCREMENT PRIMARY KEY,
 Customer_ID INT,
 Table_ID INT,
 Order_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 Status ENUM("Pending", "In Progress", "Completed", "Cancelled") DEFAULT "Pending",
 FOREIGN KEY(Customer_ID) REFERENCES Customers(Customer_ID),
 FOREIGN KEY(Table_ID) REFERENCES Tables(Table_ID));
 
 CREATE TABLE Order_Items
 (Order_Item_ID INT AUTO_INCREMENT PRIMARY KEY,
 Order_ID INT,
 Item_ID INT,
 Quantity INT,
 Item_Price DECIMAL(10,2),
 Total_Amount DECIMAL(10,2),
 FOREIGN KEY(Item_ID) REFERENCES Menu_Items(Item_ID),
 FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID));
 
 CREATE TABLE Payments
 (Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
 Order_ID INT,
 Payment_Method VARCHAR(50),
 Amount DECIMAL(10,2),
 Payment_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID));
 
 CREATE TABLE Reviews
 (Review_ID INT AUTO_INCREMENT PRIMARY KEY,
 Customer_ID INT,
 Restaurant_ID INT,
 Ratings DECIMAL(2,1),
 Comments VARCHAR(10),
 Review_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(Customer_ID) REFERENCES Customers(Customer_ID),
 FOREIGN KEY(Restaurant_ID) REFERENCES Restaurants(Restaurant_ID));
 
 SELECT * FROM Restaurants
 SELECT * FROM Customers
 SELECT * FROM Menu_Items
 SELECT * FROM Tables
 SELECT * FROM Reservations
 SELECT * FROM Orders
 SELECT * FROM Order_Items
 SELECT * FROM Payments
 SELECT * FROM Reviews

DELIMITER &&
CREATE PROCEDURE GetTotalRevenue()
BEGIN
   SELECT SUM(Total_Amount) FROM Order_Items;
END  &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetViewAllOrdersWithDetails()
BEGIN
SELECT o.order_id, c.first_name, c.last_name, mi.name AS item, oi.quantity, oi.total_amount
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
JOIN order_items AS oi ON o.order_id = oi.order_id
JOIN menu_items AS mi ON oi.item_id = mi.item_id;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetTotalRevenuePerDay()
BEGIN
    SELECT DATE(o.order_time) AS day, SUM(oi.total_amount) AS revenue
    FROM orders as o
    JOIN order_items as oi on o.order_id = oi.order_id
    GROUP BY day
    ORDER BY day DESC;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetTopSellingMenuItems()
BEGIN
SELECT mi.name, sum(oi.quantity) AS total_sold
FROM order_items AS oi
JOIN menu_items AS mi ON oi.item_id = mi.item_id
GROUP BY mi.name
ORDER BY total_sold DESC
LIMIT 10;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetRevenueGeneratedByEachMenuItemCategory()
BEGIN
SELECT mi.category, SUM(oi.quantity * mi.price) AS revenue
FROM Order_items AS oi
JOIN Menu_Items AS mi ON oi.item_id = mi.item_id
GROUP BY mi.category
ORDER BY revenue DESC;
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetOrderSummaryForASpecificCustomer(in cusid int)
BEGIN
SELECT o.order_id, o.order_time, mi.name AS item, oi.quantity, mi.price, oi.quantity * mi.price AS total
FROM Orders AS o
JOIN Order_items AS oi ON o.order_id = oi.order_id
JOIN Menu_Items AS mi ON oi.item_id = mi.item_id
WHERE o.customer_id = cusid;
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetCalculateAverageOrderValue()
BEGIN
SELECT AVG(total_amount) AS average_order_value
FROM Order_items;
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetMonthlyRevenueReport()
BEGIN
SELECT DATE_FORMAT(o.order_time, '%Y-%m') AS month, SUM(oi.total_amount) AS monthly_revenue
FROM Orders AS o
JOIN order_items AS oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month DESC;
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetListOfCustomersWhoHavenotOrderedRecently()
BEGIN
SELECT * FROM Customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM Orders
    WHERE order_time >= CURDATE() - INTERVAL 21 DAY);
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetDailyOrderCount()
BEGIN
SELECT DATE(order_time) AS order_day, COUNT(*) AS total_orders
FROM Orders as o
GROUP BY order_day
ORDER BY order_day;
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetMostRecentOrders()
BEGIN
SELECT o.order_id, c.first_name, c.last_name, o.order_time, oi.total_amount
FROM Orders AS o
JOIN order_items AS oi ON o.order_id = oi.order_id
JOIN Customers AS c ON o.customer_id = c.customer_id
ORDER BY o.order_time DESC
LIMIT 5;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetCustomersWithItemsOrdered()
BEGIN
SELECT CONCAT(c.first_name,' ',c.last_name) AS customer, GROUP_CONCAT(mi.name SEPARATOR ', ') AS items_ordered
FROM Orders AS o
JOIN Order_items AS oi ON o.order_id = oi.order_id
JOIN Menu_Items AS mi ON oi.item_id = mi.item_id
JOIN Customers AS c ON o.customer_id = c.customer_id
GROUP BY o.order_id;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetRecentCustomerFeedback()
BEGIN
SELECT CONCAT(c.first_name,' ',c.last_name) AS customer_names, re.restaurant_name, r.ratings, r.comments, r.review_date
FROM reviews AS r
JOIN customers AS c ON c.customer_id = r.customer_id
JOIN restaurants AS re ON re.restaurant_id = r.restaurant_id
WHERE review_date >= CURRENT_DATE - INTERVAL 5 DAY
ORDER BY review_date DESC;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetAvailableSummary()
BEGIN
SELECT table_id, table_number, status,
   CASE
      WHEN status = "available" THEN "proceed"
      WHEN status = "reserved" THEN "not proceed"
      ELSE "cannot proceed"
   END AS table_status FROM tables;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetSecondHighestPrice()
BEGIN
    SELECT MAX(price) AS second_highest_price FROM menu_items WHERE price < (SELECT MAX(price) FROM menu_items);
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetTheHighestSalaryForEachDepartment(in pricerank int)
BEGIN
     SELECT category, MAX(price) AS second_highest_price
     FROM (SELECT category, price, DENSE_RANK() OVER(PARTITION BY category ORDER BY price DESC) AS price_rank 
       FROM menu_items) AS ranked_prices 
       WHERE price_rank = pricerank GROUP BY category;
END &&
DELIMITER;



CALL GetTotalRevenue
CALL GetAllOrdersWithDetails
CALL GetTotalRevenuePerDay
CALL GetTopSellingMenuItems
CALL GetRevenueGeneratedByEachMenuItemCategory
CALL GetOrderSummaryForASpecificCustomer(121)
CALL GetCalculateAverageOrderValue
CALL GetMonthlyRevenueReport
CALL GetListOfCustomersWhoHavenotOrderedRecently
CALL GetDailyOrderCount
CALL GetMostRecentOrders
CALL GetCustomersWithItemsOrdered
CALL GetRecentCustomerFeedback
CALL GetAvailableSummary
CALL GetSecondHighestPrice
CALL GetTheHighestSalaryForEachDepartment(2)