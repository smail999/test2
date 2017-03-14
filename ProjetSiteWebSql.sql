CREATE DATABASE sitecommerce;
--USE sitecommerce;

# Création de ma table avec mes marques et insertion des données
CREATE TABLE marque (id SMALLINT AUTO_INCREMENT PRIMARY KEY, nom VARCHAR(40) NOT NULL);
    INSERT INTO marque (nom) VALUES ('MSI'), ('ASUS'), ('Gigabyte'), ('ASROCK');

# Création de ma table avec mes types de produits et insertion des données
CREATE TABLE typesproduit (id SMALLINT AUTO_INCREMENT PRIMARY KEY, type VARCHAR(40) NOT NULL);
    INSERT INTO typesproduit (type) VALUES ('carte mère'), ('carte graphique');

# Création de ma table avec mes produits avec clé primaires et clés étrangères avec contraintes puis insertion des données
CREATE TABLE produits (id SMALLINT AUTO_INCREMENT PRIMARY KEY, types SMALLINT, marques SMALLINT, article VARCHAR(40) NOT NULL, prix REAL NOT NULL, 
CONSTRAINT fk_marque_produit FOREIGN KEY (marques) REFERENCES marque(id),
CONSTRAINT fk_type_produit FOREIGN KEY (types) REFERENCES typesproduit(id));
    INSERT INTO produits (types, article, marques, prix) VALUES (1, 'Z170-A PRO', 1, 115.90); 
    INSERT INTO produits (types, article, marques, prix) VALUES (1, 'Z170A GAMING PRO CARBON', 1, 149.90); 
    INSERT INTO produits (types, article, marques, prix) VALUES (1, 'Z170A GAMING M3', 1, 164.90);
    INSERT INTO produits (types, article, marques, prix) VALUES (1, 'Z170A GAMING M5', 1, 194.90); 
    INSERT INTO produits (types, article, marques, prix) VALUES (1, 'Z170A SLI PLUS', 1, 139.90);
    INSERT INTO produits (types, article, marques, prix) VALUES (1, 'Z170A GAMING M7', 1, 229.90);
    INSERT INTO produits (types, article, marques, prix) VALUES (2, 'GTX 1060 OC 6Go', 2, 349.90);
    INSERT INTO produits (types, article, marques, prix) VALUES (2, 'GTX 1080 Oc 8Go', 2, 799.90);

# Afin d'afficher toutes les données dans la table produits faire un JOIN;

SELECT typesproduit.type AS Type, marque.nom AS Marque, article, prix FROM produits JOIN typesproduit ON produits.types=typesproduit.id JOIN marque ON marque.id = produits.marques;

# Création de ma table avec la liste de mes clients, et insertion de leurs données
CREATE TABLE listeclients (id BIGINT AUTO_INCREMENT PRIMARY KEY, civilite CHAR(1) NOT NULL, nom VARCHAR(30) NOT NULL, prenom VARCHAR(30) NOT NULL, date_de_naissance DATE NOT NULL, adresse VARCHAR(64) NOT NULL, code_postal VARCHAR(20) NOT NULL, ville VARCHAR(30) NOT NULL, pays VARCHAR(30) NOT NULL, telephone VARCHAR(20) NOT NULL, adresse_mail VARCHAR(40) NOT NULL, mot_de_passe VARCHAR(32) NOT NULL);
    INSERT INTO listeclients (civilite, nom, prenom, date_de_naissance, adresse, code_postal, ville, pays, telephone, adresse_mail, mot_de_passe) VALUES ('F', 'Vachet', 'Ginette', '1901-01-01', '15 rue boule de gomme', '26140', 'Saint-Rambert-d Albon', 'FRANCE', '06 25 34 59 87', 'nenette26@gmail.com', '********'); 
    INSERT INTO listeclients (civilite, nom, prenom, date_de_naissance, adresse, code_postal, ville, pays, telephone, adresse_mail, mot_de_passe) VALUES ('H', 'Valgean', 'Jean', '1945-10-18', '12 Rue de la defenestration', '75000', 'Paris', 'FRANCE', '06 32 85 69 28', 'jean.valgean@gmail.com', '**********'); 
    INSERT INTO listeclients (civilite, nom, prenom, date_de_naissance, adresse, code_postal, ville, pays, telephone, adresse_mail, mot_de_passe) VALUES ('F', 'Acle', 'Laure', '1400-09-15', '1 Rue qui vois tout', '34920', 'Le Crès', 'FRANCE', '08 80 00 80 00', 'LaureAcle@gmail.com', '*******'); 
    INSERT INTO listeclients (civilite, nom, prenom, date_de_naissance, adresse, code_postal, ville, pays, telephone, adresse_mail, mot_de_passe) VALUES ('H', 'Noel', 'Papa', '1000-12-25', 'Rue Glacière', '99999', 'Pole-Nord', 'Antarctique', '08 36 65 65 65', 'papa.noel@gmail.com', '***********'); 


# Création de ma table avec mes entreprises de livraisons et leurs tarifs puis insertion des données
CREATE TABLE livreur (id SMALLINT AUTO_INCREMENT PRIMARY KEY, nom_entreprise_livraison VARCHAR(30) NOT NULL, prix_livraison REAL NOT NULL);
    INSERT INTO livreur (nom_entreprise_livraison, prix_livraison) VALUES ('colissimo', 5.99), ('ups', 7.99), ('relais Colis', 4.99);

# Création de ma table avec mes avec mes informations relatives à ma commance ainsi que l'insertion des données
CREATE TABLE commande (id SMALLINT AUTO_INCREMENT PRIMARY KEY, date_commande DATE, idclient BIGINT NOT NULL,
CONSTRAINT fk_idclient FOREIGN KEY (idclient) REFERENCES listeclients(id));

# Join de mes idclients dans ma commande
SELECT commande.id, commande.Date_de_commande, listeclients.nom, listeclients.prenom, listeclients.adresse_mail FROM Commande INNER JOIN listeclients ON listeclients.id = commande.idclient;

    INSERT INTO commande (date_commande, idclient) VALUES ('2017-03-06', 3);
    INSERT INTO commande (date_commande, idclient) VALUES ('2017-03-06', 3);
    INSERT INTO commande (date_commande, idclient) VALUES ('2017-02-28', 2);
    INSERT INTO commande (date_commande, idclient) VALUES ('2017-01-15', 5);
    INSERT INTO commande (date_commande, idclient) VALUES ('2017-01-13', 6);
    

# Création de ma table avec les détails de ma commande avec insertion de données
CREATE TABLE commandedetaillee (reference_produit SMALLINT NOT NULL, reference_commande SMALLINT NOT NULL, prix REAL NOT NULL, 
CONSTRAINT fk_fiche_produit FOREIGN KEY (reference_produit) REFERENCES produits(id), 
CONSTRAINT fk_commande_detaillee FOREIGN KEY (reference_commande) REFERENCES commande(id)); 

# Join de mes commandes et mes produits dans ma table commande détaillée    
SELECT commande.id AS Commandes, produits.article AS Articles FROM commandedetaillee JOIN commande ON commandedetaillee.id=commande.id JOIN produits ON produits.id = commandedetaillee.article;