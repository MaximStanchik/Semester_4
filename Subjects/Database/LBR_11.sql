use UNIVER
----------------------------------------Task_1-----------------------------------------

declare Cursor_1 cursor for select SUBJECT.SUBJECT_NAME from SUBJECT where SUBJECT.PULPIT like N'ИСиТ';

declare @Subject nchar(35), @FinalResult nchar(500) = '';

open Cursor_1;
fetch Cursor_1 into @Subject;
print N'Дисциплины кафедр ИСиТ';
while @@FETCH_STATUS = 0
    begin
        set @FinalResult = RTRIM(@Subject) +', ' +  @FinalResult;
        FETCH Cursor_1 into @Subject;
    end;
print @FinalResult;
close Cursor_1;

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA = 'dbo';

----------------------------------------Task_2-----------------------------------------
-----локальный:
declare Cursor_2 cursor local for select GROUPS.IDGROUP from GROUPS

declare @IdGroupNumber int, @FinalResultOfIdGroups nchar(500) = '';

open Cursor_2;
fetch Cursor_2 into @IdGroupNumber;
print N'Все группы';
while @@FETCH_STATUS = 0
    begin
        set @FinalResultOfIdGroups = RTRIM(@IdGroupNumber) +', ' +  @FinalResultOfIdGroups;
        FETCH Cursor_2 into @IdGroupNumber;
    end;
print @FinalResultOfIdGroups;
close Cursor_2;

-----глобальный:
declare GlobalCursor_2 cursor global for select GROUPS.IDGROUP from GROUPS

declare @IdGroupNumber int, @FinalResultOfIdGroups nchar(500) = '';

open GlobalCursor_2;
fetch GlobalCursor_2 into @IdGroupNumber;
print N'Все группы';
while @@FETCH_STATUS = 0
    begin
        set @FinalResultOfIdGroups = RTRIM(@IdGroupNumber) +', ' +  @FinalResultOfIdGroups;
        FETCH GlobalCursor_2 into @IdGroupNumber;
    end;
print @FinalResultOfIdGroups;
close GlobalCursor_2;
deallocate GlobalCursor_2;
----------------------------------------Task_3-----------------------------------------
-----статический:
declare Cursor_3_Static cursor local static for select MyTable.ID from MyTable

declare @IdGroupNumber int, @FinalResultOfIdGroups nchar(500) = '';

open Cursor_3_Static;
fetch Cursor_3_Static into @IdGroupNumber;
INSERT INTO MyTable (ID, Name)
VALUES (12, N'PONCHIK')
print N'Все группы';
while @@FETCH_STATUS = 0
    begin
        set @FinalResultOfIdGroups = RTRIM(@IdGroupNumber) +', ' +  @FinalResultOfIdGroups;
        FETCH Cursor_3_Static into @IdGroupNumber;
    end;
print @FinalResultOfIdGroups;
close Cursor_3_Static;

select * from MyTable

-----динамический:
declare Cursor_3_Dynamic cursor local dynamic for select MyTable.ID from MyTable

declare @IdGroupNumber int, @FinalResultOfIdGroups nchar(500) = '';

open Cursor_3_Dynamic;
fetch Cursor_3_Dynamic into @IdGroupNumber;
INSERT INTO MyTable (ID, Name)
VALUES (13, N'DESSERT')
print N'Все группы';
while @@FETCH_STATUS = 0
    begin
        set @FinalResultOfIdGroups = RTRIM(@IdGroupNumber) +', ' +  @FinalResultOfIdGroups;
        FETCH Cursor_3_Dynamic into @IdGroupNumber;
    end;
print @FinalResultOfIdGroups;
close Cursor_3_Dynamic;

----------------------------------------Task_4-----------------------------------------

DECLARE @number varchar(100), @sub varchar(10), @idstudent varchar(6), @pdate varchar (11), @note varchar (2);
DECLARE PROGRESS_CURSOR_SCROLL CURSOR LOCAL DYNAMIC SCROLL
    for select ROW_NUMBER() over (order by IDSTUDENT) Номер, * from PROGRESS;
