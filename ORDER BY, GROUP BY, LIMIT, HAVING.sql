USE SocialMediaDB;
/*Challenge 1 — Top Active Users
Sort users by number of posts (DESC) and LIMIT 5.*/
SELECT user_id ,
       COUNT(Post_id) AS Number_of_Post
FROM Post
GROUP BY user_id
ORDER BY Number_of_Post DESC
LIMIT 5;

/*Challenge 2 — Group by Posts Per Day
Group posts by DATE(posted_at) and return: date, total posts
Only show days with more than 1 posts (HAVING).*/
SELECT * FROM Post;

SELECT 
		DATE(Posted_at) AS Date,
		COUNT(Post_id) AS Total_Post
FROM Post
GROUP BY DATE(Posted_at)
HAVING Total_Post >= 1;