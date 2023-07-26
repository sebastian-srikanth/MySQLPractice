-- Create employee table with PRIMARY KEY CONSTRAINT with AUTO INCREMENT enabled
create table employee(
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(20) NOT NULL,
    age int NOT NULL,
    salary int NOT NULL,
    location varchar(30) DEFAULT 'bangalore'
);

-- Insert into employee table
insert into employee(name, age, salary) values (
    'RAM', 28, 100000
);

-- Insert into employee table
insert into employee(name, age, salary, location) values (
    'JOHN', 26, 200000, 'hyderabad'
);

-- Create employee table with multiple UNIQUE KEY CONSTRAINTS
create table employee(
    id int,
    name varchar(20) NOT NULL,
    age int NOT NULL,
    salary int NOT NULL,
    location varchar(30) DEFAULT 'bangalore',
    UNIQUE KEY(id, name)
);

-- Create employee table with multiple PRIMARY KEY CONSTRAINTS
create table employee(
    id int,
    name varchar(20) NOT NULL,
    age int NOT NULL,
    salary int NOT NULL,
    location varchar(30) DEFAULT 'bangalore',
    PRIMARY KEY(id, name)
);

-- Practice
create table courses(
    course_id int NOT NULL,
    course_name varchar(30) NOT NULL,
    course_duration decimal(3,1) NOT NULL,
    course_fee int NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    PRIMARY KEY(course_id)
);

select 
    *,
    CASE WHEN course_duration > 4.0 THEN 'Masters Program' ELSE 'Diploma' END as course_cetegory
from courses;


insert into courses(course_id, course_name, course_duration, course_fee) VALUES (
    (1, 'bigdata', 6.5, 50000),
    (2, 'webdevelopment', 3.8, 20000),
    (3, 'sql', 2.4, 10000),
    (4, 'devops', 10.3, 34000),
);

insert into courses(course_id, course_name, course_duration, course_fee) VALUES (
    1, 'bigdata', 6.5, 50000
);
insert into courses(course_id, course_name, course_duration, course_fee) VALUES (
    2, 'webdevelopment', 3.8, 20000
);
insert into courses(course_id, course_name, course_duration, course_fee) VALUES (
    3, 'sql', 2.4, 10000
);
insert into courses(course_id, course_name, course_duration, course_fee) VALUES (
    4, 'devops', 10.3, 34000
);

insert into courses(course_id, course_name, course_duration, course_fee) VALUES (
    5, 'cloudcomputing', 8.1, 45000
);

-- Create employee table with multiple UNIQUE KEY CONSTRAINTS
create table employee(
    firstname varchar(20) NOT NULL,
    lastname varchar(20) NOT NULL,
    age int NOT NULL,
    salary int NOT NULL,
    location varchar(30) DEFAULT 'bangalore'
);

insert into employee values ('sachin', 'tendulkar', 28, 10000, 'bangalore');

insert into employee values ('shane', 'warne', 50, 3000, 'bangalore');

insert into employee values ('rohit', 'sharma', 30, 7000, 'hyderabad');

insert into employee values ('shikhar', 'dhawan', 35, 8000, 'chennai');

insert into employee values ('mahendrasingh', 'dhoni', 40, 10000, 'pune');
