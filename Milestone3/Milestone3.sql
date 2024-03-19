-- drop table Review;
-- drop table Orders;
-- drop table Car;
-- drop table Salesperson;
-- drop table Model;
-- drop table Category;
-- drop table Maker;
-- drop table Customer;
-- show tables;

-- Create Customer table
CREATE TABLE Customer
(
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name  VARCHAR(50)  NOT NULL,
    Last_Name   VARCHAR(50)  NOT NULL,
    Password    VARCHAR(20)  NOT NULL,
    Email       VARCHAR(100) NOT NULL,
    Address     VARCHAR(50)  NOT NULL
);

-- Create Maker table
CREATE TABLE Maker
(
    Maker_ID               INT PRIMARY KEY AUTO_INCREMENT,
    Maker_Name             VARCHAR(20)  NOT NULL,
    Country                VARCHAR(50)  NOT NULL,
    Maker_Established_Year INT          NOT NULL,
    Maker_Website_URL      VARCHAR(255) NOT NULL
);


-- Create Category table
CREATE TABLE Category
(
    Category_ID          INT PRIMARY KEY,
    Category_Name        VARCHAR(50)  NOT NULL,
    Category_Description VARCHAR(255) NOT NULL
);

-- Create Model table
CREATE TABLE Model
(
    Model_ID                 INT PRIMARY KEY,
    Model_Name               VARCHAR(100) NOT NULL ,
    Model_Year               INT         NOT NULL,
    Transmission_Type        VARCHAR(20) NOT NULL,
    Average_Fuel_Consumption VARCHAR(50) NOT NULL,
    Sales                    INT     NOT NULL,
    Stock_Quantity           INT    NOT NULL
);

-- Create Salesperson table
CREATE TABLE Salesperson
(
    Salesperson_ID INT PRIMARY KEY,
    First_Name     VARCHAR(50) NOT NULL,
    Last_Name      VARCHAR(50) NOT NULL,
    Email          VARCHAR(100) NOT NULL,
    Phone_Number   VARCHAR(20) NOT NULL
);

-- Create Car table
CREATE TABLE Car
(
    Car_ID         INT PRIMARY KEY,
    Warranty       VARCHAR(10) NOT NULL DEFAULT '1 year',
    Engine_Type    VARCHAR(10) NOT NULL,
    Category_ID    INT NOT NULL,
    Maker_ID       INT NOT NULL,
    Color          VARCHAR(20) NOT NULL,
    Model_ID       INT NOT NULL,
    Condition_Type VARCHAR(4) NOT NULL,
    Photo_URL    VARCHAR(255) NOT NULL ,
    Price          DECIMAL(10, 4) NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Category (Category_ID),
    FOREIGN KEY (Maker_ID) REFERENCES Maker (Maker_ID),
    FOREIGN KEY (Model_ID) REFERENCES Model (Model_ID)
);

-- Create Order table
CREATE TABLE Orders
(
    Order_ID       INT PRIMARY KEY,
    Customer_ID    INT NOT NULL,
    Car_ID         INT NOT NULL,
    Salesperson_ID INT NOT NULL,
    Order_Date     TIMESTAMP DEFAULT NOW(),
    Total_Amount   DECIMAL(10, 2) NOT NULL,
    Status         VARCHAR(50)  NOT NULL,
    Card_Number    VARCHAR(16) NOT NULL,
    Expiry_Date    VARCHAR(5) NOT NULL,
    CVC            INT NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
    FOREIGN KEY (Car_ID) REFERENCES Car (Car_ID),
    FOREIGN KEY (Salesperson_ID) REFERENCES Salesperson (Salesperson_ID)
);

-- Create Review table
CREATE TABLE Review
(
    Review_ID   INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Car_ID      INT NOT NULL,
    Rating      INT     NOT NULL,
    Comment     VARCHAR(255),
    Date_Posted TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
    FOREIGN KEY (Car_ID) REFERENCES Car (Car_ID)
);

