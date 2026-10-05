
CREATE TABLE ratings (
    rating_id SERIAL PRIMARY KEY,
    rating_code VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE languages (
    language_id SERIAL PRIMARY KEY,
    language_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE person (
    person_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL
);


CREATE TABLE titles (
    show_id VARCHAR(20) PRIMARY KEY, 
    type VARCHAR(10) NOT NULL CHECK (type IN ('Movie', 'TV Show')),
    title VARCHAR(255) NOT NULL,
    release_year SMALLINT CHECK (release_year >= 1880),
    date_added DATE,
    rating_id INT REFERENCES ratings(rating_id),
    duration_minutes INT CHECK (duration_minutes >= 0), 
    seasons_count INT CHECK (seasons_count >= 0),
    description TEXT,
    popularity NUMERIC(8,3),
    vote_count INT DEFAULT 0,
    vote_average NUMERIC(4,2)
);

CREATE TABLE movie_finance (
    show_id VARCHAR(20) PRIMARY KEY REFERENCES titles(show_id) ON DELETE CASCADE,
    budget NUMERIC(15,2),
    revenue NUMERIC(15,2)
);


CREATE TABLE title_directors (
    show_id VARCHAR(20) REFERENCES titles(show_id) ON DELETE CASCADE,
    person_id INT REFERENCES person(person_id) ON DELETE CASCADE,
    PRIMARY KEY (show_id, person_id)
);

CREATE TABLE title_cast (
    show_id VARCHAR(20) REFERENCES titles(show_id) ON DELETE CASCADE,
    person_id INT REFERENCES person(person_id) ON DELETE CASCADE,
    PRIMARY KEY (show_id, person_id)
);

CREATE TABLE title_genres (
    show_id VARCHAR(20) REFERENCES titles(show_id) ON DELETE CASCADE,
    genre_id INT REFERENCES genres(genre_id) ON DELETE CASCADE,
    PRIMARY KEY (show_id, genre_id)
);

CREATE TABLE title_countries (
    show_id VARCHAR(20) REFERENCES titles(show_id) ON DELETE CASCADE,
    country_id INT REFERENCES countries(country_id) ON DELETE CASCADE,
    PRIMARY KEY (show_id, country_id)
);

CREATE TABLE title_languages (
    show_id VARCHAR(20) REFERENCES titles(show_id) ON DELETE CASCADE,
    language_id INT REFERENCES languages(language_id) ON DELETE CASCADE,
    PRIMARY KEY (show_id, language_id)
);


CREATE INDEX idx_titles_type_year ON titles(type, release_year);
CREATE INDEX idx_titles_popularity ON titles(popularity DESC);
CREATE INDEX idx_title_genres_genre ON title_genres(genre_id);
CREATE INDEX idx_title_cast_person ON title_cast(person_id);



-- 32 Duplicates in Person Table
# %%sql

# WITH duplicates AS (
#     SELECT person_id, full_name, 
#     ROW_NUMBER() OVER(PARTITION BY full_name ORDER BY person_id) AS rn
#     FROM person
# )

# DELETE FROM person 
# WHERE person_id IN (SELECT person_id FROM duplicates WHERE rn > 1);


