----------------------------------------Task_1-----------------------------------------
use UNIVER

select * from AUDITORIUM
select * from AUDITORIUM_TYPE

select AUDITORIUM.AUDITORIUM_TYPE,
max(AUDITORIUM.AUDITORIUM_CAPACITY) [Maximum capacity],
min(AUDITORIUM.AUDITORIUM_CAPACITY) [Minimum capacity],
avg(AUDITORIUM.AUDITORIUM_CAPACITY) [Average capacity],
sum(AUDITORIUM.AUDITORIUM_CAPACITY) [Summary capacity],
count(AUDITORIUM.AUDITORIUM_CAPACITY) [Count of auditoriums]
from AUDITORIUM inner join AUDITORIUM_TYPE
on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
group by AUDITORIUM.AUDITORIUM_TYPE;

----------------------------------------Task_2-----------------------------------------

select AUDITORIUM.AUDITORIUM_TYPE,
       max(AUDITORIUM.AUDITORIUM_CAPACITY) [Maximum capacity],
       min(AUDITORIUM.AUDITORIUM_CAPACITY) [Minimum capacity],
       avg(AUDITORIUM.AUDITORIUM_CAPACITY) [Average capacity],
       sum(AUDITORIUM.AUDITORIUM_CAPACITY) [Summary capacity],
       count(AUDITORIUM.AUDITORIUM_CAPACITY) [Count of auditoriums]
from AUDITORIUM inner join AUDITORIUM_TYPE
                           on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
group by AUDITORIUM.AUDITORIUM_TYPE;

----------------------------------------Task_3-----------------------------------------

select * from PROGRESS

select * from (
    select case
        when NOTE between 1 and 2 then '1-2'
        when NOTE between 3 and 4 then '3-4'
        when NOTE between 5 and 6 then '5-6'
        when NOTE between 7 and 8 then '7-8'
        when NOTE between 9 and 10 then '9-10'
        END [NOTES], count(*) [COUNT_OF_NOTES]
    FROM PROGRESS GROUP BY CASE
        when NOTE between 1 and 2 then '1-2'
        when NOTE between 3 and 4 then '3-4'
        when NOTE between 5 and 6 then '5-6'
        when NOTE between 7 and 8 then '7-8'
        when NOTE between 9 and 10 then '9-10'
        END) AS a
ORDER BY CASE [NOTES]
             WHEN '1-2' THEN 4
             WHEN '3-4' THEN 3
             WHEN '5-6' THEN 2
             WHEN '7-8' THEN 1
             WHEN '9-10' THEN 0
             END

----------------------------------------Task_4-----------------------------------------

select * from FACULTY
select * from GROUPS
select * from STUDENT
select * from PROGRESS

select FACULTY.FACULTY, GROUPS.PROFESSION, STUDENT.IDGROUP,  round(avg(cast(PROGRESS.NOTE AS float(4))), 2) as [Average note]
    from FACULTY
    inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY
    inner join STUDENT on GROUPS.IDGROUP = STUDENT.IDGROUP
    inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
group by FACULTY.FACULTY, GROUPS.PROFESSION, STUDENT.IDGROUP
order by [Average note] desc

----------------------------------------Task_5-----------------------------------------

select FACULTY.FACULTY, GROUPS.PROFESSION, STUDENT.IDGROUP,  round(avg(cast(PROGRESS.NOTE AS float(4))), 2) as [Average note]
from FACULTY
         inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY
         inner join STUDENT on GROUPS.IDGROUP = STUDENT.IDGROUP
         inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where PROGRESS.SUBJECT like 'БД' or PROGRESS.SUBJECT like 'ОАиП'
group by FACULTY.FACULTY, GROUPS.PROFESSION, STUDENT.IDGROUP
order by [Average note] desc

----------------------------------------Task_6-----------------------------------------

select GROUPS.PROFESSION, PROGRESS.SUBJECT, avg(PROGRESS.NOTE) as [Average notes] ------ничего не выводит
from FACULTY
         inner join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY
         inner join STUDENT on GROUPS.FACULTY = STUDENT.IDGROUP
         inner join PROGRESS on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
where FACULTY.FACULTY like 'ТОВ'
group by GROUPS.PROFESSION, PROGRESS.SUBJECT

----------------------------------------Task_7-----------------------------------------

select PROGRESS.SUBJECT, count(PROGRESS.IDSTUDENT) [Count of students]
from PROGRESS
group by PROGRESS.SUBJECT, PROGRESS.NOTE
having PROGRESS.NOTE in (8,9)

----проверить: N5, N6

