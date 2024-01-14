requests['Display all actors'] = "SELECT * FROM actors;"
requests['Display all genres'] = "SELECT * FROM GENRES;"
requests['Display the name and year of the movies'] = "SELECT MOV_TITLE, MOV_YEAR FROM MOVIES;"
requests['Display reviewer name from the reviews table'] = "SELECT REV_NAME FROM REVIEWS;"

requests["Find the year when the movie American Beauty released"] = "SELECT MOV_YEAR FROM MOVIES WHERE MOV_TITLE = 'American Beauty';"
requests["Find the movie which was released in the year 1999"] = "SELECT MOV_TITLE FROM MOVIES WHERE MOV_YEAR = '1999';"
requests["Find the movie which was released before 1998"] = "SELECT MOV_TITLE FROM MOVIES WHERE MOV_YEAR < 1998;"
requests["Find the name of all reviewers who have rated 7 or more stars to their rating order by reviews rev_name (it might have duplicated names :-))"] = "SELECT A.REV_NAME FROM REVIEWS A,MOVIES_RATINGS_REVIEWS B WHERE  A.ID = B.REV_ID AND B.REV_STARS >= 7 ORDER BY A.REV_NAME ASC;"
requests["Find the titles of the movies with ID 905, 907, 917"] = "SELECT MOV_TITLE FROM MOVIES WHERE ID = 905 OR ID= 907 OR ID = 917;"
requests["Find the list of those movies with year and ID which include the words Boogie Nights"] = "SELECT ID,MOV_TITLE,MOV_YEAR FROM MOVIES WHERE MOV_TITLE LIKE '%Boogie Nights %';"
requests["Find the ID number for the actor whose first name is 'Woody' and the last name is 'Allen'"] = "SELECT ID FROM ACTORS WHERE ACT_FNAME = 'Woody' AND ACT_LNAME = 'Allen';"

requests["Find the actors with all information who played a role in the movies 'Annie Hall'"] = "SELECT actors.id,act_fname, act_lname, actors.act_gender FROM movies, movies_actors, actors WHERE movies.mov_title = 'Annie Hall' AND movies_actors.act_id=actors.id AND movies_actors.mov_id=movies.id;"
requests["Find the first and last names of all the actors who were cast in the movies 'Annie Hall', and the roles they played in that production"] = "SELECT act_fname, act_lname, role FROM movies, movies_actors, actors WHERE movies.mov_title = 'Annie Hall' AND movies_actors.act_id=actors.id AND movies_actors.mov_id=movies.id;" 
 
requests["Find the name of movie and director who directed a movies that casted a role as Sean Maguire"] = "SELECT dir_fname, dir_lname, mov_title FROM movies, directors WHERE movies.id =(SELECT mov_id FROM movies_actors WHERE role= 'Sean Maguire') AND directors.id= (SELECT dir_id FROM directors_movies WHERE directors_movies.mov_id= (SELECT mov_id FROM movies_actors WHERE role= 'Sean Maguire'));"
requests["Find all the actors who have not acted in any movie between 1990 and 2000 (select only actor first name, last name, movie title and release year)"] = "SELECT a.act_fname, a.act_lname, b.mov_title, 
CAST(SUBSTRING (b.mov_dt_rel, 0, 5) AS INT) As release_year FROM actors a, movies b, movies_actors c
WHERE (release_year NOT BETWEEn '1990' AND '2000' AND a.id = c.act_id AND b.id = c.mov_id )
and (a.act_fname NOT IN ('Kevin'))"