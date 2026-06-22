USE sakila;

SELECT * 
FROM film;

SELECT title, release_year, rating
FROM film;


SELECT DISTINCT rating
FROM film;

SELECT title, rating
FROM film
WHERE rating = 'PG';


SELECT title, length
FROM film
WHERE length > 120;


SELECT title, rating, length
FROM film
WHERE rating = 'PG' AND length > 120;

SELECT title, rating
FROM film
WHERE rating = 'PG' OR rating = 'G';

SELECT title, length
FROM film
WHERE length BETWEEN 90 AND 120;


SELECT title, rating
FROM film
WHERE rating IN ('PG', 'G', 'PG-13');


SELECT title
FROM film
WHERE title LIKE 'A%';

SELECT title
FROM film
WHERE title LIKE '%Y';

SELECT title
FROM film
WHERE title LIKE '%LOVE%';

SELECT title, length
FROM film
ORDER BY length ASC;


SELECT title, length
FROM film
ORDER BY length DESC;


SELECT title, length
FROM film
LIMIT 5;


SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating;

SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating
HAVING COUNT(*) > 200;


SELECT title AS movie_name, length AS duration
FROM film;

