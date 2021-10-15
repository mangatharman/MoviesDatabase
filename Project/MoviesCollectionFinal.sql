USE MASTER 
DROP DATABASE IF EXISTS MoviesCollection
GO
CREATE DATABASE MoviesCollection
GO
USE MoviesCollection
GO

CREATE TABLE OwnedMovies (
	CollectionID smallint NOT NUll,
	MovieID smallint,
	MovieName varchar(50),
	AquisitionDate Date,
	Quantity smallint

	Primary Key (CollectionID)
);

CREATE TABLE BoxOffice (
	MovieID smallint,
	TotalBoxOffice money,
	International money NOT NULL,
	Domestic money NOT NULL

	Primary Key (International, Domestic),
);

CREATE TABLE MovieInfo (
	MovieID smallint NOT NULL,
	MovieName varchar(50),
	Runtime time,
	CompanyName varchar(30),
	PrimaryLanguage varchar(20),
	DirectorID smallint,
	Genre varchar(100),
	CastID smallint

	Primary Key (MovieID)
);

CREATE TABLE DirectorInfo (
	DirectorID smallint NOT NULL,
	FirstName varchar(20),
	LastName varchar(20),
	DateofBirth date,
	Gender varchar(10)

	Primary Key (DirectorID)
);

CREATE TABLE ProductionCompany (
	CompanyName varchar(30) NOT NULL,
	MoviesInCollection smallint,
	Country varchar(20)

	Primary Key (CompanyName)
);

CREATE TABLE Cast1 (
	CastID smallint NOT NULL,
	MovieID smallint NOT NULL

	Primary Key (CastID)
);

CREATE TABLE Mapping (
	MappingID smallint NOT NULL,
	CastID smallint,
	ActorID smallint

	Primary Key (MappingID)
);

CREATE TABLE ActorInfo (
	ActorID smallint NOT NULL,
	FirstName varchar(20),
	LastName varchar(20),
	Gender varchar(10),
	DateofBirth date

	Primary Key (ActorID)
);



INSERT INTO OwnedMovies (CollectionID, MovieID, MovieName, AquisitionDate, Quantity)
	Values  (1,10,'Groundhog Day','1995-05-28',1),
			(2,11,'Cars','2010-09-10',1),
			(3,12,'Back to the Future','2015-10-01',1),
			(4,13,'Inception','2018-11-01',1),
			(5,14,'Batman vs. Superman','2021-05-05',2),
			(6,15,'Wonder Park','2020-06-10',1),
			(7,16,'Home Movie #1','1997-02-22',1),
			(8,17,'Cars 2','2010-10-10',1);


 INSERT INTO BoxOffice (MovieID, TotalBoxOffice, International, Domestic)
	VALUES  (10, '$71,112,677', '$14,834', '$71,097,843'),
			(11, '$461,630,558', '$217,547,576', '$244,082,982'),
			(12, '$385,510,205', '$212,259,762','$173,250,443'),
			(13, '$826,137,188', '$533,560,993', '$292,576,195'),
			(14, '$873,634,919', '$543,274,725', '$330,360,194'),
			(15, '$119,559,110', '$74,342,317', '$45,216,793'),
			(17, '$559,852,396', '$368,400,000', '$191,452,396');	


INSERT INTO MovieInfo (MovieID, MovieName, Runtime, CompanyName, PrimaryLanguage, DirectorID, Genre, CastID)
	Values  (10,'GroundHogDay','01:41','Columbia Pictures','English',101,'Comedy',201),
			(11,'Cars','01:57','Pixar','English',102,'Animation/Comedy',202),
			(12,'Back to the Future','01:56','UniversalPictures','English',103,'Sci-Fi/Comedy',203),
			(13,'Inception','02:42','Warner Bros. Pictures','English',104 ,'Sci-Fi/Thriller',204),
			(14,'Batman V Superman','03:03','Warner Bros. Pictures','English',105,'Action',205),
			(15,'Wonder Park', '01:26','Paramount Animation','English',NULL, 'Comedy',206),
			(16,'Home Movie #1','00:33',NULL,'English',NULL,NULL,NULL),
			(17,'Cars 2','02:00','Pixar','English',102,'Animation/Comedy',207);


INSERT INTO DirectorInfo (DirectorID, FirstName, LastName, DateofBirth, Gender)
	VALUES  (101, 'Harold', 'Ramis', '1944-11-21', 'Male'),
			(102, 'John', 'Lasseter', '1957-01-12', 'Male'),
			(103, 'Robert', 'Zemeckis', '1952-05-14', 'Male'),
			(104, 'Christopher', 'Nolan', '1970-07-30', 'Male'),
			(105, 'Zack', 'Snyder', '1966-03-01', 'Male');


