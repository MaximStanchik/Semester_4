create database LBR_04
use LBR_04
create table AUDITORIUM_TYPE
(    AUDITORIUM_TYPE  char(10) constraint AUDITORIUM_TYPE_PK  primary key,
     AUDITORIUM_TYPENAME  varchar(30)
)
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
values
    ('LC', 'Lecture'),
    ('LB-K', 'Computer class'),
    ('LB-K', 'Lecture room with installed projector'),
    ('LB-C', 'Chemical laboratory'),
    ('LB-SC', 'Special computer class');

create table AUDITORIUM
(   AUDITORIUM char(20)  constraint AUDITORIUM_PK  primary key,
    AUDITORIUM_TYPE char(10) constraint  AUDITORIUM_AUDITORIUM_TYPE_FK foreign key references AUDITORIUM_TYPE(AUDITORIUM_TYPE),
    AUDITORIUM_CAPACITY integer constraint  AUDITORIUM_CAPACITY_CHECK default 1  check (AUDITORIUM_CAPACITY between 1 and 300),  -- вместимость
    AUDITORIUM_NAME varchar(50)
)
insert into  AUDITORIUM   (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values
    ('206-1', '206-1', 'LB-K', 15),
    ('301-1', '301-1', 'LB-K', 15),
    ('236-1', '236-1', 'LC',   60),
    ('313-1', '313-1', 'LC-K', 60),
    ('324-1', '324-1', 'LC-K', 50),
    ('413-1', '413-1', 'LC-K', 15),
    ('423-1', '423-1', 'LB-K', 90),
    ('408-2', '408-2', 'LC',   90);


