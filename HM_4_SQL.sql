USE semimar_4;

-- Подсчитать общее количество лайков, которые получили пользователиm младше 12 лет

SELECT COUNT(*) AS total_likes
FROM likes
WHERE user_id IN(
	SELECT profiles.user_id
	FROM profiles
	WHERE TIMESTAMPDIFF(YEAR, profiles.birthday, curdate()) < 12);

SELECT COUNT(*) AS total_likes
FROM likes
JOIN profiles ON profiles.user_id = likes.user_id
WHERE TIMESTAMPDIFF(YEAR, profiles.birthday, curdate()) < 12;

-- Определить кто больше поставил лайков (всего): мужчины или женщины

SELECT profiles.gender, COUNT(*)
FROM likes
JOIN profiles ON profiles.user_id = likes.user_id
GROUP BY profiles.gender;

-- Вывести всех пользователей, которые не отправляли сообщения

SELECT *
FROM users
WHERE id NOT IN(SELECT DISTINCT from_user_id FROM messages);

-- 4. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал
ему сообщений.

SELECT  
	CONCAT(firstname, ' ', lastname) AS users_name, 
    COUNT(from_user_id) AS total_messages
FROM messages
JOIN users ON users.id = messages.from_user_id
WHERE to_user_id = 1
	AND from_user_id IN (SELECT -- выведим id друзей пользователя с id 1
							CONCAT(IF(initiator_user_id = 1, '', initiator_user_id), 
								   IF(target_user_id = 1, '', target_user_id))
						FROM friend_requests
						WHERE updated_at IS NOT NULL
							AND status = 'approved'
							AND (initiator_user_id = 1 OR target_user_id = 1))
GROUP BY from_user_id
ORDER BY 2 DESC
LIMIT 1;
