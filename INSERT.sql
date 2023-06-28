-- INSERT запросы

INSERT INTO genre (name_genre)
VALUES	('Pop'),
		('Electronic'),
		('Alternative'),
		('Hip-Hop');
	
INSERT INTO artists (artist_name)
VALUES	('Lady Gaga'),
		('Melanie C'),
		('Miley Cyrus'),
		('Allie X'),
		('TR/ST'),
		('Caravan Palace'),
		('SHAED'),
		('Night Club'),
		('Niki Fre$h');
	
INSERT INTO albums (name_album, date_of_release)
VALUES	('Chromatica', 2020),
		('Melanie C Deluxe Edition', 2020),
		('Plastic Hearts', 2020),
		('CollXtion II', 2017),
		('TRST', 2012),
		('Chronologic', 2019),
		('High Dive', 2021),
		('Die Die Lullaby', 2020),
		('Unearthed', 2020),
	    ('Requiem For Romance', 2016),
	   	('Myself', 2023);
	
INSERT INTO tracks (name_track, duration_track, album_id)
VALUES	('Replay', 187, 1),
		('Who I Am', 212, 2),
		('Fearless', 248, 2),
		('Nowhere To Run', 214, 2),
		('Midnight Sky', 223, 3),
		('Plastic Hearts', 206, 3),
		('Simon Says', 216, 4),
		('Downtown', 237, 4),
		('Candy Walls', 277, 5),
		('Bulbform', 290, 5),
		('Miracle', 216, 6),
		('Moonshine', 214, 6),
		('Melancolia', 243, 6),
		('High Dive', 185, 7),
		('Dizzy', 161, 7),
		('Part Time Psycho', 185, 7),
		('My Valentine', 192, 8),
		('Ciwil War', 243, 8),
		('Pray', 194, 10),
		('Lil Gems', 188, 9),
		('Myself', 230, 11);
	
INSERT INTO collections (name_collection, date_of_release)
VALUES	('Поп вечеринка', 2020),
		('Chill', 2019),
		('Ride Boy Ride', 2021),
		('Relax', 2012);
	
INSERT INTO artist_genre (artist_id, genre_id)
VALUES	(1, 1),
		(2, 1),
		(2, 3),
		(3, 1),
		(4, 1),
		(4, 3),
		(5, 2),
		(5, 3),
		(6, 2),
		(6, 3),
		(7, 1),
		(7, 3),
		(8, 1),
		(8, 2),
		(9, 4);

INSERT INTO artist_albums (artist_id, album_id)
VALUES	(1, 1),
		(2, 2),
		(3, 3),
		(4, 4),
		(5, 5),
		(6, 6),
		(7, 7),
		(8, 8),
		(9, 9),
		(8, 10),
		(8, 11);
	
INSERT INTO tracks_collections (track_id, collection_id)
VALUES	(1, 1),
		(2, 1),
		(3, 1),
		(4, 1),
		(5, 3),
		(6, 3),
		(7, 3),
		(8, 3),
		(7, 1),
		(8, 1),
		(9, 4),
		(10, 4),
		(11, 4),
		(12, 4),
		(13, 4),
		(14, 2),
		(15, 2),
		(16, 2),
		(17, 2), 
		(18, 2),
		(20, 3),
		(14, 3),
		(15, 3),
		(21, 1);