
use UNIVER
----------------------------------------Task_1-----------------------------------------
select * from SUBJECT

create procedure PSUBJECT
as
begin
    select SUBJECT.SUBJECT as [код], SUBJECT.SUBJECT_NAME as [дисциплина], SUBJECT.PULPIT as [кафедра] from SUBJECT
    declare @numberOfLines int = (select count(*) from SUBJECT);
    return @numberOfLines;
end

declare @numberOfLinesInProcedure int = 0;
execute @numberOfLinesInProcedure = PSUBJECT

print N'Количество строк: ' + cast(@numberOfLinesInProcedure as varchar(100));
----------------------------------------Task_2-----------------------------------------
alter procedure PSUBJECT @p nvarchar(20) = NULL, @c int output
as
begin
    select SUBJECT.SUBJECT as [код], SUBJECT.SUBJECT_NAME as [дисциплина], SUBJECT.PULPIT as [кафедра] from SUBJECT where SUBJECT.SUBJECT = @p
    set @c = (select count(*) from SUBJECT);
    return @c;
end

declare @numberOfLinesInPSUBJECT int = 0;
exec PSUBJECT @p = N'БД', @c = @numberOfLinesInPSUBJECT output;

print N'Количество строк: ' + cast(@numberOfLinesInPSUBJECT as varchar(100));

----------------------------------------Task_3-----------------------------------------
    create table #SUBJECTS
    (
        s1 nchar(10) not null,
        s2 nvarchar(100) not null,
        s3 nchar(20) not null
    );

    alter procedure PSUBJECT @p nvarchar(20) = NULL
    as
    begin
        select SUBJECT.SUBJECT as s1, SUBJECT.SUBJECT_NAME as s2, SUBJECT.PULPIT as s3 from SUBJECT where SUBJECT.SUBJECT = @p
    end

    insert into #SUBJECTS (s1, s2, s3) execute PSUBJECT N'БД'
    select * from #SUBJECTS
----------------------------------------Task_4-----------------------------------------
    alter procedure PAUDITORIUMINSERT @a nchar(20), @n nvarchar(50), @c int = 0, @t nchar(10)
    as
        begin
        begin try
        insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE) values (@a, @n, @c, @t);
        return 1;
        end try
        begin catch
            print N'Возникла ошибка!';
            print N'Номер ошибки: ' + cast(error_number() as varchar(20));
            print N'Сообщение: ' + error_message();
            print N'Уровень: ' + cast(error_severity() as varchar(20));
            print N'Метка: ' + cast (error_state() as varchar(20));
            print N'Номер строки: ' + cast(error_line() as varchar(20));

            if error_procedure() is not null
            print N'Имя процедуры: ' + error_procedure();

        return -1;
        end catch
        end

    DECLARE @rc INT;

        EXECUTE @rc = PAUDITORIUMINSERT
                      @a = N'405-4',
                      @n = N'405-4',
                      @c = 65,
                      @t = N'ËÊ';

        PRINT N'Номер ошибки: ' + CAST(@rc AS VARCHAR(20));

        select * from AUDITORIUM
----------------------------------------Task_5-----------------------------------------
                          select SUBJECT.PULPIT from SUBJECT
go
alter procedure SUBJECT_REPORT @p nchar(10)
as
declare @rc int = 0;
DECLARE @subject nchar(35), @subjects nchar(500) = '';
begin try
    DECLARE discpipline CURSOR for select SUBJECT.SUBJECT_NAME from SUBJECT where SUBJECT.PULPIT = @p;
    OPEN discpipline;
    FETCH discpipline into @subject;
    print N'Дисциплины кафедры ' + @p + ':';
    while @@FETCH_STATUS = 0
        begin
            set @subjects = RTRIM(@subject) +', ' +  @subjects;
            set @rc = @rc + 1;
            FETCH  discpipline into @subject;
        end;
    print @subjects;
    CLOSE discpipline;

    if(@rc = 0)
        begin
            raiserror(N'Ошибка в параметрах', 11, 1);
            return -1;
        end;

    else
        begin
            return @rc;
        end;
end try

begin catch
    print N'Ошибка: ' + cast(error_number() as varchar(6));
    print N'Сообщение: ' + error_message();
    return -1;
end catch;
go
declare @res2 int;
    exec @res2 = SUBJECT_REPORT @p= N'ТЛ';
    print N'Количество дисциплин кафедры: ' + cast(@res2 as varchar(10));

    deallocate  discpipline;
----------------------------------------Task_6-----------------------------------------

    alter procedure PAUDITORIUM_INSERTX @a nchar(20), @n nvarchar(50), @c int = 0, @t nchar(10), @tn nvarchar(50)
    as
    begin

        begin try
            set transaction isolation level serializable;
            insert into AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME) values (@t, @tn);
            execute PAUDITORIUM_INSERT @a=@a,@n=@n,@c=@c,@t=@t;
            commit;
            return 1;
        end try

        begin catch
            print N'Возникла ошибка!';
            print N'Номер ошибки: ' + cast(error_number() as varchar(20));
            print N'Сообщение: ' + error_message();
            print N'Уровень: ' + cast(error_severity() as varchar(20));
            print N'Метка: ' + cast (error_state() as varchar(20));
            print N'Номер строки: ' + cast(error_line() as varchar(20));

            if error_procedure() is not null
            print N'Имя процедуры: ' + error_procedure();
            return -1;
        end catch

    end

    declare @paud int = 0;
        execute @paud = PAUDITORIUM_INSERTX @a='993-1',@n='993-1',@c=99,@t=N'ЛБ-К', @tn = N'Компьютерный класс с макбуками';
    select * from AUDITORIUM

        delete AUDITORIUM where AUDITORIUM_NAME='993-1';
