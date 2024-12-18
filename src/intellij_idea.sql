CREATE DATABASE java16Day;

CREATE TABLE cities(
                       id SERIAL PRIMARY KEY ,
                       citys_name VARCHAR NOT NULL );

CREATE TABLE university(
                           id SERIAL PRIMARY KEY,
                           uni_name VARCHAR NOT NULL,
                           citys_id INT REFERENCES cities(id)
);

CREATE TABLE students(
                         id SERIAL PRIMARY KEY,
                         students_name VARCHAR NOT NULL,
                         students_last_name VARCHAR NOT NULL,
                         email VARCHAR NOT NULL,
                         university_id INT REFERENCES university(id)
);

INSERT INTO cities(citys_name)
VALUES ('Naryn'),
       ('Bishkek'),
       ('Osh');

INSERT INTO university(uni_name,citys_id)
VALUES ('KGTU','2'),
       ('NMU','1'),
       ('KGMA','2');

INSERT INTO students(students_name, students_last_name, email, university_id)
VALUES ('Rahman','Zhakaev','zakaevrahmankul77@gmail.com','1'),
       ('Nurbek','Ahmadaliev','nurbek@gmail.com','1'),
       ('Bayaz','test','bay@gmail.ru','2'),
       ('Aijan','Altynbek k','aijan@gmail.com','3');

CREATE TABLE country(
                        id SERIAL PRIMARY KEY,
                        country_name VARCHAR(70)NOT NULL,
                        population INT NOT NULL,
                        area VARCHAR NOT NULL
);

INSERT INTO country(country_name,population,area)
VALUES ('Kyrgyzstan',7161900,'199 900 км²'),
       ('Kazakhstan',20000000,'2,7млн км²'),
       ('Germany',84000000,'357 021 км²'),
       ('Uzbekistan',36000000,'448 900 км²');

CREATE TABLE mountain(
                         id SERIAL PRIMARY KEY,
                         mountain_name VARCHAR(50) NOT NULL,
                         high INT NOT NULL,
                         country_id INT REFERENCES country(id)
);

INSERT INTO country(country_name,population,area)
VALUES ('China','1411750000','9,6 млн2');

INSERT INTO country(country_name,population,area)
VALUES ('Непал','29164578','147 516 км²');

ALTER TABLE mountain ALTER COLUMN high TYPE float;

INSERT INTO mountain(mountain_name, high, country_id)
VALUES ('Эверест','8848','6'),
       ('Чогори','8614','5'),
       ('Канченджанга','8586','6');

CREATE TABLE library(
                        id SERIAL PRIMARY KEY,
                        library_name VARCHAR (50)NOT NULL,
                        city_id INT REFERENCES cities(id)
);
ALTER TABLE library
    ADD COLUMN address VARCHAR(50);


INSERT INTO library(library_name, city_id)
VALUES ('T.Satylganov',3),
       ('A.Osmonov',2),
       ('Jenish',1);

insert into library(address)
VALUES ('Байтик баатыр 15'),
       ('пр.Чуй'),
       ('пр.Ч.Айтматов 237');

CREATE TABLE book(
                     id SERIAL PRIMARY KEY,
                     book_name VARCHAR NOT NULL,
                     author VARCHAR (60),
                     library_id INT REFERENCES library(id)
);

INSERT INTO book(book_name, author, library_id)
VALUES ('Ежевичная зима','Сара Джио',2),
       ('Немой свидетель','Агата Кристи',1),
       ('Журоктордун ачкычы','Бексултан Нурышеев',2),
       ('Цветы для Элджернона','Даниель Кис',1),
       ('Бейиштик уй булоого 5 хадис','Калысбек Заманбеков',3),
       ('Эмне учун китеп окушубуз керек','Мамбетасан Ибраев',3);

CREATE TABLE work(
                     id SERIAL PRIMARY KEY,
                     title_of_work VARCHAR NOT NULL,
                     address VARCHAR NOT NULL,
                     city_id INT REFERENCES cities(id)
);
ALTER TABLE work RENAME COLUMN title_of_work to firma;
INSERT INTO work(firma, address, city_id)
VALUES ('Евро тех строй','5-мкр',2),
       ('Navat','Джунусалиева 34',2),
       ('Power people','пр.Мира',1);

CREATE TABLE employee(
                         id SERIAL PRIMARY KEY,
                         name VARCHAR NOT NULL,
                         position VARCHAR (50),
                         work_id INT REFERENCES work(id)
);

INSERT INTO employee(name, position, work_id)
VALUES ('Ibo','admin',3),
       ('Nurbol','worker',2),
       ('Rahman','manager',1);

CREATE TABLE village(
                        id SERIAL PRIMARY KEY,
                        name VARCHAR NOT NULL,
                        country_id INT REFERENCES country(id)
);
INSERT INTO village(name, country_id)
VALUES ('Мин-Булак',1),
       ('Эмгекчил',1),
       ('Куйбышев',1),
       ('Кара-Чий',1),
       ('Исакеев',1),
       ('Кара-Суу',1);