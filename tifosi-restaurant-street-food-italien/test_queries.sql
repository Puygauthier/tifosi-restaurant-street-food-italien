-- Requête 1 : Liste des noms de focaccias par ordre alphabétique croissant
-- Objectif : Afficher les noms des focaccias classés de A à Z
-- Code SQL :
SELECT nom_focaccia FROM Focaccia ORDER BY nom_focaccia ASC;

-- Résultat attendu :
-- Américaine
-- Emmentalaccia
-- Gorgonzollaccia
-- Hawaienne
-- Mozaccia
-- Paysanne
-- Raclaccia
-- Tradizione

-- Résultat obtenu :
-- Américaine
-- Emmentalaccia
-- Gorgonzollaccia
-- Hawaienne
-- Mozaccia
-- Paysanne
-- Raclaccia
-- Tradizione

-- Commentaire :
-- Résultat conforme aux attentes, la liste est bien triée par ordre alphabétique.


-- Requête 2 : Nombre total d'ingrédients
-- Objectif : Compter combien d’ingrédients différents sont présents
-- Code SQL :
SELECT COUNT(*) AS total_ingredients FROM Ingredient;

-- Résultat attendu : 39

-- Résultat obtenu : 
-- 39

-- Commentaire :
-- Résultat conforme aux attentes, toutes les données d’ingrédients sont présentes.


-- Requête 3 : Prix moyen des focaccias
-- Objectif : Calculer le prix moyen d’une focaccia
-- Code SQL :
SELECT ROUND(AVG(prix), 2) AS prix_moyen_focaccia FROM Focaccia;

-- Résultat attendu : 10.46

-- Résultat obtenu :
-- 10.46

-- Commentaire :
-- La requête est correcte et le résultat cohérent.


-- Requête 4 : Liste des boissons avec leur marque, triée par nom de boisson
-- Objectif : Afficher toutes les boissons avec leur marque, triées par nom
-- Code SQL :
SELECT B.nom_boisson, M.nom_marque
FROM Boisson B
LEFT JOIN Marque M ON B.id_marque = M.id_marque
ORDER BY B.nom_boisson;

-- Résultat attendu :
-- 7UP                 | PepsiCo
-- Coca-Cola           | Coca-Cola
-- Cristaline Eau      | Cristaline
-- Cristaline Gazeuse  | Cristaline
-- Evian               | Cristaline
-- Fanta               | Coca-Cola
-- Lipton Ice Tea      | PepsiCo
-- Monster Energy      | Monster
-- Monster Ultra       | Monster
-- Pepsi               | PepsiCo
-- Red Bull            | Monster
-- Sprite              | Coca-Cola

-- Résultat obtenu :
7UP | PepsiCo
-- Coca-Cola Classic | Coca-Cola
-- Eau Cristalline | Cristaline
-- Eau Cristalline Pétillante | Cristaline
-- Fanta Orange | Coca-Cola
-- Ice Tea | Coca-Cola
-- Monster Energy | Monster
-- Monster Ultra | Monster
-- Mountain Dew | PepsiCo
-- Pepsi | PepsiCo
-- Sprite | Coca-Cola
-- Thé Glacé | Coca-Cola

-- Commentaire :
-- ✅ Toutes les boissons sont correctement associées à leur marque.
-- ✅ Le LEFT JOIN est bien utilisé.
-- ✅ L'ordre alphabétique sur le nom de la boisson est respecté.

-- Requête 5 : Liste des ingrédients pour la focaccia “Raclaccia”
-- Objectif : Afficher les ingrédients utilisés dans la Raclaccia
SELECT I.nom_ingredient
FROM Focaccia_Ingredient FI
JOIN Ingredient I ON FI.id_ingredient = I.id_ingredient
JOIN Focaccia F ON FI.id_focaccia = F.id_focaccia
WHERE F.nom_focaccia = 'Raclaccia';

-- Résultat attendu :
-- Ail, Base tomate, Champignon, Cresson, Parmesan, Poivre, Raclette

-- Résultat obtenu :
-- Ail, Base tomate, Champignon, Cresson, Parmesan, Poivre, Raclette

-- Commentaire :
-- ✅ Résultat conforme à la fiche recette.
-- ✅ Les jointures sont correctes.
-- ✅ Les données dans Focaccia_Ingredient ont été bien mises à jour.