select ROW_NUMBER() over (order by IDSTUDENT) Номер, * from PROGRESS;
OPEN PROGRESS_CURSOR_SCROLL
FETCH PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print N'Первая выбранная строка: ' + CHAR(10) +
      N'Номер записи: '+ rtrim(@number)  +
      N'. Дисциплина: '+ rtrim(@sub) +
      N'. ID студента: ' + rtrim(@idstudent) +
      N'. Дата экзамена: '  + rtrim(@pdate) +
      N'. Оценка: ' + rtrim(@note);

FETCH LAST from PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print N'Последняя строка: ' + CHAR(10) +
      N'Номер записи: '+ rtrim(@number)  +
      N'. Дисциплина: '+ rtrim(@sub) +
      N'. ID студента: ' + rtrim(@idstudent) +
      N'. Дата экзамена: '  + rtrim(@pdate) +
      N'. Оценка: ' + rtrim(@note);

FETCH RELATIVE -1  from PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print N'Первая до предыдущей строка: ' + CHAR(10) +
      N'Номер записи: '+ rtrim(@number)  +
      N'. Дисциплина: '+ rtrim(@sub) +
      N'. ID студента: ' + rtrim(@idstudent) +
      N'. Дата экзамена: '  + rtrim(@pdate) +
      N'. Оценка: ' + rtrim(@note);

FETCH ABSOLUTE 2  from PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print N'Вторая с начала строка: ' + CHAR(10) +
      N'Номер записи: '+ rtrim(@number)  +
      N'. Дисциплина: '+ rtrim(@sub) +
      N'. ID студента: ' + rtrim(@idstudent) +
      N'. Дата экзамена: '  + rtrim(@pdate) +
      N'. Оценка: ' + rtrim(@note);

FETCH RELATIVE 1  from PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print N'Первая после предыдущей строка: ' + CHAR(10) +
      N'Номер записи: '+ rtrim(@number)  +
      N'. Дисциплина: '+ rtrim(@sub) +
      N'. ID студента: ' + rtrim(@idstudent) +
      N'. Дата экзамена: '  + rtrim(@pdate) +
      N'. Оценка: ' + rtrim(@note);

FETCH ABSOLUTE -3  from PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print N'Третья с конца строка: ' + CHAR(10) +
      N'Номер записи: '+ rtrim(@number)  +
      N'. Дисциплина: '+ rtrim(@sub) +
      N'. ID студента: ' + rtrim(@idstudent) +
      N'. Дата экзамена: '  + rtrim(@pdate) +
      N'. Оценка: ' + rtrim(@note);
close PROGRESS_CURSOR_SCROLL

----------------------------------------Task_5-----------------------------------------

DECLARE @id int, @name nvarchar(50);

DECLARE myCursor CURSOR FOR SELECT ID, Name FROM MyTable;

OPEN myCursor;
FETCH NEXT FROM myCursor INTO @id, @name;

WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @id = 7
            BEGIN
                UPDATE MyTable
                SET Name = 'Updated Name'
                WHERE CURRENT OF myCursor;
            END
        IF @id = 4
            BEGIN
                DELETE FROM MyTable
                WHERE CURRENT OF myCursor;
            END
        FETCH NEXT FROM myCursor INTO @id, @name;
    END

CLOSE myCursor;
DEALLOCATE myCursor;

select * from MyTable
----------------------------------------Task_6------------------------------------------

DECLARE newCursor cursor local dynamic
    for SELECT STUDENT.NAME, GROUPS.PROFESSION, PROGRESS.NOTE
        from STUDENT inner join GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP inner join
             PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT;

DECLARE @name varchar(300), @profession varchar(300), @mark varchar(2), @list varchar(400);

OPEN newCursor;
fetch newCursor into @name,@profession,@mark;
if(@mark < 4)
    begin
        DELETE PROGRESS where CURRENT OF newCursor;
    end;
