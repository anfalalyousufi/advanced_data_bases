/************************
 * Anfal AlYousufi      *
 * U72884742            *
 * PROJECT 2            *
 ************************/

/* anfal1=# \i /home/anfal/Downloads/course_files_export/Proj2/proj2-aalyousufi.sql*/

drop table teams;
drop table coaches_season;
drop table draft;
drop table players;
drop table player_rs_career;
drop table player_rs;


create table teams (tid varchar(30), location varchar(30), name varchar(30), league varchar(30), primary key (tid, league));

create table coaches_season (cid varchar(30), year int, yr_order int,
firstname varchar(30), lastname varchar(30), season_win int, season_loss int, playoff_win int, playoff_loss int, tid varchar(30), primary key (cid, year, yr_order));

create table draft (draft_year int, draft_round int, selection int, tid varchar(30), firstname varchar(30), lastname varchar(30), ilkid  varchar(30), draft_from varchar(100), league varchar(30));

create table players (ilkid varchar(30), firstname varchar(30), lastname varchar(30), position varchar(1), first_season int, last_season int, h_feet int, h_inches real, weight real, college varchar(100), birthday varchar(30), primary key (ilkid));

create table player_rs_career (ilkid varchar(30), firstname varchar(30), lastname varchar(30), league varchar(10), gp int, minutes int, pts int, dreb int, oreb int, reb int, asts int, stl int, blk int, turnover int, pf int, fga int, fgm int, fta int, ftm int, tpa int, tpm int);

create table player_rs (ilkid varchar(30), year int, firstname varchar(30), lastname varchar(30), tid varchar(30), league varchar(10), gp int, minutes int, pts int, dreb int, oreb int, reb int, asts int, stl int, blk int, turnover int, pf int, fga int, fgm int, fta int, ftm int, tpa int, tpm int, primary key(ilkid, year, tid));


-- Put your SQL statement under the following lines:

-- 0. Under psql, load all the above tables with data obtained from the corresponding txt file using the 'copy' command like this:
copy teams from '/home/anfal/Downloads/course_files_export/Proj2/teams.txt' with delimiter ',';
copy coaches_season from '/home/anfal/Downloads/course_files_export/Proj2/coaches_season.txt' with delimiter ',';
copy players from '/home/anfal/Downloads/course_files_export/Proj2/players.txt' with delimiter ',';
copy player_rs from '/home/anfal/Downloads/course_files_export/Proj2/player_rs.txt' with delimiter ',';
copy player_rs_career from '/home/anfal/Downloads/course_files_export/Proj2/player_rs_career.txt' with delimiter ',';
copy draft from '/home/anfal/Downloads/course_files_export/Proj2/draft.txt' with delimiter ',';


/********************************************************************************************
 *1.Find all the players who played in a Denver team but never in a Boston team. List their
 *  first names followed by their last names.
 *********************************************************************************************/

