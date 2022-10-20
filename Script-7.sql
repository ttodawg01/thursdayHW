--1. List all customers who live in Texas (use JOINs)
SELECT * 
FROM address
WHERE district = 'Texas';




--2. List all payments of more than $7.00 with the customer’s first and last name
SELECT c.first_name, c.last_name, p.amount 
FROM customer c
JOIN payment p 
ON c.customer_id = p.customer_id
WHERE amount >= 7.00;


--3. Show all customer names who have made over $175 in payments (use
--subqueries)


SELECT *
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
	FROM payment 
	GROUP BY customer_id 
	HAVING sum(amount) > 175.00 
);



--4. List all customers that live in Argentina (use the city table)
SELECT *
FROM customer ;


SELECT c.first_name, c.last_name, ca.country 
FROM customer c
JOIN country ca 
ON c.customer_id = ca.country_id
WHERE ca.country IN (
	SELECT country
	WHERE country = 'Argentina'
);


--5. Show all the film categories with their count in descending order
SELECT *
FROM film_category ; -- category_id

SELECT * 
FROM category ; --name


--SELECT *
--FROM category
--WHERE category_id IN (
--	SELECT category_id AS num_movies_in_cat
--	FROM film_category fc 
--	GROUP BY category_id 
--	HAVING count(film_id) IN (
--		SELECT c.customer_id
--		FROM rental r 
--		GROUP BY customer_id
--		HAVING count(*) > 25
--		ORDER BY c.customer_id DESC 
--	)
--);

SELECT c.category_id, c.name, count(*) AS num_of_movies_in_cat
FROM category c 
JOIN film_category fc 
ON fc.category_id = c.category_id 
GROUP BY c.category_id 
ORDER BY num_of_movies_in_cat DESC;





--6. What film had the most actors in it (show film info)?

SELECT *
FROM category c ;

SELECT f.film_id, f.title
FROM film f ;
JOIN 




--7. Which actor has been in the least movies?





--8. Which country has the most cities?
SELECT *
FROM country c 





--9. List the actors who have been in between 20 and 25 films.
SELECT *
FROM film_actor;

SELECT *
FROM actor;

