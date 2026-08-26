USE SocialMediaDB;

#3Challenge 1 — Create Comments Table

CREATE TABLE comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    comment_text TEXT,
    commented_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (post_id) REFERENCES Post(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO comments (post_id, user_id, comment_text, commented_at)
VALUES
(1, 2, 'Great post!', '2024-01-10 10:35:00'),
(1, 3, 'Very interesting!', '2024-01-10 11:20:00'),
(2, 1, 'Nice information.', '2024-02-05 10:00:00'),
(3, 4, 'Thanks for sharing!', '2024-03-12 14:30:00'),
(4, 5, 'Good work!', '2024-04-18 16:20:00');

SELECT * FROM comments;

##Challenge 2 — Create likes Table

CREATE TABLE likes (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    liked_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (post_id) REFERENCES Post(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO likes (post_id, user_id, liked_at)
VALUES
(1, 2, '2024-01-10 10:30:00'),
(1, 3, '2024-01-10 11:15:00'),
(2, 1, '2024-02-05 09:45:00'),
(3, 4, '2024-03-12 14:20:00'),
(4, 5, '2024-04-18 16:10:00');

SELECT * FROM likes;

/*Challenge 2 — JOIN Report
Display:post_id, username, caption, total likes, total comments.*/
SELECT 
    p.post_id,
    u.username,
    p.Caption,
    COUNT(DISTINCT l.like_id) AS total_likes,
    COUNT(DISTINCT c.comment_id) AS total_comments
FROM Post p
JOIN Users u
    ON p.user_id = u.user_id
LEFT JOIN likes l
    ON p.post_id = l.post_id
LEFT JOIN comments c
    ON p.post_id = c.post_id
GROUP BY 
    p.post_id,
    u.username,
    p.Caption;

/*Challenge 3 — Built-in Functions
· Show usernames in UPPER case.
· Extract month name from posted_at.
· Return the length of each caption.*/

SELECT 
    UPPER(u.username) AS Username,
    MONTHNAME(p.Posted_at) AS Month_Name,
    LENGTH(p.Caption) AS Caption_Length
FROM Users u
JOIN Post p
    ON u.user_id = p.user_id;
    
/*Challenge 4 — UNION
Combine list of users who commented OR liked.*/
SELECT user_id
FROM comments
UNION
SELECT user_id
FROM likes;
