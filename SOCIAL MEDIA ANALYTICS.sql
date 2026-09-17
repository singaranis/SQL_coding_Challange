USE SocialMediaDB;
/* FINAL PROJECT: SOCIAL MEDIA ANALYTICS
Complete end-to-end analysis:
Final Challenges
1. Top influencers (users with highest total engagement)*/

SELECT u.username,
       COUNT(l.like_id) + COUNT(c.comment_id) AS engagement
FROM users u
JOIN post p ON u.user_id = p.user_id
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY u.user_id, u.username
ORDER BY engagement DESC
LIMIT 10;

##2. Virality report (posts with unusually high engagement)
SELECT p.post_id, p.Caption,
       COUNT(l.like_id) + COUNT(c.comment_id) AS engagement
FROM post p
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id, p.Caption
ORDER BY engagement DESC
LIMIT 10;

##3. User activity timeline (daily/weekly posting patterns)

SELECT DATE(Posted_at) AS post_date,
       COUNT(*) AS total_posts
FROM post
GROUP BY DATE(Posted_at)
ORDER BY post_date;

##4. Follower growth (who gained the most followers recently)
DESC followers;


SELECT u.username,
       COUNT(f.follower_id) AS total_followers
FROM users u
LEFT JOIN followers f
ON u.user_id = f.user_id
GROUP BY u.user_id, u.username
ORDER BY total_followers DESC
LIMIT 10;

