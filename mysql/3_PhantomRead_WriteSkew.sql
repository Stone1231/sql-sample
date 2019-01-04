SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

select sum(price) from order_details where order_id = 1;

INSERT INTO order_details VALUES (1, 3, 1, 100);

-- do something
select SLEEP(3);

Commit;
---
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

select sum(price) from order_details where order_id = 1;

INSERT INTO order_details VALUES (1, 4, 1, 100);

Commit;