print @name + ' - '+ @profession + ' - ' + @mark ;
While (@@FETCH_STATUS = 0)
    begin
        fetch newCursor into @name,@profession,@mark;
        print @name + '  '+ @profession + '  ' + @mark ;
        if(@mark < 4)
            begin
                DELETE PROGRESS where CURRENT OF newCursor;
            end;
    end;
CLOSE newCursor;  ---- fetch_status, cursor_status, cursor_rows, типы курсоров все знать, 
---------------------------------------Task_7_1-----------------------------------------

declare Cursor_11 cursor for select Company.Наименование from COMPANY where Company.WorkerID like N'1';

declare @NameOfCompany nchar(35), @FinalResult nchar(500) = '';

open Cursor_11;
fetch Cursor_11 into @NameOfCompany;
print N'Компании';
while @@FETCH_STATUS = 0
    begin
        set @FinalResult = RTRIM(@NameOfCompany) +', ' +  @FinalResult;
        FETCH Cursor_11 into @NameOfCompany;
    end;
print @FinalResult;
close Cursor_11;

---------------------------------------Task_7_2-----------------------------------------
-----локальный:
declare Cursor_22 cursor local for select Company.Наименование from COMPANY where Company.WorkerID like N'1';

declare @NameOfCompany nchar(35), @FinalResult nchar(500) = '';

open Cursor_22;
fetch Cursor_22 into @NameOfCompany;
print N'Компании';
while @@FETCH_STATUS = 0
    begin
        set @FinalResult = RTRIM(@NameOfCompany) +', ' +  @FinalResult;
        FETCH Cursor_22 into @NameOfCompany;
    end;
print @FinalResult;
close Cursor_22;

-----глобальный:
declare GlobalCursor_22 cursor global for select GROUPS.IDGROUP from GROUPS

declare @NameOfCompany nchar(35), @FinalResult nchar(500) = '';

open GlobalCursor_22;
fetch GlobalCursor_22 into @NameOfCompany;
print N'Компании';
while @@FETCH_STATUS = 0
    begin
        set @FinalResult = RTRIM(@NameOfCompany) +', ' +  @FinalResult;
        FETCH GlobalCursor_22 into @NameOfCompany;
    end;
print @FinalResult;
close GlobalCursor_22;
deallocate GlobalCursor_22;

---------------------------------------Task_7_3-----------------------------------------
-----статический:
declare Cursor_33_Static cursor local for select Company.Наименование from COMPANY;

declare @NameOfCompany nchar(35), @FinalResult nchar(500) = '';

open Cursor_33_Static;
fetch Cursor_33_Static into @NameOfCompany ;
INSERT INTO Company (Наименование, Worker, WorkerID)
VALUES ('Company 20', 'Ivan1337', '90')
print N'Все компании';
while @@FETCH_STATUS = 0
    begin
        set @FinalResult = RTRIM(@NameOfCompany) +', ' +  @FinalResult;
        FETCH Cursor_33_Static into @NameOfCompany;
    end;
print @FinalResult;
close Cursor_33_Static;

select * from Company

-----динамический:
declare Cursor_33_Dynamic cursor dynamic for select Company.Наименование from COMPANY;

declare @NameOfCompany nchar(35), @FinalResult nchar(500) = '';

open Cursor_33_Dynamic;
fetch Cursor_33_Dynamic into @NameOfCompany ;
INSERT INTO Company (Наименование, Worker, WorkerID)
VALUES ('Company 40', 'Ivan1337', '60')
print N'Все компании';
while @@FETCH_STATUS = 0
    begin
        set @FinalResult = RTRIM(@NameOfCompany) +', ' +  @FinalResult;
        FETCH Cursor_33_Dynamic into @NameOfCompany;
    end;
print @FinalResult;
close Cursor_33_Dynamic;
deallocate Cursor_33_Dynamic;

select * from Company

---------------------------------------Task_7_4-----------------------------------------
DECLARE @Наименование nvarchar(20), @Worker nvarchar(10), @WorkerID nvarchar(10);

