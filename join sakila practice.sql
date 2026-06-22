USE sakila;

-- 1. List all customers along with their city names.
SELECT c.first_name, c.last_name, ci.city
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id;

-- 2. Show all customers with their country names.
SELECT c.first_name, c.last_name, co.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- 3. Display staff names with their store location (city).
SELECT s.first_name, s.last_name, ci.city
FROM staff s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id;

-- 4. List all films with their language name.
SELECT f.title, l.name
FROM film f
JOIN language l ON f.language_id = l.language_id;

-- 5. Show film titles along with their category names.
SELECT f.title, c.name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

-- 6. Display all actors with the films they acted in.
SELECT a.first_name, a.last_name, f.title
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id;

-- 7. List all customers and their rental dates.
SELECT c.first_name, r.rental_date
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id;

-- 8. Show rental details with customer names and film titles.
SELECT c.first_name, f.title, r.rental_date
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

-- 9. Display payment details with customer names.
SELECT c.first_name, p.amount
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id;

-- 10. List all staff members with the payments they processed.
SELECT s.first_name, p.amount
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id;

-- 11. Show all films available in each store.
SELECT s.store_id, f.title
FROM inventory i
JOIN film f ON i.film_id = f.film_id
JOIN store s ON i.store_id = s.store_id;

-- 12. Display store details with manager names.
SELECT st.store_id, s.first_name
FROM store st
JOIN staff s ON st.manager_staff_id = s.staff_id;

-- 13. List customers along with their total payments.
SELECT c.first_name, SUM(p.amount)
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

-- 14. Show all rentals with return dates and customer names.
SELECT c.first_name, r.return_date
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id;

-- 15. Display film titles and the number of actors in each film.
SELECT f.title, COUNT(fa.actor_id)
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id;

-- 16 List all categories with the number of films in each category.
SELECT c.name, COUNT(fc.film_id)
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id;

-- 17 Show actor names with the number of films they acted in.
SELECT a.first_name, COUNT(fa.film_id)
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id;

-- 18 Display customer names with the number of rentals made.
SELECT c.first_name, COUNT(r.rental_id)
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- 19 List films along with rental counts.
SELECT f.title, COUNT(r.rental_id)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id;

-- 20  Show store-wise total revenue.
SELECT s.store_id, SUM(p.amount)
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id;

-- 21 Display all customers who live in the same city as a store.
SELECT c.first_name, ci.city
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN store st ON ci.city_id = st.store_id;

-- 22 List films rented by each customer.
SELECT c.first_name, f.title
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

-- 23 Show customers who never made any payment (LEFT JOIN).
SELECT c.first_name
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
WHERE p.payment_id IS NULL;

-- 24 List films that were never rented.
SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;

-- 25 Show all actors who have not acted in any film (if any).
SELECT a.first_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL;

-- 26
SELECT r.rental_id
FROM rental r
WHERE r.return_date IS NULL;

-- 27
SELECT c.first_name, MAX(r.rental_date)
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- 28
SELECT f.title, COUNT(i.inventory_id)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.film_id;

-- 29
SELECT c.first_name, f.title, f.rental_duration
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

-- 30
SELECT c.first_name, f.title, p.amount
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON p.customer_id = c.customer_id;

-- 31
SELECT s.first_name, COUNT(r.rental_id)
FROM staff s
JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id;

-- 32
SELECT c.first_name, s.first_name
FROM customer c
JOIN store st ON c.store_id = st.store_id
JOIN staff s ON st.store_id = s.store_id;

-- 33
SELECT f.title, f.replacement_cost, c.name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

-- 34
SELECT a.address, ci.city, co.country
FROM address a
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- 35
SELECT c.first_name, a.address, ci.city, co.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- 36
SELECT f.title, a.first_name, c.name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

-- 37
SELECT r.rental_id, s.first_name, st.store_id
FROM rental r
JOIN staff s ON r.staff_id = s.staff_id
JOIN store st ON s.store_id = st.store_id;

-- 38
SELECT p.amount, f.title
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

-- 39
SELECT DISTINCT c.first_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
WHERE fc.category_id = 1;

-- 40
SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
GROUP BY f.film_id
HAVING COUNT(fc.category_id) > 1;

-- 41
SELECT c.first_name, COUNT(r.rental_id)
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
HAVING COUNT(r.rental_id) > 5;

-- 42
SELECT f.title, c.name, COUNT(r.rental_id)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY f.film_id
ORDER BY COUNT(r.rental_id) DESC;

