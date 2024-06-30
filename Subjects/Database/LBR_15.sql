use UNIVER
----------------------------------------Task_1-----------------------------------------
create table TR_AUDIT
(
    ID int identity(1, 1),										-- ID
    STMT nvarchar(20) check (STMT in ('INS', 'DEL', 'UPD')),		-- DML operator name
    TRNAME nvarchar(50),											-- trigger name
    CC nvarchar(300)												-- comment
)

CREATE TRIGGER TR_TEACHER_INS ON TEACHER AFTER INSERT
    AS
BEGIN
    DECLARE @TEACHER nchar(10), @TEACHER_NAME nvarchar(100),
        @GENDER nchar(1), @PULPIT nchar(20), @IN nvarchar(300)
    PRINT N'Выполнена операция INSERT'
    SET @TEACHER = (SELECT TEACHER FROM INSERTED)
    SET @TEACHER_NAME = (SELECT TEACHER_NAME FROM INSERTED)
    SET @GENDER = (SELECT GENDER FROM INSERTED)
    SET @PULPIT = (SELECT PULPIT FROM INSERTED)
    SET @IN = LTRIM(RTRIM(@TEACHER)) + ' ' + LTRIM(RTRIM(@TEACHER_NAME)) +
              ' ' + LTRIM(RTRIM(@GENDER)) + ' ' + LTRIM(RTRIM(@PULPIT))
    INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('INS', 'TR_TEACHER_INS', @IN)
    RETURN;
END;

----------------------------------------Task_2-----------------------------------------
    CREATE TRIGGER TR_TEACHER_DEL ON TEACHER AFTER DELETE
        AS
    BEGIN
        DECLARE @TEACHER nchar(10), @TEACHER_NAME nvarchar(100),
            @GENDER nchar(1), @PULPIT nchar(20), @IN nvarchar(300)
        PRINT N'Выполнена операция DELETE'
        SET @TEACHER = (SELECT TEACHER FROM DELETED)
        SET @TEACHER_NAME = (SELECT TEACHER_NAME FROM DELETED)
        SET @GENDER = (SELECT GENDER FROM DELETED)
        SET @PULPIT = (SELECT PULPIT FROM DELETED)
        SET @IN = LTRIM(RTRIM(@TEACHER)) + ' ' + LTRIM(RTRIM(@TEACHER_NAME)) +
                  ' ' + LTRIM(RTRIM(@GENDER)) + ' ' + LTRIM(RTRIM(@PULPIT))
        INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('DEL', 'TR_TEACHER_DEL', @IN)
        RETURN;
    END;
----------------------------------------Task_3-----------------------------------------
        CREATE TRIGGER TR_TEACHER_UPD ON TEACHER AFTER UPDATE
            AS
        BEGIN
            DECLARE @TEACHER nchar(10), @TEACHER_NAME nvarchar(100),
                @GENDER nchar(1), @PULPIT nvarchar(20), @IN nvarchar(300)
            PRINT N'Выполнена операция UPDATE'

            SET @TEACHER = (SELECT TEACHER FROM DELETED WHERE TEACHER IS NOT NULL)
            SET @TEACHER_NAME = (SELECT TEACHER_NAME FROM DELETED WHERE TEACHER_NAME IS NOT NULL)
            SET @GENDER = (SELECT GENDER FROM DELETED WHERE GENDER IS NOT NULL)
            SET @PULPIT = (SELECT PULPIT FROM DELETED WHERE PULPIT IS NOT NULL)
            SET @IN = LTRIM(RTRIM(@TEACHER)) + N' ' + LTRIM(RTRIM(@TEACHER_NAME)) +
                      N' ' + LTRIM(RTRIM(@GENDER)) + N' ' + LTRIM(RTRIM(@PULPIT)) + N' -> '

            SET @TEACHER = (SELECT TEACHER FROM INSERTED WHERE TEACHER IS NOT NULL)
            SET @TEACHER_NAME = (SELECT TEACHER_NAME FROM INSERTED WHERE TEACHER_NAME IS NOT NULL)
            SET @GENDER = (SELECT GENDER FROM INSERTED WHERE GENDER IS NOT NULL)
            SET @PULPIT = (SELECT PULPIT FROM INSERTED WHERE PULPIT IS NOT NULL)
            SET @IN = @IN + LTRIM(RTRIM(@TEACHER)) + N' ' + LTRIM(RTRIM(@TEACHER_NAME)) +
                      N' ' + LTRIM(RTRIM(@GENDER)) + N' ' + LTRIM(RTRIM(@PULPIT))

            INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('UPD', 'TR_TEACHER_UPD', @IN)
            RETURN;
        END;
