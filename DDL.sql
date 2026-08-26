/*Challenge 1 — Create Database
Create a database named SocialMediaDB*/

CREATE DATABASE SocialMediaDB;

##Challenge 2 — Create Table
USE SocialMediaDB;
CREATE TABLE users(user_id INT PRIMARY KEY,
username VARCHAR(50),
full_name VARCHAR(100),
email VARCHAR(100),
created_at DATETIME);

/*Challenge 3 — Alter Table
Add column bio (VARCHAR 255) to users.*/
ALTER TABLE users ADD COLUMN bio VARCHAR(255);

SELECT * FROM users;

/*Challenge 4 — Rename & Drop
Rename table users → app_users, then rename it back.*/

RENAME TABLE USERS TO App_users;
SELECT * FROM App_users;
RENAME TABLE App_users TO Users;

##Drop a table named temp_table if it exists.
DROP TABLE temp_table;








