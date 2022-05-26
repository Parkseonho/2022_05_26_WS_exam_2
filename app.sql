DROP DATABASE IF EXISTS WS2;
CREATE DATABASE WS2;
USE WS2;

SHOW DATABASES;

DROP TABLE IF EXISTS w_saying;

#번호, 날짜, 내용, 작가, 조회수, 좋아요, 싫어요
CREATE TABLE w_saying(
 id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
 s_date DATETIME NOT NULL,
 content TEXT NOT NULL, 
 s_name VARCHAR(200) NOT NULL, 
 hit INT UNSIGNED NOT NULL, 
 s_good INT UNSIGNED NOT NULL, 
 s_hate INT UNSIGNED NOT NULL
 
);

SELECT*
FROM w_saying;

INSERT INTO w_saying
SET s_date = NOW(),
content = "Without continuous personal development, you are now all that you will ever become and hell starts when the person you are meets the person you could have been",
s_name = "Eli cohen";

SELECT*
FROM w_saying;

INSERT INTO w_saying
SET s_date = NOW(),
content = "Working hard for something we don't care about is called stressed, working hard for something we love is called passion.",
s_name = "Simon Sinek";

SELECT*
FROM w_saying;

INSERT INTO w_saying
SET s_date = NOW(),
content = "Move out of your comfort zone. You can only grow if you are willing to feel awkward and uncomfortable when you try something new",
s_name = "Brian Tracy";

SELECT*
FROM w_saying;
INSERT INTO w_saying
SET s_date = NOW(),
content = "Don't let the fear of losing be greater than the excitement of winning.",
s_name = "Robert Kiyosaki";

SELECT*
FROM w_saying;

INSERT INTO w_saying
SET s_date = NOW(),
content = "Develop success from failures. Discouragement and failure are two of the surest stepping stones to success",
s_name = "Dale Carnegie";

SELECT*
FROM w_saying;


INSERT INTO w_saying
SET s_date = NOW(),
content = "Action is the foundational key to all success",
s_name = "Pablo Picasso";

SELECT*
FROM w_saying;
INSERT INTO w_saying
SET s_date = NOW(),
content = "The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack of will.",
s_name = "Vince Lombardi";

SELECT*
FROM w_saying;
INSERT INTO w_saying
SET s_date = NOW(),
content = "It is your determination and persistence that will make you a successful person.",
s_name = "Kenneth J Hutchins";

SELECT*
FROM w_saying;
INSERT INTO w_saying
SET s_date = NOW(),
content = "You can waste your life drawing lines. Or you can live your life crossing them.",
s_name = "Shonda Rhimes";

SELECT*
FROM w_saying;
INSERT INTO w_saying
SET s_date = NOW(),
content = "Be poor, humble and driven. Don't be afraid to shift or pivot.",
s_name = "Alex Rodriguez";

SELECT*
FROM w_saying;

INSERT INTO w_saying
SET s_date = NOW(),
content = "Without continuous personal development, you are now all that you will ever become and hell starts when the person you are meets the person you could have been",
s_name = "Eli cohen";

SELECT*
FROM w_saying;
