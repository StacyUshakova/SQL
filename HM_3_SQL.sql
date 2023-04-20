SELECT * FROM staffdb.staff;

USE staffdb;

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания

-- по возрастанию
SELECT *
FROM staff
ORDER BY salary;

-- по убыванию
SELECT *
FROM staff
ORDER BY salary DESC;

-- 2. Выведите 5 максимальных заработных плат (saraly)

SELECT *
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT post, SUM(salary)
FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post) « Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT COUNT(*) 
FROM staff
WHERE post = 'Рабочий' AND age BETWEEN 24 AND 49;

-- 5. Найдите количество специальностей

SELECT COUNT(DISTINCT post) AS spesialities
FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет (будет выведена пустая таблица)

SELECT post, AVG(age) AS average_age
FROM staff
GROUP BY post
HAVING average_age < 30;

-- если рассмотреть средний возраст сотрудников больше 30 лет

SELECT post, AVG(age) AS average_age
FROM staff
GROUP BY post
HAVING average_age > 30;