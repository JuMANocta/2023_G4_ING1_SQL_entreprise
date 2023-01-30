DROP DATABASE IF EXISTS entreprise;
CREATE DATABASE IF NOT EXISTS entreprise;
USE entreprise;

CREATE TABLE IF NOT EXISTS client (
    id_client INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    code_postal VARCHAR(5) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    telephone VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS energie(
    id_energie INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS vehicule(
    id_vehicule INT PRIMARY KEY AUTO_INCREMENT,
    marque VARCHAR(50) NOT NULL,
    modele VARCHAR(50) NOT NULL,
    annee DATE NOT NULL,
    immatriculation VARCHAR(50) NOT NULL,
    kilometrage INT NOT NULL,
    disponibilite BOOLEAN DEFAULT TRUE,
    id_energie INT NOT NULL,
    FOREIGN KEY (id_energie) REFERENCES energie(id_energie)
);

CREATE TABLE IF NOT EXISTS livreur (
    id_livreur INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    code_postal VARCHAR(5) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    telephone VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    id_vehicule INT NULL,
    diponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_vehicule) REFERENCES vehicule(id_vehicule)
);

CREATE TABLE IF NOT EXISTS commercial(
    id_commercial INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    adresse VARCHAR(100) NOT NULL,
    code_postal VARCHAR(5) NOT NULL,
    ville VARCHAR(50) NOT NULL,
    telephone VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    id_vehicule INT NULL,
    FOREIGN KEY (id_vehicule) REFERENCES vehicule(id_vehicule)
);

CREATE TABLE IF NOT EXISTS stock(
    id_stock INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    reference VARCHAR(50) NOT NULL,
    nombre INT NOT NULL
);

CREATE TABLE IF NOT EXISTS commande(
    id_commande INT PRIMARY KEY AUTO_INCREMENT,
    date_commande DATE NOT NULL,
    date_livraison DATE NOT NULL,
    delivre BOOLEAN NOT NULL DEFAULT FALSE,
    quantite INT NOT NULL,
    id_client INT NOT NULL,
    id_livreur INT NOT NULL,
    id_commercial INT NOT NULL,
    id_vehicule INT NOT NULL,
    id_stock INT NOT NULL,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_livreur) REFERENCES livreur(id_livreur),
    FOREIGN KEY (id_commercial) REFERENCES commercial(id_commercial),
    FOREIGN KEY (id_vehicule) REFERENCES vehicule(id_vehicule),
    FOREIGN KEY (id_stock) REFERENCES stock(id_stock)
);

INSERT INTO client 
(nom, prenom, adresse, code_postal, ville, telephone, email) 
VALUES
('DUPONT', 'Jean', '1 rue de la paix', '75000', 'Paris', '0123456789', 'dup@jean.fr'),
('DURAND', 'Pierre', '2 rue de la paix', '75000', 'Paris', '0123456789', 'dur@pierre.fr'),
('MAXENE', 'Michel', '3 rue de la paix', '75000', 'Paris', '0123456789', 'max@michel.fr');

INSERT INTO energie
(nom)
VALUES
("Gazole"),
("Essence"),
("Bioéthanol"),
("Electrique"),
("GPL"),
("Hybride");

INSERT INTO vehicule
(marque, modele, annee, immatriculation, kilometrage, id_energie)
VALUES
("FORD", "Transit", "2020-01-01", "TF-567-YT", 40000 , 1),
("RENAULT", "Master", "2018-02-11", "RM-167-PG", 80000, 2),
("VOLKSWAGEN", "Crafter", "2023-03-21", "VC-547-MM", 20000, 3),
("MERCEDES", "Sprinter", "2022-04-06", "MS-967-ZA", 60000, 4),
("PEUGEOT", "Boxer", "2021-05-15", "PB-562-YR", 90000, 5),
("CITROEN", "Jumper", "2023-06-09", "CJ-777-RT", 20000, 6);

INSERT INTO livreur 
(nom, prenom, adresse, code_postal, ville, telephone, email, id_vehicule)
VALUES
("FRIDE", "Paul", "1 rue de la fleur", "75000", "Paris", "0123456789", "fride@paul.fr", 1),
("SOLI", "Rudi", "2 rue de la fleur", "75000", "Paris", "0123456789", "soli@rudi.fr", 2),
("ECORCE", "Sauvage", "3 rue de la fleur", "75000", "Paris", "0123456789", "ecorce@sauvage.fr", 3);

INSERT INTO commercial
(nom, prenom, adresse, code_postal, ville, telephone, email, id_vehicule)
VALUES
("RICO", "Henri", "1 rue de la mer", "75000", "Paris", "0123456789", "rico@henri.fr", 4),
("GAZ", "Boby", "2 rue de la mer", "75000", "Paris", "0123456789", "gaz@bobi.fr", 5),
("MAG", "Mickael", "3 rue de la mer", "75000", "Paris", "0123456789", "mag@mickael.fr", 6);

INSERT INTO stock
(nom, reference, nombre)
VALUES
("Pompe à chaleur", "PAC-001", 10),
("Chauffe-eau", "CE-002", 20),
("Radiateur", "R-003", 30),
("Climatiseur", "C-004", 40),
("Chauffage", "CH-005", 50),
("Ventilateur", "V-006", 60);

INSERT INTO commande
(date_commande, date_livraison, quantite, id_client, id_livreur, id_commercial, id_vehicule, id_stock)
VALUES
("2023-01-01", "2023-01-02", 1, 1, 1, 1, 1, 1),
("2023-01-01", "2023-01-02", 2, 2, 2, 2, 2, 2),
("2023-01-01", "2023-01-02", 3, 3, 3, 3, 3, 3),
("2023-01-01", "2023-01-02", 1, 1, 1, 1, 1, 4),
("2023-01-01", "2023-01-02", 2, 2, 2, 2, 2, 5),
("2023-01-01", "2023-01-02", 3, 3, 3, 3, 3, 6);
