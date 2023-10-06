CREATE TABLE items(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    archived boolean,
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE books(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(50),
    cover_state VARCHAR(50),
    publish_date DATE,
    archived boolean,
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE labels(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50),
    color VARCHAR(50)
)