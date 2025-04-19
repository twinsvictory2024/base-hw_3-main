INSERT INTO GenreList (title) VALUES 
('Rock'), ('Pop'), ('Hip-Hop'), ('Electronic'), ('Classical');


INSERT INTO Artist (name) VALUES 
('The Weeknd'), ('Billie Eilish'), ('Eminem'), ('Hans Zimmer'), ('Daft Punk');


INSERT INTO Album (title, year) VALUES 
('After Hours', 2020), 
('When We All Fall Asleep', 2019), 
('Music to Be Murdered By', 2020), 
('Interstellar OST', 2014), 
('Random Access Memories', 2013);


INSERT INTO Track (title, duration, album_id) VALUES 
('Blinding Lights', 200, 1),
('Save Your Tears', 215, 1),
('bad guy', 194, 2),
('everything i wanted', 244, 2),
('Godzilla', 211, 3),
('Darkness', 337, 3),
('Cornfield Chase', 138, 4),
('No Time for Caution', 456, 4),
('Get Lucky', 369, 5),
('Instant Crush', 337, 5),
('My Universe', 228, 1),
('My Strange Addiction', 179, 2),
('Мой рок-н-ролл', 210, 3),
('My Heart Will Go On', 280, 4);


INSERT INTO AlbumArtist (album_id, artist_id) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (1, 2), (3, 1);


INSERT INTO GenreListAlbum (album_id, genrelist_id) VALUES 
(1, 2), (1, 3), (2, 2), (2, 4), (3, 3), (4, 5), (5, 4), (5, 2);


INSERT INTO Collections (title, year) VALUES 
('Best of 2020', 2020),
('Pop Hits', 2019),
('Hip-Hop Collection', 2020),
('Film Music', 2018),
('Electronic Mix', 2019),
('My Favorite Tracks', 2021);


INSERT INTO TrackCollections (track_id, collection_id) VALUES 
(1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 3),
(7, 4), (8, 4), (9, 5), (10, 5), (11, 6), (12, 6),
(13, 6), (14, 6), (1, 6), (3, 6);
