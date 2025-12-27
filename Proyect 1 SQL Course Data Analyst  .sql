create database db_WomenMaccabi_3
go
use db_WomenMaccabi_3

create table Persons (PersonID int primary Key identity (1,1), 
PersonName varchar (30) not null, YearOfBirth int,Seassons_in_club real , 
PhoneNumber nvarchar (15) default null )

insert Persons values ('Alin',2007, 3,null),('Talia', 2007,4,null),
('Elianna', 2007, 3, null) ,('Arkovi',2008, 8, null),('Blaier',2008, 2, null),
('Gali', 2009, 2, null),('Or',2009,2,null),('TamarF', 2009, 6,null),('Mia',2009,1,null),
('ShoeretAtlit',2009,0,null),('Elian',2010,5,null),('Liam',2010,7,null),('Hagar',2010,7,null),
('Lia', 2010,3,null),('Neta', 2010,3,null),('Amit',2011,6,null),('AlmaM',2011,7,null),
('Noam',2011,1,null),('Mijal',2011,2,null),('AlmaBenDavid',2011,1,null),('Gili',2011,7,null),
('Regev',2011,3,null),('Twill',2011,1,null),('Griner',2011,1,null),
('NaamaShoeret',2011, 1,null),('ShaiMacabi', 2011,1,null),('HilaBerIakov',2011,0,null),
('LihiBerIakov',2011,0,null),
('Shira',2012,2,null),('TamarSk',2012,2,null),('Liel',2012,2,null),
('RomiB',2012,1,null),('NetaC',2012,6,null),('MayaFishler',2012,1,null),('Keren',2012,1,null),
('Ema',2012,0,null),('GiliMacabi2012',2012,0,null),
('MilanaMac',2012,5,null),('ArielMac',2012,3,null),('AdiMac',2012,1,null),
('ShiraMac',2012,2,null),('AlmaMac',2012,2,null),('TahelMac',2012,1,null),
('OfirMac',2012,3,null),('OrMac',2013,0,null),('MishmiMac',2013,1,null),
('AlonaKtana',2013,2,null),('Yarden',2013,1,null),('Yael',2013,2,null),
('Venus',2013,2,null),('Naama',2013,1,null),
('Noa',2013,2,null),('Shoval',2013,1,null),('Mia2014',2014,2,null),('Gabriela',2014,2,null),
('Carmi',2014,1,null),('magenaiemin2014',2014,1, null),('Yeladotbet1',2014,1,null),
('Yeladotbet2',2014,1,null),('Yeladotbet3',2014,1,null),('Yeladotbet4',2014,1,null),
('Yeladotbet5',2014,1,null),('Yeladotbet6',2014,1,null),('Yeladotbet7',2014,1,null),
('Yeladotbet8',2014,1,null),('Yeladotbet9',2015,1,null),('Yeladotbet10',2015,1,null),
('Yeladotbet11',2015,1,null),('Yeladotbet12',2015,1,null),('Yeladotbet13',2015,1,null),
('Yeladotbet14',2015,1,null),('Yeladotbet15',2015,1,null),('Yeladotbet16',2015,1,null),
('Yeladotbet17',2015,1,null),('Yeladotbet18',2015,1,null),('Yeladotbet19',2015,1,null),
('Tromiot1',2016,0,null),('Tromiot2',2016,0,null),('Tromiot3',2016,0,null),
('Tromiot4',2016,0,null),('Tromiot5',2016,0,null),('Tromiot6',2016,0,null),
('Tromiot7',2016,0,null),('Tromiot8',2016,0,null),('Tromiot9',2016,0,null),
('Tromiot10',2016,0,null),('Tromiot11',2017,0,null),('Tromiot12',2017,0,null),
('Tromiot13',2017,0,null),('Tromiot14',2017,0,null),('Tromiot15',2017,0,null),
('Elad',null,1,null),('Ary',null,4,null),('Yaron',null,7,null),('Shai',null,3,null),
('MosheMaccabi',null,8,null),('OfirMeamenetTromiot',null,0,null),
('GabrielMeamenKosher',null,2,null),('AradMeamenKosher',null,1,null),
('NoiOzeretmeamen',null,0,null),('MayaMenaelet',null,0,null),('ShirliMenaelet',null,8,null),
('OmerMenael',null,8,null),('GuyMaccabi',null,8,null),('LimorMaccabi',null,5,null),
('Rachel',null,9,null)

