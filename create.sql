CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	title VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
	year INTEGER  NOT NULL CHECK (year > 2016)
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	title VARCHAR(40) NOT NULL UNIQUE,
	year INTEGER  NOT NULL CHECK (year > 2016)
);

CREATE TABLE IF NOT EXISTS Track (
	id SERIAL PRIMARY KEY,
	year INTEGER  NOT NULL CHECK (year > 2016),
	duration INTEGER NOT NULL CHECK (duration < 700),
	title VARCHAR(40) NOT NULL UNIQUE,
	album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS ArtistGenre (
	genre_id INTEGER REFERENCES Genre(id),
	artist_id INTEGER REFERENCES Artist(id),
	CONSTRAINT pk_artist_genre PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS ArtistAlbum (
	album_id INTEGER NOT NULL REFERENCES Album(id),
	artist_id INTEGER NOT NULL REFERENCES Artist(id),
	CONSTRAINT pk_artist_album PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS TrackCollection (
	track_id INTEGER NOT NULL REFERENCES Track(id),
	collection_id INTEGER NOT NULL REFERENCES Collection(id),
	CONSTRAINT pk_track_collection PRIMARY KEY (collection_id, track_id)
);
