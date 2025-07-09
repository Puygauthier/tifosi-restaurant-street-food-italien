CREATE DATABASE IF NOT EXISTS tifosi;
USE tifosi;

-- Table Marque
CREATE TABLE Marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom_marque VARCHAR(50) NOT NULL UNIQUE
);

-- Table Produit
CREATE TABLE Produit (
    id_produit INT AUTO_INCREMENT PRIMARY KEY,
    nom_produit VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0),
    id_marque INT,
    FOREIGN KEY (id_marque) REFERENCES Marque(id_marque)
);

-- Table Ingredient
CREATE TABLE Ingredient (
    id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
    nom_ingredient VARCHAR(50) NOT NULL UNIQUE
);

-- Table Focaccia
CREATE TABLE Focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom_focaccia VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0)
);

-- Table Focaccia_Ingredient (relation entre Focaccia et Ingredient)
CREATE TABLE Focaccia_Ingredient (
    id_focaccia INT,
    id_ingredient INT,
    quantite INT NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES Focaccia(id_focaccia) ON DELETE CASCADE,
    FOREIGN KEY (id_ingredient) REFERENCES Ingredient(id_ingredient) ON DELETE CASCADE
);

-- Table Boisson
CREATE TABLE Boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom_boisson VARCHAR(50) NOT NULL UNIQUE,
    id_marque INT,
    FOREIGN KEY (id_marque) REFERENCES Marque(id_marque)
);

-- Table Client
CREATE TABLE Client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT NOT NULL
);

-- Table Menu (un menu contient exactement une focaccia)
CREATE TABLE Menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    id_focaccia INT NOT NULL,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0),
    FOREIGN KEY (id_focaccia) REFERENCES Focaccia(id_focaccia)
);

-- Table Achat (Client achète Produit ou Menu)
CREATE TABLE Achat (
    id_achat INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT NOT NULL,
    id_produit INT DEFAULT NULL,
    id_menu INT DEFAULT NULL,
    date_achat DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (id_produit) REFERENCES Produit(id_produit),
    FOREIGN KEY (id_menu) REFERENCES Menu(id_menu),
    CHECK (
        (id_produit IS NOT NULL AND id_menu IS NULL) OR
        (id_menu IS NOT NULL AND id_produit IS NULL)
    )
);

-- Table Menu_Boisson (un menu contient une ou plusieurs boissons)
CREATE TABLE Menu_Boisson (
    id_menu INT,
    id_boisson INT,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES Menu(id_menu) ON DELETE CASCADE,
    FOREIGN KEY (id_boisson) REFERENCES Boisson(id_boisson) ON DELETE CASCADE
);
