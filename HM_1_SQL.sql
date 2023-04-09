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

INSERT INTO mobile_phones VALUES
	(NULL, 'iPhone X', 'Apple', 3, 76000),
    (NULL,'iPhone 8', 'Apple', 2, 51000),
    (NULL,'Galaxy S9', 'Samsung', 2, 56000),
    (NULL,'Galaxy S8', 'Samsung', 1, 41000),
    (NULL,'P20 Pro', 'Huawei', 5, 36000);

SELECT product_name, manufacturer, price
FROM mobilephones.mobile_phones
WHERE product_count > 2;

SELECT * FROM mobilephones.mobile_phones
WHERE manufacturer = 'Samsung';

SELECT * FROM mobilephones.mobile_phones
WHERE product_name like 'Iphone%';

SELECT * FROM mobilephones.mobile_phones
WHERE manufacturer like '%Samsung%';

SELECT * FROM mobilephones.mobile_phones
WHERE product_name RLIKE '[0-9]';

SELECT * FROM mobilephones.mobile_phones
WHERE product_name like '%8%';