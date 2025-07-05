CREATE DATABASE IF NOT EXISTS street_food_italien;
USE street_food_italien;

CREATE TABLE Marque (
    id_marque INT PRIMARY KEY,
    nom_marque VARCHAR(100) NOT NULL
);

CREATE TABLE Produit (
    id_produit INT PRIMARY KEY,
    nom_produit VARCHAR(100) NOT NULL,
    prix DECIMAL(5,2) NOT NULL,
    id_marque INT,
    FOREIGN KEY (id_marque) REFERENCES Marque(id_marque)
);

CREATE TABLE Ingredient (
    id_ingredient INT PRIMARY KEY,
    nom_ingredient VARCHAR(100) NOT NULL
);

CREATE TABLE Focaccia (
    id_focaccia INT PRIMARY KEY,
    nom_focaccia VARCHAR(100) NOT NULL,
    prix DECIMAL(5,2) NOT NULL
);

CREATE TABLE Focaccia_Ingredient (
    id_focaccia INT,
    id_ingredient INT,
    quantite INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES Focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES Ingredient(id_ingredient)
);