SELECT DISTINCT firstname, lastname 
FROM player_rs p1, teams t1
WHERE t1.tid = p1.tid AND t1.location = 'Denver' AND ilkid NOT IN (
SELECT p2.ilkid 
FROM teams t2, player_rs p2
WHERE t2.tid = p2.tid AND t2.location = 'Boston');
/*ROW: 269*/
/*************output
 firstname |   lastname    
-----------+---------------
 Aaron     | Williams
 Adam      | Harrington
 Adonis    | Jordan
 Al        | Guokas
 Al        | Smith
 Alex      | English
 Andre     | Miller
 Andre     | Moore
 Anthony   | Cook
 Anthony   | Goldwire
 Anthony   | Mason
 Anthony   | Roberts
 Antonio   | Mcdyess
 Art       | Becker
 Arvid     | Kramer
 Avery     | Johnson
 Ben       | Warley
 Bill      | Hanzlik
 Bill      | Herman
 Bill      | Mcgill
 Billy     | Mckinney
 Bison     | Dele
 Blair     | Rasmussen
 Bo        | Ellis
 Bob       | Brown
 Bob       | Royer
 Bob       | Wilkerson
 Bobby     | Jackson
 Bobby     | Jones
 Brad      | Wright
 Brian     | Taylor
 Brooks    | Thompson
 Bryon     | Russell
 Byron     | Beck
 Cadillac  | Anderson
 Calvin    | Natt
 Carl      | Herrera
 Carl      | Nicks
 Carmelo   | Anthony
 Cedrick   | Hordges
 Charley   | Parks
 Chris     | Andersen
 Chris     | Gatling
 Chris     | Whitney
 Chuck     | Gardner
 Chuck     | Williams
 Claude    | Terry
 Cliff     | Anderson
 Cliff     | Levingston
 Corey     | Gaines
 Cory      | Alexander
 Craig     | Neal
 Dale      | Ellis
 Dan       | Hester
 Dan       | Issel
 Dan       | Mcclintock
 Danny     | Schayes
 Darnell   | Hillman
 Darnell   | Mee
 Darrell   | Walker
 Darvin    | Ham
 Darwin    | Cook
 Dave      | Bustion
 Dave      | Robisch
 David     | Burns
 David     | Greenwood
 David     | Thompson
 Dean      | Garrett
 DerMarr   | Johnson
 Devin     | Brown
 Dikembe   | Mutombo
 Dillard   | Crocker
 Don       | Maclean
 Don       | Sidle
 Don       | Washington
 Donnell   | Harvey
 Duane     | Klueh
 Dwight    | Anderson
 Dwight    | Waller
 Earl      | Boykins
 Earl      | Dodd
 Ed        | Bartels
 Eddie     | Hughes
 Eduardo   | Najera
 Eldridge  | Recasner
 Elmer     | Bennett
 Elmore    | Spencer
 Elston    | Turner
 Eric      | Murdock
 Eric      | Washington
 Ervin     | Johnson
 Fatty     | Taylor
 Floyd     | Theard
 Floyd     | Volker
 Francisco | Elson
 Frank     | Card
 Garth     | Joseph
 Gary      | Garland
 Gary      | Plummer
 George    | Irvine
 George    | Johnson
 George    | Mccloud
 George    | Mcginnis
 George    | Zidek
 Glen      | Gondrezick
 Grant     | Simmons
 Greg      | Buckner
 Greg      | Grant
 Greg      | Wittman
 Gus       | Gerard
 Harold    | Ellis
 Howard    | Carter
 Isaiah    | Rider
 Jack      | Cotton
 Jack      | Toomay
 Jacky     | Dorsey
 Jake      | Carter
 Jalen     | Rose
 James     | Posey
 Jamesearl | Ray
 Jan       | Vanbredakolff
 Jawann    | Oldham
 Jay       | Vincent
 Jeff      | Congdon
 Jeff      | Mcinnis
 Jeff      | Trepagnier
 Jeffrey   | Crompton
 Jerome    | Lane
 Jim       | Bradley
 Jim       | Browne
 Jim       | Farmer
 Jim       | Price
 Jimmy     | Darden
 Jimmy     | Foster
 Jimmy     | King
 Joe       | Kopicki
 Joebarry  | Carroll
 John      | Crotty
 John      | Kuester
 John      | Morrison
 John      | Roche
 John      | Trapp
 Johnny    | Newman
 Johnny    | Taylor
 Jon       | Barry
 Julian    | Hammond
 Julius    | Keye
 Juwan     | Howard
 Keith     | Edmonson
 Kelly     | Mccarty
 Ken       | Wilburn
 Kenny     | Dennard
 Kenny     | Higgs
 Kenny     | Sailors
 Kenny     | Satterfield
 Kenny     | Smith
 Kenyon    | Martin
 Keon      | Clark
 Kevin     | Brooks
 Kevin     | Willis
 Kiki      | Vandeweghe
 Kim       | Hughes
 Kiwane    | Garris
 Lafayette | Lever
 Laphonso  | Ellis
 Larry     | Brown
 Larry     | Cannon
 Larry     | Jones
 Lasalle   | Thompson
 Lonnie    | Wright
 Loren     | Meyer
 Lorinza   | Harrington
 Luis      | Flores
 Mack      | Calvin
 Mahmo     | Abdul-rauf
 Marcus    | Camby
 Marcus    | Liberty
 Mark      | Alarie
 Mark      | Jackson
 Mark      | Macon
 Mark      | Pope
 Mark      | Randall
 Mark      | Strickland
 Marv      | Roberts
 Marvin    | Webster
 Matt      | Fish
 Maybyner  | Hilario
 Melvin    | Booker
 Mengke    | Bateer
 Michael   | Adams
 Michael   | Brooks
 Michael   | Doleac
 Mike      | Evans
 Mike      | Green
 Mike      | Higgins
 Mo        | Martin
 Monte     | Towe
 Monty     | Williams
 Nene      | Hilario
 Nick      | Vanexel
 Nikoloz   | Tskitishvili
 Orlando   | Woolridge
 Otis      | Smith
 Pat       | Mcfarland
 Pete      | Williams
 Phil      | Hicks
 Predrag   | Savovic
 Pries     | Lauderdale
 Ralph     | Simpson
 Randy     | Woods
 Rastko    | Cvetkovic
 Rb        | Lynam
 Reggie    | Slater
 Reggie    | Williams
 Rich      | Kelley
 Richard   | Anderson
 Richie    | Moore
 Ricky     | Pierce
 Rob       | Williams
 Robert    | Pack
 Robert    | Smith
 Robert    | Werdann
 Rodney    | White
 Rogerw    | Brown
 Roland    | Taylor
 Ron       | Horn
 Ron       | Valentine
 Roy       | Marble
 Ryan      | Bowen
 Sarunas   | Marciulionis
 Scott     | Hastings
 Scott     | Williams
 Shawnelle | Scott
 Spencer   | Haywood
 Steve     | Scheffler
 Steve     | Wilson
 Tariq     | Abdul-wahad
 Ted       | Mcclain
 Terry     | Davis
 Terry     | Mills
 Tim       | Hardaway
 Tim       | Kempton
 Tim       | Legler
 Tom       | Bowens
 Tom       | Hammonds
 Tom       | Hoover
 Tom       | Lagarde
 Tom       | Workman
 T.r.      | Dunn
 Tracy     | Murray
 Tyson     | Wheeler
 Vincent   | Askew
 Vincent   | Yarbrough
 Voshon    | Lenard
 Walt      | Piatkowski
 Walter    | Davis
 Warren    | Jabali
 Wayne     | Chapman
 Wayne     | Cooper
 Wayne     | Englestad
 Wayne     | Hightower
 Wesley    | Person
 Willie    | Long
 Willie    | Murrell
 Willie    | Rogers
 Willie    | White
 Willie    | Wise
 Winston   | Garland
 Zendon    | Hamilton
(269 rows)

/***method 2***/
/*
SELECT DISTINCT firstname, lastname
FROM player_rs
WHERE ilkid IN (SELECT player_rs.ilkid
FROM teams, player_rs
WHERE teams.tid = player_rs.tid AND teams.location ='Denver' 
EXCEPT
SELECT player_rs.ilkid
FROM teams, player_rs
WHERE teams.tid = player_rs.tid AND teams.location = 'Boston');
*/