INSERT INTO ProductionCompany (CompanyName, MoviesInCollection, Country)
	VALUES  ('20thFoxCentury', 0, 'UnitedStates'),
			('UniversalPictures', 1, 'UnitedStates'),
			('Pixar', 2, 'UnitedStates'),
			('Columbia Pictures', 1, 'UnitedStates'),
			('Warner Bros. Pictures', 2, 'UnitedStates'),
			('Paramount Animation', 1, 'UnitedStates');


INSERT INTO Cast1 (CastID, MovieID)
	Values  (201, 10),
			(202, 11),
			(203, 12),
			(204, 13),
			(205, 14),
			(206, 15),
			(207, 17);


INSERT INTO Mapping (MappingID, CastId, ActorId)
	VALUES  (501, 201, 301),
			(502, 201, 302),
			(503, 201, 303),
			(504, 202, 304),
			(505, 202, 305),
			(506, 202, 306),
			(507, 203, 307),
			(508, 203, 308),
			(509, 203, 309),
			(510, 204, 310),
			(511, 204, 311),
			(512, 204, 312),
			(513, 205, 313),
			(514, 205, 314),
			(515, 205, 315),
			(516, 206, 316),
			(517, 206, 317),
			(518, 206, 318),
			(519, 207, 304),
			(520, 207, 305),
			(521, 207, 319);




INSERT INTO ActorInfo (ActorID, FirstName, LastName, Gender, DateofBirth)
	Values  (301,'Bill','Murray','Male','1950-09-21'),
			(302,'Andie','MacDowell','Female','1958-04-21'),
			(303, 'Harold','Ramis','Male','1944-11-21'),
			(304,'Owen','Wilson','Male','1968-11-18'),
			(305, 'Daniel','Whitney','Male','1963-02-17'),
			(306, 'Bonnie','Hunt','Female','1961-09-22'),
			(307, 'Michael J','Fox','Male','1961-06-09'),
			(308, 'Christopher',' Lloyd','Male','1938-10-22'),
			(309, 'Lea','Thompson','Female','1961-05-31'),
			(310, 'Leonardo','DiCaprio','Male','1974-11-11'),
			(311, 'Joseph','Gordon-Levitt','Male','1981-02-17'),
			(312, 'Tom','Hardy','Male','1977-09-15'),
			(313, 'Ben','Affleck','Male','1972-08-15'),
			(314, 'Henry','Cavill','Male','1983-05-05'),
			(315, 'Gal',' Gadot','Female','1985-04-30'),
			(316, 'Mila','Kunis','Female','1983-08-14'),
			(317, 'Matthew','Broderick','Male','1962-03-21'),
			(318, 'Jennifer','Garner','Female','1972-04-17'),
			(319, 'Emily','Mortimer','Female','1971-10-06');


ALTER TABLE OwnedMovies 
	ADD Foreign Key (MovieID) References MovieInfo (MovieID);

ALTER TABLE BoxOffice
	ADD Foreign Key (MovieID) References MovieInfo (MovieID);

ALTER TABLE MovieInfo
	ADD Foreign Key (CompanyName) References ProductionCompany (CompanyName),
		 Foreign Key (DirectorID) References DirectorInfo (DirectorID),
		 Foreign Key (CastID) References Cast1 (CastID);

ALTER TABLE Cast1
	ADD Foreign Key (MovieID) References MovieInfo (MovieID);

ALTER TABLE Mapping
	ADD Foreign Key (CastID) References Cast1 (CastID),
		Foreign Key (ActorID) References ActorInfo (ActorID);



--Updating the Genre

--GroundHogsDay
UPDATE MovieInfo SET Genre = 'Comedy'
	WHERE MovieID = 10;

--Cars
UPDATE MovieInfo SET Genre = 'Comedy'
	WHERE MovieID = 11;

--Back to the future
UPDATE MovieInfo SET Genre = 'Sci-fi'
	WHERE MovieID = 12;

--Inception
UPDATE MovieInfo SET Genre = 'Thriller'
	WHERE MovieID = 13;

--Batman V Superman
UPDATE MovieInfo SET Genre = 'Action'
	WHERE MovieID = 14;

--Wonder Park
UPDATE MovieInfo SET Genre = 'Comedy'
	WHERE MovieID = 15;

--Cars 2
UPDATE MovieInfo SET Genre = 'Comedy'
	WHERE MovieID = 17;