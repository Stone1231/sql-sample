-- update, then rollback
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

update products
set price = 2
where id = 1;
/*資料被加上X lock*/

-- do something
select SLEEP(3);

ROLLBACK;
/*歸還X lock*/

---

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

select price from products where id =1;
/*拿取S lock失敗，所以本TX被blocking*/

/*成功拿取S lock，顯示正確價格*/
Commit;