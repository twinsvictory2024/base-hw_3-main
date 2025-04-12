SELECT g.title AS genre_title, COUNT(DISTINCT a.id) AS artist_count
FROM GenreList g
JOIN GenreListAlbum gla ON g.id = gla.genrelist_id
JOIN Album al ON gla.album_id = al.id
JOIN AlbumArtist aa ON al.id = aa.album_id
JOIN Artist a ON aa.artist_id = a.id
GROUP BY g.title;

SELECT al.title AS album_title, COUNT(t.id) AS track_count
FROM Album al
JOIN Track t ON al.id = t.album_id
WHERE al.year between 2019 and 2020
GROUP BY al.title;

SELECT al.id AS album_id, al.title AS album_title, al.year, t.id AS track_id, t.title AS track_title, t.duration 
FROM Album al
LEFT JOIN Track t ON al.id = t.album_id
WHERE al.year IS NOT NULL;

SELECT al.title AS album_title, avg(t.duration) AS track_avg_d, al.id
FROM Album al
JOIN Track t ON al.id = t.album_id
GROUP BY al.title, al.id;

SELECT art.name
FROM Album al
JOIN Track t ON al.id = t.album_id
join artist art on art.id = t.id 
WHERE al.year != 2020
GROUP BY art.name;

select c.title , art.name, t.title 
from collections c
join trackcollections t2 on t2.collection_id = c.id 
JOIN Track t ON t.id = t2.track_id 
JOIN Album a ON a.id = t.id
JOIN Artist art ON art.id = a.id
where art.name='Eminem'
;

select a.title, count(g2.id)
from album a 
join genrelistalbum g on g.album_id =a.id 
join genrelist g2 on g2.id = g.genrelist_id 
group by a.title;

select t.title 
from track t 
left join trackcollections t2 on t2.track_id = t.id 
where t2.track_id is null 
;


select art.name, t.duration, t.title 
from artist art
join albumartist a on a.artist_id = art.id 
join album a2 on a2.id = a.album_id 
join track t on t.album_id = a.album_id
where t.duration = (select min(t.duration) as min_duration
from track t)
group by art.name, t.duration, t.title
;

select a.title, count(t.id) as track_count
from album a 
join track t ON a.id=t.album_id
group by a.title
having count(t.id)=(
	select min(track_count)
		from (
			select count(a.id) as track_count
			from album a 
			join track t ON a.id=t.album_id
			group by a.id
			))
;