----------------------------------------Task_4-----------------------------------------
            CREATE TRIGGER TR_TEACHER ON TEACHER AFTER INSERT, UPDATE, DELETE
                AS
            BEGIN
                DECLARE @TEACHER nchar(10), @TEACHER_NAME nvarchar(100),
                    @GENDER nchar(1), @PULPIT nvarchar(20), @IN nvarchar(300)

                IF (SELECT COUNT(*) FROM INSERTED) > 0 AND (SELECT COUNT(*) FROM DELETED) > 0
                    BEGIN
                        PRINT N'Выполнена операция UPDATE'
                        SET @TEACHER = (SELECT TEACHER FROM DELETED WHERE TEACHER IS NOT NULL)
                        SET @TEACHER_NAME = (SELECT TEACHER_NAME FROM DELETED WHERE TEACHER_NAME IS NOT NULL)
                        SET @GENDER = (SELECT GENDER FROM DELETED WHERE GENDER IS NOT NULL)
                        SET @PULPIT = (SELECT PULPIT FROM DELETED WHERE PULPIT IS NOT NULL)
                        SET @IN = LTRIM(RTRIM(@TEACHER)) + N' ' + LTRIM(RTRIM(@TEACHER_NAME)) +
                                  N' ' + LTRIM(RTRIM(@GENDER)) + N' ' + LTRIM(RTRIM(@PULPIT)) + N' -> '

                        SET @TEACHER = (SELECT TEACHER FROM INSERTED WHERE TEACHER IS NOT NULL)
                        SET @TEACHER_NAME = (SELECT TEACHER_NAME FROM INSERTED WHERE TEACHER_NAME IS NOT NULL)
                        SET @GENDER = (SELECT GENDER FROM INSERTED WHERE GENDER IS NOT NULL)
                        SET @PULPIT = (SELECT PULPIT FROM INSERTED WHERE PULPIT IS NOT NULL)
                        SET @IN = @IN + LTRIM(RTRIM(@TEACHER)) + N' ' + LTRIM(RTRIM(@TEACHER_NAME)) +
                                  N' ' + LTRIM(RTRIM(@GENDER)) + N' ' + LTRIM(RTRIM(@PULPIT))

                        INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('UPD', 'TR_TEACHER', @IN)
                    END

                IF (SELECT COUNT(*) FROM INSERTED) > 0 AND (SELECT COUNT(*) FROM DELETED) = 0
                    BEGIN
                        PRINT N'Выполнена операция INSERT'
                        SET @TEACHER = (SELECT TEACHER FROM INSERTED)
                        SET @TEACHER_NAME = (SELECT TEACHER_NAME FROM INSERTED)
                        SET @GENDER = (SELECT GENDER FROM INSERTED)
                        SET @PULPIT = (SELECT PULPIT FROM INSERTED)
                        SET @IN = LTRIM(RTRIM(@TEACHER)) + N' ' + LTRIM(RTRIM(@TEACHER_NAME)) +
                                  N' ' + LTRIM(RTRIM(@GENDER)) + N' ' + LTRIM(RTRIM(@PULPIT))
                        INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('INS', 'TR_TEACHER', @IN)
                    END

                IF (SELECT COUNT(*) FROM INSERTED) = 0 AND (SELECT COUNT(*) FROM DELETED) > 0
                    BEGIN
                        PRINT N'Выполнена операция DELETE'
                        SET @TEACHER = (SELECT TEACHER FROM DELETED)
                        SET @TEACHER_NAME = (SELECT TEACHER_NAME FROM DELETED)
                        SET @GENDER = (SELECT GENDER FROM DELETED)
                        SET @PULPIT = (SELECT PULPIT FROM DELETED)
                        SET @IN = LTRIM(RTRIM(@TEACHER)) + N' ' + LTRIM(RTRIM(@TEACHER_NAME)) +
                                  N' ' + LTRIM(RTRIM(@GENDER)) + N' ' + LTRIM(RTRIM(@PULPIT))
                        INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('DEL', 'TR_TEACHER', @IN)
                    END
            END;
----------------------------------------Task_5-----------------------------------------
ALTER TABLE TEACHER ADD CONSTRAINT PULPIT_LEN CHECK (LEN(PULPIT) <= 8);
GO

UPDATE TEACHER SET PULPIT = N'Информатика' WHERE TEACHER = N'ЕВА';