----------------------------------------Task_8-------------------------------------------
create database Sta_MyBase;
use Sta_MyBase;

create table ЗАКАЗЧИКИ
(
    Наименование_фирмы nvarchar(20) primary key,
    Адрес              nvarchar(20) unique,
    Расчетный_счет     nvarchar(15) check (Расчетный_счет >= 0),
);

create table ТОВАРЫ
(
    Наименование nvarchar(20) primary key,
    Цена         real check (Цена >= 0),
    Количество   integer check (Количество >= 0)
);

create table ЗАКАЗЫ
(
    Номер_заказа        nvarchar(10) primary key not null,
    Наименование_товара nvarchar(20) unique      not null,
    Цена_продажи        real check (Цена_продажи >= 0),
    Количество          integer check (Количество > 0),
    Дата_поставки       date                     not null,
    Заказчик            nvarchar(20)             not null
)

INSERT INTO ТОВАРЫ (Наименование, Цена, Количество)
VALUES ('Company 1', 10.99, 5),
       ('Company 2', 19.00, 3),
       ('Company 3', 5.99, 8),
       ('Company 4', 8.49, 2),
       ('Company 5', 14.99, 6);

INSERT INTO ЗАКАЗЧИКИ (Наименование_фирмы, Адрес, Расчетный_счет)
VALUES ('Company 1', 'Adress 1', 5233),
       ('Company 2', 'Adress 2', 3123),
       ('Company 3', 'Adress 3', 8123),
       ('Company 4', 'Adress 4', 223),
       ('Company 5', 'Adress 5', 623);

INSERT INTO ЗАКАЗЫ (Номер_заказа, Наименование_товара, Цена_продажи, Количество, Дата_поставки, Заказчик)
VALUES ('Order 1', 'Product 1', 10.99, 2, '2024-02-20', 'Company 1'),
       ('Order 2', 'Product 2', 19.00, 1, '2024-02-21', 'Company 2'),
       ('Order 3', 'Product 3', 5.99, 4, '2024-03-22', 'Company 3'),
       ('Order 4', 'Product 4', 8.49, 3, '2024-03-23', 'Company 4'),
       ('Order 5', 'Product 5', 14.99, 2, '2024-02-24', 'Company 5');

INSERT INTO ЗАКАЗЫ (Номер_заказа, Наименование_товара, Цена_продажи, Количество, Дата_поставки, Заказчик)
VALUES ('Order 6', 'Product 6', 17.90, 10, '2024-02-20', 'Company 1'),
       ('Order 7', 'Product 7', 21.80, 10, '2024-02-21', 'Company 3'),
       ('Order 8', 'Product 8', 99.87, 10, '2024-03-22', 'Company 3'),
       ('Order 9', 'Product 9', 1.10, 20, '2024-03-23', 'Company 3'),
       ('Order 10', 'Product 10', 5.90, 30, '2024-02-24', 'Company 4');
----------------------------------------Task_8_1-----------------------------------------
select ЗАКАЗЫ.Заказчик, max(ЗАКАЗЫ.Цена_продажи) [Максимальная цена продажи], min(ЗАКАЗЫ.Цена_продажи) [Минимальная цена продажи], avg(ЗАКАЗЫ.Цена_продажи) [Средняя цена продажи]
from ЗАКАЗЫ
group by ЗАКАЗЫ.Заказчик
----------------------------------------Task_8_2-----------------------------------------
select ЗАКАЗЫ.Заказчик, max(ЗАКАЗЫ.Цена_продажи) [Максимальная цена продажи], min(ЗАКАЗЫ.Цена_продажи) [Минимальная цена продажи], avg(ЗАКАЗЫ.Цена_продажи) [Средняя цена продажи]
from ЗАКАЗЫ
group by ЗАКАЗЫ.Заказчик
----------------------------------------Task_8_6-----------------------------------------
select ЗАКАЗЫ.Наименование_товара, ЗАКАЗЫ.Цена_продажи
from ЗАКАЗЫ
where ЗАКАЗЫ.Дата_поставки in ('2024-02-20','2024-02-21')
group by ЗАКАЗЫ.Наименование_товара, ЗАКАЗЫ.Цена_продажи
----------------------------------------Task_8_7-----------------------------------------
select ЗАКАЗЫ.Заказчик,ЗАКАЗЫ.Количество,count (ЗАКАЗЫ.Наименование_товара) [Кол-во товаров]
from ЗАКАЗЫ
group by ЗАКАЗЫ.Заказчик, ЗАКАЗЫ.Количество
having ЗАКАЗЫ.Количество in (10,30)