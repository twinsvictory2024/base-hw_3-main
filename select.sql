select title, duration
from track
order by duration desc 
limit 1;

select title
from track
where duration >= 210;

select title
from collections c 
where year between 2018 and 2020;

select name
from artist a 
where name not like '% %';

select title
from track t 
where title like '%my%' or title like '%мой%';