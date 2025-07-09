-- Vider les tables dans l'ordre pour respecter les contraintes de clés étrangères
DELETE FROM Focaccia_Ingredient;
DELETE FROM Boisson;
DELETE FROM Produit;
DELETE FROM Focaccia;
-- Ne pas supprimer Ingredient (important pour garder les ingrédients déjà existants)
-- DELETE FROM Ingredient;

-- Insertion des marques (uniquement celles des boissons)
INSERT IGNORE INTO Marque (id_marque, nom_marque) VALUES
    (1, 'Coca-Cola'),
    (2, 'Cristaline'),
    (3, 'Monster'),
    (4, 'PepsiCo');

-- Insertion des ingrédients (uniques, insérer uniquement les nouveaux ingrédients si besoin)
INSERT IGNORE INTO Ingredient (id_ingredient, nom_ingredient) VALUES
    (1, 'Ail'),
    (2, 'Ananas'),
    (3, 'Artichaut'),
    (4, 'Bacon'),
    (5, 'Base Tomate'),
    (6, 'Base Crème'),
    (7, 'Champignon'),
    (8, 'Chèvre'),
    (9, 'Cresson'),
    (10, 'Emmental'),
    (11, 'Gorgonzola'),
    (12, 'Jambon cuit'),
    (13, 'Jambon fumé'),
    (14, 'Oeuf'),
    (15, 'Oignon'),
    (16, 'Olive noire'),
    (17, 'Olive verte'),
    (18, 'Parmesan'),
    (19, 'Piment'),
    (20, 'Poivre'),
    (21, 'Pomme de terre'),
    (22, 'Raclette'),
    (23, 'Salami'),
    (24, 'Tomate cerise'),
    (25, 'Mozarella');

-- Insertion des focaccias
INSERT INTO Focaccia (id_focaccia, nom_focaccia, prix) VALUES
    (1, 'Mozaccia', 9.80),
    (2, 'Gorgonzollaccia', 10.80),
    (3, 'Raclaccia', 8.90),
    (4, 'Emmentalaccia', 9.80),
    (5, 'Tradizione', 8.90),
    (6, 'Hawaienne', 11.20),
    (7, 'Américaine', 10.80),
    (8, 'Paysanne', 12.80);

-- Insertion des ingrédients associés à chaque focaccia (sans poivron, avec bonnes quantités)
INSERT INTO Focaccia_Ingredient (id_focaccia, id_ingredient, quantite) VALUES
    -- Mozaccia
    (1, 5, 200),
    (1, 25, 50),
    (1, 13, 80),
    (1, 1, 2),
    (1, 3, 20),
    (1, 7, 40),
    (1, 18, 20),
    (1, 9, 20),
    (1, 20, 1),
    (1, 16, 20),

    -- Gorgonzollaccia
    (2, 5, 200),
    (2, 11, 50),
    (2, 9, 20),
    (2, 18, 20),
    (2, 1, 2),
    (2, 7, 40),
    (2, 20, 1),
    (2, 16, 20),

    -- Raclaccia
    (3, 5, 200),
    (3, 22, 50),
    (3, 9, 20),
    (3, 1, 2),
    (3, 7, 40),
    (3, 18, 20),
    (3, 20, 1),

    -- Emmentalaccia
    (4, 6, 200),
    (4, 10, 50),
    (4, 9, 20),
    (4, 18, 20),
    (4, 7, 40),
    (4, 20, 1),
    (4, 15, 20),

    -- Tradizione
    (5, 5, 200),
    (5, 25, 50),
    (5, 12, 80),
    (5, 18, 20),
    (5, 7, 80),
    (5, 20, 1),
    (5, 16, 10),
    (5, 17, 10),
    (5, 9, 20),

    -- Hawaienne
    (6, 5, 200),
    (6, 25, 50),
    (6, 9, 20),
    (6, 4, 80),
    (6, 2, 40),
    (6, 19, 2),
    (6, 18, 20),
    (6, 20, 1),
    (6, 16, 20),

    -- Américaine
    (7, 5, 200),
    (7, 25, 50),
    (7, 9, 20),
    (7, 4, 80),
    (7, 21, 40),
    (7, 18, 20),
    (7, 20, 1),
    (7, 16, 20),

    -- Paysanne
    (8, 6, 200),
    (8, 8, 50),
    (8, 9, 20),
    (8, 21, 80),
    (8, 7, 40),
    (8, 13, 80),
    (8, 3, 20),
    (8, 18, 20),
    (8, 1, 2),
    (8, 14, 50),
    (8, 20, 1),
    (8, 16, 20);

-- Insertion des boissons avec colonne id_marque remplie correctement
INSERT INTO Boisson (id_boisson, nom_boisson, id_marque) VALUES
    (1, 'Coca-Cola zéro', 1),
    (2, 'Coca-cola original', 1),
    (3, 'Fanta citron', 1),
    (4, 'Fanta orange', 1),
    (5, 'Capri-sun', 1),
    (6, 'Pepsi', 4),
    (7, 'Pepsi Max Zéro', 4),
    (8, 'Lipton zéro citron', 4),
    (9, 'Lipton Peach', 4),
    (10, 'Monster energy ultra gold', 3),
    (11, 'Monster energy ultra blue', 3),
    (12, 'Eau de source', 2);
