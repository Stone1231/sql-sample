SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

select price from products where id = 1;

-- do something
select SLEEP(3);

update order_details 
             -- non-repeatable read
set price = (select price from products where id = 1) * count
where product_id = 1;

Commit;

---
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

update products set price = 2 where id = 1;

Commit;