/*******************************************************************************************************************
 * 2.Find the players who only played between years 1990 to 1991, order the results by (last_name, first_name); 
 *******************************************************************************************************************/

/* Assumption: I used two methods for this and they both gave me the same output */

SELECT DISTINCT lastname, firstname
FROM players
WHERE (players.first_season=1990 OR players.first_season=1991) AND (players.last_season=1990 OR players.last_season=1991)
ORDER BY lastname, firstname;

/**another way**/
SELECT DISTINCT p.lastname, p.firstname
FROM players p
WHERE p.first_season>=1990 AND p.last_season <=1991
ORDER BY p.lastname, p.firstname;
/*ROW: 25*/

/********output 
lastname  | firstname 
-----------+-----------
 Babic     | Milos
 Ball      | Cedric
 Brown     | Myron
 Calip     | Demetrius
 Calloway  | Rick
 Coffey    | Richard
 Copa      | Tom
 Eddie     | Patrick
 English   | A.j.
 Godfread  | Dan
 Grandholm | Jim
 Hunter    | Cedric
 Jepsen    | Les
 Lee       | Kurk
 Lockhart  | Ian
 Mayes     | Tharon
 Monroe    | Rodney
 Munk      | Chris
 Owens     | Keith
 Thomas    | Charles
 Thomas    | Irving
 Thompson  | Stephen
 Turner    | John
 Vianna    | Joao
 Wydner    | A.j.

(25 rows)

************************end/

/**************************************************************************************************************************************************************************************
 * 3.For each college, print the college name and average number of drafts (per season) they sent to NBA. However, only report those colleges that sent drafts in at least 3 seasons. 
 **************************************************************************************************************************************************************************************/

/* Assumption: For this question I just used draft.txt because I thought draft_from had all the college names and all the data neccesary to solve this question and write a query for. I first
 * thought of having players.txt and draft.txt but then many of draft id's were missing. So, i took the approach of just using draft.txt
 **************************************************/

SELECT a.draft_from, (ROUND(AVG(a.cnt),2))  
FROM (SELECT DISTINCT d.draft_from, d.draft_year, COUNT (*) cnt 
FROM draft d 

GROUP BY d.draft_from, d.draft_year
HAVING COUNT (d.draft_year)>=3) a 
GROUP BY a.draft_from
ORDER BY a.draft_from; 

