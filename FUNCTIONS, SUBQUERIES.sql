USE SocialMediaDB;
/*Challenge 1 — User Defined Function
Create a function:
GetUserEngagement(user_id)
Returns total likes + comments made by the user.*/
DELIMITER $$

CREATE FUNCTION GetUserEngagement(p_user_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_engagement INT;
  SELECT 
        (SELECT COUNT(*) FROM likes
         WHERE likes.user_id = p_user_id)
        +
        (SELECT COUNT(*) FROM comments
         WHERE comments.user_id = p_user_id)
    INTO total_engagement;

    RETURN total_engagement;
END $$

DELIMITER ;

SELECT GetUserEngagement(1) AS Total_Engagement;

/*Challenge 2 — Subquery
Find users who have more followers than the average follower count.*/

SELECT 
    u.user_id,
    u.username,
    COUNT(f.follower_id) AS follower_count
FROM users u
LEFT JOIN followers f
    ON u.user_id = f.user_id
GROUP BY u.user_id, u.username
HAVING COUNT(f.follower_id) > (
    SELECT AVG(follower_count)
    FROM (
        SELECT COUNT(*) AS follower_count
        FROM followers
        GROUP BY user_id
    ) AS follower_counts
);





