/*
Базы данных и SQL (семинары)
Урок 2. SQL – создание объектов, простые запросы выборки
1 Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
2 Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
3 Создайте таблицу “orders”, заполните ее значениями.
4 Покажите “полный” статус заказа, используя оператор CASE
5 Чем NULL отличается от 0?
*/

USE hw_02;

-- 1

DROP TABLE sales;

CREATE TABLE sales(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    bucket INT NOT NULL
);

INSERT INTO sales(order_date, bucket) VALUES
('2023-05-31', 290),
('2023-05-30', 240),
('2023-05-28', 40),
('2023-05-27', 160),
('2023-05-26', 370);
('2023-05-25', 170);

SELECT * FROM sales;

-- 2

ALTER TABLE sales ADD orders VARCHAR(45);

UPDATE sales SET orders=
CASE
	WHEN bucket > 300 THEN 'Большой заказ'
	WHEN bucket > 99 THEN 'Средний заказ'
	ELSE 'Маленький заказ'
END;

SELECT * FROM sales WHERE orders = "Большой заказ";
SELECT * FROM sales WHERE orders = "Средний заказ";
SELECT * FROM sales WHERE orders = "Маленький заказ";

-- 3

DROP TABLE orders;

CREATE TABLE orders
(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    employeeid VARCHAR(30) NOT NULL,
    amount DECIMAL(8,2) DEFAULT(0.00),
    order_status VARCHAR(45) NOT NULL
);

INSERT INTO orders (employeeid, amount, order_status) VALUES
("E03",50.65,"OPEN"),
("E02",33.34,"OPEN"),
("E03",7.90,"CLOSED"),
("E03",58.30,"CLOSED"),
("E03",15.02,"CANCELLED"),
("E05",28.46,"CLOSED"),
("E04",23.70,"OPEN"),
("E02",84.01,"OPEN"),
("E06",29.08,"OPEN"),
("E07",23.53,"OPEN"),
("E03",58.08,"CLOSED"),
("E03",58.88,"OPEN"),
("E02",14.36,"CLOSED"),
("E06",93.59,"CLOSED"),
("E05",59.20,"CANCELLED"),
("E03",8.40,"CLOSED"),
("E04",94.67,"CLOSED"),
("E05",79.53,"CANCELLED"),
("E06",65.51,"CLOSED"),
("E03",83.78,"CLOSED");

SELECT * FROM orders;

--4

SELECT order_id, order_status,
CASE
	WHEN order_status = 'OPEN' THEN 'Order is in open state.'
	WHEN order_status = 'CLOSED' THEN 'Order is closed.'
    ELSE 'Order is cancelled'
END AS order_summary
FROM orders;

--5

/*
0 - это значение, константа
null - отсутствие значения, пустое место
*/
