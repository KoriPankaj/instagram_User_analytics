use ig_clone;
SELECT * FROM users;
# SELECT id , username, created_at FROM users ORDER BY created_at ASC LIMIT 5;
SELECT users.id, users.username FROM users LEFT JOIN photos ON users.id = photos.user_id;
SELECT users.id, users.username FROM users LEFT JOIN photos ON users.id = photos.user_id where photos.id is NULL;

SELECT user_id, photo_id, COUNT(*) AS like_count FROM likes GROUP BY user_id, photo_id ORDER BY like_count DESC
LIMIT 10;
# Find photo which got max likes
SELECT photo_id, COUNT(*) AS like_count FROM likes GROUP BY  photo_id ORDER BY like_count DESC LIMIT 1;

SELECT photo_id FROM likes GROUP BY photo_id 
ORDER BY COUNT(*) DESC LIMIT 1;

SELECT * FROM users JOIN photos ON users.id = photos.user_id 
WHERE photos.id = (SELECT photo_id FROM likes GROUP BY photo_id 
ORDER BY COUNT(*) DESC LIMIT 1);

SELECT * FROM users WHERE id = (SELECT user_id from photos WHERE photos.id = (SELECT photo_id FROM likes 
GROUP BY photo_id ORDER BY COUNT(*) DESC LIMIT 1));

SELECT tag_name FROM tags WHERE id = (SELECT tag_id FROM photo_tags GROUP BY tag_id ORDER BY COUNT(*) DESC LIMIT 1);

SELECT tag_name, tag_id, COUNT(*) AS tag_count FROM tags JOIN photo_tags ON tags.id = photo_tags.tag_id 
GROUP BY tag_id ORDER BY tag_count DESC LIMIT 5;

SELECT DAYNAME(created_at) AS registration_day, COUNT(*) AS user_count FROM users
GROUP BY registration_day ORDER BY user_count DESC;

SELECT * FROM photos;
SELECT DISTINCT(user_id) FROM photos;
SELECT COUNT(DISTINCT(user_id)) FROM photos; # 74 user posted some post
SELECT COUNT(*) FROM photos; # 257 total post in instagram
SELECT COUNT(*) / COUNT(DISTINCT(user_id)) AS avg_post_per_user FROM photos;

SELECT (SELECT COUNT(*) AS total_post FROM photos), (SELECT COUNT(*) AS total_user FROM users) ;
(total_post / total_user) AS post_per_user;


SELECT
    (SELECT COUNT(*) FROM photos) AS total_photos,
    (SELECT COUNT(*) FROM users) AS total_users,
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS photos_per_user;



