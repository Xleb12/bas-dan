CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE NOT NULL,
    recommended_by INT,
    FOREIGN KEY (recommended_by) REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price_per_unit DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers (customer_id, full_name, email, registration_date, recommended_by) VALUES
(1, 'Иван Иванов', 'ivan.ivanov@example.com', '2023-01-15', NULL),
(2, 'Мария Петрова', 'maria.petrova@example.com', '2023-02-20', 1),
(3, 'Алексей Смирнов', 'alex.smirnov@example.com', '2023-03-10', 1),
(4, 'Елена Васильева', 'elena.v@example.com', '2023-04-01', 2),
(5, 'Андрей Николаев', 'andrey.n@example.com', '2023-05-01', NULL);

INSERT INTO Products (product_name, category, price) VALUES
('Смартфон', 'Электроника', 70000.00),
('Ноутбук', 'Электроника', 120000.00),
('Кофемашина', 'Бытовая техника', 25000.00),
('Книга "Основы SQL"', 'Книги', 1500.00),
('Фен', 'Бытовая техника', 4500.00),
('Пылесос', 'Бытовая техника', 15000.00);

INSERT INTO Orders (customer_id, order_date, status) VALUES
(1, '2024-05-10', 'Доставлен'),
(2, '2024-05-12', 'В обработке'),
(1, '2024-05-15', 'Отправлен'),
(3, '2024-05-16', 'Доставлен');

INSERT INTO Order_Items (order_id, product_id, quantity, price_per_unit) VALUES
(1, 1, 1, 70000.00),  -- Иван купил Смартфон
(1, 4, 2, 1400.00),   -- и 2 книги
(2, 2, 1, 120000.00), -- Мария купила Ноутбук
(3, 3, 1, 25000.00),  -- Иван купил Кофемашину
(4, 1, 1, 70000.00),  -- Алексей купил Смартфон
(4, 5, 1, 4500.00);   -- и Фен
--лаб 8
--1
SELECT
    c.full_name,
    o.order_date
FROM customers c
JOIN Orders o on c.customer_id = o.customer_id;
--2
SELECT
    c.full_name,
    o.order_date
FROM Customers c
LEFT JOIN Orders o on c.customer_id = o.customer_id WHERE o.order_id is NULL;
--3
SELECT
     p.product_name,
     oi.quantity,
     oi.price_per_unit
FROM Orders o
JOIN Order_Items oi on o.order_id = oi.order_id
JOIN Products p  on p.product_id = oi.product_id
where o.order_id = 1;
--4
SELECT full_name
FROM Customers c
WHERE c.customer_id in(
    SELECT o.customer_id
    FROM Orders o, Order_Items oi
    WHERE o.order_id = oi.order_id and oi.product_id=1 and c.customer_id=o.customer_id);
SELECT full_name
FROM Customers c
WHERE c.customer_id in(
    select o.customer_id
    from Orders o
    WHERE o.order_id in(
        select oi.order_id
        from Order_Items oi
        WHERE oi.product_id=1));
--5
select product_name, price
from Products
where price > (SELECT AVG(price) FROM Products);
--6
SELECT order_id, order_date
FROM Orders o
where EXISTS(
    select oi.price_per_unit
    from Order_Items oi
    WHERE o.order_id=oi.order_id and oi.price_per_unit>100000
) ;
--7
SELECT
    c.full_name
FROM Customers c
LEFT JOIN Orders o on c.customer_id = o.customer_id
JOIN Order_Items oi on o.order_id=oi.order_id where product_id !=2;
SELECT full_name
FROM Customers c
WHERE c.customer_id not in(
    SELECT o.customer_id
    FROM Orders o, Order_Items oi
    WHERE o.order_id = oi.order_id and oi.product_id=2 and c.customer_id=o.customer_id);
--8
SELECT p.product_name, oi.product_id
from Products p
RIGHT JOIN Order_Items oi on p.product_id=oi.product_id;
--9
SELECT
c.full_name,
p.product_name,
oi.quantity
FROM Customers c
FULL OUTER JOIN Orders o ON c.customer_id = o.customer_id
FULL OUTER JOIN Order_Items oi ON o.order_id = oi.order_id
FULL OUTER JOIN Products p ON oi.product_id = p.product_id;
--10
SELECT full_name
FROM Customers c
WHERE c.customer_id in(
    select o.customer_id
    from Orders o
    WHERE o.order_id in(
        select oi.order_id
        from Order_Items oi
        WHERE oi.product_id=2));
--11
SELECT c.full_name, p.category
FROM Customers c
CROSS JOIN Products p;
--12
SELECT
r.full_name AS recommended_by,
c.full_name as new_customer
from Customers c
JOIN Customers r ON c.recommended_by=r.customer_id;

--лаб 9
--1
SELECT
    category,
    COUNT(product_id) AS products_in_category
FROM Products
GROUP BY category;
--2

--3

--4

--5

--6

--7

--8
