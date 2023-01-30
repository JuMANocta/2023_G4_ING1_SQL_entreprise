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
