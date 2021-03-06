START TRANSACTION ISOLATION LEVEL READ COMMITTED;

select * from orders where id = 1 for update;
/* 加上X lock */

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
START TRANSACTION ISOLATION LEVEL READ COMMITTED;

select * from orders where id = 1 for update;
/* 試圖拿取X lock失敗，所以被blocking*/

/*等拿到了record的X lock，繼續執行*/
INSERT INTO order_details VALUES (1, 3, 1, 100);

Commit;

-- clean test data
select pg_sleep(4);
delete from order_details where order_id = 1 and product_id = 3;
update orders set price = 0 where id = 1;