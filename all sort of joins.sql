use movie_database

SELECT rev_name
FROM reviewer
    JOIN rating ON rating.rev_id = reviewer.rev_id
WHERE rev_stars IS NULL;

SELECT act_fname, act_lname, role
FROM actor
    INNER JOIN movie_cast ON movie_cast.act_id = actor.act_id
    INNER JOIN movie ON movie_cast.mov_id = movie.mov_id
WHERE mov_title = 'Annie Hall'

SELECT rev_name, rev_stars
FROM reviewer
    JOIN rating ON reviewer.rev_id BETWEEN 9001 AND 9005
WHERE rev_stars IS NULL;

SELECT *
FROM rating, reviewer
WHERE rating.rev_id = reviewer.rev_id;

SELECT *
FROM reviewer
    LEFT JOIN rating
    ON reviewer.rev_id = rating.rev_id;

SELECT *
FROM reviewer
    RIGHT JOIN rating ON 
    reviewer.rev_id = rating.rev_id;
