PRAGMA foreign_keys = ON;

-- TODO: Put a FK constraint on user_id when we have users setup
CREATE TABLE last_searched (
        id          INTEGER PRIMARY KEY,
        user_id     INTEGER,
        url         TEXT,
        created     TIMESTAMP,
        updated     TIMESTAMP
);

CREATE TABLE gifs (
        id          INTEGER PRIMARY KEY,
        user_id     INTEGER,
        url         TEXT,
        created     TIMESTAMP,
        updated     TIMESTAMP
);

CREATE TABLE tags (
        id          INTEGER PRIMARY KEY,
        name        TEXT,
        created     TIMESTAMP,
        updated     TIMESTAMP
);

-- This will be used to form our many to many relationship between gifs and tags
CREATE TABLE gif_tag (
        gif_id      INTEGER REFERENCES gifs(id) ON DELETE CASCADE ON UPDATE CASCADE,
        tag_id      INTEGER REFERENCES tags(id) ON DELETE CASCADE ON UPDATE CASCADE,
        PRIMARY KEY (gif_id, tag_id)
);