CREATE DATABASE HomeWork6
go
USE HomeWork6

CREATE TABLE Authors (
    Id INT identity PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL
);

CREATE TABLE Books (
    Id INT identity PRIMARY KEY,
	AuthorId INT REFERENCES Authors(Id),
    Name VARCHAR(100) CHECK (LEN(Name) >= 2),
    PageCount INT CHECK (PageCount >= 10)
);
go

INSERT INTO Books values
(2,'The Great Gatsby',208),
(3,'The Running Graves',268),
(1,'To Kill a Mockingbird',336),
(3,'Harry Potter',607),
(4,'The Lord of the Rings',372),
(5,'The Little Prince',109)


INSERT INTO Authors values
('Harper','Lee'),
('F. Scott','Fitzgerald'),
('Joanne','Rowling'),
('John','Ronald'),
('Antoine','Saint')

go

CREATE VIEW book_detail_view
as SELECT 
	Books.Id,
	Books.[Name],
	Books.[PageCount],
	Authors.[Name] + ' ' + Authors.Surname as FullName
FROM Authors 
JOIN Books
ON Authors.Id = Books.AuthorId; 

select * from book_detail_view



CREATE PROCEDURE sp_show @AuthorName varchar(100)
AS
	BEGIN
		SELECT 
			Books.Id,
			Books.[Name],
			Books.[PageCount],
			Authors.[Name] + ' ' + Authors.Surname as FullName
		FROM Authors 
		JOIN Books
		ON Authors.ID = Books.AuthorId
		WHERE Authors.Name =  @AuthorName
	END



CREATE PROCEDURE sp_insert @Name varchar(50), @Surname varchar(50)
AS
	BEGIN
		INSERT Authors VALUES(@Name,@Surname)
	END



CREATE PROCEDURE sp_update @Name varchar(50), @Surname varchar(50)
AS
	BEGIN
		UPDATE Authors
		SET Name = @Name, Surname = @Surname
		WHERE @Name = Authors.Name;
	END



CREATE PROCEDURE sp_delete @Name varchar(50)
AS
	BEGIN
		DELETE FROM Authors 
		WHERE @Name = Authors.Name;
	END



CREATE VIEW Author_books_details
as SELECT
		Authors.Id,
		Authors.[Name] + ' ' + Authors.Surname as FullName,
		COUNT(Books.Id) AS BooksCount ,
		SUM(Books.PageCount) AS OverallPageCount
	FROM Authors 
	JOIN Books
	ON Authors.Id = Books.AuthorId
	GROUP BY
    Authors.Id, Authors.Name, Authors.Surname;
	
go

select * from Author_books_details