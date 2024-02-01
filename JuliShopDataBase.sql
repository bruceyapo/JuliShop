CREATE DATABASE JuliShop;

use JuliShop

CREATE TABLE Users (
    IdUser INT PRIMARY KEY IDENTITY(1,1),
    Email VARCHAR(100),
    MotDePasse VARCHAR(255),
	Roles VARCHAR(30)
);

CREATE TABLE Administrateurs (
    IdAdministrateur INT PRIMARY KEY IDENTITY(1,1),
    NomAdministrateur VARCHAR(100),
	PrenomAdministrateur VARCHAR(150),
	IdUser INT,
	FOREIGN KEY(IdUser)	REFERENCES Users(IdUser)
);


CREATE TABLE Clients (
    IdClient INT PRIMARY KEY IDENTITY(1,1),
    PrenomClient VARCHAR(50),
    NomClient VARCHAR(50),
    AdresseClient VARCHAR(255),
	DetailAdresseClient TEXT,
	IdUser INT,
	FOREIGN KEY(IdUser)	REFERENCES Users(IdUser)
);

CREATE TABLE CategoriesProduits (
    IdCategorie INT PRIMARY KEY IDENTITY(1,1),
    NomCategorie VARCHAR(90)
);

CREATE TABLE Produits (
    IdProduit INT PRIMARY KEY IDENTITY(1,1),
    NomProduit VARCHAR(100),
    Descriptions TEXT,
    Prix DECIMAL(10, 2),
    QuantiteStock INT,
	Img1 VARCHAR(255),
	Img2 VARCHAR(255),
	Img3 VARCHAR(255),
	Img4 VARCHAR(255),
    IdCategorie INT,
    FOREIGN KEY (IdCategorie) REFERENCES CategoriesProduits(IdCategorie)
);


CREATE TABLE Commandes (
    IdCommande INT PRIMARY KEY IDENTITY(1,1),
    IdClient INT,
	IdProduit INT,
    DateCommande VARCHAR(90),
    StatutCommande VARCHAR(90),
    MontantTotal DECIMAL(10, 2),
    FOREIGN KEY (IdClient) REFERENCES Clients(IdClient),
    FOREIGN KEY (IdProduit) REFERENCES Produits(IdProduit)

);


CREATE TABLE DetailsCommande (
    IdDetailCommande INT PRIMARY KEY IDENTITY(1,1),
    IdCommande INT,
    Quantite INT,
    PrixUnitaire DECIMAL(10, 2),
    FOREIGN KEY (IdCommande) REFERENCES Commandes(IdCommande),
);