-- Insert data into Customer table
INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Password, Email, Address)
VALUES (1001, 'John', 'Doe', 'password123', 'john.doe@email.com', '123 Main St'),
       (1002, 'Jane', 'Smith', 'securepass', 'jane.smith@email.com', '456 Oak Ave'),
       (1003, 'Robert', 'Johnson', 'pass123', 'robert.johnson@email.com', '789 Pine Rd'),
       (1004, 'Emily', 'Davis', 'securepass321', 'emily.davis@email.com', '101 Elm St'),
       (1005, 'Michael', 'Miller', 'mikepass', 'michael.miller@email.com', '202 Maple Ave'),
       (1006, 'Olivia', 'Williams', 'olivia123', 'olivia.williams@email.com', '303 Birch Rd'),
       (1007, 'David', 'Brown', 'brownpass', 'david.brown@email.com', '404 Cedar St'),
       (1008, 'Emma', 'Jones', 'emma456', 'emma.jones@email.com', '505 Oak Ave'),
       (1009, 'William', 'Lee', 'willpass789', 'william.lee@email.com', '606 Pine Rd'),
       (1010, 'Sophia', 'Taylor', 'sophiapass', 'sophia.taylor@email.com', '707 Elm St');


-- Insert data into Maker table
INSERT INTO Maker (Maker_ID, Maker_Name, Country, Maker_Established_Year, Maker_Website_URL)
VALUES (2001, 'Toyota', 'Japan', 1937, 'https://www.toyota.com'),
       (2002, 'Ford', 'USA', 1903, 'https://www.ford.com'),
       (2003, 'Honda', 'Japan', 1948, 'https://www.honda.com'),
       (2004, 'Chevrolet', 'USA', 1911, 'https://www.chevrolet.com'),
       (2005, 'BMW', 'Germany', 1916, 'https://www.bmw.com'),
       (2006, 'Mercedes-Benz', 'Germany', 1926, 'https://www.mercedes-benz.com'),
       (2007, 'Hyundai', 'South Korea', 1967, 'https://www.hyundai.com'),
       (2008, 'Nissan', 'Japan', 1933, 'https://www.nissan.com'),
       (2009, 'Kia', 'South Korea', 1944, 'https://www.kia.com'),
       (2010, 'Volkswagen', 'Germany', 1937, 'https://www.vw.com');


-- Insert data into Category table
INSERT INTO Category (Category_ID, Category_Name, Category_Description)
VALUES (3001, 'Sedan', 'Four-door passenger car'),
       (3002, 'SUV', 'Sport Utility Vehicle'),
       (3003, 'Hatchback', 'Compact car with a rear door that opens upwards'),
       (3004, 'Truck', 'Large vehicle designed to transport cargo'),
       (3005, 'Coupe', 'Two-door car with a fixed roof'),
       (3006, 'Convertible', 'Car with a folding or retractable roof'),
       (3007, 'Crossover', 'Combines features of SUV and sedan'),
       (3008, 'Van', 'Larger vehicle primarily used for transporting people'),
       (3009, 'Electric', 'Vehicle powered by electric energy'),
       (3010, 'Sports Car', 'High-performance and typically two-seater');


-- Insert data into Model table
INSERT INTO Model (Model_ID, Model_Name, Model_Year, Transmission_Type, Average_Fuel_Consumption, Sales, Stock_Quantity)
VALUES (6001, 'Camry', 2022, 'Automatic', '30.5 mi/gal', 100, 20),
       (6002, 'Explorer', 2023, 'Automatic', '25.2 mi/gal', 80, 15),
       (6003, 'Civic', 2022, 'CVT', '32.1 mi/gal', 120, 25),
       (6004, 'Silverado', 2023, 'Automatic', '18.5 mi/gal', 60, 10),
       (6005, 'X5', 2022, 'Automatic', '27.8 mi/gal', 90, 18),
       (6006, 'C-Class', 2023, 'Automatic', '24.3 mi/gal', 70, 12),
       (6007, 'Palisade', 2022, 'Automatic', '22.7 mi/gal', 110, 22),
       (6008, 'Altima', 2023, 'CVT', '28.4 mi/gal', 75, 14),
       (6009, 'Soul', 2022, 'Automatic', '26.0 mi/gal', 95, 16),
       (6010, 'Golf', 2023, 'Automatic', '29.6 mi/gal', 85, 17);