-- 43
SELECT DISTINCT a.first_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film_category fc ON fa.film_id = fc.film_id
WHERE fc.category_id = 1;

-- 44
SELECT c.first_name, COUNT(p.payment_id), SUM(p.amount)
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

-- 45
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
WHERE ci.city = 'London';

-- 46
SELECT s.first_name
FROM staff s
JOIN store st ON s.store_id = st.store_id
JOIN address a ON st.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'India';

-- 47
SELECT f.title, i.store_id, COUNT(r.rental_id)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, i.store_id;

-- 48
SELECT c.first_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
WHERE r.staff_id = 1;

-- 49
SELECT f.title, a.first_name, COUNT(r.rental_id)
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, a.actor_id;

-- 50 (FULL JOIN style using UNION)
SELECT first_name, last_name FROM customer
UNION
SELECT first_name, last_name FROM staff;

------------------------------------------

-- 1
SELECT c.first_name, f.title, cat.name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id;

-- 2
SELECT a.first_name, SUM(p.amount) AS revenue
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN inventory i ON fa.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY a.actor_id;

-- 3
SELECT f.title, COUNT(DISTINCT r.customer_id)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id;

-- 4
SELECT DISTINCT c.first_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_actor fa ON i.film_id = fa.film_id
WHERE fa.actor_id = 1;

-- 5
SELECT f.title, SUM(p.amount)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.film_id;

-- 6
SELECT store_id, COUNT(DISTINCT customer_id)
FROM customer
GROUP BY store_id;

-- 7
SELECT c.customer_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT fc.category_id) > 1;

-- 8
SELECT c.first_name, f.title
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE MONTH(r.rental_date) = 5;

-- 9
SELECT a1.first_name, a2.first_name
FROM film_actor fa1
JOIN film_actor fa2 
ON fa1.film_id = fa2.film_id 
AND fa1.actor_id < fa2.actor_id
JOIN actor a1 ON fa1.actor_id = a1.actor_id
JOIN actor a2 ON fa2.actor_id = a2.actor_id;

-- 10
SELECT f.title, COUNT(DISTINCT fa.actor_id)
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id;

-- 11
SELECT c.first_name, SUM(f.rental_duration)
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY c.customer_id;

-- 12
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.film_id
HAVING COUNT(DISTINCT i.store_id) = 2;      

-- 13
SELECT c.first_name, f.title, COUNT(*)
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY c.customer_id, f.film_id
HAVING COUNT(*) > 1;

-- 14
SELECT s.first_name, MONTH(p.payment_date), SUM(p.amount)
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id, MONTH(p.payment_date);

-- 15
SELECT category_id, film_id
FROM (
  SELECT fc.category_id, fc.film_id,
         RANK() OVER (PARTITION BY fc.category_id ORDER BY COUNT(r.rental_id) DESC) rnk
  FROM film_category fc
  JOIN inventory i ON fc.film_id = i.film_id
  JOIN rental r ON i.inventory_id = r.inventory_id
  GROUP BY fc.category_id, fc.film_id
) t
WHERE rnk = 1;

-- 16
SELECT c.customer_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT fc.category_id) = (SELECT COUNT(*) FROM category);

-- 17
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE i.store_id = 1
AND r.rental_id IS NULL;
-- 18
SELECT fa1.actor_id, fa2.actor_id, COUNT(*) AS total_films
FROM film_actor fa1
JOIN film_actor fa2 
  ON fa1.film_id = fa2.film_id 
  AND fa1.actor_id < fa2.actor_id
GROUP BY fa1.actor_id, fa2.actor_id
HAVING COUNT(*) > 3;

-- 19
SELECT c.first_name
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE p.amount > (SELECT AVG(amount) FROM payment);

-- 20
SELECT store_id, film_id, SUM(amount)
FROM inventory i
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY store_id, film_id;

-- 21
SELECT c.customer_id
FROM customer c
WHERE c.customer_id NOT IN (
  SELECT r.customer_id
  FROM rental r
  JOIN inventory i ON r.inventory_id = i.inventory_id
  JOIN film_category fc ON i.film_id = fc.film_id
  WHERE fc.category_id = 1
);

-- 22
SELECT a.actor_id
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film_category fc ON fa.film_id = fc.film_id
GROUP BY a.actor_id
HAVING COUNT(DISTINCT fc.category_id) = 1;

-- 23
SELECT c.customer_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT i.store_id) = 1;

-- 24
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id;

-- 25
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
HAVING COUNT(DISTINCT r.customer_id) >= 10;

