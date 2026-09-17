Use Socialmediadb;
/*DCL, TCL, Text-to-SQL
Challenge 3 — Text-to-SQL
Convert English to SQL:
“Show the top 10 users who received the highest total likes on their posts this year.”*/

SELECT
    u.user_id,
    u.username,
    COUNT(l.like_id) AS total_likes
FROM users u
INNER JOIN post p
    ON u.user_id = p.user_id
LEFT JOIN likes l
    ON p.post_id = l.post_id
WHERE YEAR(p.Posted_at) = 2024
GROUP BY
    u.user_id,
    u.username
ORDER BY total_likes DESC
LIMIT 10;

/*DESC post;
SHOW COLUMNS FROM post;

SELECT post_id, Caption, Posted_at, user_id
FROM post;

SELECT 
    YEAR(Posted_at) AS post_year,
    COUNT(*) AS post_count
FROM post
GROUP BY YEAR(Posted_at)
ORDER BY post_year;

SELECT 
    p.post_id,
    p.user_id,
    COUNT(l.like_id) AS total_likes
FROM post p
LEFT JOIN likes l
    ON p.post_id = l.post_id
GROUP BY p.post_id, p.user_id;*/