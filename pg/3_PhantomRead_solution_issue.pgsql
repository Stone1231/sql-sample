-- 範例是用 START TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- PG用REPEATABLE READ就可以達到效果?
START TRANSACTION ISOLATION LEVEL REPEATABLE READ;

select sum(price) from order_details where order_id = 1;
/*建立where order_id = 1的predicate monitoring */

-- do something
select pg_sleep(3);

/*接收到predicate monitoring的exception，引起強制性Rollback*/

-- rollback;
/*返回所有鎖和monitoring*/

update orders 
set price = (select sum(price) from order_details where order_id = 1) 
where id = 1;

select price
from orders 
where id = 1;

Commit;
---
START TRANSACTION ISOLATION LEVEL REPEATABLE READ;

INSERT INTO order_details VALUES (1, 3, 1, 100);

Commit;
/* 因為資料符合predicate ，提醒predicate 相關的TX*/

-- clean test data
select pg_sleep(4);
delete from order_details where order_id = 1 and product_id = 3;
update orders set price = 0 where id = 1;