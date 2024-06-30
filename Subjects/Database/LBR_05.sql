create table FACULTY
(
    FACULTY      nvarchar(10) primary key,
    FACULTY_NAME nvarchar(50) default N'Не указано'
)
    insert into FACULTY (FACULTY, FACULTY_NAME)
values (N'ХТиТ', N'Химическая технология и техника'),
       (N'ЛХФ', N'Лесохозяйственный факультет'),
       (N'ИЭФ', N'Инженерно-экономический факультет'),
       (N'ТТЛП', N'Технология и техника лесной промышленности'),
       (N'ТОВ', N'Технология органических веществ'),
       (N'ИТ', N'Факультет информационных технологий'),
       (N'ИДиП', N'Издательское дело и полиграфия');

create table PROFESSION
(
    PROFESSION      nvarchar(20) primary key,
    FACULTY         nvarchar(10) foreign key references FACULTY (FACULTY),
    PROFESSION_NAME nvarchar(100),
    QUALIFICATION   nvarchar(50)
);

insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
values (N'ИТ', '1-40 01 02', N'Информационные системы и технологии', N'инженерпрограммист-системотехник'),
       (N'ХТиТ', '1-36 01 08', N'Конструирование и производство из-делий из композиционных материалов',
        N'инженер-механик'),
       (N'ХТиТ', '1-36 07 01', N'Машины и аппараты химических производств и предприятий строительных материалов',
        N'инженер-механик'),
       (N'ЛХФ', '1-75 01 01', N'Лесное хозяйство', N'инженер лесного хозяйства'),
       (N'ЛХФ', '1-75 02 01', N'Садово-парковое строительство', N'инженер садово-паркового строительства'),
       (N'ЛХФ', '1-89 02 02', N'Туризм и природопользование', N'специ-алист в сфере туризма'),
       (N'ИЭФ', '1-25 01 07', N'Экономика и управление на предприятии', N'экономист-менеджер'),
       (N'ИЭФ', '1-25 01 08', N'Бухгалтерский учет, анализ и аудит', N'экономист'),
       (N'ТТЛП', '1-36 05 01', N'Машины и оборудование лесного ком-плекса', N'инженер-механик'),
       (N'ТТЛП', '1-46 01 01', N'Лесоинженерное дело', N'инженер-технолог'),
       (N'ТОВ', '1-48 01 02', N'Химическая технология органических веществ, материалов и изделий',
        N'инженер-химик-технолог'),
       (N'ТОВ', '1-48 01 05', N'Химическая технология переработки древесины', N'инженер-химик-технолог'),
       (N'ТОВ', '1-54 01 03', N'Физико-химические методы и приборы контроля качества продукции',
        N'инженер по сертификации'),
       (N'ИДиП', '1-47 01 01', N'Издательское дело', N'редактор-технолог'),
       (N'ИДиП', '1-36 06 01', N'Полиграфическое оборудование и си-стемы обработки информации',
        N'инженер-электромеханик');

create table PULPIT
(
    PULPIT      nvarchar(20) primary key,
    PULPIT_NAME nvarchar(100),
    FACULTY     nvarchar(10) foreign key references FACULTY (FACULTY)
);

insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values (N'ИСиТ', N'Информационных систем и технологий ', N'ИТ'),
       (N'ЛВ', N'Лесоводства', N'ЛХФ'),
       (N'ЛУ', N'Лесоустройства', N'ЛХФ'),
       (N'ЛЗиДВ', N'Лесозащиты и древесиноведения', N'ЛХФ'),
       (N'ЛКиП', N'Лесных культур и почвоведения', N'ЛХФ'),
       (N'ТиП', N'Туризма и природопользования', N'ЛХФ'),
       (N'ЛПиСПС', N'Ландшафтного проектирования и садово-паркового строительства', N'ЛХФ'),
       (N'ТЛ', N'Транспорта леса', N'ТТЛП'),
       (N'ЛМиЛЗ', N'Лесных машин и технологии лесозаготовок', N'ТТЛП'),
       (N'ТДП', N'Технологий деревообрабатывающих производств', N'ТТЛП'),
       (N'ТиДИД', N'Технологии и дизайна изделий из древесины', N'ТТЛП'),
       (N'ОХ', N'Органической химии', N'ТОВ'),
       (N'ХПД', N'Химической переработки древесины', N'ТОВ'),
       (N'ТНВиОХТ', N'Технологии неорганических веществ и общей химической технологии ', N'ХТиТ'),
       (N'ПиАХП', N'Процессов и аппаратов химических производств', N'ХТиТ'),
       (N'ЭТиМ', N'Экономической теории и маркетинга', N'ИЭФ'),
       (N'МиЭП', N'Менеджмента и экономики природопользования', N'ИЭФ'),
       (N'СБУАиА', N'Статистики, бухгалтерского учета, анализа и аудита', N'ИЭФ'),
       (N'ПОиСОИ', N'Полиграфического оборудования и систем обработки инфор-мации ', N'ИДиП'),
       (N'БФ', N'Белорусской филологии', N'ИДиП'),
       (N'РИТ', N'Редакционно-издательских тенологий', N'ИДиП'),
       (N'ПП', N'Полиграфических производств', N'ИДиП');

----------------------------------------Task_1-----------------------------------------
select PULPIT.PULPIT
from PULPIT, FACULTY
where PULPIT.FACULTY = FACULTY.FACULTY
and FACULTY.FACULTY In (select FACULTY
                          from PROFESSION
                          Where PROFESSION.PROFESSION_NAME like N'%технология%' or PROFESSION.PROFESSION_NAME like N'%технологии%')
select FACULTY, profession_name
from PROFESSION
Where PROFESSION.PROFESSION_NAME like N'%технология%' or PROFESSION.PROFESSION_NAME like N'%технологии%'
----------------------------------------Task_2-----------------------------------------
select FACULTY.FACULTY from FACULTY
select PULPIT.PULPIT
from PULPIT inner join FACULTY
on PULPIT.FACULTY = FACULTY.FACULTY
where FACULTY.FACULTY In (select FACULTY
                          from PROFESSION
                          Where PROFESSION.PROFESSION_NAME like N'%технология%' or PROFESSION.PROFESSION_NAME like N'%технологии%')
----------------------------------------Task_3-----------------------------------------
select distinct PULPIT.PULPIT
from PULPIT inner join FACULTY
on PULPIT.FACULTY = FACULTY.FACULTY
inner join PROFESSION
on FACULTY.FACULTY = PROFESSION.FACULTY
Where PROFESSION.PROFESSION_NAME like N'%технология%' or PROFESSION.PROFESSION_NAME like N'%технологии%'

----------------------------------------Task_4-----------------------------------------
select distinct a.AUDITORIUM_TYPE, AUDITORIUM_CAPACITY from
    AUDITORIUM as a
where a.AUDITORIUM_CAPACITY = (select top(1) aa.AUDITORIUM_CAPACITY from AUDITORIUM as aa
                               where aa.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE
                               order by aa.AUDITORIUM_CAPACITY desc) order by a.AUDITORIUM_CAPACITY desc
----------------------------------------Task_5-----------------------------------------
SELECT FACULTY_NAME FROM FACULTY
WHERE NOT EXISTS (SELECT * FROM PULPIT WHERE PULPIT.FACULTY = FACULTY.FACULTY)
select * from PULPIT
select * from FACULTY
----------------------------------------Task_6-----------------------------------------
select distinct
(select avg(PROGRESS.NOTE) from PROGRESS
where PROGRESS.SUBJECT like N'ОАиП') as ОАиП,

(select avg(PROGRESS.NOTE) from PROGRESS
where PROGRESS.SUBJECT like N'БД') as БД,

(select avg(PROGRESS.NOTE) from PROGRESS
where PROGRESS.SUBJECT like N'СУБД') as СУБД
from PROGRESS

select * from PROGRESS

