SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

select price from products where id = 1 for update;
/*資料被加上X lock, 講義用S lock不行 */

-- do something
select SLEEP(3);

update order_details 
set price = (select price from products where id = 1) * count
where product_id = 1;
/*資料的S lock提升為X lock，這時price還是跟上面讀取的資料一樣 */

Commit;
/*返回所有鎖*/

---
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

update products set price = 2 where id = 1;
/*因為無法拿到X lock，所以被blocking */

-- wait
select SLEEP(3);

/*終於拿到了X lock，執行資料改動*/
Commit;
/*返回所有鎖*/