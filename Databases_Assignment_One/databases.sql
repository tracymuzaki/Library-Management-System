CREATE DATABASE library;

CREATE TABLE shifts
(
	shift_id integer NOT NULL,
	shift_time varchar NOT NULL,
	PRIMARY KEY (shift_id)
);


CREATE TABLE public.librarians
(
	librarian_id integer,
	librarian_name varchar(40),
	librarian_email varchar(40),
	librarian_telephone_number integer,
	shift_id integer,
	PRIMARY KEY (librarian_id),
	UNIQUE (librarian_email, librarian_telephone_number),
	FOREIGN KEY (shift_id) REFERENCES shifts (shift_id)
);


CREATE TABLE public.students
(
    student_id integer NOT NULL,
	student_name varchar(40),
	student_contact integer,
	student_address varchar(100),
	date_of_borrowing date,
	date_of_returning date,
	return_status varchar(20),
    PRIMARY KEY (student_id),
	UNIQUE (student_contact)
);


CREATE TABLE public.publishers
(
	publisher_id integer NOT NULL,
	publisher_name varchar NOT NULL,
	PRIMARY KEY (publisher_id)
);


CREATE TABLE public.authors
(
    author_id integer NOT NULL,
    author_name varchar(40) NOT NULL,
    author_email varchar(40) NOT NULL,
    author_bio varchar(200),
    author_contact integer NOT NULL,
	publisher_id integer,
    PRIMARY KEY (author_id),
	UNIQUE(author_email),
	UNIQUE (author_contact),
	FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id)
);


CREATE TABLE public.books
(
	book_isbn_number varchar NOT NULL,
	book_title varchar UNIQUE NOT NULL,
	book_price money NOT NULL,
	book_description varchar NOT NULL,
	book_publish_date date NOT NULL,
	book_publish_year int NOT NULL,
	book_image bit varying,
	author_id integer,
	student_id integer,
	PRIMARY KEY (book_isbn_number),
	FOREIGN KEY (author_id) REFERENCES authors (author_id),
	FOREIGN KEY (student_id) REFERENCES students (student_id)
);


INSERT INTO shifts
VALUES (10, 'morning'),
(20, 'evening');


INSERT INTO authors VALUES (280, 'Stephen Chbosky', 'stephenchbosky@gmail.com', 'married', 0703456271, 50);
INSERT INTO authors VALUES (470, 'Solomon Mutual', 'solmutual@gmail.com', 'married', 0200003334, 50);
INSERT INTO authors VALUES (300, 'Joan Oswald', 'oswaldj@yahoo.com', 'single', 0324751290, 80);
INSERT INTO authors VALUES (304, 'Anita Walts', 'anitawalts1@gmail.com', 'single', 0778946237, 60);
INSERT INTO authors VALUES (309, 'Joyce Meyer', 'meyerjoyce@gmail.com', 'married', 0200345674, 70);
INSERT INTO authors VALUES (400, 'Gary Martinz', 'gary@gmail.com', 'married', 0700024565, 80);
INSERT INTO authors VALUES (420, 'Mercy Cranes', 'cranes@gmail.com', 'single', 0773454566, 50);


INSERT INTO librarians VALUES (100, 'Joseph Katale', 'josephk@gmail.com', 0789924355, 10);
INSERT INTO librarians VALUES (200, 'Mary Kisakye', 'marykis@gmail.com', 0720345673, 20);
INSERT INTO librarians VALUES (300, 'Anna Akello', 'annaakello@gmail.com', 0778904510, 10);
INSERT INTO librarians VALUES (400, 'Gerald Otim', 'geraldOtim@gmail.com', 0700896432, 20);
INSERT INTO librarians VALUES (500, 'James Mwesigwa', 'james111@gmail.com', 0780004432, 10);
INSERT INTO librarians VALUES (600, 'Jade Lule', 'jadelule@gmail.com', 0799665443, 20);