-- Insert data into Salesperson table
INSERT INTO Salesperson (Salesperson_ID, First_Name, Last_Name, Email, Phone_Number)
VALUES (8001, 'Alice', 'Johnson', 'alice@email.com', '(206) 555-1234'),
       (8002, 'Bob', 'Williams', 'bob@email.com', '(425) 555-5678'),
       (8003, 'Charlie', 'Smith', 'charlie@email.com', '(650) 555-9876'),
       (8004, 'David', 'Brown', 'david@email.com', '(267) 555-4321'),
       (8005, 'Emma', 'Davis', 'emma@email.com', '(288) 555-8765'),
       (8006, 'Frank', 'Jones', 'frank@email.com', '(206) 555-2345'),
       (8007, 'Grace', 'Taylor', 'grace@email.com', '(288) 555-6789'),
       (8008, 'Henry', 'Wilson', 'henry@email.com', '(254) 555-3456'),
       (8009, 'Ivy', 'Martinez', 'ivy@email.com', '(252) 555-7890'),
       (8010, 'Jack', 'Harris', 'jack@email.com', '(246) 555-4567');

-- Insert data into Car table
INSERT INTO Car (Car_ID, Price, Warranty, Engine_Type, Category_ID, Maker_ID, Color, Model_ID, Condition_Type,
                 Photo_URL)
VALUES (4001, 25000.00, '2 years', 'V6', 3001, 2001, 'Blue', 6001, 'New', 'car1.jpg'),
       (4002, 30000.00, '3 years', 'V8', 3002, 2002, 'Red', 6002, 'Used', 'car2.jpg'),
       (4003, 22000.00, '1 year', 'Inline-4', 3003, 2003, 'Silver', 6003, 'New', 'car3.jpg'),
       (4004, 35000.00, '2 years', 'V8', 3004, 2004, 'Black', 6004, 'Used', 'car4.jpg'),
       (4005, 40000.00, '3 years', 'V6', 3005, 2005, 'White', 6005, 'New', 'car5.jpg'),
       (4006, 28000.00, '2 years', 'Inline-6', 3006, 2006, 'Gray', 6006, 'Used', 'car6.jpg'),
       (4007, 24000.00, '1 year', 'V4', 3007, 2007, 'Green', 6007, 'New', 'car7.jpg'),
       (4008, 32000.00, '3 years', 'V6', 3008, 2008, 'Brown', 6008, 'Used', 'car8.jpg'),
       (4009, 26000.00, '2 years', 'Inline-4', 3009, 2009, 'Yellow', 6009, 'New', 'car9.jpg'),
       (4010, 38000.00, '2 years', 'V8', 3010, 2010, 'Orange', 6010, 'Used', 'car10.jpg');


-- Insert data into Review table
INSERT INTO Review (Review_ID, Customer_ID, Car_ID, Rating, Comment, Date_Posted)
VALUES (5001, 1001, 4001, 5, 'Great car!', '2024-02-18 23:12:00'),
       (5002, 1002, 4002, 4, 'Good performance', '2024-02-19 10:32:15'),
       (5003, 1003, 4003, 3, 'Average experience', '2024-02-20 02:17:35'),
       (5004, 1004, 4004, 5, 'Excellent truck', '2024-02-21 04:53:19'),
       (5005, 1005, 4005, 4, 'Smooth ride', '2024-02-22 17:25:39'),
       (5006, 1006, 4006, 2, 'Not satisfied with the convertible', '2024-02-23 12:10:00'),
       (5007, 1007, 4007, 4, 'Spacious interior', '2024-02-24 15:25:10'),
       (5008, 1008, 4008, 5, 'Luxurious feel', '2024-02-25 14:25:30'),
       (5009, 1009, 4009, 3, 'Decent electric car', '2024-02-26 02:00:00'),
       (5010, 1010, 4010, 4, 'Sporty and fun', '2024-02-27 13:12:21');


