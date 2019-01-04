-- update, then rollback
START TRANSACTION ISOLATION LEVEL READ COMMITTED;

update products
set price = 2
where id = 1;
/* 資料被加上X lock，並且建立還未Commit的ver1副本*/

-- do something
select pg_sleep(3);

ROLLBACK;
/*歸還X lock*/

---

START TRANSACTION ISOLATION LEVEL READ COMMITTED;

select price from products where id =1;
/*資料庫無視還未Committed的ver1副本，並且返回最新的ver0副本*/

Commit;