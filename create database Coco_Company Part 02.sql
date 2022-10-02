
(01). Query 01

SELECT C.costomer_name, S.name, S.city
FROM salesman AS S , costomer AS C
WHERE S.city = C.city;

/* name and city of those customers 
and salesmen who lives in the same city. */

(02). Query 02

SELECT costomer.costomer_name, salesman.name
FROM costomer, salesman
WHERE salesman.salesman_id = costomer.salesman_id;


/* names of all customers along 
with the salesmen who works for them. */

(03). Query 03

SELECT order_no, costomer_name, orderr.costomer_id,
orderr.salesman_id
FROM salesman, costomer, orderr
WHERE costomer.city <> salesman.city
AND orderr.costomer_id = costomer.costomer_id
AND orderr.salesman_id = salesman.salesman_id;

/* orders by the customers not located 
in the same cities where their salesmen live. */

(04). Query 04 (using subquery)

SELECT *
FROM orderr
WHERE salesman_id =
(SELECT salesman_id
FROM salesman 
WHERE name = 'Paul Adam');

/* Display all the orders issued by 
the salesman 'Paul Adam' from the orders table. */

(05). Query 05 (using subquery)

SELECT *
FROM orderr
WHERE purch_amt >
(SELECT AVG(purch_amt) 
FROM orderr 
WHERE order_date = '2012-10-10');

/* all the orders which values are greater than the average order
 value for 10th October 2012. */

(06). Query 06 (using subquery)

SELECT *
FROM orderr
WHERE salesman_id IN
(SELECT salesman_id
FROM salesman 
WHERE city ='Paris');

/* all orders attributed to salesmen in Paris. */

(07). Query 07 (using subquery)

SELECT order_no, purch_amt, order_date, salesman_id
FROM orderr 
WHERE salesman_id IN (
SELECT salesman_id
FROM salesman
WHERE commission = (
SELECT MAX(commission) 
FROM salesman)
);

/*  orders table for the 
salesman who earned the maximum commission. */

(08). Query 08 (using subquery)

SELECT salesman_id, name 
FROM salesman AS a 
WHERE 1 < 
(SELECT COUNT(*) 
FROM costomer AS c
WHERE c.salesman_id = a.salesman_id);

/* name and ids of all salesmen who 
had more than one customer. */

/* OR USE THIS CODE */

SELECT c.salesman_id, s.name FROM salesman AS s, costomer AS c 
where s.salesman_id = c.salesman_id
group by c.salesman_id, s.name Having count(c.salesman_id) > 1;


(09). Query 09 (using subquery)

SELECT * 
FROM salesman 
WHERE salesman_id IN (
SELECT DISTINCT salesman_id
FROM costomer a 
WHERE NOT EXISTS (
SELECT * FROM costomer b 
WHERE a.salesman_id = b.salesman_id
AND a.costomer_name <> b.costomer_name));

/* all the salesmen who 
worked for only one customer. */

(09.1). Query 09.1  Equivalent Queries

SELECT c.salesman_id, s.name, s.city, s.commission
FROM salesman s, costomer c
where s.salesman_id = c.salesman_id
group by c.salesman_id, s.name
Having count(c.salesman_id) = 1;

/* all the salesmen who 
worked for only one customer. */

(10). Query 10 (using subquery)

SELECT *
FROM orderr
WHERE purch_amt > ANY
(SELECT purch_amt
FROM orderr
WHERE order_date = '2012-09-10');


/* orders that had amounts that were greater than at 
least one of the orders from September 10th 2012. */

(11). Query 11 (using subquery)

SELECT *
FROM costomer
WHERE grade > ALL
(SELECT grade
FROM costomer
WHERE city = 'NewYork');

/* customers whose grade are, in 
fact, higher than every customer in New York. */