/*ROW 208 using draft*/
/****************output
       draft_from       | round 
------------------------+-------
                        |  4.00
 Alabama                |  4.00
 Alabama-Birmingham     |  3.50
 Alcorn A&M             |  5.00
 Arizona                |  4.00
 Arizona State          |  4.00
 Arkansas               |  3.20
 Atlanta                |  3.00
 Auburn                 |  4.00
 Baltimore              |  3.00
 Boston                 |  4.00
 Boston College         |  3.00
 Bowling Green          |  4.00
 Bradley                |  3.20
 Brigham Young          |  3.50
 Buffalo                |  3.00
 Butler                 |  3.00
 California             |  3.50
 California-Irvine      |  3.00
 California-Riverside   |  4.00
 Cal State-Fullerton    |  3.00
 Canisius               |  3.33
 Catawba                |  3.00
 Centenary              |  3.00
 Central Michigan       |  3.00
 Cheyney State          |  4.00
 Chicago                |  7.00
 Cincinnati             |  3.50
 Clemson                |  3.00
 Colorado               |  3.00
 Colorado State         |  3.33
 Columbia               |  4.00
 Connecticut            |  3.00
 Davidson               |  4.50
 Dayton                 |  3.50
 Delaware               |  3.00
 Denver                 |  3.50
 DePaul                 |  3.00
 Detroit                |  3.33
 Dillard                |  3.00
 Drake                  |  4.50
 Duke                   |  4.00
 Duquesne               |  4.00
 Eastern Kentucky       |  4.50
 Eastern Michigan       |  3.00
 Eau Claire State       |  4.00
 Evansville             |  3.00
 Fairfield              |  3.00
 Ferris State           |  3.00
 Florida                |  3.00
 Florida State          |  3.50
 Floridians             |  8.00
 Fordham                |  3.00
 France                 |  3.00
 Fresno State           |  3.00
 Furman                 |  3.50
 Georgetown             |  3.67
 George Washington      |  3.00
 Georgia                |  4.00
 Georgia Southern       |  3.00
 Golden State           |  5.00
 Grambling              |  3.00
 Guilford               |  4.00
 Hamline                |  4.00
 Hanover                |  4.00
 Harvard                |  3.00
 Hawaii                 |  4.00
 Holy Cross             |  3.00
 Houston                |  3.50
 Idaho State            |  3.33
 Illinois               |  3.50
 Illinois State         |  3.50
 Indiana                |  4.00
 Indiana State          |  3.00
 Iowa                   |  4.00
 Iowa State             |  3.25
 Jackson State          |  4.00
 Jacksonville           |  4.33
 Kansas                 |  3.50
 Kansas State           |  3.33
 Kentucky               |  4.33
 Kentucky State         |  3.33
 Kentucky Wesleyan      |  3.50
 Lafayette              |  3.00
 Lamar                  |  3.00
 La Salle               |  3.25
 Long Beach State       |  6.75
 Long Island            |  3.00
 Los Angeles            |  5.00
 Louisiana State        |  4.00
 Louisville             |  3.56
  Louisville            |  3.00
 Loyola (CA)            |  3.00
 Loyola (IL)            |  3.00
 Loyola (LA)            |  5.00
 Manhattan              |  3.00
 Marquette              |  3.75
 Marshall               |  3.67
 Maryland               |  4.00
 Maryland-Eastern Shore |  3.00
 Maryland State         |  4.00
 Massachusetts          |  3.00
 Memphis                |  3.00
 Memphis State          |  4.67
 Miami (FL)             |  4.00
 Miami (OH)             |  3.00
 Michigan               |  3.83
 Michigan St.           |  3.00
 Michigan State         |  3.33
 Minnesota              |  4.17
 Mississippi State      |  3.00
 Missouri               |  3.67
 Montana State          |  3.00
 Morehead State         |  4.00
 Murray State           |  3.00
 Nebraska               |  3.00
 Nevada-Las Vegas       |  4.00
 Nevada Southern        |  3.00
 New Mexico             |  4.00
 New Mexico State       |  4.00
 New York               |  4.00
 New York University    |  3.00
 Niagara                |  3.00
 None                   |  5.00
 Norfolk State          |  3.00
 North Carolina         |  3.68
 North Carolina A&T     |  3.67
 North Carolina State   |  3.55
 Northeastern           |  3.00
 Northern Arizona       |  3.00
 Northern Illinois      |  4.00
 North Park             |  3.00
 Northwestern           |  3.67
 Notre Dame             |  4.14
 Ohio State             |  3.25
 Oklahoma               |  3.67
 Oklahoma Christian     |  3.00
 Oklahoma City          |  3.50
 Oral Roberts           |  3.20
 Oregon                 |  5.00
 Oregon State           |  4.00
 Pacific                |  4.50
 Pan American           |  3.50
 Pasadena               |  3.00
 Penn                   |  3.00
 Pennsylvania           |  3.00
 Pepperdine             |  3.00
 Pittsburgh             |  6.00
 Portland               |  6.00
 Princeton              |  3.67
 Providence             |  6.50
 Purdue                 |  3.50
 Rhode Island           |  3.00
 Sam Houston State      |  7.00
 San Diego State        |  3.00
 San Francisco          |  3.83
 Santa Clara            |  3.50
 Savannah State         |  4.00
 Seattle                |  3.75
 Serbia                 |  4.00
 Shaw                   |  6.00
 South Alabama          |  3.33
 South Carolina         |  4.43
 Southern               |  3.00
 Southern California    |  5.33
 Southern Methodist     |  3.00
 South Florida          |  3.00
 Stanford               |  3.00
 St. Bonaventure        |  4.00
 Stephen F. Austin      |  9.00
 St. John's             |  3.67
 St. Joseph's           |  3.00
 St. Louis              |  5.00
 St. Mary's (CA)        |  3.00
 St. Peter's            |  3.00
 SW Louisiana           |  3.00
 Syracuse               |  3.29
 Temple                 |  3.00
  Temple                |  4.00
 Tennessee              |  3.25
 Tennessee State        |  4.50
 Texas                  |  5.00
 Texas Christian        |  3.00
 Texas Western          |  3.00
 Tulsa                  |  4.33
 UCLA                   |  3.90
 USC                    |  3.50
 Utah                   |  4.00
 Utah State             |  3.00
 Vanderbilt             |  3.75
 Villanova              |  3.29
 Virginia               |  3.50
 Virginia Commonwealth  |  3.50
 Virginia Tech          |  3.00
 Wake Forest            |  3.67
 Washington             |  3.33
 Washington State       |  4.00
 Weber State            |  3.00
 Western Kentucky       |  4.29
 West Texas State       |  4.00
 West Virginia          |  3.00
 Wichita State          |  4.00
 Winston-Salem          |  3.00
 Wisconsin              |  3.50
 Wisconsin-Eau Claire   |  3.00
 Wyoming                |  3.50
 Xavier (OH)            |  3.50
 Yugoslavia             |  3.00
(208 rows)

*****************************end/






/****************************************************************************************************************************
 * 4.Find the coach(es) (firstname and lastname) who have coached the maximum number of teams between the year 1985 to 1990; 
 ****************************************************************************************************************************/

