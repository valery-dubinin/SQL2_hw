USE sakila;

select c.store_id, s2.first_name, s2.last_name, c2.city, count(c.store_id)
FROM customer c
join store s1 on s1.store_id = c.store_id 
join staff s2 on s1.manager_staff_id = s2.staff_id 
join address a on s1.address_id = a.address_id 
join city c2 on c2.city_id = a.city_id 
group by store_id
HAVING count(c.store_id) > 300;  


select count(f.`length`)
from film f 
where f.`length` > (select avg(`length`) from film f);


select SUM(1), DATE_FORMAT(rental_date, '%M-%Y') as mon
from rental r 
group by DATE_FORMAT(rental_date, '%M-%Y')
HAVING mon = 
(
	select DATE_FORMAT(payment_date, '%M-%Y')
	from payment p 
	group by DATE_FORMAT(payment_date, '%M-%Y')
	having sum(amount) = 
	(
		select MAX(sum_month)
		from 
		(
			select sum(amount) sum_month
			from payment p 
			group by DATE_FORMAT(payment_date, '%M-%Y')
		) as maximum
	)
);

select sum(amount) sum_month, DATE_FORMAT(payment_date, '%M-%Y') 
		from payment p 
		group by DATE_FORMAT(payment_date, '%M-%Y');