create table Category (CategoryID int primary Key identity (1,1), 
CategoryName varchar (30))

insert Category values ('player'),('Coach'),('Fitness Trainner'),('Coach Assistant'),
('Goal Keeper Coach'),('Young Dept. Manager'),('Main Women Team Manager'), 
('Women Soccer Manager'), ('Main Women Soccer Manager'),('Financial Asisstant'),('Scouting')

create table Players (playerID int primary key identity (1,1), 
personID int references Persons (PersonID))

insert players values 
(1),(2),(3) ,(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),
(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),
(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),
(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),
(74),(75),(76),(77),(78),(79),(80),(81),(82),
(83),(84),(85),(86),(87),(88),(89),(90),(91)
 
create table Teams (TeamID int primary Key identity (1,1), TeamName varchar (20), 
Years_Of_Player_Birth nvarchar (30))

insert Teams values ('U18', '2007-2010'), ('U15', '2010-2012'), ('U13', '2012-2014'),
('U13-South', '2012-2014'),('U11', '2014-2016'), ('U9', '2016-2018')

Create table Coaches (CoachID int primary Key identity (1,1), 
PersonID int references Persons (PersonID))

insert Coaches values (92),(93),(94),(95),(96),(97),(98),(99),(100)

Create table Teams_PLayers (TeamID int references Teams (TeamID), 
PLayerID int references Players (PlayerID), primary Key (TeamID, PlayerID))

insert Teams_Players values 
(1,1),(1,2),(1,3) ,(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),
(2,11),(2,12),(2,13),(2,14),(2,15),
(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),
(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),
(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),
(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),
(4,38),(4,39),(4,40),(4,41),(4,42),(4,43),(4,44),
(4,45),(4,46),
(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),
(5,55),(5,56),(5,57),
(5,58),(5,59),(5,60),(5,61),(5,62),(5,63),(5,64),(5,65),(5,66),
(5,67),(5,68),(5,69),(5,70),(5,71),(5,72),(5,73),(5,74),(5,75),(5,76),
(6,77),(6,78),(6,79),(6,80),(6,81),(6,82),(6,83),(6,84),(6,85),(6,86),
(6,87),(6,88),(6,89),(6,90),(6,91)

Create table Employees (EmployeeID int primary key identity (1,1),
PersonID int references Persons (PersonID),
CategoryID int references Category (CategoryID)) 

insert Employees values 
(92,2),(93,2),(94,2),(95,2),(96,2),(97,2),
(98,3),(99,3),(100,4),(94,5),
(101,6),(102,7),
(103,8),(104,9),(105,10),(106,11)

Create table TeamCoaches (TeamID int references Teams (TeamID), 
CoachID int references Coaches (CoachID), primary Key (TeamID,CoachID))

Insert TeamCoaches values 
(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(2,8),(2,9),(2,3),(1,8)

create table weekly_Trainings (TrainingID int primary Key identity (1,1), 
TeamID int references Teams (TeamID), WeeklyDay int, HourOfTraining datetime)

insert weekly_Trainings values 
(1,1,18.00),(1,3,18.00),(1,5,18.00),(1,6,9.00),
(2,2,16.30),(2,4,18.00),(2,5,18.00), (2,6,9.00),
(3,1,16.30),(3,3,18.00),(3,5,18.00),(3,6,9.00),
(4,1,18.00),(4,2,18.00),(4,4,18.00),
(5,1,15.15),(5,4,16.30),(5,5,16.30),
(6,2,15.15),(6,5,16.30)


--select*
--from Persons

--select*
--from Category

--select*
--from Players

--select*
--from Teams

--select*
--from Players

--select*
--from Teams_PLayers

--select*
--from Employees

--select*
--from TeamCoaches



--select*
--from weekly_Trainings
--where WeeklyDay

--select t.TeamName, t.Years_Of_Player_Birth,  ps.YearOfBirth, ps.PersonName,
--ps.Seassons_in_club, c.CoachID
--from Teams t join Teams_PLayers tp
--on t.TeamID=tp.TeamID
--join Players p
--on tp.PLayerID=p.playerID
--join persons ps
--on p.personID=ps.PersonID
--join TeamCoaches tc
--on t.TeamID=tc.TeamID
--join Coaches c
--on tc.CoachID=c.CoachID
--join persons ps
--on c.personID=p.personId
