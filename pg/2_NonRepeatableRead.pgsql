START TRANSACTION ISOLATION LEVEL READ COMMITTED;

select price from products where id = 1;

-- do something
select pg_sleep(3);

update order_details 
             -- non-repeatable read
set price = (select price from products where id = 1) * count
where product_id = 1;

Commit;

---
START TRANSACTION ISOLATION LEVEL READ COMMITTED;

update products set price = 2 where id = 1;

Commit;