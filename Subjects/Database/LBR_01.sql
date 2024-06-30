DROP TABLE IF EXISTS ТОВАРЫ;
DROP TABLE IF EXISTS ЗАКАЗЫ;
DROP TABLE IF EXISTS ЗАКАЗЧИКИ;

create table if not exists ТОВАРЫ(
    Наименование nvarchar(20) PRIMARY KEY ,
    Цена real,
    Количество integer
);

create table if not exists ЗАКАЗЧИКИ (
    Наименование_фирмы nvarchar(20) PRIMARY KEY,
    Адрес nvarchar(20),
    Расчетный_счет nvarchar(15)
);

create table if not exists ЗАКАЗЫ (
    Номер_заказа nvarchar(10) PRIMARY KEY,
    Наименование_товара nvarchar(20),
    Цена_продажи real,
    Количество integer,
    Дата_поставки date,
    Заказчик nvarchar(20)
);

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
    ('Заказ 1', 'Товар 1', 10.00, 2, '2024-02-20', 'Фирма 1'),
    ('Заказ 2', 'Товар 2', 19.00, 1, '2024-02-21', 'Фирма 2'),
    ('Заказ 3', 'Товар 3', 5.80, 4, '2024-02-22', 'Фирма 3'),
    ('Заказ 4', 'Товар 4', 8.49, 3, '2024-02-23', 'Фирма 4'),
    ('Заказ 5', 'Товар 5', 14.99, 2, '2024-02-24', 'Фирма 5');

select *
from ЗАКАЗЫ
join ЗАКАЗЧИКИ on ЗАКАЗЫ.Заказчик = ЗАКАЗЧИКИ.Наименование_фирмы;

select *
from ТОВАРЫ
join ЗАКАЗЫ on ТОВАРЫ.Наименование = ЗАКАЗЫ.Наименование_товара;

select *
from ЗАКАЗЫ where Дата_поставки > '2024-02-22';

select *
from ТОВАРЫ
where Цена > 10.00 and Цена < 20.00;

select ЗАКАЗЧИКИ.Наименование_фирмы
from ТОВАРЫ
         join ЗАКАЗЫ on ТОВАРЫ.Наименование = ЗАКАЗЫ.Наименование_товара
         join ЗАКАЗЧИКИ on ЗАКАЗЫ.Заказчик = ЗАКАЗЧИКИ.Наименование_фирмы
where ТОВАРЫ.Наименование = 'Товар 1';

select ЗАКАЗЫ.*
FROM ЗАКАЗЧИКИ
         JOIN ЗАКАЗЫ ON ЗАКАЗЧИКИ.Наименование_фирмы = ЗАКАЗЫ.Заказчик
WHERE ЗАКАЗЧИКИ.Наименование_фирмы = 'Фирма 1'
ORDER BY ЗАКАЗЫ.Дата_поставки;