SELECT cs1.firstname, cs1.lastname
FROM coaches_season cs1
WHERE cs1.year >= 1985 AND cs1.year<=1990
GROUP BY cs1.firstname, cs1.lastname
HAVING COUNT (DISTINCT cs1.tid) >= ALL (SELECT COUNT (DISTINCT cs2.tid)
				FROM coaches_season cs2
				WHERE cs2.year >= 1985 AND cs2.year <= 1990
				GROUP BY cs2.firstname, cs2.lastname, cs2.cid);

/**********************output
 firstname | lastname 
-----------+----------
 John      | MacLeod
(1 row)
**************************end/


/*********************************************************************************************************************************************
 * 5.List the top 5 shortest players. List their last and first names and their heights in centimeters. (Hint: use keywords ORDER BY and LIMIT) 
 *********************************************************************************************************************************************/

SELECT firstname,lastname 
FROM (SELECT firstname,lastname,(h_feet*30.48)+(h_inches*2.54) as ht 
FROM players ORDER BY ht) name LIMIT 5;

/**************output
 firstname | lastname 
-----------+----------
 Muggsy    | Bogues
 Earl      | Boykins
 Sid       | Catlett
 Spud      | Webb
 Mel       | Hirsch
(5 rows)
************************end/

/********************************************************************************************************************
 * 6.Which college sent the second largest number of drafts to NBA? List the college name and the number of drafts.
 ********************************************************************************************************************/
SELECT d.draft_from, COUNT (DISTINCT d.ilkid)
FROM draft d
GROUP BY d.draft_from 
ORDER BY COUNT (DISTINCT d.ilkid) DESC LIMIT 1 OFFSET 1;

/****************output
 draft_from | count 
------------+-------
 Kentucky   |    59
(1 row)
************************end/

/**********************************************************************************************************
 *7.Who coached in all leagues? Use the method introduced in class with 'NOT EXISTS -- EXCEPT -- ...";
 **********************************************************************************************************/
