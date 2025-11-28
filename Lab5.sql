CREATE TABLE Authors(
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);
CREATE TABLE Books(
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    published_year int,
    author_id int,
    Foreign Key (author_id) REFERENCES Authors(author_id)
);
ALTER TABLE Books add COLUMN genre VARCHAR(255);
ALTER TABLE Books add CONSTRAINT published_year CHECK(published_year <2025);
ALTER TABLE Books drop COLUMN author_id;
CREATE TABLE Book_Authors(
    book_id int,
    author_id int,
    PRIMARY KEY (book_id, author_id),
    Foreign Key (book_id) REFERENCES Books(book_id),
    Foreign Key (author_id) REFERENCES Authors(author_id)
);
CREATE Table Temp_Table(
    temps int
);
DROP table Temp_Table;