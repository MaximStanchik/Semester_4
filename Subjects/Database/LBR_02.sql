drop table if exists Информация_о_водителе;
drop table if exists Информация_о_грузе;
drop table if exists Информация_о_маршруте;
drop table if exists Информация_о_водителе;
drop table if exists Грузовые_перевозки;

--1-ая форма:

create table if not exists Грузовые_перевозки
(
    Название_маршрута      varchar,
    Дальность              real,
    Количество_дней_в_пути real,
    Оплата                 real,
    Фамилия_водителя       varchar,
    Имя                    varchar,
    Отчество               varchar,
    Стаж                   integer,
    Дата_отправки          timestamp,
    Дата_возвращения       timestamp
);

--2-ая форма:

create table if not exists Информация_о_водителе
(
    Водитель_ID            integer primary key,
    Фамилия_водителя       varchar,
    Имя                    varchar,
    Отчество               varchar,
    Стаж                   integer,
    Оплата                 real
);

create table if not exists Информация_о_маршруте
(
    Маршрут_ID             integer primary key,
    Название_маршрута      varchar,
    Дальность              real,
    Количество_дней_в_пути real
    Дата_отправки          timestamp,
    Дата_возвращения       timestamp
);

create table if not exists Информация_о_грузе
(
    Груз_ID                integer primary key,
    Вес integer,
    Размер integer
);

create table if not exists Грузовые_перевозки
(
    Компания               varchar ,
    Груз_ID                integer,
    Маршрут_ID             integer,
    Водитель_ID            integer,
    PRIMARY KEY (Груз_ID, Маршрут_ID, Водитель_ID)
);


