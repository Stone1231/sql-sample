START TRANSACTION ISOLATION LEVEL READ COMMITTED;

select price from products where id = 1 for update;
/* record 被加上X lock */

-- do something
select pg_sleep(3);

update order_details 
set price = (select price from products where id = 1) * count
where product_id = 1;

Commit;
/*返回所有鎖*/

---
START TRANSACTION ISOLATION LEVEL READ COMMITTED;

update products set price = 2 where id = 1;
/*因為沒法拿到X lock，所以被blocking*/

/*拿到了X lock繼續執行*/
Commit;