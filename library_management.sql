-- Library Management System Database

CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Authors Table
CREATE TABLE Authors (
    author_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birthdate DATE,
    PRIMARY KEY (author_id)
);

-- Books Table
CREATE TABLE Books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    published_year YEAR NOT NULL,
    isbn VARCHAR(13) UNIQUE,
    PRIMARY KEY (book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Members Table
CREATE TABLE Members (
    member_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    membership_date DATE NOT NULL,
    PRIMARY KEY (member_id)
);

-- Loans Table
CREATE TABLE Loans (
    loan_id INT NOT NULL AUTO_INCREMENT,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    PRIMARY KEY (loan_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Sample Data
INSERT INTO Authors (name, birthdate) VALUES
('J.K. Rowling', '1965-07-31'),
('George R.R. Martin', '1948-09-20');

INSERT INTO Books (title, author_id, published_year, isbn) VALUES
('Harry Potter and the Philosopher\'s Stone', 1, 1997, '9780747532699'),
('A Game of Thrones', 2, 1996, '9780553103540');

INSERT INTO Members (name, membership_date) VALUES
('Alice Johnson', '2023-01-15'),
('Bob Smith', '2023-02-20');

INSERT INTO Loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2023-03-01', NULL),
(2, 2, '2023-03-05', '2023-03-15');
