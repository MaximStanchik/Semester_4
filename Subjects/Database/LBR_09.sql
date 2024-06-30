use UNIVER

----------------------------------------Task_1-----------------------------------------

declare
    @ch char(1) = 'A',
    @va varchar(4) = 'BSTU',
    @da datetime,
    @ti time,
    @in int,
    @sm smallint,
    @ty tinyint,
    @nu numeric(12, 5)

set @da = '2024-02-05 11:02:56';
set @ti = '11:03:00';
set @in = 4000;

select @sm = 1000, @ty = 50, @nu = 123.45678;

print N'Значение переменной @ch: ' + @ch;
print N'Значение переменной @va: ' + @va;
print N'Значение переменной @da: ' + cast(@da as varchar(25));
print N'Значение переменной @ti: ' + cast(@ti as varchar(20));
print N'Значение переменной @in: ' + cast(@in as varchar(10));

select @sm [smallint], @ty [tinyint], @nu [numeric];

----------------------------------------Task_2-----------------------------------------

    select * from AUDITORIUM
declare @totalClassroomCapacity integer = (select sum (AUDITORIUM_CAPACITY) from AUDITORIUM),
    @countOfAuditoriums integer,
    @averageClassroomCapacity float,
    @countOfAuditoriumsWithLowCapacity integer,
	@percentOfAuditoriumsWithLowCapacity numeric (12,5);


if @totalClassroomCapacity > 200
begin
    SELECT @countOfAuditoriums = (SELECT COUNT(*) FROM AUDITORIUM)
    SELECT @averageClassroomCapacity = (SELECT AVG(AUDITORIUM_CAPACITY) FROM AUDITORIUM)
    SELECT @countOfAuditoriumsWithLowCapacity = (SELECT COUNT(*) FROM AUDITORIUM WHERE AUDITORIUM_CAPACITY <  @averageClassroomCapacity)
    SELECT @percentOfAuditoriumsWithLowCapacity = CAST(@countOfAuditoriumsWithLowCapacity as float) / CAST(@countOfAuditoriums as float)

    print N'Количество аудиторий: ' + cast(@countOfAuditoriums as varchar(20));
    print N'Средняя вместимость аудиторий: ' + cast(@averageClassroomCapacity as varchar(20));
    print N'Количество аудиторий, вместимость которых меньше средней: ' + cast(@countOfAuditoriumsWithLowCapacity as varchar(20));
    print N'Процент аудиторий, вместимость которых меньше средней: ' + cast(@percentOfAuditoriumsWithLowCapacity * 100 as varchar(20)) + '%';
end
else
print N'Размер общей вместимости: ' + cast(@totalClassroomCapacity as varchar(20));

----------------------------------------Task_3-----------------------------------------

print N'Число обработанных строк: ' + cast(@@rowcount as varchar(10));
print N'Версия SQL Server: ' + cast(@@version as varchar(25));
print N'Системный идентификатор процесса, назначенный сервером текущему подключению: ' + cast(@@spid as varchar(20));
print N'Код последней ошибки: ' + cast(@@error as varchar(10));
print N'Имя сервера: ' + cast(@@servername as varchar(20));
print N'Уровень вложенности транзакции: ' + cast(@@trancount as varchar(20));
print N'Проверка результата считывания строк результирующего набора: ' + cast(@@FETCH_STATUS as varchar(20));
print N'Уровень вложенности текущей процедуры: ' + cast(@@NESTLEVEL as varchar(20));


----------------------------------------Task_4_1-----------------------------------------

declare @z numeric(5, 3), @t float, @x float
set @t = 1
set @x = 1.2

if (@t > @x)
    set @z = sin(@t) * sin(@t)
else if (@t < @x)
    set @z = 4 * (@t + @x)
else
    set @z = 1 - exp(@x - 2)

print 'z = ' + cast(@z as char)

----------------------------------------Task_4_2-----------------------------------------

declare @full_name nvarchar(100) = N'Станчик Максим Андреевич';
set @full_name = (select substring(@full_name, 1, charindex(' ', @full_name)) +
                         substring(@full_name, charindex(' ', @full_name)+1, 1) + '.' +
                         substring(@full_name, charindex(' ', @full_name, charindex(' ', @full_name)+1)+1,1)+'.');
