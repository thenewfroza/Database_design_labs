CREATE OR REPLACE VIEW anonymized_users AS
SELECT
    user_id,
    anon.fake_last_name() AS name,
    anon.md5(password) as Password,
    anon.fake_email() AS loggin
FROM users;

CREATE OR REPLACE VIEW anonymized_books AS
SELECT
    book_id,
    cast(anon.random_in_numrange(numrange(1, 1400)) as bigint) AS year
FROM books;

SELECT * FROM anonymized_users;
SELECT * FROM anonymized_books;