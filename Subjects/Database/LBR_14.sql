use UNIVER
----------------------------------------Task_1-----------------------------------------
    create function COUNT_STUDENTS (@faculty nvarchar(20))
    returns int
    as
    begin
        declare @countOfStudents int = 0;
        set @countOfStudents = (select count(IDSTUDENT) from
            GROUPS inner join FACULTY on
            GROUPS.FACULTY = FACULTY.FACULTY inner join STUDENT on
            STUDENT.IDGROUP = GROUPS.IDGROUP where GROUPS.FACULTY = @faculty);
        return @countOfStudents;
    end

    declare @countOfStudentsOnFac int = dbo.COUNT_STUDENTS(N'ХТиТ')
    print N'Количество студентов на факультете ХТиТ: ' + cast(@countOfStudentsOnFac as nvarchar)

    alter function COUNT_STUDENTS (@faculty nvarchar(20) = null, @prof varchar(20) = null) returns int
    as
    begin
        declare @countOfStudents int = 0;
        set @countOfStudents = (select count(IDSTUDENT) from
            GROUPS inner join FACULTY on
            GROUPS.FACULTY = FACULTY.FACULTY inner join STUDENT on
            STUDENT.IDGROUP = GROUPS.IDGROUP where GROUPS.FACULTY = @faculty and GROUPS.PROFESSION = isnull(@prof, GROUPS.PROFESSION));
        return @countOfStudents;
    end

    declare @countOfStudentsOnFacAndProf int = dbo.COUNT_STUDENTS(N'ИДиП', '1-40 01 02')
    print N'Количество студентов на факультете ИДиП и специальности 1-40 01 02: ' + cast(@countOfStudentsOnFacAndProf as nvarchar)

----------------------------------------Task_2-----------------------------------------

create function FSUBJECTS (@p nvarchar(20)) RETURNS nvarchar(300)
as
begin
    declare @OUT nvarchar(300) = N'Предметы: '
    declare @SUBJ nvarchar(100) = ''
    declare cur cursor local static FOR
        (select s.SUBJECT
         from SUBJECT s
         where s.PULPIT = @p)
    open cur
    fetch next from cur into @SUBJ
    while @@FETCH_STATUS = 0
        begin
            set @OUT += RTRIM(LTRIM(@SUBJ)) + ', '
            fetch next from cur into @SUBJ
        end
    close cur
    deallocate cur
    return @OUT
end;

SELECT PULPIT AS Кафедра, dbo.FSUBJECTS(PULPIT) AS Предметы
FROM PULPIT;
----------------------------------------Task_3-----------------------------------------
go
create function FFACPUL(@faculty nvarchar(20), @pulpit nvarchar(20)) returns table
    as return
    select FACULTY.FACULTY,PULPIT.PULPIT from
        FACULTY left outer join PULPIT
                                on FACULTY.FACULTY = PULPIT.FACULTY
    where FACULTY.FACULTY = isnull(@faculty,FACULTY.FACULTY)and
        PULPIT.PULPIT = isnull(@pulpit,PULPIT.PULPIT);

--DROP FUNCTION FFACPUL;

select * from dbo.FFACPUL(NULL,NULL);
select * from dbo.FFACPUL(N'ТТЛП',NULL);
select * from dbo.FFACPUL(NULL,N'ИСиТ');
select * from dbo.FFACPUL(N'ЛХ',N'ТиП');
select * from dbo.FFACPUL(N'ЛХ',N'ПИ');
----------------------------------------Task_4-----------------------------------------
go
alter function FTEACHER (@pulpit nvarchar(20)) returns int
as begin
    declare @result int = 0;
    set @result  = (select count(*) from
        TEACHER inner join PULPIT
                           on TEACHER.PULPIT = PULPIT.PULPIT
                    where PULPIT.PULPIT = isnull(@pulpit,PULPIT.PULPIT));
    return @result;
end;

select PULPIT, dbo.FTEACHER(PULPIT.PULPIT) 'Количество преподавателей' from PULPIT;
select dbo.FTEACHER(NULL) 'Всего преподавателей';
---------------------------------------Task_5_1----------------------------------------
create function COUNT_ORDERS (@Order_number nvarchar(10)) returns int
as
begin
    declare @CompanyCount int;

    select @CompanyCount = count(distinct ЗАКАЗЧИКИ.Наименование_фирмы)
    from ЗАКАЗЧИКИ
    inner join ЗАКАЗЫ on ЗАКАЗЧИКИ.Наименование_фирмы = ЗАКАЗЫ.Заказчик
    where ЗАКАЗЫ.Номер_заказа = @Order_number;

    return @CompanyCount;
end;
declare @OrderNumber nvarchar(10) = 'Order 1';

declare @CompanyCount INT;
set @CompanyCount = dbo.COUNT_ORDERS(@OrderNumber);

print N'Количество компаний принявших заказ ' + @OrderNumber + ': ' + cast(@CompanyCount as nvarchar);

ALTER FUNCTION COUNT_ORDERS
    (
        @Order_number NVARCHAR(10),
        @Order_cast REAL
        )
    RETURNS INT
    AS
    BEGIN
        DECLARE @CompanyCount INT;

        SELECT @CompanyCount = COUNT(DISTINCT ЗАКАЗЧИКИ.Наименование_фирмы)
        FROM ЗАКАЗЧИКИ
                 INNER JOIN ЗАКАЗЫ ON ЗАКАЗЧИКИ.Наименование_фирмы = ЗАКАЗЫ.Заказчик
        WHERE ЗАКАЗЫ.Номер_заказа = @Order_number
          AND ЗАКАЗЫ.Цена_продажи = @Order_cast;

        RETURN @CompanyCount;
    END;

