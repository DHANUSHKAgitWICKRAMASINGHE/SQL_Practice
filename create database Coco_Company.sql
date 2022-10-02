create database Coco_Company;

use Coco_Company;

create table salesman (

    salesman_id varchar(50) primary key,
    name varchar (255) not null,
    city varchar (255),
    commission double (30,4)
);

desc salesman;


insert into salesman values 
    ('5001', 'James Hong', 'New York', 0.15),
    ('5002', 'Nail Knite', 'Paris', 0.13);

    

insert into salesman values
    ('5005', 'Pit Alex', 'London', 0.11),
    ('5006', 'Mo Lyon', 'Paris', 0.14);

insert into salesman values
    ('5003', 'Lauson Hen', ' ', 0.12),
    ('5007', 'Paul Adam', 'Rome', 0.13);

    select * from salesman;

    create table costomer(

    costomer_id varchar(50) primary key,
    costomer_name varchar (255) not null,
    city varchar (255),
    grade int (30),
    salesman_id varchar(50)
);

alter table costomer 
add foreign key 
costomer(salesman_id) references salesman(salesman_id);



drop table costomer;


insert into costomer values 
    ('3002', 'Nick Rimando','New York', 100,'5001'),
    ('3005', 'Graham Zusi','California', 200,'5002'),
    ('3001', 'Brad Guzan','London',null,null),
    ('3004', 'Fabian Johns','Paris', 300,'5006'),
    ('3007', 'Brad Davis','New York', 200,'5001'),
    ('3009', 'Geoff Camero','Berlin', 100,null),
    ('3008', 'Julian Green','London', 300,'5002'),
    ('3003', 'Jozy Altidor','Moncow', 200,'5001')
   ;


 

   
 select * from costomer;
 desc costomer;

 delete from costomer;

 create table orderr(
    order_no varchar(50) primary key,
    purch_amt double(10,4),
    order_date date,
    costomer_id varchar(50),
    salesman_id varchar(50)
);

insert into orderr values 
    ('70001', '150.5','2016-10-05','3005','5002'),
    ('70009', '270.65','2016-09-10','3001',null),
    ('70002', '65.26','2016-10-05','3002','5001'),
    ('70004', '110.5','2016-08-17','3009',null),
    ('70007', '948.5','2016-09-10','3005','5002'),
    ('70005', '2400.6','2016-07-27','3007','5001'),
    ('70008', '5760','2016-09-10','3002','5001'),
    ('70010', '1983.43','2016-10-10','3004','5006'),
    ('70003', '2480.4','2016-10-10','3009',null),
    ('70012', '250.45','2016-06-27','3008','5002'),
    ('70011', '75.29','2016-08-17','3003','5007')
   ;
select * from orderr;

 delete from orderr;

 alter table orderr add foreign key (costomer_id) references costomer(costomer_id);
alter table orderr add foreign key (salesman_id) references salesman(salesman_id);

 desc orderr;

 alter table orderr add foreign key orderr(salesman_id2) references salesman(salesman_id);

 

alter table costomer 
add foreign key 
costomer(salesman_id) references salesman(salesman_id);



 create table nobel_win(
    year int(50),
    subject varchar(50),
    winner varchar(255),
    country varchar(50),
    category varchar(50)
);

