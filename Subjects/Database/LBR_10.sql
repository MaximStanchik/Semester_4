----------------------------------------Task_1-----------------------------------------
use UNIVER

exec SP_HELPINDEX 'AUDITORIUM_TYPE'
exec SP_HELPINDEX 'AUDITORIUM'
exec SP_HELPINDEX 'FACULTY'
exec SP_HELPINDEX 'PROFESSION'
exec SP_HELPINDEX 'PULPIT'
exec SP_HELPINDEX 'TEACHER'
exec SP_HELPINDEX 'SUBJECT'
exec SP_HELPINDEX 'GROUPS'
exec SP_HELPINDEX 'STUDENT'
exec SP_HELPINDEX 'PROGRESS'

create table #temporaryLocalTable_1
(
    id int,
    string nvarchar(1000)
)

declare @i int = 0;
        while (@i < 1000)
              begin
              insert into #temporaryLocalTable_1 (id, string) values (@i, cast(@i as nvarchar(1000)) + N'-ая строка')
              set @i = @i + 1;
              end;

select * from #temporaryLocalTable_1 where ID between 20 and 30;

checkpoint;  --фиксация БД
dbcc dropcleanbuffers;  --очистить буферный кэш

create clustered index #example_index_1 on #temporaryLocalTable_1 (ID asc); ----как посмотреть стоимость
----------------------------------------Task_2-----------------------------------------
create table #temporaryLocalTable_2
(
    id int,
    string nvarchar(1000)
)
declare @i int = 0;
while (@i < 10000)
    begin
        insert into #temporaryLocalTable_2 (id, string) values (@i, cast(@i as nvarchar(1000)) + N'-ая строка')
        set @i = @i + 1;
    end;

select * from #temporaryLocalTable_2 where ID between 20 and 30;

checkpoint;
dbcc dropcleanbuffers;
create nonclustered index #example_index_2 on #temporaryLocalTable_2 (id, string)

----------------------------------------Task_3-----------------------------------------
create table #temporaryLocalTable_3
(
    id int,
    string nvarchar(1000),
    cc nvarchar(5)
)

declare @i int = 0;
while (@i < 10000)
    begin
        insert into #temporaryLocalTable_3 (id, string) values (@i, cast(@i as nvarchar(1000)) + N'-ая строка')
        set @i = @i + 1;
    end;

checkpoint;
dbcc dropcleanbuffers;
create nonclustered index #example_index_3 on #temporaryLocalTable_3(id) include (cc)
select * from #temporaryLocalTable_3 where cc = N'2-ая строка'
----------------------------------------Task_4-----------------------------------------
CREATE TABLE #temporaryLocalTable_4
(
    id INT,
    string NVARCHAR(1000)
)

DECLARE @i INT = 0;
WHILE (@i < 10000)
    BEGIN
        INSERT INTO #temporaryLocalTable_4 (id, string) VALUES (@i, CAST(@i AS NVARCHAR(1000)) + N'-ая строка')
        SET @i = @i + 1;
    END;

SELECT * FROM #temporaryLocalTable_4 WHERE ID BETWEEN 30 AND 50;

CHECKPOINT;
DBCC DROPCLEANBUFFERS;

CREATE INDEX example_index_4 ON #temporaryLocalTable_4(id) WHERE (id > 30 AND id < 50);
----------------------------------------Task_5-----------------------------------------
CREATE TABLE  #TASK5
(
    INFO NVARCHAR (20),
    ITERATOR INT IDENTITY(1,1),
    INDEX_ INT
)

DECLARE @X INT =0;
WHILE @X <= 10000
    BEGIN
        INSERT INTO  #TASK5(INFO,INDEX_)
        VALUES (N'Строка' + CAST(@X AS NVARCHAR),FLOOR(20000*RAND()))
        SET @X +=1;
    END

CHECKPOINT;
DBCC DROPCLEANBUFFERS

CREATE INDEX #TASK5_KEY ON #TASK5(INDEX_)

SELECT NAME [Название], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
FROM SYS.DM_DB_INDEX_PHYSICAL_STATS(DB_ID(N'TEMPDB'),
                                    OBJECT_ID(N'#TASK5'), NULL, NULL, NULL) SS
         JOIN SYS.INDEXES II ON SS.OBJECT_ID = II.OBJECT_ID
    AND SS.INDEX_ID = II.INDEX_ID WHERE NAME IS NOT NULL;

INSERT TOP(10000) #TASK5(INDEX_ ,INFO) SELECT INDEX_, INFO FROM #TASK5

ALTER INDEX #TASK5_KEY ON #TASK5 REORGANIZE
ALTER INDEX #TASK5_KEY ON #TASK5 REBUILD WITH (ONLINE = OFF)

----------------------------------------Task_6-----------------------------------------
CREATE TABLE MyTable_2222
(
    ID INT PRIMARY KEY,
    Name NVARCHAR(50)
)

INSERT INTO MyTable_2222 (ID, Name)
VALUES (1, 'John'), (2, 'Jane'), (3, 'Mike'), (4, 'Lisa'), (5, 'Tom')

