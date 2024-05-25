CREATE MATERIALIZED VIEW mv_books_destruction AS
SELECT
    Book_ID,
    NULL AS description,
    NULL AS language,
    NULL AS year,
    NULL AS place_of_electronic_resource
FROM books;

SELECT * FROM mv_books_destruction;