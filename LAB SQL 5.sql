USE sakila;
##Drop column picture from staff.
ALTER TABLE staff
DROP picture;
##A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM staff; 

SELECT customer_id ,first_name FROM customer
WHERE first_name REGEXP 'tammy';

INSERT INTO staff(first_name , last_name , adresss_id , email, store_id ,username)
VALUES ('TAMMY' , 'SANDERS', '79', 'TAMMY.SANDERS@sakilacustomer.org',2 ,1 , 'Tammy' );	   
SELECT * FROM staff; 

##Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table
SELECT * FROM rental;
SELECT customer_id FROM customer 
WHERE first_name = 'CHARLOTTE' and last_name = 'HUNtER';
##130
SELECT film_id , title FROM film 
WHERE title = 'ACADEMY DINOSAUR';
##1
SELECT * FROM sakila.staff;

INSERT INTO rental (rental_date, inventory_id , customer_id , staff_id)
values (curdate() , 1 ,130 , 1);

##Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted

drop table if exists deleted_users;

##Create a table backup table as suggested
CREATE TABLE deleted_users(
customer_id smallint UNIQUE NOT NULL AUTO_INCREMENT PRIMARY KEY,
email varchar(50),
create_date datetime,
last_update  timestamp
);

##Insert the non active users in the table backup table
insert into deleted_users
SELECT customer_id, email , create_date, last_update FROM customer
WHERE active = '0'  ;

SELECT * FROM deleted_users; 

DELETE FROM customer
WHERE active REGEXP '0';

 
 