SELECT DISTINCT coaches_season.firstname, coaches_season.lastname
FROM coaches_season
WHERE NOT EXISTS (( SELECT COUNT (DISTINCT teams.league)
		    FROM teams)
		    EXCEPT(
			SELECT COUNT (DISTINCT t1.league)
			FROM coaches_season cs1, teams t1
			WHERE cs1.tid = t1.tid AND coaches_season.cid = cs1.cid
			GROUP BY cs1.cid));

/**************************output
 firstname |  lastname   
-----------+-------------
 Alex      | Hannum
 Andrew    | Levane
 Andy      | Phillip
 Bernie    | Bickerstaff
 Bill      | Hanzlik
 Bob       | Bass
 Bob       | Hill
 Bob       | Leonard
 Bob       | Pettit
 Bob       | Weiss
 Cotton    | Fitzsimmons
 Dan       | Issel
 Dick      | Motta
 Dick      | Versace
 Donnie    | Walsh
 Doug      | Moe
 Ed        | Macauley
 Gene      | Littles
 George    | Irvine
 Gregg     | Popovich
 Harry     | Gallatin
 Isiah     | Thomas
 Jack      | McKinney
 Jack      | Ramsay
 Jeff      | Bzdelik
 Jerry     | Tarkanian
 John      | Lucas
 Kevin     | Loughery
 Larry     | Bird
 Larry     | Brown
 Mel       | Daniels
 Mike      | D'Antoni
 Mike      | Evans
 Morris    | McHone
 Paul      | Seymour
 Paul      | Westhead
 Red       | Holzman
 Rex       | Hughes
 Richie    | Guerin
 Rick      | Carlisle
 Slater    | Martin
 Stan      | Albeck
(42 rows)
*******************************end/

/*****************************************************
 * 8.Same as in query 7, but use a different approach;
 ********************************************************/

SELECT coaches_season.firstname, coaches_season.lastname
FROM coaches_season, teams
WHERE coaches_season.tid = teams.tid
GROUP BY coaches_season.firstname, coaches_season.lastname
HAVING COUNT (DISTINCT teams.league) IN (SELECT COUNT(DISTINCT t1.league)
					FROM teams t1);

/*********************output
 firstname |  lastname   
-----------+-------------
 Alex      | Hannum
 Andrew    | Levane
 Andy      | Phillip
 Bernie    | Bickerstaff
 Bill      | Hanzlik
 Bob       | Bass
 Bob       | Hill
 Bob       | Leonard
 Bob       | Pettit
 Bob       | Weiss
 Cotton    | Fitzsimmons
 Dan       | Issel
 Dick      | Motta
 Dick      | Versace
 Donnie    | Walsh
 Doug      | Moe
 Ed        | Macauley
 Gene      | Littles
 George    | Irvine
 Gregg     | Popovich
 Harry     | Gallatin
 Isiah     | Thomas
 Jack      | McKinney
 Jack      | Ramsay
 Jeff      | Bzdelik
 Jerry     | Tarkanian
 John      | Lucas
 Kevin     | Loughery
 Larry     | Bird
 Larry     | Brown
 Mel       | Daniels
 Mike      | D'Antoni
 Mike      | Evans
 Morris    | McHone
 Paul      | Seymour
 Paul      | Westhead
 Red       | Holzman
 Rex       | Hughes
 Richie    | Guerin
 Rick      | Carlisle
 Slater    | Martin
 Stan      | Albeck
(42 rows)

*******************************end/

/***********************************************************************************************************************
 * 9.Find the tallest player (first name and last name) of each team in year 2000. Print
 * out the team, firstname, last name and the height (in centimeters) of the player. Sort the result by the team name. 
 ***********************************************************************************************************************/

SELECT player_rs.tid, players.firstname, players.lastname, players.h_feet * 30.48 +players.h_inches * 2.54 as height
FROM players, player_rs
WHERE player_rs.year = 2000 AND players.ilkid = player_rs.ilkid
GROUP BY (players.h_feet * 30.48 + players.h_inches * 2.54), player_rs.tid, players.firstname, players.lastname
HAVING (players.h_feet * 30.48 + players.h_inches * 2.54) >= ALL 
(SELECT(players1.h_feet * 30.48+ players1.h_inches * 2.54)
FROM players players1, player_rs player_rs1
WHERE player_rs1.year = 2000 AND players1.ilkid = player_rs1.ilkid AND player_rs.tid = player_rs1.tid
GROUP BY player_rs1.tid, (players1.h_feet * 30.48 + players1.h_inches * 2.54))
ORDER BY player_rs.tid;