print @full_name;

----------------------------------------Task_4_3-----------------------------------------

declare @next_month int = month(getdate()) + 1;
select * from STUDENT where month(STUDENT.BDAY) = @next_month;

----------------------------------------Task_4_4-----------------------------------------
select * from PROGRESS
select * from STUDENT

DECLARE @GroupID INT
SET @GroupID = 6
SELECT @GroupID as [Номер группы], CASE
           WHEN DATEPART(weekday, PDATE) = 1 THEN N'Понедельник'
           WHEN DATEPART(weekday, PDATE) = 2 THEN N'Вторник'
           WHEN DATEPART(weekday, PDATE) = 3 THEN N'Среда'
           WHEN DATEPART(weekday, PDATE) = 4 THEN N'Четверг'
           WHEN DATEPART(weekday, PDATE) = 5 THEN N'Пятница'
           WHEN DATEPART(weekday, PDATE) = 6 THEN N'Суббота'
           WHEN DATEPART(weekday, PDATE) = 7 THEN N'Воскресенье'
           END AS ExamDayOfWeek
FROM PROGRESS
WHERE SUBJECT = N'БД' AND IDSTUDENT IN (SELECT IDSTUDENT FROM STUDENT WHERE IDGROUP = @GroupID)

----------------------------------------Task_5-----------------------------------------

select * from STUDENT
declare @students smallint;
set @students = (select count(*) from STUDENT);
if @students > 40 begin
    print N'Количество студентов превышает 40'
end
else if @students = 40 begin
    print N'Количество студентов равно 40'
end
else begin
    print N'Количество студентов меньше 40'
end

----------------------------------------Task_6-----------------------------------------

select * from FACULTY
SELECT CASE
           WHEN NOTE BETWEEN 9 AND 10 THEN N'Отлично'
           WHEN NOTE BETWEEN 6 AND 8 THEN N'Хорошо'
           WHEN NOTE BETWEEN 4 AND 5 THEN N'Средне'
           ELSE N'Не сдано'
           END NOTE, count(*) [Notes]
FROM PROGRESS JOIN STUDENT
ON  PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT JOIN GROUPS
ON STUDENT.IDGROUP = GROUPS.IDGROUP
WHERE FACULTY = N'ИДиП'
GROUP BY CASE
             WHEN NOTE BETWEEN 9 AND 10 THEN N'Отлично'
             WHEN NOTE BETWEEN 6 AND 8 THEN N'Хорошо'
             WHEN NOTE BETWEEN 4 AND 5 THEN N'Средне'
             ELSE N'Не сдано'
             END ORDER BY NOTE DESC;

----------------------------------------Task_7-----------------------------------------

    create table #EXAMPLE_TABLE (
        randomIntValue integer,
        string nvarchar(10),
        currentDateAndTime datetime
    )
    declare @i int = 0;
    while (@i < 10)
    begin
        insert into #EXAMPLE_TABLE (randomIntValue, string, currentDateAndTime) values (floor(300 * rand()),replicate('s', @i + 1),GETDATE())
        SET @i = @i + 1;
    end
    select * from #EXAMPLE_TABLE
DELETE FROM #EXAMPLE_TABLE
drop table #EXAMPLE_TABLE

----------------------------------------Task_8-----------------------------------------
DECLARE @X INTEGER = 0
PRINT @x + 1
PRINT @x + 2
RETURN
PRINT @x + 3

----------------------------------------Task_9-----------------------------------------
select * from STUDENT
declare @studentName nvarchar(50) = N'Хартанович Екатерина Александровна';
begin try
select * from STUDENT where STUDENT.NAME = @studentName
end try

begin catch
    print N'Код последней ошибки: ' + ERROR_NUMBER ();
    print N'Сообщение об ошибке: ' + ERROR_MESSAGE ();
    print N'Номер строки с ошибкой' + ERROR_LINE ();
    print N'Имя процедуры или NULL' + ERROR_PROCEDURE ();
    print N'Уровень серьезности ошибки' + ERROR_SEVERITY ();
    print N'Метка ошибки' + ERROR_STATE ();
end catch