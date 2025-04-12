
insert into Artist (name)
values ('Eminem'),
	('Jony'),
	('IceQube'),
	('Till lindemann');

insert into GenreList (title)
values ('Rock'),
	('HipHip'),
	('Classic');

insert into Album (title, year)
values ('Millennium', 1999),
	('Back in Black', 1980),
	('CandyShop', 2013),
	('SunRise', 2019),
	('BigMa', 2018);

insert into Track (title, duration, album_id)
values ('sound_1', 250, 1),
	('sound_2_my', 90, 1),
	('sound_my_3', 88, 2),
	('sound_4', 211, 3),
	('sound_5', 70, 2),
	('sound_6', 80, 1),
	('sound_7', 254, 5),
	('sound_my_my', 300, 4),;


insert into Collections (title, year)
values ('Collect_1', 1999),
	('Collect_2', 2010),
	('Collect_3', 2020);


insert into TrackCollections (track_id, collection_id)
values (1, 1),
	(2, 2),
	(4, 3),
	(5, 2),
	(6, 1),
	(1, 2),
	(3, 3);

insert into AlbumArtist (album_id, artist_id)
values (1,1),
		(1,2),
		(2,3),
		(3,2),
		(2,1)

insert into GenreListAlbum (album_id, genrelist_id)
values (1,1),
		(3,3),
		(2,2);