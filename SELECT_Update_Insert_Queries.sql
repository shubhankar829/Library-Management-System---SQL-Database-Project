-- SQL SELECT Queries Assignment

create database Assignment_4;
use Assignment_4;

CREATE TABLE students (
    studentId INT PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50),
    birthdate DATE,
    gender CHAR(1),
    class VARCHAR(10),
    point INT
);

CREATE TABLE authors (
    authorId INT PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50)
);

CREATE TABLE types (
    typeId INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE books (
    bookId INT PRIMARY KEY,
    name VARCHAR(100),
    pagecount INT,
    point INT,
    authorId INT,
    typeId INT,
    FOREIGN KEY (authorId) REFERENCES authors(authorId),
    FOREIGN KEY (typeId) REFERENCES types(typeId)
);

CREATE TABLE borrows (
    borrowId INT PRIMARY KEY,
    studentId INT,
    bookId INT,
    takenDate DATE,
    broughtDate DATE,
    FOREIGN KEY (studentId) REFERENCES students(studentId),
    FOREIGN KEY (bookId) REFERENCES books(bookId)
);

-- Insert data into students
INSERT INTO students (studentId, name, surname, birthdate, gender, class, point) VALUES
(1, 'Alice', 'Johnson', '2005-06-15', 'F', '10A', 85),
(2, 'Bob', 'Smith', '2006-09-23', 'M', '10A', 90),
(3, 'Charlie', 'Brown', '2005-08-10', 'M', '10B', 78),
(4, 'Diana', 'Carter', '2004-03-05', 'F', '11A', 88);

-- Insert data into authors
INSERT INTO authors (authorId, name, surname) VALUES
(1, 'Jane', 'Austen'),
(2, 'Mark', 'Twain'),
(3, 'Charles', 'Dickens'),
(4, 'Leo', 'Tolstoy');


-- Insert data into types
INSERT INTO types (typeId, name) VALUES
(1, 'Fiction'),
(2, 'Science Fiction'),
(3, 'Romance'),
(4, 'Mystery'),
(5, 'Biography');

-- Insert data into books
INSERT INTO books (bookId, name, pagecount, point, authorId, typeId) VALUES
(1, 'Pride and Prejudice', 279, 5, 1, 3),
(2, 'Adventures of Huckleberry Finn', 366, 4, 2, 1),
(3, 'A Tale of Two Cities', 489, 5, 3, 1),
(4, 'War and Peace', 1225, 5, 4, 1);


-- Insert data into borrows
INSERT INTO borrows (borrowId, studentId, bookId, takenDate, broughtDate) VALUES
(1, 1, 1, '2024-01-10', '2024-01-20'),
(2, 2, 2, '2024-01-15', '2024-01-25'),
(3, 3, 3, '2024-01-20', '2024-01-30'),
(4, 4, 4, '2024-02-01', '2024-02-11');

select * from students;
select * from authors;
select * from types;
select * from borrows;
select * from books;

-- Example 1: List all the records in the student chart
select * from students;

-- Example 2: List the name surname and class of the student in the student table
select name, surname, class from students;

-- Example 3: List the gender Female (F) records in the student table
select * from students where gender = 'F';

-- Example 4 : List the names of each class in the way of being seen once in the student table
select distinct class from students;

-- Example 5: List the students with Female gender and the class 10Math in the student table
SELECT * FROM students WHERE gender = 'F' AND class = '10Math';

-- Example 6: List the names, surnames and classes of the students in the class 10Math or 10Sci in the student table
SELECT name, surname, class FROM students where class IN ( '10Math', '10Sci');

--Example 7: List the students name surname and school number in the student table
--As there are no school number present in the table hence considering student id as school number
select name, surname, studentid as School_Number from students;

--Example 8: List the students name and surname by combining them as name surname in the student table
select concat(name, ' ', surname) as Student_Name from students;
 
-- Example 9: List the students with the names starting with “A” letter in the student table 
select * from students where name like 'a%'

--Example 10: List the book names and pages count with number of pages between 50 and 200 in the book table
insert into books values (5,'Think before you speak',187,8,3,2);
select name as bookname, pagecount from books where pagecount between '50' and '200'

--Example 11: List the students with names Emma Sophia and Robert in the student table
SELECT * FROM students WHERE name IN ('Emma', 'Sophia', 'Robert');

-- Example 12: List the students with names starting with A D and K in the student table
select name from students 
where 
name like 'a%' 
OR
name like 'd%'
OR
name like 'k%';

--Example 13: List the names surnames classes and genders of males in 9Math or females in 9His in the student table
SELECT name, surname, class, gender FROM students 
WHERE (gender = 'M' AND class = '9Math') OR (gender = 'F' AND class = '9His');


--Example 14: List the males whose classes are 10Math or 10Bio
SELECT * FROM students WHERE gender = 'M' AND class IN ('10Math', '10Bio');

--Example 15: List the students with birth year 1989 in the student table
select * from students where year(birthdate) = '1989';

--Example 16: List the female students with student numbers between 30 and 50
SELECT * FROM students WHERE gender = 'F' AND studentId BETWEEN 30 AND 50;

--Example 17: List the students according to their names
SELECT * FROM students ORDER BY name;

--Example 18: List the students by names for those with same names. List them by their surnames
select * from students ORDER BY name, surname;

--Example 19: List the students in 10Math by decreasing school numbers
SELECT * FROM students WHERE class = '10Math' ORDER BY studentId DESC;

--Example 20: List the first 10 records in the student chart
select top 10 * from students;
--SELECT * FROM students LIMIT 10;

--Example 21: List the first 10 records name surname and date of birth information in the student table
select top 10 name,surname, birthdate from students;

--Example 22: List the book with the most page number
select * from books where pagecount IN (select max(pagecount) from books);
SELECT top 1 * FROM books ORDER BY pagecount DESC ;

--Example 23: List the youngest student in the student table
SELECT top 1 * FROM students ORDER BY birthdate DESC;
select * from students where birthdate IN ( select max(birthdate) from students);

--Example 24: List the oldest student in the 10Math class
select top 1 * from students where class = '10Math' order by birthdate asc;

--Example 26: List the students by grouping according to their classes
select class,name from students group by class ,name;
SELECT class, COUNT(*) AS student_count FROM students GROUP BY class;

--Example 27: List the students to be different in each questioning randomly
SELECT * FROM students ORDER BY NEWID();

--Example 28: Pick a random student from student table
SELECT top 1 * FROM students ORDER BY NEWID()

--Example 29: Bring some random student’s name , surname and number from class 10Math
select name, surname, studentid as number from students where class = '10Math' order by NEWID();

--Example 30: Add the writer named Smith Allen to the authors table
insert into authors values ('5','smith','allen');

--Example 31: Add the genre of biography to the genre table
INSERT INTO types (typeId, name) VALUES ('6','Biography');

--Example 32: Add 10Math Class male named Thomas Nelson , 9Bio class female named Sally Allen and 11His Class female named Linda Sandra in one question
INSERT INTO students (studentid,name, surname, gender, class) VALUES 
(11,'Thomas', 'Nelson', 'M', '10Math'), 
(12,'Sally', 'Allen', 'F', '9Bio'), 
(13,'Linda', 'Sandra', 'F', '11His');

-- select * from students

--Example 33: Add a random student in the students chart to the writers chart as an authors
INSERT INTO authors (authorId, name, surname) 
SELECT top 1 studentId, name, surname FROM students ORDER BY NEWID();

--Example 34: Add students with student numbers between 10 and 30 as authors
INSERT INTO authors (authorId ,name, surname)
SELECT studentid, name, surname FROM students WHERE studentId BETWEEN 10 AND 30;

select * from authors

--Example 35: Add the writer named Cindy Brown and make him write his writer number (Note: The last increased rate in automatic enhancing is hold in @@IDENTITY factor)

--Example 36: Change the class of the student whose school number is 3 from 10Bio to 10His
UPDATE students SET class = '10His' WHERE studentId = 3;

--Example 37: Transfer all the students in 9Math Class to 10Math Class 
update students set class='10Math' where class='9Math'

--Example 38: Increase all of the students’ score by 5 points
UPDATE students SET point = point + 5;

--NOTE 1: The most important thing in delete interrrogation is the part of condition.If the condition isn’t written, all records are included to the cleaning process..
--NOT 2: TRUNCATE TABLE instruction will be given at the end of interrogation. (It is used for empting the table TRUNCATE TABLE TABLE NAME)
--Example 39: Delete the author #25 When searching for the records whose rate are null in the select questıons, you can’t search for field area=null to research the area whose fieald area are null , İt is used null statement.

DELETE FROM authors WHERE authorId = 25;

--Example 40: List the students whose birth dates are null
SELECT * FROM students WHERE birthdate IS NULL;

--Example 41: List the name ,surname and the dates of received books of the student
SELECT students.name, students.surname, borrows.takenDate, borrows.broughtDate
FROM students
JOIN borrows ON students.studentId = borrows.studentId;