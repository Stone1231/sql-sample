SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;

SELECT * FROM products where id =2;

select SLEEP(3);
update products set name='prd-1 new' where id =1;

select SLEEP(2);
Commit;

---

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;

SELECT * FROM products where id =1;

select SLEEP(3);
update products set name='prd-10 new' where id =2;

select SLEEP(4);
Commit; -- abort