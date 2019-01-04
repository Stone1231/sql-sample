SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;

select sum(price) from order_details where order_id = 1;
/*建立where order_id = 1的predicate lock */

-- do something
select SLEEP(3);

update orders 
set price = (select sum(price) from order_details where order_id = 1) 
where id = 1;
/*不會被影響*/

select price
from orders 
where id = 1;
/*查看*/

Commit;
/*返回所有鎖*/

---
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;

INSERT INTO order_details VALUES (1, 3, 1, 100);
/* 因為資料符合predicate lock，所以insert被阻擋*/

Commit;
/*沒有了predicate lock， TX可以繼續執行*/

-- clean test data
select SLEEP(4);
delete from order_details where order_id = 1 and product_id = 3;
update orders set price = 0 where id = 1;