---10
--1
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255)
);
CREATE TABLE Members (
    members_id int PRIMARY KEY,
    members_name VARCHAR(255)
);
CREATE TABLE Project_Members (
    project_id int,
    members_id int,
    PRIMARY KEY (project_id, members_id),
    Foreign Key (project_id) REFERENCES Projects(project_id),
    Foreign Key (members_id) REFERENCES Members(members_id)
);
--2
CREATE TABLE EquipmentRentals (
    client_id INT,
    equipment_id INT,
    rental_date DATE,            -- Дата аренды
    PRIMARY KEY (client_id, equipment_id),
    Foreign Key (client_id) REFERENCES Clients(client_id),
    Foreign Key (equipment_id) REFERENCES Equipments(equipment_id)
);
CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255),
    client_email VARCHAR(255)
);
CREATE TABLE Equipments (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(255)
);
--3
CREATE TABLE StudentGrades (
    student_id INT,
    course_id INT,
    assignments int,
    PRIMARY KEY (student_id, course_id),
    Foreign Key (student_id) REFERENCES Students(student_id),
    Foreign Key (course_id) REFERENCES Courses(course_id)
);
CREATE TABLE Students(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);
CREATE TABLE Courses(
    course_id INT PRIMARY KEY,
    course_professor VARCHAR(255)
);
---11
--1
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255),
    publisher_id INT,
    Foreign Key (publisher_id) REFERENCES Publishers(publisher_id)
);
CREATE TABLE Publishers(
    publisher_id INT,
    publisher_name VARCHAR(255),
    publisher_city VARCHAR(100)
);
--2
CREATE TABLE RaceResults (
    race_id INT,
    driver_id INT,
    car_model_id int,
    finish_time TIME,
    PRIMARY KEY (race_id, driver_id),
    Foreign Key (car_model_id) REFERENCES Car_models(car_model_id)
);
CREATE TABLE Car_manufacturers (
    car_manufacturer_id int PRIMARY KEY,
    car_manufacturer VARCHAR(100)
);
CREATE TABLE Car_models (
    car_model_id int PRIMARY KEY,
    car_model VARCHAR(100)
);
CREATE Table Models_Manufacturer(
    car_manufacturer_id int,
    car_model_id int,
    PRIMARY KEY(car_manufacturer_id, car_model_id),
    Foreign Key (car_manufacturer_id) REFERENCES Car_manufacturers(car_manufacturer_id),
    Foreign Key (car_model_id) REFERENCES Car_models(car_model_id)
);
