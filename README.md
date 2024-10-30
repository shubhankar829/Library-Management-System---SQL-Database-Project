# Library-Management-System---SQL-Database-Project

__**Overview:**__
This project is a comprehensive SQL-based Library Management System designed to manage and analyze data for a library setup. It includes database tables, CRUD operations, and analytical queries to handle student records, books, authors, borrowing history, and book genres.

**Schema Diagram:**
![image](https://github.com/user-attachments/assets/fb8618a4-97c0-4090-a20e-2ab98ade8d8f)

**Highlights:**

_1.Database Structure:_ Tables for students, books, authors, borrows, and types create a relational schema that covers key library management entities.

_2.CRUD Operations:_ Queries for creating, reading, updating, and deleting records. Examples include adding new books and authors, updating student details, and managing borrow records.

_3.Advanced Queries:_ SQL functions such as filtering, aggregation, ordering, and random selection to analyze student borrowing patterns, identify popular books, and more.

_4.Practical Use Cases:_ Scenarios include listing students by class, finding books with specific characteristics, identifying the oldest/youngest students, and grouping records for efficient data retrieval.

**DDL and DML Statement:**
```
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
```