ALTER TABLE TEACHER DROP CONSTRAINT PULPIT_LEN;
----------------------------------------Task_6-----------------------------------------
    DROP TRIGGER TR_TEACHER_DEL1;
    DROP TRIGGER TR_TEACHER_DEL2;
    DROP TRIGGER TR_TEACHER_DEL3;
GO

CREATE TRIGGER TR_TEACHER_DEL1 ON TEACHER AFTER DELETE
    AS
BEGIN
    DECLARE @TEACHER nvarchar(10), @TEACHER_NAME nvarchar(100),
        @GENDER nchar(1), @PULPIT nvarchar(20), @IN nvarchar(300)

    SET @TEACHER = (SELECT TEACHER FROM DELETED)
    SET @TEACHER_NAME = (SELECT TEACHER_NAME FROM DELETED)
    SET @GENDER = (SELECT GENDER FROM DELETED)
    SET @PULPIT = (SELECT PULPIT FROM DELETED)
    SET @IN = N'Удаленный: ' + LTRIM(RTRIM(@TEACHER)) +
              N'. Имя: ' + LTRIM(RTRIM(@TEACHER_NAME)) +
              N'. Пол: ' + LTRIM(RTRIM(@GENDER)) +
              N'. Кафедра: ' + LTRIM(RTRIM(@PULPIT))

    INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('DEL', 'TR_TEACHER_DEL1', @IN)
END;
    PRINT(N'Создан TR_TEACHER_DEL1');
GO

CREATE TRIGGER TR_TEACHER_DEL2 ON TEACHER AFTER DELETE
    AS
BEGIN
    DECLARE @TEACHER nvarchar(10), @TEACHER_NAME nvarchar(100),
        @GENDER nchar(1), @PULPIT nvarchar(20), @IN nvarchar(300)

    SET @TEACHER = (SELECT TEACHER FROM DELETED)
    SET @TEACHER_NAME = (SELECT TEACHER_NAME FROM DELETED)
    SET @GENDER = (SELECT GENDER FROM DELETED)
    SET @PULPIT = (SELECT PULPIT FROM DELETED)
    SET @IN = N'Удаленный: ' + LTRIM(RTRIM(@TEACHER)) +
              N'. Имя: ' + LTRIM(RTRIM(@TEACHER_NAME)) +
              N'. Пол: ' + LTRIM(RTRIM(@GENDER)) +
              N'. Кафедра: ' + LTRIM(RTRIM(@PULPIT))

    INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('DEL', 'TR_TEACHER_DEL2', @IN)
END;
    PRINT(N'Создан TR_TEACHER_DEL2');
GO

CREATE TRIGGER TR_TEACHER_DEL3 ON TEACHER AFTER DELETE
    AS
BEGIN
    DECLARE @TEACHER nvarchar(10), @TEACHER_NAME nvarchar(100),
        @GENDER nchar(1), @PULPIT nvarchar(20), @IN nvarchar(300)

    SET @TEACHER = (SELECT TEACHER FROM DELETED)
    SET @TEACHER_NAME = (SELECT TEACHER_NAME FROM DELETED)
    SET @GENDER = (SELECT GENDER FROM DELETED)
    SET @PULPIT = (SELECT PULPIT FROM DELETED)
    SET @IN = N'Удаленный: ' + LTRIM(RTRIM(@TEACHER)) +
              N'. Имя: ' + LTRIM(RTRIM(@TEACHER_NAME)) +
              N'. Пол: ' + LTRIM(RTRIM(@GENDER)) +
              N'. Кафедра: ' + LTRIM(RTRIM(@PULPIT))

    INSERT INTO TR_AUDIT (STMT, TRNAME, CC) VALUES ('DEL', 'TR_TEACHER_DEL3', @IN)
END;
    PRINT(N'Создан TR_TEACHER_DEL3');
GO

SELECT t.name, e.type_desc
FROM sys.triggers t
         JOIN sys.trigger_events e ON t.object_id = e.object_id
WHERE OBJECT_NAME(t.parent_id) = 'TEACHER' AND e.type_desc = 'DELETE';

EXEC SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL3', @order = 'First', @stmttype = 'DELETE';
EXEC SP_SETTRIGGERORDER @triggername = 'TR_TEACHER_DEL2', @order = 'Last', @stmttype = 'DELETE';

--DELETE FROM TEACHER WHERE TEACHER = N'ЕВА';
--INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES (N'ЕВА', N'Едафьева Анастасия', N'Ж', N'ООП');