/************************output
 tid | firstname |  lastname  | height 
-----+-----------+------------+--------
 ATL | Dikembe   | Mutombo    | 218.44
 BOS | Mark      | Blount     | 213.36
 CHA | Elden     | Campbell   | 210.82
 CHA | Jamaal    | Magloire   | 210.82
 CHA | P.j.      | Brown      | 210.82
 CHI | Dalibor   | Bagaric    |  215.9
 CLE | Zydrunas  | Ilgauskas  | 220.98
 DAL | Shawn     | Bradley    | 226.06
 DEN | Garth     | Joseph     | 218.44
 DET | Eric      | Montross   | 213.36
 GSW | John      | Coker      | 213.36
 HOU | Jason     | Collier    | 213.36
 IND | Bruno     | Sundov     | 218.44
 LAC | Michael   | Olowokandi | 213.36
 LAL | Shaquille | O'neal     |  215.9
 MIA | Duane     | Causwell   | 213.36
 MIL | Joel      | Przybilla  |  215.9
 MIN | Radoslav  | Nesterovic | 213.36
 NJN | Jim       | Mcilvaine  |  215.9
 NYK | Luc       | Longley    | 218.44
 ORL | Michael   | Doleac     | 210.82
 PHI | Dikembe   | Mutombo    | 218.44
 PHO | Jake      | Tsakalidis | 218.44
 POR | Arvydas   | Sabonis    | 220.98
 SAC | Jabari    | Smith      | 210.82
 SAC | Scot      | Pollard    | 210.82
 SAC | Vlade     | Divac      | 210.82
 SAS | David     | Robinson   |  215.9
 SEA | Patrick   | Ewing      | 213.36
 TOR | Garth     | Joseph     | 218.44
 TOT | Dikembe   | Mutombo    | 218.44
 TOT | Garth     | Joseph     | 218.44
 UTA | Greg      | Ostertag   | 218.44
 VAN | Bryant    | Reeves     | 213.36
 WAS | Calvin    | Booth      | 210.82
 WAS | Cherokee  | Parks      | 210.82
 WAS | Christian | Laettner   | 210.82
(37 rows)
*******************************end/

/*********************************************************************************************************************************
 * 10.List the top 3 players who scored the most points in history. List their last and first names and the points they scored 
 *(hint: use"order by" to sort the results and 'limit xxx' to limit the number of rows returned); 
 *********************************************************************************************************************************/

SELECT player_rs_career.lastname, player_rs_career.firstname,pts
FROM player_rs_career
ORDER BY Pts DESC LIMIT 3;

/**************output
   lastname   | firstname |  pts  
--------------+-----------+-------
 Abdul-jabbar | Kareem    | 38387
 Malone       | Karl      | 36928
 Jordan       | Michael   | 32292
(3 rows)
**************************end/

/**************************************************************
 *11.Calculate the variance of the weights of all players;
 **************************************************************/

/*method 1*/
SELECT var_samp(weight)
FROM players;

/*method 2*/
SELECT variance(weight)
FROM players;

/***************output
     var_samp     
------------------
 647.112395449172
(1 row)
*********************end/


/*****************************************************************************************************************************************
 * 12.Print the first and last names of those who  either scored more than 12000 points in their careers or played more than 12 seasons. 
 ******************************************************************************************************************************************/

SELECT p.firstname, p.lastname
FROM (SELECT firstname, lastname 
	FROM player_rs_career
	WHERE pts > 12000 UNION SELECT firstname, lastname
				FROM player_rs 
				GROUP BY tid, firstname, lastname
				HAVING COUNT (DISTINCT year) >12) p;