-- 26
SELECT s.first_name, COUNT(r.rental_id)
FROM store st
JOIN staff s ON st.manager_staff_id = s.staff_id
JOIN inventory i ON st.store_id = i.store_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY s.staff_id;

-- 27
SELECT c.customer_id
FROM rental r1
JOIN rental r2 
ON r1.customer_id = r2.customer_id
AND DATE(r2.rental_date) = DATE_ADD(DATE(r1.rental_date), INTERVAL 1 DAY);

-- 28
SELECT f.title, SUM(f.rental_duration)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY SUM(f.rental_duration) DESC;

-- 29
SELECT a.first_name, COUNT(r.rental_id)
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN inventory i ON fa.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY a.actor_id
ORDER BY COUNT(r.rental_id) DESC
LIMIT 3;

-- 30
SELECT f.title
FROM (
  SELECT f.film_id, SUM(p.amount) total
  FROM film f
  JOIN inventory i ON f.film_id = i.film_id
  JOIN rental r ON i.inventory_id = r.inventory_id
  JOIN payment p ON r.rental_id = p.rental_id
  GROUP BY f.film_id
) t
JOIN film f ON t.film_id = f.film_id
WHERE total > (SELECT AVG(amount) FROM payment);

-- 31
SELECT c.customer_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT i.store_id) = 2;

-- 32
SELECT title
FROM film
GROUP BY title
HAVING COUNT(*) > 1;

-- 33
SELECT c.first_name, a.last_name
FROM customer c
JOIN actor a ON c.last_name = a.last_name;

-- 34
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NULL;

-- 35
SELECT c.first_name, f.title, MAX(p.amount)
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON p.customer_id = c.customer_id;

-- 36
SELECT store_id, category_id, COUNT(*)
FROM inventory i
JOIN film_category fc ON i.film_id = fc.film_id
GROUP BY store_id, category_id;

-- 37
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
JOIN staff s ON r.staff_id = s.staff_id
JOIN address a1 ON c.address_id = a1.address_id
JOIN address a2 ON s.address_id = a2.address_id
WHERE a1.city_id = a2.city_id;

-- 38
SELECT a.actor_id
FROM actor a
WHERE a.actor_id NOT IN (
  SELECT fa.actor_id
  FROM film_actor fa
  JOIN film_category fc ON fa.film_id = fc.film_id
  WHERE fc.category_id = 1
);

-- 39
SELECT c.customer_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT r.staff_id) > 1;

-- 40
SELECT f.title, AVG(f.rental_duration)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id;

-- 41
SELECT customer_id, COUNT(*)
FROM rental
GROUP BY customer_id
HAVING COUNT(*) > (SELECT AVG(cnt) FROM (SELECT COUNT(*) cnt FROM rental GROUP BY customer_id) t);

-- 42
SELECT f.title, i.store_id, COUNT(r.rental_id)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, i.store_id;

-- 43
SELECT a.actor_id
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN inventory i ON fa.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;

-- 44
SELECT c.customer_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_actor fa ON i.film_id = fa.film_id
GROUP BY c.customer_id, fa.actor_id
HAVING COUNT(DISTINCT i.film_id) = (
  SELECT COUNT(*) FROM film_actor WHERE actor_id = fa.actor_id
);

-- 45
SELECT ci.city, f.title, COUNT(r.rental_id)
FROM city ci
JOIN address a ON ci.city_id = a.city_id
JOIN customer c ON a.address_id = c.address_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY ci.city, f.film_id;

-- 46
SELECT c.customer_id
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
JOIN store s ON i.store_id = s.store_id
JOIN address a ON s.address_id = a.address_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT a.city_id) > 1;

-- 47
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.return_date <= DATE_ADD(r.rental_date, INTERVAL f.rental_duration DAY);

-- 48
SELECT a.actor_id, AVG(p.amount)
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN inventory i ON fa.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY a.actor_id;

-- 49
SELECT c.customer_id, SUM(p.amount) AS total_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN address a ON c.address_id = a.address_id
GROUP BY c.customer_id, a.city_id
HAVING total_payment < (
    SELECT AVG(city_total)
    FROM (
        SELECT c2.customer_id, SUM(p2.amount) AS city_total
        FROM customer c2
        JOIN payment p2 ON c2.customer_id = p2.customer_id
        JOIN address a2 ON c2.address_id = a2.address_id
        WHERE a2.city_id = a.city_id
        GROUP BY c2.customer_id
    ) t
);

-- 50
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;