-- Insert data into Order table
INSERT INTO Orders (Order_ID, Customer_ID, Car_ID, Salesperson_ID, Order_Date, Total_Amount, Status, Card_Number,
                     Expiry_Date, CVC)
VALUES (7001, 1001, 4001, 8001, '2024-02-20 12:30:00', 25000.00, 'Completed', '1234567890123456', '12/25', 123),
       (7002, 1002, 4002, 8002, '2024-02-21 09:45:00', 30000.00, 'Processing', '9876543210987654', '11/27', 456),
       (7003, 1003, 4003, 8003, '2024-02-22 07:17:00', 22000.00, 'Shipped', '6543210987654321', '10/28', 789),
       (7004, 1004, 4004, 8004, '2024-02-23 15:30:50', 35000.00, 'Pending', '1230987654321098', '09/29', 234),
       (7005, 1005, 4005, 8005, '2024-02-24 14:30:27', 40000.00, 'Completed', '5678901234567890', '03/31', 567),
       (7006, 1006, 4006, 8006, '2024-02-25 13:30:35', 28000.00, 'Processing', '0987654321098765', '04/26', 890),
       (7007, 1007, 4007, 8007, '2024-02-26 12:30:47', 24000.00, 'Shipped', '3456789012345678', '07/27', 123),
       (7008, 1008, 4008, 8008, '2024-02-27 01:30:48', 32000.00, 'Pending', '9012345678901234', '12/24', 456),
       (7009, 1009, 4009, 8009, '2024-02-28 02:30:12', 26000.00, 'Completed', '2345678901234567', '06/29', 789),
       (7010, 1010, 4010, 8010, '2024-02-29 22:27:11', 38000.00, 'Processing', '6789012345678901', '02/28', 234);
       

-- 1) Retrieve the details of cars along with their respective makers.
SELECT Car.Car_ID, Car.Model_ID, Maker.Maker_Name, Model_Name, Car.Color, Car.Condition_Type, Car.Price
FROM Car
INNER JOIN Maker ON Car.Maker_ID = Maker.Maker_ID
INNER JOIN Model ON Model.Model_ID = Car.Model_ID;

-- 2) Identify the top 5 customers with the highest number of orders.
SELECT Customer.Customer_ID, Customer.First_Name, Customer.Last_Name, COUNT(Orders.Order_ID) AS OrderCount
FROM Customer
INNER JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID
GROUP BY Customer.Customer_ID
ORDER BY OrderCount DESC
LIMIT 5;

-- 3) List all cars with stock quantity below the average stock quantity.
SELECT Car.Car_ID, Model_Name, Model.Stock_Quantity
FROM Car
INNER JOIN Model ON Car.Model_ID = Model.Model_ID
WHERE Model.Stock_Quantity < (SELECT AVG(Stock_Quantity) FROM Model);

-- 4) Retrieve the total sales and average price per car category, only for categories with total sales greater than 25,000.
SELECT Category.Category_Name, SUM(Car.Price) AS TotalSales, AVG(Car.Price) AS AvgPrice
FROM Category
INNER JOIN Car ON Category.Category_ID = Car.Category_ID
GROUP BY Category.Category_Name
HAVING TotalSales > 25000;

-- 5) Retrieve all customers and their orders, including those who haven't placed any orders.
SELECT Customer.Customer_ID, Customer.First_Name, Customer.Last_Name, COUNT(Orders.Order_ID) AS TotalOrders
FROM Customer
LEFT JOIN Orders ON Customer.Customer_ID = Orders.Customer_ID
GROUP BY Customer.Customer_ID, Customer.First_Name, Customer.Last_Name;
