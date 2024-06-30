use UNIVER;
select * from TEACHER

----------------------------------------Task_1-----------------------------------------
create view [Преподаватель] as
select TEACHER [код], TEACHER_NAME [имя преподавателя], GENDER [пол], PULPIT [код кафедры]
from TEACHER;

drop view [Преподаватель];
select * from Преподаватель

----------------------------------------Task_2-----------------------------------------
create view [Количество кафедр] as
select FACULTY_NAME [факультет], COUNT(PULPIT) [количество кафедр]
from FACULTY inner join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY
group by FACULTY_NAME;

select * from FACULTY
select * from PULPIT

select * from [Количество кафедр]

----------------------------------------Task_3-----------------------------------------
create view [Аудитории] as
select AUDITORIUM [код], AUDITORIUM_TYPE [наименование аудитории]
from AUDITORIUM
where AUDITORIUM_TYPE like 'ЛК%'

insert Аудитории values ('201-1', N'ЛК')

select * from AUDITORIUM
select * from Аудитории

----------------------------------------Task_4-----------------------------------------

create VIEW Лекционные_аудитории(Номер_аудитории,Название)
as select AUDITORIUM, AUDITORIUM_TYPE
from AUDITORIUM
where AUDITORIUM.AUDITORIUM_TYPE like N'ЛК%' WITH CHECK OPTION
select * from AUDITORIUM
insert Лекционные_аудитории values('935-1', N'ЛБ');

drop view[Лекционные_аудитории];
select * from Лекционные_аудитории;

----------------------------------------Task_5-----------------------------------------

create VIEW Дисциплины(код, наименование_дисциплины, код_кафедры)
as select TOP 100 SUBJECT, SUBJECT_NAME, PULPIT
from SUBJECT order by SUBJECT.SUBJECT_NAME

select * from SUBJECT
drop view[Дисциплины];
select * from Дисциплины;

----------------------------------------Task_6-----------------------------------------

ALTER VIEW [Количество кафедр] with SCHEMABINDING as
select fclt.FACULTY_NAME [Факультет], count(plpt.PULPIT) [Количество_кафедр]
from dbo.FACULTY fclt inner join dbo.PULPIT plpt
on fclt.FACULTY = plpt.FACULTY
group by FACULTY_NAME;

select * from [Количество кафедр]
drop fclt.FACULTY_NAME from [Количество кафедр] ------нужно выучить теорию по SCHEMABINDING и всему остальному
alter table FACULTY drop column FACULTY_NAME

----------------------------------------Task_7_1-----------------------------------------
create view [Клиенты] as
select Наименование_фирмы [Фирма], Адрес [Адрес],  Расчетный_счет [Счет]
from Заказчики;

drop view [Клиенты];
select * from Клиенты

----------------------------------------Task_7_2-----------------------------------------

create view [Количество компаний] as
select count(*) as [Количество компаний], З.Адрес as [Адрес]
from ТОВАРЫ Т inner join ЗАКАЗЧИКИ З
on Т.Наименование = З.Наименование_фирмы
group by З.Адрес;

select * from [Количество компаний]

----------------------------------------Task_7_3-----------------------------------------

create view [ЗАКАЗИКИ] as
select  Номер_заказа [Номер], Наименование_товара [Название]
from ЗАКАЗЫ
where Наименование_товара like 'Product%'

select * from [ЗАКАЗИКИ]

----------------------------------------Task_7_4-----------------------------------------

create view [ЗАКАЗИКИ_с_чек_опшн] as
select  Номер_заказа [Номер], Наименование_товара [Название]
from ЗАКАЗЫ
where Наименование_товара like 'Product%' with check option

select * from ЗАКАЗИКИ_с_чек_опшн

----------------------------------------Task_7_5-----------------------------------------

create view Информация_о_компании (Фирма, Глава) as
select TOP 5 Наименование_фирмы, CEO
from КОМПАНИИ
order by Наименование_фирмы

select * from Информация_о_компании
----------------------------------------Task_7_6-----------------------------------------

alter view [Количество компаний] with schemabinding as
select COUNT(*) as [Количество компаний], З.Адрес as [Адрес]
from dbo.товары Т inner join dbo.заказчики З
on Т.наименование = З.наименование_фирмы
group by З.Адрес;

select * from [Количество компаний]