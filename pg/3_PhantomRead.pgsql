-- Phantom read
-- START TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- ps:Phantom Read not in PG's REPEATABLE READ
START TRANSACTION ISOLATION LEVEL READ COMMITTED;

select sum(price) from order_details where order_id = 1;

-- do something
select pg_sleep(3);

update orders 
set price = (select sum(price) from order_details where order_id = 1) 
where id = 1;

select price
from orders 
where id = 1;

Commit;
---
-- START TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION ISOLATION LEVEL READ COMMITTED;

INSERT INTO order_details VALUES (1, 3, 1, 100);

Commit;

-- clean test data
select pg_sleep(4);
delete from order_details where order_id = 1 and product_id = 3;
update orders set price = 0 where id = 1;