INSERT INTO publishers VALUES (50, 'Macmillan');
INSERT INTO publishers VALUES (60, 'Fountain');
INSERT INTO publishers VALUES (70, 'Bloomsbury');
INSERT INTO publishers VALUES (80, 'Disney');


INSERT INTO students VALUES (123, 'James Bonds', 0300233456, 'Kiwatule', '2022-01-22', '2022-01-25', 'returned');
INSERT INTO students VALUES (124, 'Carolyn Luther', 0707897987, 'Ntinda', '2022-06-10', '2022-06-20', 'Not returned');
INSERT INTO students VALUES (125, 'Ryan Blues', 0293847654, 'Mpigi', '2022-03-10', '2022-03-15', 'returned');
INSERT INTO students VALUES (126, 'Prisca Mukite', 0777778865, 'Kiwatule', '2022-01-21', '2022-01-23', 'returned');
INSERT INTO students VALUES (127, 'Joan Namuli', 0773356427, 'Mulago', '2022-04-22', '2022-04-26', 'Not returned');
INSERT INTO students VALUES (128, 'Rodrick Mutesa', 0709864533, 'Mpigi', '2022-03-11', '2022-03-15', 'returned');
INSERT INTO students VALUES (129, 'Mark Simbwa', 0759843221, 'Wandegeya', '2022-02-23', '2022-03-12', 'returned');
INSERT INTO students VALUES (130, 'Faithful Ayela', 0768934252, 'Bwaise', '2022-08-02', '2022-08-20', 'Not returned');
INSERT INTO students VALUES (131, 'Parick Obong', 0743456321, 'Kawempe', '2022-04-01', '2022-04-20', 'returned');
INSERT INTO students VALUES (132, 'Patience Mwesigwa', 0778923333, 'Wandegeya', '2022-09-06', '2022-09-22', 'Not returned');


INSERT INTO books VALUES ('19-123-100','The Hobbit', '$100', 'Fantasy', '1996-02-24', 1996, 280, 123);
INSERT INTO books VALUES ('19-123-101', 'Salt to the Sea', '$400', 'Historical Fiction', '1998-10-10', 1998, 470, 132);
INSERT INTO books VALUES ('19-123-102', 'The Lord of the Rings', '$200', 'Fantasy', '1996-08-20', 1996, 280, 127);
INSERT INTO books VALUES ('19-123-103', 'Fahrenheit 451', '$250', 'Science Fiction', '2011-04-11', 2011, 400, 129);
INSERT INTO books VALUES ('19-123-104', 'To Kill a Mockingbird', '$60', 'Traditonal Literature', '1999-02-21', 1999, 400, 123);
INSERT INTO books VALUES ('19-123-105', 'Blue Lipstick: Concrete Poems', '$10', 'Poetry', '1996-04-20', 1996, 420, 124);
INSERT INTO books VALUES ('19-123-106', 'The Perks of Being a Wallflower', '$55', 'Traditional Literature','1999-06-16', 1999, 400, 126);
INSERT INTO books VALUES ('19-123-107', 'Building REST APIs with Flask', '$100', 'Informational', '2003-11-09', 2003, 300, 127);
INSERT INTO books VALUES ('19-123-108', 'Introduction-to-APIs', '$700', 'Informational', '2004-03-04', 2004, 300, 124);
INSERT INTO books VALUES ('19-123-109', 'The History of the Zulu', '$20', 'Historical Fiction', '1998-03-12', 1998, 470, 128);


SELECT * FROM shifts;
SELECT * FROM librarians;
SELECT * FROM publishers;
SELECT * FROM books;
SELECT * FROM students;


SELECT * FROM authors;
SELECT * FROM librarians WHERE shift_id = 10;
SELECT * FROM students WHERE return_status = 'Not returned';
SELECT author_name,publisher_id  FROM authors;
SELECT COUNT (DISTINCT author_id) FROM books;