----------------------------------------Task_7-----------------------------------------
select AUDITORIUM.AUDITORIUM_NAME, AUDITORIUM.AUDITORIUM_TYPE
from AUDITORIUM
where AUDITORIUM.AUDITORIUM_CAPACITY >= all(select AUDITORIUM.AUDITORIUM_CAPACITY from AUDITORIUM where AUDITORIUM.AUDITORIUM like '2%')

----------------------------------------Task_8-----------------------------------------
select AUDITORIUM.AUDITORIUM_NAME, AUDITORIUM.AUDITORIUM_TYPE
from AUDITORIUM
where AUDITORIUM.AUDITORIUM_CAPACITY >= any(select AUDITORIUM.AUDITORIUM_CAPACITY from AUDITORIUM where AUDITORIUM.AUDITORIUM like '2%')

----------------------------------------Task_9-----------------------------------------
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
----------------------------------------Task_9_1-----------------------------------------
select ЗАКАЗЫ.Номер_заказа
from ЗАКАЗЫ, ЗАКАЗЧИКИ
where ЗАКАЗЧИКИ.Наименование_фирмы = ЗАКАЗЫ.Заказчик
  and ЗАКАЗЫ.Цена_продажи In (select Цена from ТОВАРЫ where ТОВАРЫ.Наименование like N'%Company 1%')
----------------------------------------Task_9_2-----------------------------------------
select ЗАКАЗЫ.Номер_заказа
from ЗАКАЗЫ inner join ЗАКАЗЧИКИ
on ЗАКАЗЧИКИ.Наименование_фирмы = ЗАКАЗЫ.Заказчик
  and ЗАКАЗЫ.Цена_продажи In (select Цена from ТОВАРЫ where ТОВАРЫ.Наименование like N'%Company 1%')
----------------------------------------Task_9_3-----------------------------------------
select ЗАКАЗЫ.Номер_заказа
from ЗАКАЗЫ inner join ЗАКАЗЧИКИ
on ЗАКАЗЧИКИ.Наименование_фирмы = ЗАКАЗЫ.Заказчик inner join ТОВАРЫ
on ТОВАРЫ.Наименование = ЗАКАЗЫ.Заказчик where (ТОВАРЫ.Наименование like N'%Company 1%')
----------------------------------------Task_9_4-----------------------------------------
SELECT Заказы.Наименование_товара, Заказы.Цена_продажи
FROM Заказы
WHERE Заказы.Цена_продажи = (
    SELECT TOP (1) Цена_продажи
    FROM Заказы
    ORDER BY Цена_продажи DESC
);
----------------------------------------Task_9_5-----------------------------------------
select Наименование from ТОВАРЫ
Where not exists (select * from ЗАКАЗЧИКИ where ЗАКАЗЧИКИ.Наименование_фирмы = ТОВАРЫ.Наименование)
----------------------------------------Task_9_6-----------------------------------------
select distinct
    (select avg(ТОВАРЫ.Количество) from ТОВАРЫ) as СреднееКоличество
from ТОВАРЫ
----------------------------------------Task_9_7-----------------------------------------
select distinct ЗАКАЗЫ.Номер_заказа, ЗАКАЗЫ.Цена_продажи
from ЗАКАЗЫ, ТОВАРЫ
where ТОВАРЫ.Цена >=all(select ЗАКАЗЫ.Цена_продажи where ЗАКАЗЫ.Дата_поставки like '2024-02%')
----------------------------------------Task_9_8-----------------------------------------
select distinct ЗАКАЗЫ.Номер_заказа, ЗАКАЗЫ.Цена_продажи
from ЗАКАЗЫ, ТОВАРЫ
where ТОВАРЫ.Цена >=any(select ЗАКАЗЫ.Цена_продажи where ЗАКАЗЫ.Дата_поставки like '2024-02%')
----------------------------------------Task_10-----------------------------------------

SELECT S1.[NAME], S1.BDAY
FROM STUDENT S1
         JOIN STUDENT S2 ON S1.BDAY = S2.BDAY AND S1.IDSTUDENT <> S2.IDSTUDENT
ORDER BY S1.BDAY;
