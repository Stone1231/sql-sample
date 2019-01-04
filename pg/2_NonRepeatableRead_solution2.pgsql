START TRANSACTION ISOLATION LEVEL REPEATABLE READ;

update products set price = 2 where id = 1;

/*因CPU慢，比較晚發出Commit*/
select pg_sleep(3);
Commit;
/*返回所有鎖，並且把ver1副本狀態改成Committed*/

---

START TRANSACTION ISOLATION LEVEL REPEATABLE READ;

select price from products where id = 1;
/* ver0的price */

update order_details 
             /* 忽略TX開始後才建立的ver1，還是ver0的price */
set price = (select price from products where id = 1) * count
where product_id = 1;

Commit;
