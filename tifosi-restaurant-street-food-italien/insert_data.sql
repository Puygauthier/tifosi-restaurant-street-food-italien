-- Vider les tables dans l'ordre pour respecter les contraintes de clés étrangères
DELETE FROM Focaccia_Ingredient;
DELETE FROM Boisson;
DELETE FROM Produit;
DELETE FROM Focaccia;
-- Ne pas supprimer Ingredient (important pour garder les ingrédients déjà existants)
-- DELETE FROM Ingredient;

-- ⚠️ Ne supprime pas les marques car elles existent déjà et sont utilisées dans les autres données

-- Insertion des marques (uniquement celles des boissons)
INSERT IGNORE INTO Marque (id_marque, nom_marque) VALUES
(1, 'Coca-Cola'),
(2, 'PepsiCo'),
(3, 'Monster'),
(4, 'Cristaline');

-- Insertion des produits (relatifs aux marques déjà existantes)
INSERT INTO Produit (id_produit, nom_produit, prix, id_marque) VALUES
(1, 'Spaghetti', 2.50, 1),
(2, 'Penne Rigate', 2.80, 1),
(3, 'Fusilli', 3.00, 2),
(4, 'Tortellini', 3.20, 3),
(5, 'Lasagna', 5.00, 4);

-- Insertion des ingrédients (uniques, insérer uniquement les nouveaux ingrédients si besoin)
INSERT IGNORE INTO Ingredient (id_ingredient, nom_ingredient) VALUES
(1, 'Tomate'),
(2, 'Mozzarella'),
(3, 'Jambon'),
(4, 'Basilic'),
(5, 'Huile d\'olive'),
(6, 'Oignon'),
(7, 'Champignon'),
(8, 'Salami'),
(9, 'Parmesan'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Raclette'),
(13, 'Cresson'),          -- corrigé (remplace 'Laitue' par 'Cresson')
(14, 'Oeuf'),
(15, 'Beurre'),
(16, 'Poivron'),
(17, 'Bacon'),
(18, 'Crème fraîche'),
(19, 'Pesto'),
(20, 'Olives'),
(21, 'Moutarde'),
(22, 'Ragù'),
(23, 'Ricotta'),
(24, 'Pecorino'),
(25, 'Artichaut'),
(26, 'Ail'),
(27, 'Ananas'),
(28, 'Base tomate'),
(29, 'Base crème'),
(30, 'Chèvre'),
(31, 'Cresson'),
(32, 'Jambon cuit'),
(33, 'Jambon fumé'),
(34, 'Olive noir'),
(35, 'Olive verte'),
(36, 'Piment'),
(37, 'Pomme de terre'),
(38, 'Tomate cerise');

-- Insertion des focaccias
INSERT INTO Focaccia (id_focaccia, nom_focaccia, prix) VALUES
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 9.80),
(6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80),
(8, 'Paysanne', 12.80);

-- Insertion des ingrédients associés à chaque focaccia (sans poivron, avec bonnes quantités)

INSERT INTO Focaccia_Ingredient (id_focaccia, id_ingredient, quantite) VALUES
-- Mozaccia
(1, 28, 200),   -- base tomate
(1, 2, 50),     -- mozzarella
(1, 33, 50),    -- jambon fumé
(1, 26, 10),    -- ail
(1, 25, 30),    -- artichaut
(1, 7, 20),     -- champignon
(1, 9, 10),     -- parmesan
(1, 20, 10),    -- olives
(1, 13, 15),    -- cresson
(1, 20, 5),     -- poivre (si poivre est 20 sinon à vérifier)
(1, 34, 15),    -- olive noir

-- Gorgonzollaccia
(2, 29, 200),   -- base crème
(2, 11, 40),    -- gorgonzola
(2, 9, 20),     -- parmesan
(2, 32, 50),    -- jambon cuit
(2, 7, 80),     -- champignon
(2, 20, 5),     -- poivre
(2, 34, 15),    -- olive noir

-- Raclaccia
(3, 28, 200),   -- base tomate
(3, 12, 60),    -- raclette
(3, 13, 15),    -- cresson
(3, 26, 10),    -- ail
(3, 7, 80),     -- champignon
(3, 9, 20),     -- parmesan
(3, 20, 5),     -- poivre

-- Emmentalaccia
(4, 29, 200),   -- base crème
(4, 10, 50),    -- emmental
(4, 9, 20),     -- parmesan
(4, 7, 80),     -- champignon
(4, 15, 10),    -- beurre
(4, 20, 5),     -- poivre

-- Tradizione
(5, 28, 200),   -- base tomate
(5, 2, 50),     -- mozzarella
(5, 11, 30),    -- gorgonzola
(5, 12, 80),    -- raclette
(5, 7, 80),     -- champignon
(5, 20, 5),     -- poivre
(5, 34, 15),    -- olive noir
(5, 17, 10),    -- bacon

-- Hawaienne
(6, 28, 200),   -- base tomate
(6, 2, 50),     -- mozzarella
(6, 27, 50),    -- ananas
(6, 7, 80),     -- champignon
(6, 20, 5),     -- poivre
(6, 34, 15),    -- olive noir

-- Américaine
(7, 29, 200),   -- base crème
(7, 8, 50),     -- salami
(7, 9, 20),     -- parmesan
(7, 21, 40),    -- moutarde
(7, 20, 5),     -- poivre
(7, 34, 15),    -- olive noir

-- Paysanne
(8, 29, 200),   -- base crème
(8, 7, 80),     -- champignon
(8, 33, 50),    -- jambon fumé
(8, 13, 15),    -- cresson
(8, 26, 10),    -- ail
(8, 14, 50),    -- oeuf
(8, 20, 5);     -- poivre

-- Insertion des boissons avec colonne id_marque remplie correctement
INSERT INTO Boisson (id_boisson, nom_boisson, prix, id_marque) VALUES
(1, 'Coca-Cola', 2.50, 1),
(2, 'Pepsi', 2.80, 2),
(3, 'Monster Energy', 3.00, 3),
(4, 'Cristaline Eau', 1.20, 4),
(5, 'Fanta', 2.00, 1),
(6, '7UP', 2.00, 2),
(7, 'Red Bull', 3.50, 3),
(8, 'Evian', 1.50, 4),
(9, 'Sprite', 2.00, 1),
(10, 'Lipton Ice Tea', 2.50, 2),
(11, 'Monster Ultra', 3.20, 3),
(12, 'Cristaline Gazeuse', 1.70, 4);
