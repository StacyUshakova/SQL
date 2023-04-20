-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными

CREATE DATABASE salesdb;
USE salesdb;

CREATE TABLE sales 
	(
		id INT AUTO_INCREMENT PRIMARY KEY,
		order_date DATE,
		count_product int
	);
    
INSERT INTO sales (order_date, count_product)
VALUES
	('2022-01-01', 156),
	('2022-01-02', 180),
	('2022-01-03', 21),
	('2022-01-04', 124),
	('2022-01-05', 341);
    
-- Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
-- меньше 100 - Маленький заказ
-- от 100 до 300 - Средний заказ
-- больше 300 - Большой заказ

-- Вариант с CASE

SELECT id, count_product,
CASE 
	WHEN count_product BETWEEN 100 AND 300
		THEN 'Средний заказ'
	WHEN count_product > 300
		THEN 'Большой заказ'
	WHEN count_product < 100
		THEN 'Маленький заказ'
	ELSE 'Не определено'
END AS order_count
FROM sales;

-- Вариант с IF 

SELECT id, count_product,
IF (count_product BETWEEN 100 AND 300, 'Средний заказ',
	IF (count_product > 300, 'Большой заказ',
		IF (count_product < 100, 'Маленький заказ', 'Не определено')
        )
	) AS order_count
FROM sales;

-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
-- Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
-- OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»

CREATE TABLE orders
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id VARCHAR(10) NOT NULL,
    amount DECIMAL(5,2) NOT NULL,
    order_status VARCHAR(50) NOT NULL
);


INSERT INTO orders (employee_id, amount, order_status)
VALUES
	('e03', 15.00, 'OPEN'),
	('e01', 25.50, 'OPEN'),
	('e05', 100.70, 'CLOSED'),
	('e02', 22.18, 'OPEN'),
	('e04', 9.50, 'CANCELLED');

-- Вариант с CASE

SELECT id, employee_id, amount,
CASE
	WHEN order_status = 'OPEN'
		THEN 'Order is in open state'
	WHEN order_status = 'CLOSED'
		THEN  'Order is closed'
	WHEN order_status = 'CANCELLED'
		THEN 'Order is cancelled'
	ELSE 'Not defined'
END AS full_order_status
FROM orders;

-- Вариант с IF

SELECT id, employee_id, amount,
IF (order_status = 'OPEN', 'Order is in open state',
	IF (order_status = 'CLOSED', 'Order is closed',
		IF (order_status = 'CANCELLED', 'Order is cancelled', 'Not defined')
        )
	) AS full_order_status
FROM orders;
    
-- Чем NULL отличается от 0?
-- 0 - это значение. Это уникальная известная величина ноль, которая имеет значение в арифметике и другой математике.
-- "Null" - это поле без значения. Если поле в таблице является необязательным, то можно вставить новую запись или обновить
-- запись без добавления значения в это поле.
