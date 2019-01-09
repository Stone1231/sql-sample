-- 找出大類底下所有子類子子類.....
with recursive all_category(id) as
(
   select id from category c
   where id = 'a'
   union all
   select c.id from category c
   inner join all_category p on c.parent = p.id
)
select id from all_category;