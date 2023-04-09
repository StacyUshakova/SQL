-- 1. Создайте таблицу с мобильными телефонами (mobile_phones), используя графический интерфейс. 

CREATE DATABASE mobilephones;

USE mobilephones;

CREATE table mobile_phones
(
    id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(50),
    product_count INT(10),
    price INT(10)
);

-- Заполните БД данными

INSERT INTO mobile_phones VALUES
	(NULL, 'iPhone X', 'Apple', 3, 76000),
    (NULL,'iPhone 8', 'Apple', 2, 51000),
    (NULL,'Galaxy S9', 'Samsung', 2, 56000),
    (NULL,'Galaxy S8', 'Samsung', 1, 41000),
    (NULL,'P20 Pro', 'Huawei', 5, 36000);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT product_name, manufacturer, price
FROM mobilephones.mobile_phones
WHERE product_count > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT * FROM mobilephones.mobile_phones
WHERE manufacturer = 'Samsung';

-- 4. (по желанию)* С помощью регулярных выражений найти:
-- 4.1. Товары, в которых есть упоминание "Iphone"

SELECT * FROM mobilephones.mobile_phones
WHERE product_name like 'Iphone%';

-- 4.2. Товары, в которых есть упоминание "Samsung"

SELECT * FROM mobilephones.mobile_phones
WHERE manufacturer like '%Samsung%';

-- 4.3.  Товары, в которых есть ЦИФРЫ

SELECT * FROM mobilephones.mobile_phones
WHERE product_name RLIKE '[0-9]';

-- 4.4.  Товары, в которых есть ЦИФРА "8"  

SELECT * FROM mobilephones.mobile_phones
WHERE product_name like '%8%';
