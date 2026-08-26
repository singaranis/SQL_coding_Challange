USE SocialMediaDB;
/*Challenge 1 — Filter Users
Retrieve all users whose username starts with “a”.*/

SELECT * FROM users WHERE username LIKE "a%";

/*Challenge 2 — Posts Filter
Get posts posted BETWEEN '2024-01-01' AND '2024-12-31'.*/
SELECT * FROM Post WHERE Posted_at BETWEEN '2024-01-01' AND '2024-12-31';

/*Challenge 3 — NULL checks
Find posts that have NULL captions.*/
UPDATE Post SET Caption = NULL WHERE post_id = 3;

SELECT * FROM Post WHERE Caption IS NULL;

/*Challenge 4 — IN Clause
Find users whose email domain is in:(@gmail.com, @hotmail.com, @yahoo.com)*/

SELECT * FROM Users
WHERE email LIKE '%@gmail.com'
   OR email LIKE '%@hotmail.com'
   OR email LIKE '%@yahoo.com';
