CREATE TABLE books2016 (
    Book_ID TEXT PRIMARY KEY,
    Description TEXT,
    Language TEXT,
    Year INT,
    Place_of_electronic_resource TEXT
);

CREATE TABLE books2017 (
    Book_ID TEXT PRIMARY KEY,
    Description TEXT,
    Language TEXT,
    Year INT,
    Place_of_electronic_resource TEXT
);

CREATE TABLE books2018 (
    Book_ID TEXT PRIMARY KEY,
    Description TEXT,
    Language TEXT,
    Year INT,
    Place_of_electronic_resource TEXT
);

CREATE OR REPLACE FUNCTION create_partitions_and_move_data() RETURNS trigger AS $$
BEGIN
    IF (NEW.Year = 2016) THEN
        INSERT INTO books2016 VALUES (NEW.*);
        DELETE FROM books WHERE ctid = NEW.ctid;
        RETURN NULL;
     ELSIF (NEW.Year = 2017) THEN
        INSERT INTO books2017 VALUES (NEW.*);
        DELETE FROM books WHERE ctid = NEW.ctid;
        RETURN NULL;
    ELSIF (NEW.Year = 2018) THEN
        INSERT INTO books2018 VALUES (NEW.*);
        DELETE FROM books WHERE ctid = NEW.ctid;
        RETURN NULL;
    ELSE
        RAISE EXCEPTION 'Date out of range.';
        END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER create_partitions_and_move_data
    BEFORE INSERT ON books
    FOR EACH ROW EXECUTE PROCEDURE create_partitions_and_move_data();

INSERT INTO books (Book_ID, Description, Language, Year, Place_of_electronic_resource) VALUES
('B188', 'Описание книги1', 'Русский', 2016, 'www.books.com'),
('B189', 'Описание книги2', 'Русский', 2017, 'www.books.com'),
('B187', 'Описание книги3', 'Русский', 2018, 'www.books.com')