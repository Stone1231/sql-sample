-- 分頁
select * from (
 select 
  gender, 
  name,
  rank() over (partition by gender order by height) as ranking
 from students
) t
where ranking between 0 and 1;

-- 身高最高的男女各前兩名
select * from (
 select 
  gender, 
  name,
  rank() over (partition by gender order by height desc) as ranking
 from students
) t
where t.ranking <= 2;