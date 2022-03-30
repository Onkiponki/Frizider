use master
create database frizider
use frizider
create table proizvodjac
(id int identity (1,1) primary key,
naziv nvarchar(30),
adresa nvarchar (30),
vlasnik nvarchar (50)
)
create table kategorija
(id int identity(1,1) primary key,
naziv nvarchar (30)
)

create table proizvod
(id int identity(1,1) primary key,
naziv nvarchar(30),
cena int,
rok_trajanja datetime,
idProizvodjaca int,
idKategorije int
)
go
create view Pogled
as
select proizvod.naziv as Proizvod , kategorija.naziv as Kategorija ,proizvodjac.naziv as Proizvodjac , cena from
proizvodjac join proizvod on proizvodjac.id=proizvod.idProizvodjaca join kategorija on kategorija.id=proizvod.idKategorije

select * from pogled where lower(Proizvodjac) like '%id%' AND lower(Kategorija) like '%%';

select * from proizvod
insert into proizvod
values('Grasak', 300,'2022-06-12 00:00:00.000',1,4),
('Kulen',200,'2022-09-15 00:00:00.000',3,1),
('Kulen',200,'2022-09-15 00:00:00.000',3,1),
('Boranija',201,'2001-09-11 00:00:00.000',5,3),
('Grasko',250,'2022-06-12 00:00:00.000',4,4),
('Riblji Stapici',350,'2001-09-11 00:00:00.000',2,7),
('Oslic',200,'2001-09-11 00:00:00.000',4,7),
('Lignje',220,'2001-09-11 00:00:00.000',2,7),
('Racici',499,'2001-09-11 00:00:00.000',4,7),
('Riblji fileti',250,	'2022-09-15 00:00:00.000',1,7),
('Pomfrit',199,'2023-07-03 00:00:00.000',1,8),
('Marinirani Krompir',250,'2023-07-03 00:00:00.000',1,8),
('Mix za rusku',500,'2023-07-03 00:00:00.000',1,5)

insert into kategorija
values('Kulen'),
('Sladoled'),
('Boranija'),
('Grasak'),
('Mesavina'),
('Kukuruz'),
('Riba'),
('Krompir')

insert into proizvodjac
values('Frikom', 'Vojvode Vlahovica 27E', 'Nikola Simikic'),
('Nestle', 'Plitvicka 3', 'Pavle Georgijev'),
('Zlatiborac', 'Cerova 6', 'Milos Rakic'),
('Lidl', 'Breza 9', 'Relja Petkovic'),
('Delhaize', 'Vatroslava Lisinskog 6', 'Milos Ivkovic')
