-- update, then rollback
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;

update products
set price = 2
where id = 1;

-- do something
select SLEEP(3);

ROLLBACK;

---

-- dirty read
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;

select price from products where id =1;

Commit;