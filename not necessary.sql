SELECT g.title, COUNT(DISTINCT ga.artist_id) AS artist_count
FROM GenreList g
JOIN GenreListArtist ga ON g.id = ga.genrelist_id
GROUP BY g.title;


SELECT COUNT(t.id) AS track_count
FROM Track t
JOIN Album a ON t.album_id = a.id
WHERE a.year BETWEEN 2019 AND 2020;


SELECT a.title, AVG(t.duration) AS avg_duration
FROM Album a
JOIN Track t ON a.id = t.album_id
GROUP BY a.title;


SELECT DISTINCT ar.name
FROM Artist ar
WHERE ar.id NOT IN (
    SELECT aa.artist_id
    FROM AlbumArtist aa
    JOIN Album a ON aa.album_id = a.id
    WHERE a.year = 2020
);


SELECT DISTINCT c.title
FROM Collections c
JOIN TrackCollections tc ON c.id = tc.collection_id
JOIN Track t ON tc.track_id = t.id
JOIN Album a ON t.album_id = a.id
JOIN AlbumArtist aa ON a.id = aa.album_id
JOIN Artist ar ON aa.artist_id = ar.id
WHERE ar.name = 'Eminem';
