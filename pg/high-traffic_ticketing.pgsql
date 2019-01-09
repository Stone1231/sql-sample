-- bad idea:
-- insert ticket,然後依靠ticket的PK/UK預防相同座位被２人買到

-- good idea:
-- 搶票時，insert的page split會拖低系統throughout，update不會
Update seat 
set 
 user_id = 'stone', 
 sold = true
where 
 id = 'U1L9' and 
 sold = false;