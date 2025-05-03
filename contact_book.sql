-- Contact Book Database

DROP DATABASE IF EXISTS ContactBookDB; -- To avoid conflicts
CREATE DATABASE ContactBookDB;
USE ContactBookDB;

-- Contacts Table
CREATE TABLE Contacts (
    contact_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(15),
    PRIMARY KEY (contact_id)
);

-- Groups Table
CREATE TABLE `Groups` (
    group_id INT NOT NULL AUTO_INCREMENT,
    group_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (group_id)
);

-- ContactGroups Table (Many-to-Many Relationship)
CREATE TABLE ContactGroups (
    contact_id INT NOT NULL,
    group_id INT NOT NULL,
    PRIMARY KEY (contact_id, group_id),
    FOREIGN KEY (contact_id) REFERENCES Contacts(contact_id) ON DELETE CASCADE,
    FOREIGN KEY (group_id) REFERENCES `Groups`(group_id) ON DELETE CASCADE
);

-- Sample Data for Contacts
INSERT INTO Contacts (name, email, phone) VALUES
('Alice Johnson', 'alice@example.com', '123-456-7890'),
('Bob Smith', 'bob@example.com', '987-654-3210'),
('Charlie Brown', 'charlie@example.com', '555-666-7777');

-- Sample Data for Groups
INSERT INTO `Groups` (group_name) VALUES
('Family'),
('Friends'),
('Work');

-- Sample Data for ContactGroups
INSERT INTO ContactGroups (contact_id, group_id) VALUES
(1, 1),  -- Alice in Family
(1, 2),  -- Alice in Friends
(2, 2),  -- Bob in Friends
(3, 3);  -- Charlie in Work
