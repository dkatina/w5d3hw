--QUESTION 1

SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customer_name, district
FROM customer
JOIN address ON customer.address_id = address.address_id
WHERE district = 'Texas'

--Question 2

SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customer_name, amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY customer_name 

-- Question 3

SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customer_name,
SUM(amount)
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer_name
HAVING SUM(amount) > 175
ORDER BY customer_name 

--Question 4

SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customer_name,
country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON country.country_id = city.country_id
WHERE country = 'Nepal'

--Question 5

SELECT CONCAT(staff.first_name, ' ', staff.last_name) as employee, 
COUNT(rental_id)
FROM staff
JOIN rental ON staff.staff_id = rental.staff_id
GROUP BY employee
HAVING COUNT(rental_id) = (
    SELECT MAX(y.mycount)
    FROM (
        SELECT staff_id, COUNT(rental_id)mycount
        FROM rental
        GROUP BY staff_id
    )y)

--Question 6

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating

--QUestion 7

SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customer_name
FROM customer
WHERE customer_id in (
SELECT customer_id
FROM payment
WHERE amount > 6.99
)

--Question 8

SELECT COUNT(rental.rental_id)
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
WHERE amount = 0