----------------------------------------Task_7-----------------------------------------
DROP TRIGGER TEACHER_TRAN;
GO

CREATE TRIGGER TEACHER_TRAN ON TEACHER AFTER INSERT, DELETE, UPDATE
    AS
BEGIN
    DECLARE @count INT = (SELECT COUNT(*) FROM TEACHER);
    IF (@count >= 9)
        BEGIN
            RAISERROR(N'Количество операций не должно превышать 9!', 10, 1);
            ROLLBACK;
        END;
    RETURN;
END;
GO

INSERT INTO TEACHER (TEACHER, TEACHER_NAME, GENDER, PULPIT) VALUES (N'ЕВА', N'Едафьева Анастасия', N'Ж', N'ООП');
----------------------------------------Task_8-----------------------------------------
DROP TRIGGER FACULTY_INSTEAD_OF;
GO

CREATE TRIGGER FACULTY_INSTEAD_OF ON FACULTY INSTEAD OF DELETE
    AS
BEGIN
    RAISERROR(N'Операция отменена', 10, 1);
    RETURN;
END;
GO

DELETE FROM FACULTY WHERE FACULTY = N'ИТ';
SELECT * FROM FACULTY;

--DROP TRIGGER TR_TEACHER_INS;
--DROP TRIGGER TR_TEACHER_DEL;
--DROP TRIGGER TR_TEACHER_UPD;
--DROP TRIGGER TR_TEACHER;
--DROP TRIGGER TR_TEACHER_DEL1;
--DROP TRIGGER TR_TEACHER_DEL2;
--DROP TRIGGER TR_TEACHER_DEL3;
--DROP TRIGGER FACULTY_INSTEAD_OF;
----------------------------------------Task_9-----------------------------------------
DROP TRIGGER DDL_UNIVER;
GO

CREATE TRIGGER DDL_UNIVER ON DATABASE FOR DDL_DATABASE_LEVEL_EVENTS
    AS
BEGIN
    DECLARE @t nvarchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'nvarchar(50)');
    DECLARE @t1 nvarchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'nvarchar(50)');
    DECLARE @t2 nvarchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'nvarchar(50)');
    PRINT N'Тип события: ' + @t;
    PRINT N'Имя объекта: ' + @t1;
    PRINT N'Тип объекта: ' + @t2;
    RAISERROR(N'Изменения с использованием триггера запрещены', 16, 1);
    ROLLBACK;
END;
GO

CREATE TABLE BUBUB
(
    ID int IDENTITY(1,1)
);
--------------------------------------Task_10----------------------------------------
-- Триггер для таблицы ЗАКАЗЧИКИ
CREATE TRIGGER TRG_ЗАКАЗЧИКИ_Адрес
    ON ЗАКАЗЧИКИ
    AFTER INSERT, UPDATE
    AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE LEN(Адрес) > 20)
        BEGIN
            RAISERROR(N'Длина адреса должна быть не более 20 символов.', 16, 1);
            ROLLBACK;
        END
END;
GO

-- Триггер для таблицы ТОВАРЫ
CREATE TRIGGER TRG_ТОВАРЫ_Количество
    ON ТОВАРЫ
    AFTER INSERT, UPDATE
    AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Количество < 0)
        BEGIN
            RAISERROR(N'Количество товара должно быть неотрицательным.', 16, 1);
            ROLLBACK;
        END
END;
GO

-- Триггер для таблицы ЗАКАЗЫ
CREATE TRIGGER TRG_ЗАКАЗЫ_Цена_продажи
    ON ЗАКАЗЫ
    AFTER INSERT, UPDATE
    AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Цена_продажи < 0)
        BEGIN
            RAISERROR(N'Цена продажи должна быть неотрицательной.', 16, 1);
            ROLLBACK;
        END
END;
GO

-- Изменение длины адреса в таблице ЗАКАЗЧИКИ
UPDATE ЗАКАЗЧИКИ SET Адрес = N'Очень длинный адрес, который превышает 20 символов' WHERE Наименование_фирмы = 'Фирма 1';

-- Добавление товара с отрицательным количеством в таблицу ТОВАРЫ
INSERT INTO ТОВАРЫ (Наименование, Цена, Количество) VALUES ('Товар 6', 9.99, -2);

-- Обновление цены продажи на отрицательное значение в таблице ЗАКАЗЫ
UPDATE ЗАКАЗЫ SET Цена_продажи = -10.00 WHERE Номер_заказа = 'Order 1';
