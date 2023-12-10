CREATE DATABASE Task2

USE Task2

CREATE TABLE Brands(
	Id INT identity PRIMARY KEY,
	Name varchar(100) not null	
)

CREATE TABLE Laptops(
	Id int identity,
	Name varchar(100) not null,
	Price money,
	BrandId int FOREIGN KEY REFERENCES  Brands(Id)
)

CREATE TABLE Phones(
	Id int identity,
	Name varchar(100) not null,
	Price money,
	BrandId int FOREIGN KEY REFERENCES  Brands(Id)
)


insert into Brands values
('Apple'),
('Samsung'),
('Redmi')	

insert into Phones VALUES
('iPhone 15',1400,1),
('Iphone 15 Pro',1600,1),
('Redmi Note 12S',800,3),
('Galaxy Z Flip5',1300,2)

insert into Laptops VALUES
('Galaxy MEGA',4800,2),
('Galaxy Book3 Ultra',2000,2),
('Xiaomi Redmibook',2600,3),
('MacBook Air1',3300,1),
('MacBook Air2',5500,1),
('Galaxy Book',4500,2)



SELECT Laptops.Name , Brands.Name AS BrandName, Laptops.Price
FROM Laptops
JOIN Brands ON Laptops.BrandId = Brands.Id;

----------------------------------------------------------------------

SELECT Phones.Name , Brands.Name AS BrandName, Phones.Price
FROM Phones
JOIN Brands ON Phones.BrandId = Brands.Id;

----------------------------------------------------------------------

SELECT Laptops.Name , Brands.Name AS BrandName, Laptops.Price
FROM Laptops
JOIN Brands ON Laptops.BrandId = Brands.Id
where Brands.Name like '%s%';

----------------------------------------------------------------------

SELECT * from Laptops
where Price Between 2000 and 5000 or Laptops.Price > 5000

----------------------------------------------------------------------

SELECT * from Phones
where Price Between 1000 and 1500 or Phones.Price > 1500 

----------------------------------------------------------------------

SELECT Brands.Name as BradnName, Count(Brands.Id) as LaptopCount from Brands
join Laptops
on Brands.Id = Laptops.BrandId
group by 
Brands.Name,Brands.Id

----------------------------------------------------------------------

SELECT Brands.Name as BradnName, Count(Brands.Id) as PhoneCount from Brands
join Phones
on Brands.Id = Phones.BrandId
group by 
Brands.Name,Brands.Id

----------------------------------------------------------------------

SELECT Phones.Name AS CommonName, Phones.BrandId AS CommonBrandId
FROM Phones
JOIN Laptops ON Phones.BrandId = Laptops.BrandId;

----------------------------------------------------------------------

SELECT Phones.Name, Brands.Id as BrandId from Phones
JOIN Brands
on Phones.BrandId = Brands.Id

UNION

SELECT Laptops.Name , Brands.Id from Laptops
JOIN Brands
on Laptops.BrandId = Brands.Id

----------------------------------------------------------------------

SELECT Phones.Id , Phones.Name, Phones.Price, Brands.Id from Phones
JOIN Brands
on Phones.BrandId = Brands.Id

UNION

SELECT Laptops.Id , Laptops.Name, Laptops.Price, Brands.Id from Laptops
JOIN Brands
on Laptops.BrandId = Brands.Id

----------------------------------------------------------------------

SELECT Phones.Id , Phones.Name, Phones.Price, Brands.Name from Phones
JOIN Brands
on Phones.BrandId = Brands.Id

UNION

SELECT Laptops.Id , Laptops.Name, Laptops.Price, Brands.Name from Laptops
JOIN Brands
on Laptops.BrandId = Brands.Id

----------------------------------------------------------------------

SELECT Phones.Id ,Phones.Name ,Phones.Price ,Brands.Name from Phones
JOIN Brands
on Phones.BrandId = Brands.Id
where Price > 1000

UNION 

SELECT Laptops.Id ,Laptops.Name ,Laptops.Price ,Brands.Name from Laptops
JOIN Brands
on Laptops.BrandId = Brands.Id
where Price > 1000

----------------------------------------------------------------------

SELECT Brands.Name , SUM(Phones.Price) as TotalPrice, Count(Phones.Id) as ProductCount from Phones
JOIN Brands
on Phones.BrandId = Brands.Id
GROUP BY 
Brands.Name

----------------------------------------------------------------------

SELECT Brands.Name , SUM(Laptops .Price) as TotalPrice, Count(Laptops.Id) as ProductCount from Laptops 
JOIN Brands
on Laptops.BrandId = Brands.Id
GROUP BY 
Brands.Name
HAVING Count(Laptops.Id) >= 3

	