DECLARE myCursor CURSOR SCROLL FOR
    SELECT Наименование, Worker, WorkerID
    FROM COMPANY;

OPEN myCursor;

FETCH FIRST FROM myCursor INTO @Наименование, @Worker, @WorkerID;
print N'Первая выбранная компания: ' + CHAR(10) +
      N'   Компания: '+ rtrim(@Наименование)  +
      N'   Работник: '+ rtrim(@Worker)  +
      N'   ID работника: '+ rtrim(@WorkerID);

FETCH LAST FROM myCursor INTO @Наименование, @Worker, @WorkerID;
print N'   Последняя выбранная компания: ' + CHAR(10) +
      N'   Компания: '+ rtrim(@Наименование)  +
      N'   Работник: '+ rtrim(@Worker)  +
      N'   ID работника: '+ rtrim(@WorkerID);

FETCH RELATIVE -1 FROM myCursor INTO @Наименование, @Worker, @WorkerID;
print N'   Первая до предыдущей строка: ' + CHAR(10) +
      N'   Компания: '+ rtrim(@Наименование)  +
      N'   Работник: '+ rtrim(@Worker)  +
      N'   ID работника: '+ rtrim(@WorkerID);

FETCH ABSOLUTE 2 FROM myCursor INTO @Наименование, @Worker, @WorkerID;
print N'   Вторая с начала строка: ' + CHAR(10) +
      N'   Компания: '+ rtrim(@Наименование)  +
      N'   Работник: '+ rtrim(@Worker)  +
      N'   ID работника: '+ rtrim(@WorkerID);

FETCH RELATIVE 1 FROM myCursor INTO @Наименование, @Worker, @WorkerID;
print N'   Первая после предыдущей строка: ' + CHAR(10) +
      N'   Компания: '+ rtrim(@Наименование)  +
      N'   Работник: '+ rtrim(@Worker)  +
      N'   ID работника: '+ rtrim(@WorkerID);

FETCH ABSOLUTE -3 FROM myCursor INTO @Наименование, @Worker, @WorkerID;
print N'   Первая после предыдущей строка: ' + CHAR(10) +
      N'   Компания: '+ rtrim(@Наименование)  +
      N'   Работник: '+ rtrim(@Worker)  +
      N'   ID работника: '+ rtrim(@WorkerID);

close myCursor;
---------------------------------------Task_7_5-----------------------------------------

DECLARE @name nvarchar(20), @worker nvarchar(20), @workerID nvarchar(20);

DECLARE myCursor_2 CURSOR FOR SELECT Наименование, Worker, WorkerID FROM COMPANY;

OPEN myCursor_2;
FETCH NEXT FROM myCursor_2 INTO @name, @worker, @workerID;

WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @workerID = '5'
            BEGIN
                UPDATE COMPANY
                SET Наименование = 'Updated Name'
                WHERE CURRENT OF myCursor_2;
            END
        IF @workerID = '6'
            BEGIN
                DELETE FROM COMPANY
                WHERE CURRENT OF myCursor_2;
            END
        FETCH NEXT FROM myCursor_2 INTO @name, @worker, @workerID;
    END

CLOSE myCursor_2;
DEALLOCATE myCursor_2;

select * from COMPANY
---------------------------------------Task_7_6-----------------------------------------
DECLARE @id int, @name nvarchar(20), @worker nvarchar(10), @workerID nvarchar(10);

DECLARE myCursor_333 CURSOR FOR
    SELECT Наименование, Worker, WorkerID
    FROM COMPANY
    WHERE WorkerID = '8';

OPEN myCursor_333;
FETCH NEXT FROM myCursor_333 INTO @name, @worker, @workerID;

WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @id = CONVERT(int, @workerID) + 1;

        UPDATE COMPANY
        SET WorkerID = CONVERT(nvarchar(10), @id)
        WHERE CURRENT OF myCursor_333;

        FETCH NEXT FROM myCursor_333 INTO @name, @worker, @workerID;
    END

CLOSE myCursor_333;
DEALLOCATE myCursor_333;

select * from COMPANY