--Team 1 (Harman Mangat, Jack Occleston, Ruslan Mastov)
-- MoviesCollection Database

--Queries

--1 Name the actors who worked for Colombia Pictures
SELECT firstname + ' ' + lastname AS Name
	FROM Actorinfo JOIN Mapping ON actorinfo.ActorID = Mapping.ActorID JOIN MovieInfo ON Mapping.CastID = MovieInfo.CastID
	WHERE CompanyName = 'Columbia Pictures';


--2 Name the directors and the movie they directed with a boxoffice of more than 500 million dollars 
--  and name the youngest director first
SELECT firstname + ' ' +  lastname AS Name, MovieName
	FROM directorinfo JOIN movieinfo ON directorinfo.DirectorID = MovieInfo.DirectorID JOIN BoxOffice ON MovieInfo.MovieID = BoxOffice.MovieID
	WHERE TotalBoxOffice > '500,000,000'
	ORDER BY DateofBirth desc;

--3 Return the maximum runtime for each of the production companies
SELECT CompanyName, MAX(runtime) AS MaxRuntime
	FROM MovieInfo
	WHERE CompanyName IS NOT NULL
	GROUP BY CompanyName;


--4 Name all the female actors who acted in a comedy genre movie and name the youngest one first
SELECT firstname + ' ' + lastname AS Name, MovieName 
	FROM ActorInfo JOIN mapping ON ActorInfo.ActorID = Mapping.ActorID JOIN MovieInfo ON Mapping.CastID = MovieInfo.CastID
	WHERE genre = 'Comedy' AND gender = 'Female' 
	ORDER BY DateofBirth desc;
	

--5 What movies did Owen Wilson act in? Order them by Run Time
SELECT mi.MovieName, mi.Runtime FROM ActorInfo AS a
    Left Join Mapping AS m ON m.ActorID = a.ActorID
    Left Join Cast1 AS c ON c.CastID = m.CastID
    Left Join MovieInfo AS mi ON mi.CastID = c.CastID
	WHERE FirstName + ' ' + LastName = 'Owen Wilson'
	ORDER BY Runtime;
	

--6 Compared to other movies in the colletion, which movies have above average total box office numbers
SELECT TotalBoxOffice, M.MovieName, P.CompanyName 
	FROM BoxOffice AS B
	Left Join MovieInfo AS M ON B.MovieId = M.MovieId
	Left Join ProductionCompany AS P ON M.CompanyName = P.CompanyName
	WHERE (SELECT AVG(TotalBoxOffice) FROM BoxOffice) < TotalBoxOffice;


--7 Some directors directed more than one movie in the collection. For all such directors,
--  return the titles of all movies directed by them, along with the director name, using subqueries. Sort by director name.
SELECT FirstName + ' ' + LastName AS DirectorName, MovieName
	FROM DirectorInfo
	JOIN MovieInfo ON DirectorInfo.DirectorID = MovieInfo.DirectorID
	WHERE (SELECT COUNT(*) FROM MovieInfo WHERE DirectorInfo.DirectorID = MovieInfo.DirectorID) > 1
	ORDER BY DirectorName;
 

--8 Return Movie names, their aquisition dates in the collection and generate the column that provides information about 
--  NEWLY added movies to the collection(After 2020) and OLDER ones(Before 2020).
SELECT MovieName, AquisitionDate, 'NEW' AS InCollection FROM OwnedMovies
	WHERE AquisitionDate > '2020'
	UNION
	SELECT MovieName, AquisitionDate, 'OLD' from OwnedMovies
	WHERE AquisitionDate < '2020'
	ORDER BY AquisitionDate DESC;
 

--9 Return the names of the actors whose first name starts with the letter "m", also return the movie names that they acted in.
SELECT FirstName, LastName, MovieName
	FROM ActorInfo 
	JOIN Mapping ON Actorinfo.ActorID = Mapping.ActorID 
	JOIN MovieInfo ON Mapping.CastID = MovieInfo.CastID 
	WHERE FirstName LIKE 'm%'; 
 

--10 Return the movie name along with it's Domestic and International amount of Box office, 
--  if Domestic amount is more than International, return "Not Success" and vice versa. Show succeded results first. 
SELECT MovieName, Domestic, International, "SuccessfulOrNot" =
	CASE
		WHEN International >= Domestic THEN 'Success'
		ELSE 'Not Success'
	END
	FROM BoxOffice JOIN MovieInfo 
	ON BoxOffice.MovieID = MovieInfo.MovieID
	ORDER BY "SuccessfulOrNot" DESC;


--11 Name the movies with their runtime who have a totalboxoffice of less than 500 million dollars. 
-- Order them by their MovieName
SELECT runtime, MovieName FROM MovieInfo a JOIN BoxOffice b ON a.movieid = b.movieid
	WHERE TotalBoxOffice < '500,000,000'
	ORDER BY Moviename;
 

--12 Display all Actors between the age of 35-55
SELECT DISTINCT FirstName + ' ' + LastName AS Name, DateOfBirth 
	FROM ActorInfo 
	WHERE DateOfBirth BETWEEN '1966' AND '1986';






