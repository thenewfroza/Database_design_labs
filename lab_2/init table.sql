CREATE TABLE Users (
    User_id INT PRIMARY KEY,
    Name TEXT,
    Password TEXT,
    Loggin TEXT,
    role TEXT
);

CREATE TABLE books (
    Book_ID TEXT PRIMARY KEY,
    Description TEXT,
    Language TEXT,
    Year INT,
    Place_of_electronic_resource TEXT
);

CREATE TABLE BookShelfs (
    BookShelf_id INT PRIMARY KEY,
    bookshelfs_name TEXT,
    user_id INT REFERENCES Users(User_id)
);

CREATE TABLE bookShelfs_book (
    BookShelf_id INT REFERENCES BookShelfs(BookShelf_id),
    book_id TEXT REFERENCES books(Book_id)
);

CREATE TABLE book_series (
    book_series_id INT PRIMARY KEY,
    book_series_name TEXT
);

CREATE TABLE book_series_m (
    book_id TEXT REFERENCES books(Book_ID),
    book_series_id INT REFERENCES book_series(book_series_id)
);

CREATE TABLE key_words (
    key_word_id INT PRIMARY KEY,
    name TEXT
);

CREATE TABLE key_words_m (
    book_id TEXT REFERENCES books(Book_ID),
    keyword_id INT REFERENCES key_words(key_word_id)
);

CREATE TABLE Collections (
    Collections_Id INT PRIMARY KEY,
    Collections_name TEXT
);

CREATE TABLE Collections_m (
    book_id TEXT REFERENCES books(Book_ID),
    collections_id INT REFERENCES collections(Collections_Id)
);

COPY Users(User_id, Name, Password, Loggin, role)
FROM 'D:\Database-design\Labs\lab2\CSVtabls\users.csv'
DELIMITER ','
CSV HEADER;

COPY books(Book_ID, Description, Language, Year, Place_of_electronic_resource)
FROM 'D:\Database-design\Labs\lab2\CSVtabls\books.csv'
DELIMITER ','
CSV HEADER;

INSERT INTO book_series (book_series_id, book_series_name) VALUES
(1, 'Серия книг 1'),
(2, 'Серия книг 2'),
(3, 'Серия книг 3'),
(4, 'Серия книг 4'),
(5, 'Серия книг 5'),
(6, 'Серия книг 6'),
(7, 'Серия книг 7'),
(8, 'Серия книг 8'),
(9, 'Серия книг 9'),
(10, 'Серия книг 10'),
(11, 'Серия книг 11'),
(12, 'Серия книг 12'),
(13, 'Серия книг 13'),
(14, 'Серия книг 14'),
(15, 'Серия книг 15');

INSERT INTO book_series_m (book_id, book_series_id) VALUES
('B1', 1),
('B2', 2),
('B3', 3),
('B4', 4),
('B5', 5),
('B6', 6),
('B7', 7),
('B8', 8),
('B9', 9),
('B10', 10),
('B11', 11),
('B12', 12),
('B13', 13),
('B14', 14),
('B15', 15);

INSERT INTO BookShelfs (BookShelf_id, bookshelfs_name, user_id) VALUES
(1, 'Полка 1', 1),
(2, 'Полка 2', 2),
(3, 'Полка 3', 3),
(4, 'Полка 4', 4),
(5, 'Полка 5', 5),
(6, 'Полка 6', 6),
(7, 'Полка 7', 7),
(8, 'Полка 8', 8),
(9, 'Полка 9', 9),
(10, 'Полка 10', 10),
(11, 'Полка 11', 11),
(12, 'Полка 12', 12),
(13, 'Полка 13', 13),
(14, 'Полка 14', 14),
(15, 'Полка 15', 15);

INSERT INTO bookshelfs_book (BookShelf_id, book_id) VALUES
(1, 'B1'),
(2, 'B2'),
(3, 'B3'),
(4, 'B4'),
(5, 'B5'),
(6, 'B6'),
(7, 'B7'),
(8, 'B8'),
(9, 'B9'),
(10, 'B10'),
(11, 'B11'),
(12, 'B12'),
(13, 'B13'),
(14, 'B14'),
(15, 'B15');

INSERT INTO Collections (Collections_Id, Collections_name) VALUES
(1, 'Коллекция 1'),
(2, 'Коллекция 2'),
(3, 'Коллекция 3'),
(4, 'Коллекция 4'),
(5, 'Коллекция 5'),
(6, 'Коллекция 6'),
(7, 'Коллекция 7'),
(8, 'Коллекция 8'),
(9, 'Коллекция 9'),
(10, 'Коллекция 10'),
(11, 'Коллекция 11'),
(12, 'Коллекция 12'),
(13, 'Коллекция 13'),
(14, 'Коллекция 14'),
(15, 'Коллекция 15');

INSERT INTO Collections_m (book_id, collections_id) VALUES
('B1', 1),
('B2', 2),
('B3', 3),
('B4', 4),
('B5', 5),
('B6', 6),
('B7', 7),
('B8', 8),
('B9', 9),
('B10', 10),
('B11', 11),
('B12', 12),
('B13', 13),
('B14', 14),
('B15', 15);

INSERT INTO key_words (key_word_id, name) VALUES
(1, 'ключевое слово 1'),
(2, 'ключевое слово 2'),
(3, 'ключевое слово 3'),
(4, 'ключевое слово 4'),
(5, 'ключевое слово 5'),
(6, 'ключевое слово 6'),
(7, 'ключевое слово 7'),
(8, 'ключевое слово 8'),
(9, 'ключевое слово 9'),
(10, 'ключевое слово 10'),
(11, 'ключевое слово 11'),
(12, 'ключевое слово 12'),
(13, 'ключевое слово 13'),
(14, 'ключевое слово 14'),
(15, 'ключевое слово 15');

INSERT INTO key_words_m (book_id, keyword_id) VALUES
('B1', 1),
('B2', 2),
('B3', 3),
('B4', 4),
('B5', 5),
('B6', 6),
('B7', 7),
('B8', 8),
('B9', 9),
('B10', 10),
('B11', 11),
('B12', 12),
('B13', 13),
('B14', 14),
('B15', 15);