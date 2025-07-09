
-- Création de l'utilisateur 'tifosi' avec un mot de passe
CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'Tifosi2025!';

-- Attribution des droits d'administration sur la base de données 'tifosi'
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';

-- Appliquer les changements de droits
FLUSH PRIVILEGES;
