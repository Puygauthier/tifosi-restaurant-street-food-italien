-- Insertion des focaccias
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix) VALUES
(1, 'Mozaccia', 9.80),
(2, 'Gorgonzollaccia', 10.80),
(3, 'Raclaccia', 8.90),
(4, 'Emmentalaccia', 9.80),
(5, 'Tradizione', 9.80),
(6, 'Hawaienne', 11.20),
(7, 'Américaine', 10.80),
(8, 'Paysanne', 12.80);

-- Insertion des ingrédients associés à chaque focaccia
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES
-- Focaccia 1 : Mozaccia
(1, 5, 200),
(1, 25, 50),
(1, 9, 20),
(1, 13, 80),
(1, 1, 2),
(1, 3, 20),
(1, 7, 80),
(1, 18, 50),
(1, 20, 1),
(1, 16, 20),

-- Focaccia 2 : Gorgonzollaccia
(2, 5, 200),
(2, 11, 50),
(2, 9, 20),
(2, 1, 2),
(2, 7, 80),
(2, 18, 50),
(2, 20, 1),
(2, 16, 20),

-- Focaccia 3 : Raclaccia
(3, 6, 200),
(3, 22, 50),
(3, 9, 20),
(3, 1, 2),
(3, 7, 80),
(3, 18, 50),
(3, 20, 1),

-- Focaccia 4 : Emmentalaccia
(4, 5, 200),
(4, 10, 50),
(4, 9, 20),
(4, 7, 80),
(4, 18, 50),
(4, 20, 1),
(4, 15, 20),

-- Focaccia 5 : Tradizione
(5, 5, 200),
(5, 25, 50),
(5, 9, 20),
(5, 12, 80),
(5, 7, 80),
(5, 18, 50),
(5, 20, 1),
(5, 16, 10),
(5, 17, 10),

-- Focaccia 6 : Hawaienne
(6, 5, 200),
(6, 25, 50),
(6, 9, 20),
(6, 4, 80),
(6, 2, 40),
(6, 18, 50),
(6, 20, 1),
(6, 16, 20),

-- Focaccia 7 : Américaine
(7, 6, 200),
(7, 8, 50),
(7, 9, 20),
(7, 4, 80),
(7, 21, 40),
(7, 18, 50),
(7, 20, 1),
(7, 16, 20),

-- Focaccia 8 : Paysanne
(8, 6, 200),
(8, 8, 50),
(8, 9, 20),
(8, 13, 80),
(8, 1, 2),
(8, 3, 20),
(8, 7, 80),
(8, 18, 50),
(8, 20, 1),
(8, 16, 20),
(8, 14, 50);
