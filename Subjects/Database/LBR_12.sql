
use UNIVER
----------------------------------------Task_1-----------------------------------------
SET IMPLICIT_TRANSACTIONS ON

SET NOCOUNT ON;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.subject_2') AND type = 'U')
    DROP TABLE dbo.subject_2;

DECLARE @c INT, @flag CHAR(1) = 'c';
SET IMPLICIT_TRANSACTIONS ON;

CREATE TABLE subject_2 (
                         subject NVARCHAR(10),
                         subject_name NVARCHAR(100),
                         pulpit NVARCHAR(20)
);

BEGIN
    INSERT INTO subject_2 (subject, subject_name, pulpit)
    VALUES ('ENG', 'English', 'English Department');

    INSERT INTO subject_2 (subject, subject_name, pulpit)
    VALUES ('MTH', 'Mathematics', 'Math Department');

    SET @c = (SELECT COUNT(*) FROM subject_2);
    PRINT N'Количество строк в таблице subject: ' + CAST(@c AS VARCHAR(2));

    IF @flag = 'c'
        COMMIT;
    ELSE
        ROLLBACK;
END;

SET IMPLICIT_TRANSACTIONS OFF;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.subject') AND type = 'U')
    PRINT N'Таблица subject существует.';
ELSE
    PRINT N'Таблицы subject не существует.';

SET IMPLICIT_TRANSACTIONS OFF
----------------------------------------Task_2-----------------------------------------

begin try
    begin tran
        delete AUDITORIUM where AUDITORIUM_NAME = '301-1';
        insert into AUDITORIUM values('991-1',N'ЛБ-Кdwwdd','5','204-1');
        update AUDITORIUM set AUDITORIUM_CAPACITY = '30' where AUDITORIUM_NAME='301-1';
    commit tran;
end try
begin catch
    SELECT ERROR_MESSAGE() AS ErrorMessage;
    print N'ОШИБКА!';
    print N'Номер ошибки: ' + cast(error_number() as varchar(10));
    print N'Содержание ошибки: ' + error_message();
end catch

select * from AUDITORIUM
----------------------------------------Task_3-----------------------------------------
declare @point varchar(30)
begin try
    begin tran
        delete AUDITORIUM where AUDITORIUM_NAME = '301-1';
        set @point = 'p1'; save tran @point;
        insert into AUDITORIUM values('991-1',N'ЛБ-Кdwwdd','5','204-1');
        set @point = 'p2'; save tran @point;
        update AUDITORIUM set AUDITORIUM_CAPACITY = '30' where AUDITORIUM_NAME='301-1';
        set @point = 'p3'; save tran @point;
    commit tran;
end try
begin catch
    print N'ОШИБКА!';
    print N'Номер ошибки: ' + cast(error_number() as varchar(10));
    print N'Содержание ошибки: ' + error_message();
    if @@trancount > 0
        begin
            print N'Контрольная точка: ' + @point;
            ROLLBACK TRAN @point;
            commit tran;
        end
end catch
----------------------------------------Task_4-----------------------------------------
select * from SUBJECT
SET IMPLICIT_TRANSACTIONS OFF;
-- A --
set transaction isolation level READ UNCOMMITTED;
begin transaction;
select @@SPID 'SPID', 'insert AUDITORIUM' 'Результат', * from SUBJECT
where SUBJECT = N'ООП';
select @@SPID 'SPID', 'update AUDITORIUM'  'Результат',  AUDITORIUM_NAME,
       AUDITORIUM_TYPE,AUDITORIUM_CAPACITY from AUDITORIUM   where  AUDITORIUM_NAME='204-1';
commit;
-- B --
set transaction isolation level READ COMMITTED;
begin transaction;
select @@SPID 'SPID'
update AUDITORIUM set AUDITORIUM_CAPACITY = '15' where AUDITORIUM_NAME='301-1';
rollback;
----------------------------------------Task_5-----------------------------------------
-- A --
set transaction isolation level read committed;
begin transaction;
select count(*) from AUDITORIUM where AUDITORIUM_CAPACITY = '30';
select  N'Update AUDITORIUM'  'Результат', count(*);
commit;
-- B --
begin transaction;
update AUDITORIUM set AUDITORIUM_CAPACITY = '30' where AUDITORIUM_NAME='301-1';
commit;
----------------------------------------Task_6-----------------------------------------
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'AUDITORIUM';
select * from AUDITORIUM
-- A --
set transaction isolation level repeatable read;
begin transaction;
select * from AUDITORIUM where AUDITORIUM.AUDITORIUM_NAME = '708-1'
commit;
-- B --
set transaction isolation level read committed;
begin transaction;
insert AUDITORIUM values(N'708-1', N'ЛБ-К', 16, N'708-1');
commit;
----------------------------------------Task_7-----------------------------------------
-- A --
set transaction isolation level serializable;
begin transaction;
commit;
-- B --
set transaction isolation level read committed;
begin transaction;
commit;
----------------------------------------Task_8-----------------------------------------
delete from SUBJECT where SUBJECT = N'ТиОЛ';
select * from SUBJECT
begin tran
insert into SUBJECT values(N'ТиОЛ', N'Технология и оборудование лесозаготовок', N'ЛМиЛЗ');
begin tran
update SUBJECT set SUBJECT_NAME = N'ТиОЛ' where SUBJECT = N'ТиОЛ';
commit
if @@TRANCOUNT > 0 rollback;