checkpoint;  --фиксация БД
dbcc dropcleanbuffers;  --очистить буферный кэш

CREATE NONCLUSTERED INDEX IX_Name ON MyTable_2222 (Name)
    WITH (FILLFACTOR = 80)

SELECT *
FROM MyTable_2222
WHERE Name = 'Jane'
---------------------------------------Task_7_1----------------------------------------
use Sta_MyBASE

SELECT TABLE_NAME ---посмотеть все таблицы в бд
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA = 'dbo';

exec SP_HELPINDEX N'ЗАКАЗЧИКИ'
exec SP_HELPINDEX N'ТОВАРЫ'
exec SP_HELPINDEX N'ЗАКАЗЫ'
exec SP_HELPINDEX N'КОМПАНИИ'

create table #temporaryLocalTable_1_in_Sta_MyBASE
(
    id int,
    string nvarchar(1000)
)

declare @i int = 0;
while (@i < 1000)
    begin
        insert into #temporaryLocalTable_1_in_Sta_MyBASE (id, string) values (@i, cast(@i as nvarchar(1000)) + N'-ая строка')
        set @i = @i + 1;
    end;

select * from #temporaryLocalTable_1_in_Sta_MyBASE where ID between 20 and 30;

checkpoint;  --фиксация БД
dbcc dropcleanbuffers;  --очистить буферный кэш

create clustered index #example_index_1_in_Sta_MyBASE on #temporaryLocalTable_1_in_Sta_MyBASE (ID asc); ----как посмотреть стоимость
---------------------------------------Task_7_2----------------------------------------
create table #temporaryLocalTable_2_in_Sta_MyBASE
(
    id int,
    string nvarchar(1000)
)
declare @i int = 0;
while (@i < 10000)
    begin
        insert into #temporaryLocalTable_2_in_Sta_MyBASE (id, string) values (@i, cast(@i as nvarchar(1000)) + N'-ая строка')
        set @i = @i + 1;
    end;

select * from #temporaryLocalTable_2_in_Sta_MyBASE where ID between 20 and 30;

checkpoint;
dbcc dropcleanbuffers;
create nonclustered index #example_index_2_in_Sta_MyBASE on #temporaryLocalTable_2_in_Sta_MyBASE (id, string)
---------------------------------------Task_7_3----------------------------------------
create table #temporaryLocalTable_3_in_Sta_MyBASE
(
    id int,
    string nvarchar(1000),
    cc nvarchar(5)
)

declare @i int = 0;
while (@i < 10000)
    begin
        insert into #temporaryLocalTable_3_in_Sta_MyBASE (id, string) values (@i, cast(@i as nvarchar(1000)) + N'-ая строка')
        set @i = @i + 1;
    end;

checkpoint;
dbcc dropcleanbuffers;
create nonclustered index #example_index_3_in_Sta_MyBASE on #temporaryLocalTable_3_in_Sta_MyBASE(id) include (cc)

select * from #temporaryLocalTable_3_in_Sta_MyBASE where ID between 20 and 30;
---------------------------------------Task_7_4----------------------------------------
create table #temporaryLocalTable_4_in_Sta_MyBASE
(
    id int,
    string nvarchar(1000)
)
declare @i int = 0;
while (@i < 10000)
    begin
        insert into #temporaryLocalTable_4_in_Sta_MyBASE (id, string) values (@i, cast(@i as nvarchar(1000)) + N'-ая строка')
        set @i = @i + 1;
    end;
create nonclustered index #example_index_4_in_Sta_MyBASE on #temporaryLocalTable_4_in_Sta_MyBASE(id) where (id>30 and id <50);
select * from #temporaryLocalTable_4_in_Sta_MyBASE where ID between 20 and 30;
---------------------------------------Task_7_5----------------------------------------
create table #temporaryLocalTable_5_in_Sta_MyBASE
(
    id int,
    string nvarchar(1000)
)
declare @i int = 0;
while (@i < 10000)
    begin
        insert into #temporaryLocalTable_5_in_Sta_MyBASE (id, string) values (@i, cast(@i as nvarchar(1000)) + N'-ая строка')
        set @i = @i + 1;
    end;

select * from #temporaryLocalTable_5_in_Sta_MyBASE where ID between 20 and 30;
CREATE NONCLUSTERED INDEX #example_index_5_in_Sta_MyBASE ON #temporaryLocalTable_5_in_Sta_MyBASE (ID) WHERE (id > 20 and id < 30);
select * from #temporaryLocalTable_5_in_Sta_MyBASE where ID between 20 and 30;
---------------------------------------Task_7_6----------------------------------------
CREATE TABLE MyTable
(
    ID INT PRIMARY KEY,
    Name NVARCHAR(50)
)

INSERT INTO MyTable (ID, Name)
VALUES (1, 'John'), (2, 'Jane'), (3, 'Mike'), (4, 'Lisa'), (5, 'Tom')

CREATE NONCLUSTERED INDEX IX_Name ON MyTable (Name)
    WITH (FILLFACTOR = 80)

SELECT *
FROM MyTable
WHERE Name = 'Jane'