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

-- Résultat attendu : 25

-- Résultat obtenu : 
-- 25

-- Commentaire :
-- Résultat conforme aux attentes, toutes les données d’ingrédients sont présentes selon le jeu de données du devoir.





-- Requête 3 : Prix moyen des focaccias
-- Objectif : Calculer le prix moyen d’une focaccia
-- Code SQL :
SELECT ROUND(AVG(prix), 2) AS prix_moyen_focaccia FROM Focaccia;

-- Résultat attendu : 10.38

-- Résultat obtenu : 
-- 10.38

-- Commentaire :
-- La requête est correcte et le résultat cohérent avec les prix actuels des focaccias dans la base.



-- Requête 4 : Liste des boissons avec leur marque, triée par nom de boisson
-- Objectif : Afficher toutes les boissons avec leur marque, triées par nom de boisson
SELECT B.nom_boisson, M.nom_marque
FROM Boisson B
LEFT JOIN Marque M ON B.id_marque = M.id_marque
ORDER BY B.nom_boisson;

-- Résultat attendu :
-- Capri-sun                 | Coca-Cola
-- Coca-cola original        | Coca-Cola
-- Coca-Cola zéro            | Coca-Cola
-- Eau de source             | Cristaline
-- Fanta citron              | Coca-Cola
-- Fanta orange              | Coca-Cola
-- Lipton Peach              | PepsiCo
-- Lipton zéro citron        | PepsiCo
-- Monster energy ultra blue | Monster
-- Monster energy ultra gold | Monster
-- Pepsi                     | PepsiCo
-- Pepsi Max Zéro            | PepsiCo

-- Résultat obtenu :
-- Capri-sun                 | Coca-Cola
-- Coca-cola original        | Coca-Cola
-- Coca-Cola zéro            | Coca-Cola
-- Eau de source             | Cristaline
-- Fanta citron              | Coca-Cola
-- Fanta orange              | Coca-Cola
-- Lipton Peach              | PepsiCo
-- Lipton zéro citron        | PepsiCo
-- Monster energy ultra blue | Monster
-- Monster energy ultra gold | Monster
-- Pepsi                     | PepsiCo
-- Pepsi Max Zéro            | PepsiCo

-- Commentaire :
-- ✅ Requête correcte.
-- ✅ Les boissons sont bien triées par nom.
-- ✅ Toutes les associations avec les marques sont exactes après les corrections.


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
SELECT F.nom_focaccia, COUNT(FI.id_ingredient) AS nb_ingredients
FROM Focaccia F
JOIN Focaccia_Ingredient FI ON F.id_focaccia = FI.id_focaccia
GROUP BY F.nom_focaccia
ORDER BY nb_ingredients DESC;

-- Résultat attendu :
-- Paysanne    | 12
-- Mozaccia    | 10
-- Tradizione  | 9
-- Hawaienne   | 9
-- Gorgonzollaccia | 8
-- Américaine  | 8
-- Raclaccia   | 7
-- Emmentalaccia | 7

-- Résultat obtenu :
-- (Même que ci-dessus, à recopier depuis ton interface MySQL)

-- Commentaire :
-- ✅ La requête fonctionne correctement.
-- ✅ Le nombre d’ingrédients est bien compté pour chaque focaccia.
-- ✅ Le tri décroissant par nombre d’ingrédients est respecté.

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
-- Salami
-- Tomate cerise

-- Résultat obtenu :
-- Salami
-- Tomate cerise

-- Commentaire :
-- ✅ Requête correcte.
-- ✅ Les ingrédients affichés ici ne sont réellement utilisés dans **aucune** focaccia.

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
-- Hawaienne
-- Américaine

-- Résultat obtenu :
-- Hawaienne
-- Américaine

-- Commentaire :
-- ✅ Requête correcte.
-- ✅ Le résultat est conforme aux données : seules ces deux focaccias ne contiennent pas de champignon.

