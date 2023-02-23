-- 1. List all customers who live in Texas (use
-- JOINs)
SELECT * 
FROM address
INNER JOIN customer
ON address.address_id = customer.customer_id
WHERE district = 'Texas';


--Answer: Dorothy Taylor, Thelma Murray, Daniel Cabral, Leonard Schofield,
-- Alfredo Mcadams

-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT customer.first_name, customer.last_name, payment.amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- Answer: There are 3661 results. See above for answer

-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);
--Answer: There are 135 customer names who made payments over $175. see above for answer

-- 4. List all customers that live in Nepal (use the city table)
    SELECT first_name, last_name, city 
    FROM customer
    INNER JOIN address 
    ON customer.address_id = address.address_id
    INNER JOIN city
    ON address.city_id = city.city_id
    WHERE city = 'Nepal';

--Answer: No customers live in Nepal

-- 5. Which staff member had the most
-- transactions?
    SELECT first_name, last_name, COUNT(payment_id)
    FROM staff
    INNER JOIN payment
    ON staff.staff_id = payment.staff_id
    GROUP BY first_name, last_name
    ORDER BY COUNT(payment_id) DESC;

--Answer: Jon stevens has the most transactions with 7304

-- 6. How many movies of each rating are
-- there?

SELECT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY COUNT(title) DESC;

--Answer: PG-13 has the most with 223

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id, amount
    HAVING amount > 6.99
);

--Answer: There are 597 customers who have made a single payment above 6.99

-- 8.How many free rentals did our store give away?
SELECT * 
FROM rental;

SELECT *
FROM payment
WHERE payment_date IS NOT NULL;

SELECT * 
FROM payment
WHERE payment_date IS NULL;

SELECT * 
FROM payment
WHERE amount = 0;

SELECT * 
FROM payment
WHERE amount IS NULL;

SELECT * 
FROM payment
WHERE amount IS NOT NULL;

SELECT * 
FROM store;


--Answer: Nobody gets away with a rental without paying at this store.


