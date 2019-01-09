-- 先輸出女生，再輸出男生，女生以身高排序，男生以身高倒排序
Select * from students
order by gender,
(
 case
  when gender = 'female' then height
  when gender = 'male' then height * -1
 end
);

-- ex2
select gender,
  sum(
   case 
	  when gender = 'male' and height >= 180 then 1 
	  when gender = 'female' and height > 160 then 1
	  else 0 
	  end
  ) as tall
from students 
group by gender;