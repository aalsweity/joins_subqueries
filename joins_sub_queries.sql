-- Question 1
SELECT first_name, last_name, district
FROM customer c
JOIN address a
ON a.address_id = c.address_id
WHERE district = 'Texas';
-- Answer = 5

-- Question 2
SELECT first_name, last_name, amount
FROM payment p
JOIN customer c 
ON p.customer_id = c.customer_id
WHERE amount > 7; -- I'm considering 7.01 higher than 7 exact.
-- Answer = 1406

-- Question 3
SELECT *
FROM customer c
WHERE customer_id IN (
	SELECT customer_id
	FROM payment p 
	GROUP BY customer_id
	HAVING sum(amount) > 175
	);
-- Answer = 6

-- Question 4
SELECT first_name, last_name, country 
FROM customer c --need customer names AND address TO BEGIN chaining
JOIN address a -- FIRST chaining AS address has city ids that IS needed
ON c.address_id = a.address_id
JOIN city ci -- city SECOND chaining AS city has county ids
ON ci.city_id = a.city_id 
JOIN country co 
ON ci.country_id = co.country_id
WHERE country = 'Nepal';
-- Answer = 1

-- Question 5
SELECT count(s.staff_id), s.staff_id, first_name, last_name
FROM staff s
join rental r
on r.staff_id = s.staff_id
group by s.staff_id;
-- Answer = staff member 1, Mike Hillyer

-- Question 6
select rating, count(*)
from film f
group by rating;
-- Answer -> G = 178, PG = 194, PG-13 =  223, NC-17 = 210, R = 195

--Question 7
SELECT distinct c.customer_id
FROM customer c
WHERE c.customer_id IN (
	SELECT customer_id
	FROM payment p 
	where amount > 6.99
	GROUP BY customer_id
	);
-- Answer = 539 customers

-- Question 8
select amount
from payment
where amount = 0;
-- Answer = 24 free rentals given away

-- Test Zone
select distinct 
from customer;


 


