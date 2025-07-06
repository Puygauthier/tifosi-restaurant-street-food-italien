CREATE DATABASE IF NOT EXISTS tifosi;
USE tifosi;

-- Table Marque
CREATE TABLE Marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom_marque VARCHAR(100) NOT NULL UNIQUE
);

-- Table Produit
CREATE TABLE Produit (
    id_produit INT AUTO_INCREMENT PRIMARY KEY,
    nom_produit VARCHAR(100) NOT NULL,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0),
    id_marque INT,
    FOREIGN KEY (id_marque) REFERENCES Marque(id_marque)
);

-- Table Ingredient
CREATE TABLE Ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom_ingredient VARCHAR(100) NOT NULL UNIQUE
);

-- Table Focaccia
CREATE TABLE Focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom_focaccia VARCHAR(100) NOT NULL,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0)
);

-- Table Focaccia_Ingredient (Table de jonction entre Focaccia et Ingredient)
CREATE TABLE Focaccia_Ingredient (
    id_focaccia INT,
    id_ingredient INT,
    quantite INT NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES Focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES Ingredient(id_ingredient)
);

-- Ajouter des contraintes de vérification et garantir les valeurs uniques