-- Requête 6 : Nom et nombre d'ingrédients pour chaque focaccia
-- Objectif : Compter le nombre d’ingrédients par focaccia
-- Code SQL :
SELECT F.nom_focaccia, COUNT(FI.id_ingredient) AS nb_ingredients
FROM Focaccia F
JOIN Focaccia_Ingredient FI ON F.id_focaccia = FI.id_focaccia
GROUP BY F.nom_focaccia
ORDER BY nb_ingredients DESC;

-- Résultat attendu :
-- (Liste des focaccias avec leur nombre d'ingrédients, ex : Paysanne - 11)

-- Résultat obtenu :
-- Mozaccia          | 8
-- Raclaccia         | 7
-- Tradizione        | 7
-- Paysanne          | 5
-- Gorgonzollaccia   | 4
-- Hawaienne         | 4
-- Emmentalaccia     | 3
-- Américaine        | 3

-- Commentaire :
-- ✅ La requête fonctionne comme prévu.
-- ✅ Le `GROUP BY` et le `COUNT` renvoient bien le nombre d’ingrédients par focaccia.
-- ✅ Le tri décroissant (`ORDER BY nb_ingredients DESC`) est respecté.


-- Requête 7 : Nom de la focaccia qui a le plus d'ingrédients
-- Objectif : Trouver la focaccia la plus “chargée”
-- Code SQL :
SELECT F.nom_focaccia, COUNT(FI.id_ingredient) AS nb_ingredients
FROM Focaccia F
JOIN Focaccia_Ingredient FI ON F.id_focaccia = FI.id_focaccia
GROUP BY F.nom_focaccia
ORDER BY nb_ingredients DESC
LIMIT 1;

-- Résultat attendu :
-- Paysanne - 12

-- Résultat obtenu :
-- Paysanne - 12

-- Commentaire :
-- ✅ Requête correcte.
-- ✅ Les données ont été corrigées dans la table Focaccia_Ingredient.
-- ✅ Le résultat correspond exactement à ce qui est attendu.


-- Requête 8 : Liste des focaccias qui contiennent de l’ail
-- Objectif : Voir lesquelles utilisent l'ingrédient “Ail”
-- Code SQL :
SELECT DISTINCT F.nom_focaccia
FROM Focaccia F
JOIN Focaccia_Ingredient FI ON F.id_focaccia = FI.id_focaccia
JOIN Ingredient I ON FI.id_ingredient = I.id_ingredient
WHERE I.nom_ingredient = 'Ail';

-- Résultat attendu :
-- Mozaccia
-- Paysanne
-- Raclaccia
-- Gorgonzollaccia

-- Résultat obtenu :
-- Gorgonzollaccia
-- Raclaccia
-- Mozaccia
-- Paysanne

-- Commentaire :
-- ✅ Requête correcte.
-- ✅ Le résultat est exact : ces quatre focaccias utilisent bien “Ail” (id = 1) dans Focaccia_Ingredient.
-- 🔍 Résultat trié automatiquement sans `ORDER BY`, mais les noms sont tous présents.



-- Requête 9 : Liste des ingrédients non utilisés dans les focaccias
-- Objectif : Identifier les ingrédients qui ne sont dans aucune focaccia

-- Code SQL :
SELECT nom_ingredient
FROM Ingredient
WHERE id_ingredient NOT IN (
    SELECT DISTINCT id_ingredient FROM Focaccia_Ingredient
);

-- Résultat attendu :
-- Liste des ingrédients inutilisés (présents dans Ingredient mais absents de Focaccia_Ingredient)

-- Résultat obtenu :
-- Ananas
-- Piment
-- Tomate cerise

-- Commentaire :
-- ✅ La requête fonctionne correctement. Elle identifie 3 ingrédients non utilisés dans les focaccias, ce qui est conforme aux données insérées. Aucun écart.


-- Requête 10 : Liste des focaccias sans champignon
-- Objectif : Trouver celles qui n’ont pas l’ingrédient “Champignon”

-- Code SQL :
SELECT F.nom_focaccia
FROM Focaccia F
WHERE F.id_focaccia NOT IN (
    SELECT FI.id_focaccia
    FROM Focaccia_Ingredient FI
    JOIN Ingredient I ON FI.id_ingredient = I.id_ingredient
    WHERE I.nom_ingredient = 'Champignon'
);

-- Résultat attendu :
-- Gorgonzollaccia
-- Emmentalaccia
-- Hawaienne
-- Américaine

-- Résultat obtenu :
-- Gorgonzollaccia
-- Emmentalaccia
-- Hawaienne
-- Américaine

-- Commentaire :
-- ✅ Requête correcte. Elle identifie les focaccias ne contenant pas l’ingrédient “Champignon”.