/***********************output
 firstname |   lastname   
-----------+--------------
 Bill      | Cartwright
 Ray       | Allen
 Walt      | Bellamy
 John      | Drew
 Paul      | Pierce
 Lenny     | Wilkens
 Rick      | Barry
 Sam       | Jones
 Moses     | Malone
 Johnny    | Newman
 Maurice   | Cheeks
 Rudy      | Tomjanovich
 Dave      | Bing
 Jack      | Marin
 Bill      | Sharman
 Maurice   | Lucas
 Alonzo    | Mourning
 Spencer   | Haywood
 David     | Robinson
 Dick      | Barnett
 Jeff      | Hornacek
 Bob       | Dandridge
 Isiah     | Thomas
 Reggie    | Miller
 George    | Gervin
 Elgin     | Baylor
 Marques   | Johnson
 Mitch     | Richmond
 Richie    | Guerin
 John      | Long
 Hersey    | Hawkins
 Oscar     | Robertson
 Tom       | Heinsohn
 Reggie    | Theus
 Bob       | Love
 Lou       | Dampier
 Mychal    | Thompson
 A.c.      | Green
 Hakeem    | Olajuwon
 Johnny    | Green
 Karl      | Malone
 Kevin     | Mchale
 Darrell   | Griffith
 Dominique | Wilkins
 Julius    | Erving
 Alvan     | Adams
 John      | Havlicek
 Charles   | Barkley
 Jim       | Jackson
 Hal       | Greer
 Kevin     | Johnson
 Wilt      | Chamberlain
 Adrian    | Dantley
 Detlef    | Schrempf
 Bill      | Russell
 Sam       | Perkins
 Tracy     | Mcgrady
 Earl      | Monroe
 Rolando   | Blackman
 Pete      | Maravich
 Willis    | Reed
 Gary      | Payton
 Eddie     | Johnson
 Jeff      | Malone
 Bob       | Boozer
 Derrick   | Coleman
 Orlando   | Woolridge
 Gus       | Williams
 Joe       | Dumars
 Thomas    | Sanders
 Larry     | Bird
 Steve     | Smith
 Horace    | Grant
 Sleepy    | Floyd
 Johnny    | Kerr
 Bob       | Mcadoo
 Bernard   | King
 Tim       | Hardaway
 Randy     | Smith
 Kiki      | Vandeweghe
 Walt      | Frazier
 Bill      | Laimbeer
 Glenn     | Robinson
 Lou       | Hudson
 Dale      | Ellis
 Jack      | Twyman
 Joe Barry | Carroll
 Nick      | Van Exel
 Jerry     | Lucas
 Elvin     | Hayes
 Dave      | Cowens
 Shareef   | Abdur-rahim
 Jerry     | West
 Jojo      | White
 Antoine   | Walker
 Norm      | Nixon
 Jamaal    | Wilkes
 Dave      | Debusschere
 Billy     | Cunningham
 Tim       | Duncan
 Sam       | Cassell
 Ricky     | Pierce
 Mike      | Newlin
 Bob       | Lanier
 Jack      | Sikma
 Terry     | Porter
 Terry     | Cummings
 Tom       | Chambers
 Latrell   | Sprewell
 Chuck     | Person
 Mark      | Jackson
 Clyde     | Drexler
 Rod       | Strickland
 Scottie   | Pippen
 Patrick   | Ewing
 Xavier    | Mcdaniel
 Vlade     | Divac
 Shaquille | O'neal
 Larry     | Nance
 Rik       | Smits
 Michael   | Finley
 Dick      | Vanarsdale
 John      | Stockton
 Jerry     | Stackhouse
 Chet      | Walker
 Glen      | Rice
 Armen     | Gilliam
 Alex      | English
 Nate      | Archibald
 Dolph     | Schayes
 Chris     | Webber
 Kendall   | Gill
 Nate      | Thurmond
 Kelly     | Tripucka
 James     | Edwards
 Paul      | Westphal
 Dennis    | Johnson
 Gail      | Goodrich
 Bob       | Pettit
 Eddie     | Jones
 World     | Free
 Kareem    | Abdul-jabbar
 Cliff     | Hagan
 Mickey    | Johnson
 Fred      | Brown
 Walter    | Davis
 Kobe      | Bryant
 Kevin     | Garnett
 Calvin    | Murphy
 Kevin     | Willis
 Jalen     | Rose
 Ron       | Harper
 Buck      | Williams
 Otis      | Thorpe
 James     | Worthy
 Clifford  | Robinson
 Robert    | Parish
 Allen     | Iverson
 Artis     | Gilmore
 Purvis    | Short
 Juwan     | Howard
 Byron     | Scott
 Michael   | Jordan
 Derek     | Harper
 Stephon   | Marbury
 Paul      | Arizin
 Wayman    | Tisdale
 Chris     | Mullin
 Bailey    | Howell
 Otis      | Birdsong
 Cazzie    | Russell
 Allan     | Houston
 Magic     | Johnson
 Dell      | Curry
 Jeff      | Mullins
 Bob       | Cousy
 Ron       | Boone
 Danny     | Manning
 Shawn     | Kemp
 Charles   | Oakley
 Mark      | Aguirre
 Tom       | Vanarsdale
 Dan       | Issel
 Sidney    | Wicks
 Mike      | Mitchell
(185 rows)
***********************end/



