-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 11 mars 2021 à 12:14
-- Version du serveur :  8.0.23-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `a_table`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `numQR` int NOT NULL,
  `smartphone` varchar(10) NOT NULL,
  `langue` varchar(10) NOT NULL,
  `dates` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`numQR`, `smartphone`, `langue`, `dates`) VALUES
(1, 'samsung', 'anglais', '2021-02-07'),
(2, 'huawei', 'coréen', '2021-02-08'),
(4, 'xiaomi', 'anglais', '2021-02-03'),
(3, 'wiko', 'français', '2021-02-07'),
(5, 'apple', 'espagnol', '2021-02-06'),
(3, 'xiaomi', 'français', '2021-02-03');

-- --------------------------------------------------------

--
-- Structure de la table `orga_tables`
--

CREATE TABLE `orga_tables` (
  `numTABLES` int NOT NULL,
  `emplacement` varchar(15) NOT NULL,
  `situation` varchar(15) NOT NULL,
  `chaises` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `orga_tables`
--

INSERT INTO `orga_tables` (`numTABLES`, `emplacement`, `situation`, `chaises`) VALUES
(1, 'extérieur', 'soleil', 4),
(2, 'intérieur', 'soleil', 6),
(3, 'extérieur', 'ombre', 2),
(4, 'intérieur', 'ombre', 2),
(5, 'extérieur', 'soleil', 8);

-- --------------------------------------------------------

--
-- Structure de la table `qr_codes`
--

CREATE TABLE `qr_codes` (
  `numQR` int NOT NULL,
  `nom` varchar(10) NOT NULL,
  `numTABLES` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `qr_codes`
--

INSERT INTO `qr_codes` (`numQR`, `nom`, `numTABLES`) VALUES
(1, 'red', 1),
(2, 'blue', 2),
(3, 'pink', 3),
(4, 'green', 4),
(5, 'yellow', 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD KEY `numQR` (`numQR`);

--
-- Index pour la table `orga_tables`
--
ALTER TABLE `orga_tables`
  ADD PRIMARY KEY (`numTABLES`);

--
-- Index pour la table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`numQR`),
  ADD KEY `numTABLES` (`numTABLES`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`numQR`) REFERENCES `qr_codes` (`numQR`);

--
-- Contraintes pour la table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD CONSTRAINT `qr_codes_ibfk_1` FOREIGN KEY (`numTABLES`) REFERENCES `orga_tables` (`numTABLES`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
