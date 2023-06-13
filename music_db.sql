CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	name_genre      VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS artists (
	artist_id    SERIAL PRIMARY KEY,
	artist_name  VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS albums (
	album_id SERIAL PRIMARY KEY, 
	name_album      VARCHAR(60) NOT NULL,
	date_of_release    INTEGER     NOT NULL
	                CHECK (date_of_release > 2000)
);

CREATE TABLE IF NOT EXISTS tracks (
	track_id SERIAL PRIMARY KEY,
	name_track      VARCHAR(60) NOT NULL,
	duration_track  INTEGER     NOT NULL
	                CHECK (duration_track > 60),
	album_id        INTEGER     NOT NULL 
	                REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS collections (
	collection_id        SERIAL PRIMARY KEY,
	name_collection      VARCHAR(60) NOT NULL,
	date_of_release      INTEGER     NOT NULL
	                     CHECK (date_of_release > 2000)
);

CREATE TABLE IF NOT EXISTS artist_genre (
	genre_id       INTEGER
	               REFERENCES genre(genre_id),
	artist_id      INTEGER
	               REFERENCES artists(artist_id),
	               CONSTRAINT a_g PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS artist_albums (
	artist_id      INTEGER
	               REFERENCES artists(artist_id),
	album_id       INTEGER
                   REFERENCES albums(album_id),                
	               CONSTRAINT a_a PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS tracks_collections (
	track_id       INTEGER
	               REFERENCES tracks(track_id),
	collection_id  INTEGER
                   REFERENCES collections(collection_id),
                   CONSTRAINT t_c PRIMARY KEY (track_id, collection_id)