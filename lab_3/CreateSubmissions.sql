
CREATE VIEW UserBookshelf AS
SELECT u.Name AS UserName, b.Description AS BookDescription
FROM Users u
JOIN BookShelfs bs ON u.User_id = bs.user_id
JOIN bookshelfs_book bb ON bs.BookShelf_id = bb.BookShelf_id
JOIN books b ON bb.book_id = b.Book_ID;
