create database Users;

create table SumYear (
    sum float,
    year int
);

INSERT INTO SumYear (sum, year) VALUES
                (100.5, 2020),
                (200.3, 2019),
                (150.2, 2018),
                (300.7, 2017),
                (250.9, 2016),
                (180.4, 2015),
                (280.6, 2014),
                (220.1, 2013),
                (190.8, 2012),
                (350.2, 2011);

create table UsernameInfo(
    Username nvarchar (50),
    Password nvarchar (16),
    RoleInSystem nvarchar(16)
);

insert into UsernameInfo (Username, Password, RoleInSystem)
values
('Admin',    '11111111', 'Administrator'),
('Client_1', '22222222', 'Client'),
('Client_2', '33333333', 'Client'),
('Client_3', '44444444', 'Client');

CREATE TABLE Students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT
);

CREATE TABLE Servers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    ip_address VARCHAR(15),
    port INT,
    status VARCHAR(20)
);

INSERT INTO Students (name, age)
VALUES
    ('John Doe', 20),
    ('Jane Smith', 22),
    ('Michael Johnson', 21);

INSERT INTO Servers (name, ip_address, port, status)
VALUES
    ('Server 1', '192.168.0.1', 8080, 'Active'),
    ('Server 2', '192.168.0.2', 8080, 'Inactive'),
    ('Server 3', '192.168.0.3', 8080, 'Active');

select * from
Students inner join Servers
on Students.id = Servers.id