select
    (select count(*) from SUBJECT where SUBJECT = N'ТиОЛ') as 'Количество',
    (select count(*) from TEACHER inner join SUBJECT on TEACHER.PULPIT = SUBJECT.PULPIT) as 'Преподаватели';
---------------------------------------Task_9_1----------------------------------------
SET IMPLICIT_TRANSACTIONS ON

SET NOCOUNT ON;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.subject_3') AND type = 'U')
    DROP TABLE dbo.subject_3;

DECLARE @c INT, @flag CHAR(1) = 'c';
SET IMPLICIT_TRANSACTIONS ON;

CREATE TABLE subject_3 (
                           subject NVARCHAR(10),
                           subject_name NVARCHAR(100),
                           pulpit NVARCHAR(20)
);

BEGIN
    INSERT INTO subject_3 (subject, subject_name, pulpit)
    VALUES ('ENG', 'English', 'English Department');

    INSERT INTO subject_3 (subject, subject_name, pulpit)
    VALUES ('MTH', 'Mathematics', 'Math Department');

    SET @c = (SELECT COUNT(*) FROM subject_3);
    PRINT N'Количество строк в таблице subject: ' + CAST(@c AS VARCHAR(2));

    IF @flag = 'c'
        COMMIT;
    ELSE
        ROLLBACK;
END;

SET IMPLICIT_TRANSACTIONS OFF;

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.subject') AND type = 'U')
    PRINT N'Таблица subject существует.';
ELSE
    PRINT N'Таблицы subject не существует.';

SET IMPLICIT_TRANSACTIONS OFF
---------------------------------------Task_9_2----------------------------------------
BEGIN TRY
    BEGIN TRAN;
    DELETE FROM Company WHERE WorkerID = '2';
    INSERT INTO Company VALUES (N'Company 3', N'Mashka', N'90');
    UPDATE Company SET Worker = 'Renat' WHERE WorkerID = '81';
    COMMIT TRAN;
END TRY
BEGIN CATCH
    PRINT N'ОШИБКА!';
    PRINT N'Номер ошибки: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));
    PRINT N'Содержание ошибки: ' + ERROR_MESSAGE();
END CATCH;

select * from Company
---------------------------------------Task_9_3----------------------------------------
declare @point varchar(30)
BEGIN TRY
    BEGIN TRAN;
    DELETE FROM Company WHERE WorkerID = '2';
    set @point = 'p1'; save tran @point;
    INSERT INTO Company VALUES (N'Company 3', N'Mashka', N'90');
    set @point = 'p2'; save tran @point;
    UPDATE Company SET Worker = 'Renat' WHERE WorkerID = '81';
    set @point = 'p3'; save tran @point;
    COMMIT TRAN;
END TRY
BEGIN CATCH
    PRINT N'ОШИБКА!';
    PRINT N'Номер ошибки: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));
    PRINT N'Содержание ошибки: ' + ERROR_MESSAGE();
    if @@trancount > 0
        begin
            print N'Контрольная точка: ' + @point;
            rollback tran @point;
            commit tran;
        end
end catch;

select * from Company

---------------------------------------Task_9_4----------------------------------------
-- A --
set transaction isolation level read uncommitted;
begin transaction;
select * from Company where Company.Наименование = 'Company 200';
commit;
-- B --
set transaction isolation level read committed;
begin transaction;
insert Company values(N'Company 200', N'Aktoeto', N'99');
commit;
---------------------------------------Task_9_5----------------------------------------
-- A --
set transaction isolation level read committed;
begin transaction;
select count(*) from COMPANY where COMPANY.WorkerID = '1';
select N'Update COMPANY' 'Результат', count(*);
commit;
-- B --
begin transaction;
update COMPANY set COMPANY.WorkerID = '2' where COMPANY.WorkerID = '1';
commit;
---------------------------------------Task_9_6----------------------------------------
-- A --
set transaction isolation level repeatable read;
begin transaction;
select COMPANY.Наименование from COMPANY where COMPANY.WorkerID = N'1337';
commit;
-- B --
set transaction isolation level read committed;
insert COMPANY values(N'Company 90', N'Polina', N'1337');
begin transaction;
-------------------------- t2 --------------------
commit;
---------------------------------------Task_9_7----------------------------------------
-- A --
set transaction isolation level serializable;
begin transaction;
delete from COMPANY where Company.Наименование = N'Company 59';
insert COMPANY values(N'Company 59', N'Polina', N'1337');
update COMPANY set Company.WorkerID = N'1488' where Company.Наименование = N'Company 59';
select * from COMPANY where Company.Наименование = N'Company 59';
-------------------------- t1 --------------------
select * from COMPANY where Company.Наименование = N'Company 59';
-------------------------- t2 --------------------
commit;
-- B --
set transaction isolation level read committed;
begin transaction;
delete from COMPANY where Company.Наименование = N'Company 59';
insert COMPANY values(N'Company 59', N'Polina', N'1337');
update COMPANY set Company.WorkerID = N'1488' where Company.Наименование = N'Company 59';
select * from COMPANY where Company.Наименование = N'Company 59';
-------------------------- t1 --------------------
commit;
select * from COMPANY where Company.Наименование = N'Company 59';
-------------------------- t2 --------------------
---------------------------------------Task_9_8----------------------------------------

begin transaction; ---тут начинается внешняя транзакция
insert Company values(N'Company 33', N'Znaesh', N'1234');

begin transaction; ---тут начинается внутренняя транзакция
update COMPANY set Worker = N'NewWorker' where Наименование = N'Company 33';
commit; ---тут заканчивается внутрення транзакция
if @@trancount > 0 rollback;
select * from Company;
