USE SocialMediaDB;
/*Challenge 1 — Posts Table with Constraints
Create a posts table:*/

CREATE TABLE Post(
post_id INT PRIMARY KEY  AUTO_INCREMENT,
user_id INT, 
Caption TEXT,
Posted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id)REFERENCES Users(user_id));

/*Challenge 2 – Followers Table
Create a followers table:*/
CREATE TABLE Followers(
follower_id INT PRIMARY KEY,
user_id INT,
follow_date DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id)REFERENCES Users(user_id));

/*Challenge 3 – Insert Sample Data
Insert 5 users and 5 posts.*/
INSERT INTO users(user_id,username,full_name ,email,created_at )
VALUES
(1, 'arun01', 'Arun Kumar', 'arun@gmail.com', '2026-08-01'),
(2, 'priya02', 'Priya Sharma', 'priya@gmail.com', '2026-08-02'),
(3, 'rahul03', 'Rahul Raj', 'rahul@gmail.com', '2026-08-03'),
(4, 'anu04', 'Anu Priya', 'anu@gmail.com', '2026-08-04'),
(5, 'karthik05', 'Karthik S', 'karthik@gmail.com', '2026-08-05');

INSERT INTO Post (user_id, Caption,Posted_at)
VALUES
(1, 'My first post!','2024-03-01'),
(2, 'Learning SQL today.','2024-05-11'),
(3, 'Working on a data analytics project.','2024-07-29'),
(4, 'SQL joins are interesting!','2024-10-18'),
(5, 'Building my data analytics skills.','2024-11-12');

/*Challenge 4 – Update/Delete
· Update a user’s bio.*/


UPDATE users SET bio = 'Aspiring Data Analyst' WHERE user_id=1;
UPDATE users SET bio = 'Aspiring Data Scientist' WHERE user_id=2;
UPDATE users SET bio = 'Aspiring Data Analyst'  WHERE user_id=3;
UPDATE users SET bio = 'Aspiring Data Scientis' WHERE user_id=4;
UPDATE users SET bio = 'Aspiring Data Analyst' WHERE user_id=5;

##· Delete a post by ID.
DELETE FROM Post WHERE post_id = 5;
SELECT * FROM Post;
 
## Explain DELETE vs TRUNCATE vs DROP for the posts table.
TRUNCATE TABLE Post;

DROP TABLE Post;

 

