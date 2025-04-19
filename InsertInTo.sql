
CREATE TABLE IF NOT EXISTS Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS GenreList (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    year INTEGER NOT NULL CHECK(year > 1900)
);

CREATE TABLE IF NOT EXISTS Track (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INTEGER NOT NULL CHECK(duration > 0),
    album_id INTEGER REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collections (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    year INTEGER NOT NULL CHECK(year > 1900)
);

CREATE TABLE IF NOT EXISTS ArtistGenre (
    artist_id INTEGER REFERENCES Artist(id),
    genre_id INTEGER REFERENCES GenreList(id),
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS AlbumArtist (
    album_id INTEGER REFERENCES Album(id),
    artist_id INTEGER REFERENCES Artist(id),
    PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS TrackCollections (
    track_id INTEGER REFERENCES Track(id),
    collection_id INTEGER REFERENCES Collections(id),
    PRIMARY KEY (track_id, collection_id)
);


INSERT INTO Artist (name) VALUES 
('Eminem'),
('Jony'),
('IceQube'),
('Till lindemann');

INSERT INTO GenreList (title) VALUES 
('Rock'),
('HipHop'),
('Classic');

INSERT INTO Album (title, year) VALUES 
('Millennium', 1999),
('Back in Black', 1980),
('CandyShop', 2013),
('SunRise', 2019),
('BigMa', 2018);

INSERT INTO Track (title, duration, album_id) VALUES 
('sound_1', 250, 1),
('sound_2_my', 90, 1),
('sound_my_3', 88, 2),
('sound_4', 211, 3),
('sound_5', 70, 2),
('sound_6', 80, 1),
('sound_7', 254, 5),
('sound_my_my', 300, 4),
('my own', 200, 1),
('own my', 180, 2),
('my', 150, 3),
('oh my god', 220, 4),
('myself', 190, 5),
('by myself', 210, 1),
('bemy self', 230, 2),
('myself by', 240, 3),
('by myself by', 250, 4),
('beemy', 260, 5),
('premyne', 270, 1);

INSERT INTO Collections (title, year) VALUES 
('Collect_1', 1999),
('Collect_2', 2010),
('Collect_3', 2020);

INSERT INTO TrackCollections (track_id, collection_id) VALUES 
(1, 1),
(2, 2),
(4, 3),
(5, 2),
(6, 1),
(1, 2),
(3, 3);

INSERT INTO AlbumArtist (album_id, artist_id) VALUES 
(1, 1),
(1, 2),
(2, 3),
(3, 2),
(2, 1),
(4, 3),
(5, 4);

INSERT INTO ArtistGenre (artist_id, genre_id) VALUES 
(1, 2),
(2, 1),
(2, 2),
(3, 2),
(4, 1),
(1, 1),
(3, 1),
(4, 3);


SELECT title
FROM track
WHERE title ~* '(^my[^a-z]|[^a-z]my[^a-z]|[^a-z]my$|^my$)';


SELECT g.title AS genre_title, COUNT(DISTINCT ag.artist_id) AS artist_count
FROM GenreList g
LEFT JOIN ArtistGenre ag ON g.id = ag.genre_id
GROUP BY g.title;

SELECT COUNT(t.id) 
FROM Track t
JOIN Album al ON t.album_id = al.id
WHERE al.year BETWEEN 2019 AND 2020;

SELECT a.name
FROM Artist a
WHERE a.name NOT IN (
    SELECT DISTINCT a.name
    FROM Artist a
    JOIN AlbumArtist aa ON a.id = aa.artist_id
    JOIN Album al ON aa.album_id = al.id
    WHERE al.year = 2020
);

SELECT DISTINCT c.title
FROM Collections c
JOIN TrackCollections tc ON c.id = tc.collection_id
JOIN Track t ON tc.track_id = t.id
JOIN Album a ON t.album_id = a.id
JOIN AlbumArtist aa ON a.id = aa.album_id
JOIN Artist art ON aa.artist_id = art.id
WHERE art.name = '
