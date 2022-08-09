CREATE TABLE IF NOT EXISTS users (
id integer PRIMARY KEY UNIQUE,
login text NOT NULL UNIQUE,
password text NOT NULL,
coins unsigned integer NOT NULL
);

CREATE TABLE IF NOT EXISTS friends (
userId integer NOT NULL,
friendId integer NOT NULL,
PRIMARY KEY (userId, friendId)
);

CREATE TABLE IF NOT EXISTS games (
hostId integer NOT NULL UNIQUE
);