---------------------------------------Task_7_1----------------------------------------
select * from Company

create procedure PCOMPANY
as
begin
    select Company.Наименование as [Название], Company.Worker as [Работник], Company.WorkerID as [Идентификатор работника] from Company;
    declare @numberOfLInes int = (select count(*) from Company);
    return @numberOfLines;
end

declare @numberOfLinesInPCOMPANY int = 0;
execute @numberOfLinesInPCOMPANY = PCOMPANY;

print N'Количество строк: ' + cast(@numberOfLinesInPCOMPANY as nvarchar(100));

---------------------------------------Task_7_2----------------------------------------
alter procedure PCOMPANY @p nvarchar(20) = NULL, @c int output
as
begin
    select Company.Наименование as [Название], Company.Worker as [Работник], Company.WorkerID as [Идентификатор работника] from Company where Company.Наименование = @p;
    set @c = (select count(*) from Company where Company.Наименование = @p);
    return @c;
end

declare @numberOfLinesInPCOMPANY int = 0;
execute PCOMPANY @p = N'Company 20', @c = @numberOfLinesInPCOMPANY output;

print N'Количество строк: ' + cast(@numberOfLinesInPCOMPANY as nvarchar(20));
---------------------------------------Task_7_3----------------------------------------
    create table #COMPANY
    (
        s1 nvarchar(20) primary key,
        s2 nvarchar(10),
        s3 nvarchar(10)
    );

    alter procedure PCOMPANY @p nvarchar(20) = NULL
    as
    begin
        select Company.Наименование as s1, Company.Worker as s2, Company.WorkerID as s3 from Company where Company.Наименование = @p;
    end

insert into #COMPANY (s1, s2, s3) execute PCOMPANY N'Company 20'

select * from #COMPANY
---------------------------------------Task_7_4----------------------------------------
    create procedure PACOMPANY_INSERT @a nvarchar(20), @n nvarchar(10), @c nvarchar(10) = NULL
    as
    begin
        begin try
            insert into COMPANY (Наименование, Worker, WorkerID) values (@a, @n, @c);
            return 1;
        end try
        begin catch
            print N'Возникла ошибка!';
            print N'Номер ошибки: ' + cast(error_number() as varchar(20));
            print N'Сообщение: ' + error_message();
            print N'Уровень: ' + cast(error_severity() as varchar(20));
            print N'Метка: ' + cast (error_state() as varchar(20));
            print N'Номер строки: ' + cast(error_line() as varchar(20));

            if error_procedure() is not null
            print N'Имя процедуры: ' + error_procedure();

            return -1;
        end catch
    end

    DECLARE @rc INT;

        EXECUTE @rc = PACOMPANY_INSERT
                      @a = N'Company 61',
                      @n = N'Natalia',
                      @c = 123;

        PRINT N'Номер ошибки: ' + CAST(@rc AS NVARCHAR(20));

    select * from Company
---------------------------------------Task_7_5----------------------------------------
CREATE PROCEDURE NAME_REPORT
@p nvarchar(10)
AS
BEGIN
    DECLARE @CompanyList nvarchar(max) = ''
    DECLARE @RowCount int = 0

    IF EXISTS (SELECT 1 FROM COMPANY WHERE Worker = @p)
        BEGIN
            SELECT @CompanyList += RTRIM(Наименование) + ', '
            FROM COMPANY
            WHERE Worker = @p

            SET @RowCount = (SELECT COUNT(*) FROM COMPANY WHERE Worker = @p)

            SET @CompanyList = LEFT(@CompanyList, LEN(@CompanyList) - 1) -- Удаление последней запятой
            PRINT @CompanyList
        END
    ELSE
        BEGIN
            RAISERROR(N'Ошибка в параметрах', 11, 1)
        END

    RETURN @RowCount
END

DECLARE @Count int
    EXEC @Count = NAME_REPORT @p = N'Ivan1337'
    PRINT N'Количество компаний: ' + CAST(@Count AS nvarchar)
---------------------------------------Task_7_6----------------------------------------
    go
    create table CompanyInfo (
    Company nvarchar(20),
    Name nvarchar(10),
    Adress nvarchar(50)
)

        go
        alter procedure PACOMPANY_INSERTX @a nvarchar(20), @n nvarchar(10), @c nvarchar(10) = NULL, @tn nvarchar(50)
    as
    begin
        begin try

        set transaction isolation level serializable;
        begin transaction
        insert into CompanyInfo ( Company, Name, Adress) values (@a, @n, @tn);
        execute PACOMPANY_INSERT @a=@a,@n=@n,@c=@c;
        commit;
        return 1;

        end try

        begin catch
        print N'Возникла ошибка!';
        print N'Номер ошибки: ' + cast(error_number() as varchar(20));
        print N'Сообщение: ' + error_message();
        print N'Уровень: ' + cast(error_severity() as varchar(20));
        print N'Метка: ' + cast (error_state() as varchar(20));
        print N'Номер строки: ' + cast(error_line() as varchar(20));

        if error_procedure() is not null
        print N'Имя процедуры: ' + error_procedure();
        return -1;
        end catch
    end
    go
    declare @pcomp int = 0;
    execute @pcomp = PACOMPANY_INSERTX @a=N'Company 56', @n = N'Natalia', @c = N'124', @tn = N'Sverdlova 13';
    PRINT N'Номер ошибки: ' + CAST(@pcomp AS NVARCHAR(20));

    select * from Company