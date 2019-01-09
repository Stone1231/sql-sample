-- 每班成績首三名的學生中，他們之間有兄弟姐妹關係的人
with top3students as (
   select * from (
      select gender, name , height, parent,
      rank() over (order by height desc) as ranking
      from students
   ) t1
   where t1.ranking <= 3
)
select * from top3students t1
where exists (
   select 1 from top3students t2
   where 
	 t1.parent = t2.parent and
	 t1.name != t2.name
)
