START TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT * FROM products where id =2;

select pg_sleep(3);
update products set name='prd-1 new' where id =1;

select pg_sleep(2);
Commit;

---

START TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT * FROM products where id =1;

select pg_sleep(3);
update products set name='prd-10 new' where id =2;

select pg_sleep(4);
Commit; -- abort