insert into nobel_win values 
    ('1970', 'Physics','Hannes Alfven','Sweden','Scientist'),
    ('1970', 'Physics','Louis Neel','France','Scientist'),
    ('1970', 'Chemistry','Luis Federico Leloir','France','Scientist'),
    ('1970', 'Physiology','Ulf von Euler','Sweden','Scientist'),
    ('1970', 'Physiology','Bernard Katz','Germany','Scientist'),
    ('1970', 'Literature','Aleksandr Solzhenitsyn','Russia','Linguist'),
    ('1970', 'Economics','Paul Samuelson','USA','Economist'),
    ('1970', 'Physiology','Julius Axelrod','USA','Scientist'),
    ('1971', 'Physics','Dennis Gabor','Hungary','Scientist'),
    ('1971','Chemistry','Gerhard Herzberg','Germany','Scientist'),
    ('1971', 'Peace','Willy Brandt','Germany','Chancellor'),
    ('1971', 'Literature','Pablo Neruda','Chile','Linguist'),
    ('1971', 'Economics','Simon Kuznets','Russia','Economist'),
    ('1978', 'Peace','Anwar al-Sadat','Egypt','President'),
    ('1978', 'Peace','Menachem Begin','Israel','Prime Minister'),
    ('1987', 'Chemistry','Donald J. Cram','USA','Scientist'),
    ('1987', 'Chemistry','Jean-Marie Lehn','France','Scientist'),
    ('1987', 'Physiology','Susumu Tonegawa','Japan','Scientist'),
    ('1994', 'Economics','Reinhard Selten','Germany','Economist'),
    ('1994', 'Peace','Yitzhak Rabin','Israel','Prime Minister'),
    ('1987', 'Physics','Johannes Georg Bednorz','Germany','Scientist'),
    ('1987', 'Literature','Joseph Brodsky','Russia','Linguist'),
    ('1987', 'Economics','Robert Solow','USA','Economist'),
    ('1994', 'Literature','Kenzaburo Oe','Japan','Linguist')
   ;
    

    select * from nobel_win;

    drop table orderr;



   (01). Query 1

        SELECT name, commission
        FROM salesman;


    (02). Query 2

        select distinct salesman_id
        from orderr;

    (03). Query 3

        SELECT name,city
        FROM salesman
        WHERE city='Paris';

    (04). Query 4

        SELECT *
        FROM costomer
        WHERE grade = 200;

    (05). Query 5

        SELECT order_no, order_date, purch_amt
        FROM orderr
        WHERE salesman_id = 5001;

    (06). Query 6

        SELECT winner
        FROM nobel_win
        WHERE year = 1971
        AND subject = 'Literature';

    (07). Query 7

        SELECT *
        FROM nobel_win
        WHERE winner LIKE 'Louis%';


    (08). Query 8

        SELECT * 
        FROM nobel_win
        WHERE (subject = 'Physics' AND year = 1970) 
        UNION
        (SELECT * 
        FROM nobel_win
        WHERE (subject = 'Economics' AND year = 1971)
        );


    (09). Query 9

        SELECT *
    FROM nobel_win
    WHERE year = 1970
    AND subject NOT IN ('Physiology','Economics');


    (10). Query 10

        SELECT * 
    FROM nobel_win
    WHERE subject NOT LIKE'P%'
    ORDER BY year DESC, winner;


(11). Query 11

    SELECT pro_name, pro_price
    FROM item_mast
    WHERE pro_price =  (SELECT MIN(pro_price) 
    FROM item_mast);


(12). Query 12

    SELECT * 
    FROM costomer 
    WHERE city = 'New York' OR NOT grade > 100;



(13). Query 13

    SELECT salesman_id, name, city, commission 
    FROM salesman 
    WHERE (commission > 0.10 AND commission < 0.12);  -- this mean only 0.11 
   


    SELECT salesman_id, name, city, commission 
    FROM salesman 
    WHERE commission between 0.10 AND 0.12; -- between mean 0.10 0.11 0.12 

    
    (14). Query 14

    SELECT *
    FROM costomer
    WHERE costomer_name LIKE '%n';  /*  whose names are ending with the letter 'n' */



(15). Query 15

    SELECT *
    FROM salesman
    WHERE name LIKE 'N__l%';   /* whose name containing the 1st character is 'N' and the 4th 
character is 'l' and rests may be any character */



(16). Query 16

SELECT *
FROM cOstomer
WHERE grade IS NULL;    /* who does not get any grade except NULL. */



(17). Query 17


SELECT SUM (purch_amt)
FROM orderr;     /* total purchase amount of all orders. */


(18). Query 18


SELECT COUNT (salesman_id) 
FROM orderr;     /* number of salesman currently listing for 
all of their customers */


SELECT COUNT (DISTINCT salesman_id)
FROM orderr;


(19). Query 19


SELECT city, MAX(grade) 
FROM cOstomer 
GROUP BY city;    /* highest grade for each of the cities of the customers. */



(20). Query 20


SELECT costomer_id, MAX(purch_amt) 
FROM orderr
GROUP BY costomer_id;    /* highest purchase amount ordered by the each customer 
with their ID and highest purchase amount */



(21). Query 21

SELECT costomer_id,order_date, MAX(purch_amt) 
FROM orderr 
GROUP BY costomer_id,order_date;

highest purchase amount ordered by the each 
customer on a particular date with their ID, order date 
and highest purchase amount.

(22). Query 22

SELECT salesman_id, MAX(purch_amt) 
FROM orderr
WHERE order_date = '2012-08-17'
GROUP BY salesman_id;


(23). Query 23

SELECT costomer_id, order_date, MAX(purch_amt) 
FROM orderr
GROUP BY  costomer_id, order_date
HAVING MAX (purch_amt) > 2000.00;

/* highest purchase amount with their customer ID 
and order date, for only those customers who have the 
highest purchase amount in a day is more than 2000. */


(24). Query 24


SELECT COUNT(*)
FROM orderr
WHERE order_date = '2012-08-17';


/* counts all orders for a 
date August 17th, 2012. */