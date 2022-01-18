--Q1
select customer_id , first_name,last_name,district
from address
join customer
on address.address_id =customer.customer_id
where district = 'Texas'

select *
from customer;

--Q2

select  c.customer_id , c.first_name , c.last_name, p.payment_id , p.amount 
from payment p
join customer c 
on p.customer_id =c.customer_id 
where amount > 6.99;

--Q3

select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment 
	group by customer_id
	having sum(amount) > 175
)
--Q4

select * from customer;
select * from address;
select * from city;
select * from country;

select *
from country c
where c.country = 'Nepal';

select city_id
from city
where country_id in(
	select country_id
	from country c
	where c.country = 'Nepal'
);

select address_id 
from address 
where city_id in(
	select city_id 
	from city
	where country_id in(
		select country_id
		from country c
		where c.country='Nepal'
	)
)

select * 
from customer
where address_id in(
	select address_id 
	from address 
	where city_id in(
		select city_id 
		from city
		where country_id in(
			select country_id
			from country c
			where c.country='Nepal'
		)
	)
);


--Q5

select p.staff_id, s.first_name , s.last_name, Count(*) as num_transactions
from payment p
join staff s
on p.staff_id = s.staff_id
group by p.staff_id, s.staff_id , s.last_name 
order by num_transactions desc;

--Q6

select f.film_id, f.title, count(*) as num_actors
from film_actor fa
join film f
on fa.film_id = f.film_id
group by f.film_id, f.title
order by num_actors desc 
limit 1;

--Q7

select a.actor_id, a.first_name, a.last_name, count(*) as num_films
from film_actor fa
join actor a
on a.actor_id = fa.actor_id
group by a.actor_id
order by num_films
limit 1;

--Q8

select district, count(*)
from address
group by district
having count(*) > 5;

select count(*)
from(
	select district 
	from address
	group by district 
	having count(*)>5
)as districts_more_than_five;
)



