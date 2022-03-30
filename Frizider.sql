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
select proizvod.naziv as Proizvod , kategorija.naziv as Kategeorija ,proizvodjac.naziv as Proizvodjac , cena from
proizvodjac join proizvod on proizvodjac.id=proizvod.idProizvodjaca join kategorija on kategorija.id=proizvod.idKategorije
