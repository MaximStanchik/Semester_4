DROP DATABASE Sta_MyBASE

CREATE DATABASE Sta_MyBASE

create table ЗАКАЗЧИКИ (
    Наименование_фирмы nvarchar(20) primary key unique,
    Адрес nvarchar(20) unique,
    Расчетный_счет nvarchar(15) check (Расчетный_счет >= 0),
    );

create table ТОВАРЫ(
    Наименование nvarchar(20) unique not null primary key,
    Цена real check (Цена >= 0),
    Количество integer check (Количество >= 0)
    );

create table ЗАКАЗЫ (
    Номер_заказа nvarchar(10) primary key not null,
    Наименование_товара nvarchar(20) unique not null,
    Цена_продажи real check (Цена_продажи >= 0),
    Количество integer check (Количество > 0),
    Дата_поставки date not null,
    Заказчик nvarchar(20) not null
    )

alter table ЗАКАЗЫ
add Скидка integer;


INSERT INTO ТОВАРЫ (Наименование, Цена, Количество)
VALUES
    ('Товар 1', 10.99, 5),
    ('Товар 2', 19.00, 3),
    ('Товар 3', 5.99, 8),
    ('Товар 4', 8.49, 2),
    ('Товар 5', 14.99, 6);

INSERT INTO ЗАКАЗЧИКИ (Наименование_фирмы, Адрес, Расчетный_счет)
VALUES
    ('Фирма 1', 'Адрес 1', 5233),
    ('Фирма 2', 'Адрес 2', 3123),
    ('Фирма 3', 'Адрес 3', 8123),
    ('Фирма 4', 'Адрес 4', 223),
    ('Фирма 5', 'Адрес 5', 623);

INSERT INTO ЗАКАЗЫ (Номер_заказа, Наименование_товара, Цена_продажи, Количество, Дата_поставки, Заказчик)
VALUES
    ('Order 1', 'Product 1', 10.00, 2, '2024-02-20', 'Company 1'),
    ('Order 2', 'Product 2', 19.00, 1, '2024-02-21', 'Company 2'),
    ('Order 3', 'Product 3', 5.80, 4, '2024-02-22', 'Company 3'),
    ('Order 4', 'Product 4', 8.49, 3, '2024-02-23', 'Company 4'),
    ('Order 5', 'Product 5', 14.99, 2, '2024-02-24', 'Company 5');

UPDATE ЗАКАЗЫ SET Скидка = 20 WHERE Скидка IS NULL;

SELECT * From ЗАКАЗЫ;

SELECT Номер_заказа, Цена_продажи from ЗАКАЗЫ;

SELECT count(*) from ЗАКАЗЫ

use master
go
CREATE DATABASE Sta_MyBASE
    ON PRIMARY
    (
        NAME = 'Sta_MyBASE_Data_mdf',
        FILENAME = 'C:\Users\User\DataGripProjects\LBR_03\DataBase\Sta_MyBASE_mdf.mdf',
        SIZE = 10240KB,
        MAXSIZE = UNLIMITED,
        FILEGROWTH = 1024KB
        )
    LOG ON
    (
        NAME = 'Sta_MyBASE_Data_log',
        FILENAME = 'C:\Users\User\DataGripProjects\LBR_03\DataBase\Sta_MyBASE_log.log',
        SIZE = 10240KB,
        MAXSIZE = 400MB,
        FILEGROWTH = 10%
        );

ALTER DATABASE Sta_MyBASE
    ADD FILEGROUP SecondFileGroup;

ALTER DATABASE Sta_MyBASE
    ADD FILE
        (
            NAME = 'Sta_MyBASE_Data2',
            FILENAME = 'C:\Users\User\DataGripProjects\LBR_03\DataBase\Sta_MyBASE_Data2.ndf',
            SIZE = 5120KB,
            MAXSIZE = UNLIMITED,
            FILEGROWTH = 512KB
            )
        TO FILEGROUP SecondFileGroup;