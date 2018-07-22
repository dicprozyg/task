-- create tables
BEGIN;
   
    CREATE TABLE IF NOT EXISTS authors (
        id SERIAL PRIMARY KEY, 
        name            varchar(80)
    );

    CREATE TABLE  IF NOT EXISTS books (
        id SERIAL PRIMARY KEY, 
        name            varchar(80)
    );
    
    CREATE TABLE  IF NOT EXISTS authors_books (
        id SERIAL PRIMARY KEY, 
        author_id int REFERENCES authors,
        book_id int REFERENCES books
    );

-- --------- add test values to table ------------------

    -- authors 
    INSERT INTO authors(name) VALUES ('Leo Tolstoy');
    INSERT INTO authors(name) VALUES ('Alexander Pushkin');
    INSERT INTO authors(name) VALUES ('Mark Twain');
    INSERT INTO authors(name) VALUES ('Theodore Dreiser');
    INSERT INTO authors(name) VALUES ('Jack London');
    INSERT INTO authors(name) VALUES ('James Cooper');
     
    -- books
    INSERT INTO books(name) VALUES ('book1');
    INSERT INTO books(name) VALUES ('book2');
    INSERT INTO books(name) VALUES ('book3');
    INSERT INTO books(name) VALUES ('book4');
    INSERT INTO books(name) VALUES ('book5');
    INSERT INTO books(name) VALUES ('book6');
    INSERT INTO books(name) VALUES ('book7');
    INSERT INTO books(name) VALUES ('book8');
    INSERT INTO books(name) VALUES ('book9');
    INSERT INTO books(name) VALUES ('book10');
    INSERT INTO books(name) VALUES ('book11');
    INSERT INTO books(name) VALUES ('book12');
    INSERT INTO books(name) VALUES ('book13');
    INSERT INTO books(name) VALUES ('book14');
    INSERT INTO books(name) VALUES ('book15');
    INSERT INTO books(name) VALUES ('book16');

    -- autors books
    -- Leo Tolstoy
    INSERT INTO authors_books(author_id, book_id) VALUES (1,1);
    INSERT INTO authors_books(author_id, book_id) VALUES (1,2);
    INSERT INTO authors_books(author_id, book_id) VALUES (1,3);
    INSERT INTO authors_books(author_id, book_id) VALUES (1,4);
    INSERT INTO authors_books(author_id, book_id) VALUES (1,5);
    INSERT INTO authors_books(author_id, book_id) VALUES (1,6);
    INSERT INTO authors_books(author_id, book_id) VALUES (1,7);

    -- Alexander Pushkin
    INSERT INTO authors_books(author_id, book_id) VALUES (2,6);
    INSERT INTO authors_books(author_id, book_id) VALUES (2,7);
    INSERT INTO authors_books(author_id, book_id) VALUES (2,8);
    INSERT INTO authors_books(author_id, book_id) VALUES (2,9);
    INSERT INTO authors_books(author_id, book_id) VALUES (2,10);
    INSERT INTO authors_books(author_id, book_id) VALUES (2,11);
    INSERT INTO authors_books(author_id, book_id) VALUES (2,12);

    -- Mark Twain
    INSERT INTO authors_books(author_id, book_id) VALUES (3,13);
    -- Theodore Dreiser
    INSERT INTO authors_books(author_id, book_id) VALUES (4,14);
    -- Jack London
    INSERT INTO authors_books(author_id, book_id) VALUES (5,15);
    -- James Cooper
    INSERT INTO authors_books(author_id, book_id) VALUES (6,16);

COMMIT;


-- task request
SELECT a.id, a.name, Count(ab.book_id)
FROM authors as a
LEFT OUTER JOIN authors_books as ab ON a.id = ab.author_id
GROUP BY a.id, a.name
HAVING Count(ab.book_id) < 7

