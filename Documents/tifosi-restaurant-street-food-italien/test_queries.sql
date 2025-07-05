USE street_food_italien;

-- 1. Toutes les marques
SELECT * FROM Marque;

-- 2. Tous les produits avec leur marque
SELECT p.nom_produit, p.prix, m.nom_marque
FROM Produit p
JOIN Marque m ON p.id_marque = m.id_marque;

-- 3. Toutes les focaccias avec leur prix
SELECT * FROM Focaccia;

-- 4. Focaccias avec plus de 5 ingrédients
SELECT f.nom_focaccia, COUNT(fi.id_ingredient) AS nb_ingredients
FROM Focaccia f
JOIN Focaccia_Ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.nom_focaccia
HAVING COUNT(fi.id_ingredient) > 5;

-- 5. Liste des ingrédients d'une focaccia (exemple : Mozaccia)
SELECT f.nom_focaccia, i.nom_ingredient, fi.quantite
FROM Focaccia f
JOIN Focaccia_Ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN Ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE f.nom_focaccia = 'Mozaccia';

-- 6. Nombre total d'ingrédients utilisés dans toutes les focaccias
SELECT COUNT(DISTINCT id_ingredient) AS nb_ingredients_total
FROM Focaccia_Ingredient;

-- 7. Produits de la marque "Pasta Fresca"
SELECT p.nom_produit
FROM Produit p
JOIN Marque m ON p.id_marque = m.id_marque
WHERE m.nom_marque = 'Pasta Fresca';
