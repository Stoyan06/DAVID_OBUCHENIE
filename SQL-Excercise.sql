CREATE DATABASE Boardgames
USE Boardgames
GO
CREATE TABLE PlayersRanges
(
  Id INT UNIQUE IDENTITY,
  PRIMARY KEY(Id),
  PlayersMin INT NOT NULL,
  PlayersMax INT NOT NULL
)

CREATE TABLE Categories
(
  Id INT UNIQUE IDENTITY,
  PRIMARY KEY(Id),
  NAME VARCHAR(50) NOT NULL
)

CREATE TABLE Creators
(
  Id INT UNIQUE IDENTITY,
  PRIMARY KEY(Id),
  FirstName NVARCHAR(30) NOT NULL,
  LastName NVARCHAR(30) NOT NULL,
  Email NVARCHAR(30) NOT NULL
)

CREATE TABLE Boardgames
(
  Id INT UNIQUE IDENTITY FOREIGN KEY REFERENCES Creators(Id),
  Name NVARCHAR(30) NOT NULL,
  YearPublished INT NOT NULL,
  Rating DECIMAL(2) NOT NULL,
  PRIMARY KEY(Id),
  CategoryId INT NOT NULL FOREIGN KEY REFERENCES Categories(Id),
  PublisherId INT NOT NULL FOREIGN KEY REFERENCES Publishers(Id),
  PlayersRangeId INT NOT NULL FOREIGN KEY REFERENCES PlayersRanges(Id)
)

CREATE TABLE Publishers
(
  Id INT UNIQUE IDENTITY,
  PRIMARY KEY(Id),
  Name VARCHAR(30) UNIQUE NOT NULL,
  AddressId INT NOT NULL FOREIGN KEY REFERENCES Addresses(Id),
  Website NVARCHAR(40),
  Phone NVARCHAR(20) 
)

CREATE TABLE Addresses
(
  Id INT UNIQUE IDENTITY,
  PRIMARY KEY(Id),
  StreetName NVARCHAR(100) NOT NULL,
  StreetNumber INT NOT NULL,
  Town VARCHAR(30) NOT NULL,
  Country VARCHAR(50) NOT NULL,
  ZIP INT NOT NULL
)