DECLARE @OrderNumber NVARCHAR(10) = 'Order 1';
DECLARE @OrderCast REAL = 10.00;
DECLARE @CompanyCount INT;

SET @CompanyCount = dbo.COUNT_ORDERS(@OrderNumber, @OrderCast);
PRINT N'Количество компаний принявших заказ ' + @OrderNumber + N' с ценой ' + CAST(@OrderCast AS NVARCHAR) + ': ' + CAST(@CompanyCount AS NVARCHAR);
---------------------------------------Task_5_2----------------------------------------

CREATE FUNCTION FORDERS (@p nvarchar(20)) RETURNS nvarchar(300)
AS
BEGIN
    DECLARE @OUT nvarchar(300) = N'Предметы: '
    DECLARE @SUBJ nvarchar(100) = ''
    DECLARE cur CURSOR LOCAL STATIC FOR
        (
            SELECT ЗАКАЗЫ.Наименование_товара
            FROM ЗАКАЗЫ
            WHERE ЗАКАЗЫ.Заказчик = @p
            UNION
            SELECT ТОВАРЫ.Наименование
            FROM ТОВАРЫ
            WHERE ТОВАРЫ.Наименование = @p
        )
    OPEN cur
    FETCH NEXT FROM cur INTO @SUBJ
    WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @OUT += RTRIM(LTRIM(@SUBJ)) + ', '
            FETCH NEXT FROM cur INTO @SUBJ
        END
    CLOSE cur
    DEALLOCATE cur
    RETURN @OUT
END;
GO

SELECT Наименование_фирмы AS Фирма, dbo.FORDERS(Наименование_фирмы) AS Предметы
FROM ЗАКАЗЧИКИ;

SELECT Наименование AS Товар, dbo.FORDERS(Наименование) AS Предметы
FROM ТОВАРЫ;

SELECT Номер_заказа AS Заказ, dbo.FORDERS(Заказчик) AS Предметы
FROM ЗАКАЗЫ;
---------------------------------------Task_5_3----------------------------------------
CREATE FUNCTION FORDER(@faculty nvarchar(20), @pulpit nvarchar(20)) RETURNS TABLE
    AS
    RETURN
    SELECT ЗАКАЗЧИКИ.Наименование_фирмы AS Фирма, ЗАКАЗЫ.Наименование_товара AS Товар
    FROM ЗАКАЗЧИКИ
             LEFT OUTER JOIN ЗАКАЗЫ ON ЗАКАЗЧИКИ.Наименование_фирмы = ЗАКАЗЫ.Заказчик
    WHERE ЗАКАЗЧИКИ.Наименование_фирмы = ISNULL(@faculty, ЗАКАЗЧИКИ.Наименование_фирмы)
      AND ЗАКАЗЫ.Наименование_товара = ISNULL(@pulpit, ЗАКАЗЫ.Наименование_товара);

SELECT * FROM dbo.FORDER(NULL, NULL);
SELECT * FROM dbo.FORDER(N'Фирма 1', NULL);
SELECT * FROM dbo.FORDER(NULL, N'Product 1');
SELECT * FROM dbo.FORDER(N'Фирма 2', N'Product 2');
SELECT * FROM dbo.FORDER(N'Фирма 3', N'Product 3');
---------------------------------------Task_5_4----------------------------------------
    create FUNCTION FCOMPANY (@pulpit nvarchar(20)) RETURNS int
    AS
    BEGIN
        DECLARE @result int = 0;
        SET @result = (
            SELECT COUNT(*)
            FROM ЗАКАЗЧИКИ
            WHERE ЗАКАЗЧИКИ.Адрес = ISNULL(@pulpit, ЗАКАЗЧИКИ.Адрес)
        );
        RETURN @result;
    END;

SELECT Наименование_фирмы, dbo.FCOMPANY(Адрес) AS 'Количество заказчиков' FROM ЗАКАЗЧИКИ;
SELECT dbo.FCOMPANY(NULL) AS 'Всего заказчиков';
----------------------------------------Task_6-----------------------------------------
create function COUNT_PULPITS (@FACULTY nvarchar(20)) returns int
as begin
    declare @COUNT int = (select count(PULPIT) from PULPIT where FACULTY = isnull(@FACULTY, FACULTY))
    return @COUNT
end

create function COUNT_GROUPS (@FACULTY nvarchar(20)) returns int
as begin
    declare @COUNT int = (select count(IDGROUP) from GROUPS where FACULTY = isnull(@FACULTY, FACULTY))
    return @COUNT
end

create function COUNT_PROFESSIONS (@FACULTY nvarchar(20)) returns int
as begin
    declare @COUNT int =  (select count(PROFESSION) from PROFESSION where FACULTY = isnull(@FACULTY, FACULTY))
    return @COUNT
end

alter function FACULTY_REPORT(@c int) returns @fr table
                                                   ([Факультет] nvarchar(50), [Кол-во кафедр] int, [Кол-во групп] int, [Кол-во студентов] int, [Кол-во профессий] int)
as begin
    declare @f nvarchar(30);
    declare cc CURSOR static for
        select FACULTY from FACULTY
        where  dbo.COUNT_STUDENTS(FACULTY, default) > @c;

    open cc;
    fetch cc into @f;
    while @@fetch_status = 0
        begin
            insert @fr values(@f,  dbo.COUNT_PULPITS(@f),
                              dbo.COUNT_GROUPS(@f),   dbo.COUNT_STUDENTS(@f, default),
                              dbo.COUNT_PROFESSIONS(@f));
            fetch cc into @f;
        end;
    return;
end;


select * from FACULTY_REPORT(0)