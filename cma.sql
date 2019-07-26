-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 26 juil. 2019 à 20:47
-- Version du serveur :  10.1.31-MariaDB
-- Version de PHP :  7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cma`
--

-- --------------------------------------------------------

--
-- Structure de la table `concour`
--

CREATE TABLE `concour` (
  `id_crc` int(11) NOT NULL,
  `description` text NOT NULL,
  `date_crc` varchar(50) NOT NULL,
  `date_limite` varchar(50) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_filiere` int(11) NOT NULL,
  `id_epreuve` int(11) NOT NULL,
  `id_ecole` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `corrige`
--

CREATE TABLE `corrige` (
  `id_corrige` int(11) NOT NULL,
  `path_corrige` text NOT NULL,
  `id_epreuve` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

CREATE TABLE `ecole` (
  `id_ecole` int(11) NOT NULL,
  `nom_ecole` varchar(50) NOT NULL,
  `intitule_ecole` varchar(10) NOT NULL,
  `localisation_ecole` text NOT NULL,
  `addresse_ecole` varchar(100) NOT NULL,
  `description_ecole` text NOT NULL,
  `id_ville` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

CREATE TABLE `epreuve` (
  `id_epreuve` int(11) NOT NULL,
  `path_epreuve` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `id_filiere` int(11) NOT NULL,
  `nom_filiere` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `id_ville` int(11) NOT NULL,
  `nom_ville` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `concour`
--
ALTER TABLE `concour`
  ADD PRIMARY KEY (`id_crc`),
  ADD KEY `id_ecole` (`id_ecole`),
  ADD KEY `fk_filiere_concour` (`id_filiere`),
  ADD KEY `fk_epreuve_concour` (`id_epreuve`);

--
-- Index pour la table `corrige`
--
ALTER TABLE `corrige`
  ADD PRIMARY KEY (`id_corrige`),
  ADD KEY `fk_epreuve_corrige` (`id_epreuve`);

--
-- Index pour la table `ecole`
--
ALTER TABLE `ecole`
  ADD PRIMARY KEY (`id_ecole`),
  ADD KEY `fk_ville_ecole` (`id_ville`);

--
-- Index pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD PRIMARY KEY (`id_epreuve`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`id_filiere`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id_ville`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `concour`
--
ALTER TABLE `concour`
  MODIFY `id_crc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `corrige`
--
ALTER TABLE `corrige`
  MODIFY `id_corrige` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ecole`
--
ALTER TABLE `ecole`
  MODIFY `id_ecole` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `epreuve`
--
ALTER TABLE `epreuve`
  MODIFY `id_epreuve` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `id_filiere` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id_ville` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `concour`
--
ALTER TABLE `concour`
  ADD CONSTRAINT `fk_ecole_concour` FOREIGN KEY (`id_ecole`) REFERENCES `ecole` (`id_ecole`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_epreuve_concour` FOREIGN KEY (`id_epreuve`) REFERENCES `epreuve` (`id_epreuve`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_filiere_concour` FOREIGN KEY (`id_filiere`) REFERENCES `filiere` (`id_filiere`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `corrige`
--
ALTER TABLE `corrige`
  ADD CONSTRAINT `fk_epreuve_corrige` FOREIGN KEY (`id_epreuve`) REFERENCES `epreuve` (`id_epreuve`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ecole`
--
ALTER TABLE `ecole`
  ADD CONSTRAINT `fk_ville_ecole` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
