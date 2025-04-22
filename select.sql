SELECT title, duration 
FROM Track 
ORDER BY duration DESC 
LIMIT 1;


SELECT title 
FROM Track 
WHERE duration >= 210;


SELECT title 
FROM Collections 
WHERE year BETWEEN 2018 AND 2020;


SELECT name 
FROM Artist 
WHERE name NOT LIKE '% %';


SELECT title 
FROM Track 
WHERE title ~* /(^|.*)\b(my|мой)\b(.*|\s|$)/g;
