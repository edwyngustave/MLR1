-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 19, 2019 at 02:41 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bddallume`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `code_art` varchar(255) NOT NULL,
  `nom_art` varchar(255) NOT NULL,
  `img_art` text,
  `prix_art` varchar(20) NOT NULL,
  `qte` varchar(3) DEFAULT NULL,
  `id_depot` int(6) DEFAULT NULL,
  PRIMARY KEY (`code_art`),
  KEY `FK_Article_id_depot` (`id_depot`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`code_art`, `nom_art`, `img_art`, `prix_art`, `qte`, `id_depot`) VALUES
('fen_1', 'Fenetre en bois', 'image/img/fen_1.jpg', '700.00', '5', 1),
('P2', 'OUL', NULL, '56.0', '34', NULL),
('pisc_1', 'Piscine rectangulaire arrondie', 'image/img/pisc_1.jpg', '4500.00', '5', 1),
('pisc_10', 'Piscine forme libre', 'image/img/pisc_10.jpg', '3500.00', '5', 1),
('pisc_11', 'Piscine en cacahuete', 'image/img/pisc_11.jpg', '2500.00', '5', 1),
('pisc_12', 'Piscine en retroviseur', 'image/img/pisc_12.jpg', '5500.00', '5', 1),
('pisc_13', 'Piscine en charette', 'image/img/pisc_13.jpg', '4500.00', '5', 1),
('pisc_14', 'Piscine ovale', 'image/img/pisc_14.jpg', '2500.00', '5', 1),
('pisc_15', 'Piscine ronde', 'image/img/pisc_15.jpg', '2000.00', '5', 1),
('pisc_16', 'Piscine guitare', 'image/img/pisc_16.jpg', '7000.00', '5', 1),
('pisc_17', 'Piscine simple', 'image/img/pisc_17.jpg', '5500.00', '5', 1),
('pisc_18', 'Piscine en coeur', 'image/img/pisc_18.jpg', '2500.00', '5', 1),
('pisc_19', 'Piscine topaze', 'image/img/pisc_19.jpg', '4444.00', '5', 1),
('pisc_2', 'Piscine rectangulaire', 'image/img/pisc_2.jpg', '4000.00', '5', 1),
('pisc_20', 'Piscine longue', 'image/img/pisc_20.jpg', '6000.00', '5', 1),
('pisc_3', 'Piscine rectangulaire profonde', 'image/img/pisc_3.jpg', '3500.00', '5', 1),
('pisc_4', 'Piscine rectangulaire tres profonde', 'image/img/pisc_4.jpg', '5000.00', '5', 1),
('pisc_5', 'Piscine interieur', 'image/img/pisc_5.jpg', '3000.00', '5', 1),
('pisc_6', 'Piscine lowcost', 'image/img/pisc_6.jpg', '400.00', '5', 1),
('pisc_7', 'Piscine rectangulaire longue', 'image/img/pisc_7.jpg', '4500.00', '5', 1),
('pisc_8', 'Piscine rectangulaire courte', 'image/img/pisc_8.jpg', '2500.00', '5', 1),
('pisc_9', 'Piscine petite forme libre', 'image/img/pisc_9.jpg', '2500.00', '5', 1),
('port_1', 'Porte marron', 'image/img/port_1.jpg', '200.00', '5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bon_livraison`
--

DROP TABLE IF EXISTS `bon_livraison`;
CREATE TABLE IF NOT EXISTS `bon_livraison` (
  `id_bonliv` int(6) NOT NULL AUTO_INCREMENT,
  `date_bonliv` date NOT NULL,
  `id_devis` int(6) NOT NULL,
  `id_cli` int(6) NOT NULL,
  `id_cam` int(6) NOT NULL,
  PRIMARY KEY (`id_bonliv`),
  KEY `FK_Bon_livraison_id_devis` (`id_devis`),
  KEY `FK_Bon_livraison_id_cli` (`id_cli`),
  KEY `FK_Bon_livraison_id_cam` (`id_cam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `camion`
--

DROP TABLE IF EXISTS `camion`;
CREATE TABLE IF NOT EXISTS `camion` (
  `id_cam` int(6) NOT NULL AUTO_INCREMENT,
  `annee_cam` year(4) NOT NULL,
  `id_chauf` int(6) NOT NULL,
  PRIMARY KEY (`id_cam`),
  KEY `FK_Camion_id_chauf` (`id_chauf`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `camion`
--

INSERT INTO `camion` (`id_cam`, `annee_cam`, `id_chauf`) VALUES
(1, 1998, 1),
(2, 1999, 2),
(3, 2005, 3),
(4, 2010, 4),
(5, 2009, 20),
(6, 2015, 5),
(7, 1998, 6),
(8, 1999, 7),
(9, 2017, 8),
(10, 2006, 9),
(11, 2014, 10),
(12, 2014, 11),
(13, 2013, 12),
(14, 2018, 13),
(15, 2006, 14),
(16, 2015, 15),
(17, 1999, 16),
(18, 2006, 17),
(19, 2006, 18),
(20, 2012, 19);

-- --------------------------------------------------------

--
-- Table structure for table `chauffeur`
--

DROP TABLE IF EXISTS `chauffeur`;
CREATE TABLE IF NOT EXISTS `chauffeur` (
  `id_chauf` int(2) NOT NULL AUTO_INCREMENT,
  `nom_chauf` varchar(25) DEFAULT NULL,
  `prenom_chauf` varchar(25) DEFAULT NULL,
  `tel_chauf` varchar(10) DEFAULT NULL,
  `libre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_chauf`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chauffeur`
--

INSERT INTO `chauffeur` (`id_chauf`, `nom_chauf`, `prenom_chauf`, `tel_chauf`, `libre`) VALUES
(1, 'Loic', 'BernardO', '0344556677', 'oui'),
(2, 'Henro', 'Baptiste', '0455447899', 'Non'),
(3, 'Clauss', 'Verma', '0544889933', 'Oui'),
(4, 'Hermel', 'Ortoga', '0544889933', 'non'),
(5, 'Heinss', 'Dimitri', '0587689933', 'Non'),
(6, 'Voss', 'Karina', '054486233', 'Oui'),
(7, 'Fouger', 'Guillaume', '0245129933', 'Non'),
(8, 'Han', 'Thuan', '0567932411', 'Oui'),
(9, 'Loran', 'Norman', '0588990455', 'Oui'),
(10, 'Poulet', 'Thibault', '0143522324', 'Non'),
(11, 'Anouk', 'Anna', '0322321219', 'Non'),
(12, 'Mojart', 'Nikolai', '0984354677', 'Non'),
(13, 'reus', 'Marco', '123976655', 'Non'),
(14, 'Luigiano', 'Mario', '0237654310', 'Non'),
(15, 'Fett', 'Valentin', '0233440105', 'Oui'),
(16, 'Ken', 'Nicolas', '0121176753', 'Non'),
(17, 'Pouti', 'Adelin', '0588997111', 'Non'),
(18, 'Guodar', 'Amza', '0344321167', 'Oui'),
(19, 'Thie', 'Camille', '0321765544', 'Non'),
(20, 'Veers', 'Gordon', '0543221010', 'Non'),
(21, 'HU', 'KI', 'PO', 'OUI');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_cli` int(6) NOT NULL AUTO_INCREMENT,
  `mail_cli` varchar(75) NOT NULL,
  `mdp_cli` varchar(50) NOT NULL,
  `nom_cli` varchar(25) DEFAULT NULL,
  `prenom_cli` varchar(25) DEFAULT NULL,
  `datenaiss_cli` varchar(25) DEFAULT NULL,
  `tel_cli` varchar(15) DEFAULT NULL,
  `adress_cli` varchar(255) DEFAULT NULL,
  `cp_cli` varchar(25) DEFAULT NULL,
  `nbcom` int(11) DEFAULT '0',
  PRIMARY KEY (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id_cli`, `mail_cli`, `mdp_cli`, `nom_cli`, `prenom_cli`, `datenaiss_cli`, `tel_cli`, `adress_cli`, `cp_cli`, `nbcom`) VALUES
(42, 'cli', 'c', 'sssd', 'szs', NULL, '122', '>jgfjg', '1345', NULL),
(43, 'aa', 'aa', 'aa', 'aa', NULL, '23', 'aa', '33', NULL),
(44, 'dd', 'ff', 'gg', 'tt', NULL, '66', 'uu', '45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commandec`
--

DROP TABLE IF EXISTS `commandec`;
CREATE TABLE IF NOT EXISTS `commandec` (
  `id_commandc` int(6) NOT NULL AUTO_INCREMENT,
  `date_commandc` date NOT NULL,
  `id_cli` int(6) NOT NULL,
  PRIMARY KEY (`id_commandc`),
  KEY `FK_CommandC_id_cli` (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commandec`
--

INSERT INTO `commandec` (`id_commandc`, `date_commandc`, `id_cli`) VALUES
(4, '2018-05-02', 24),
(5, '2018-05-02', 24),
(6, '2018-05-02', 24),
(7, '2018-05-02', 24),
(8, '2018-05-02', 24),
(9, '2018-05-02', 24),
(10, '2018-05-02', 24),
(11, '2018-05-02', 24),
(12, '2018-05-02', 24),
(13, '2018-05-02', 26),
(14, '2018-05-03', 24),
(15, '2018-05-03', 24),
(16, '2018-05-03', 24),
(17, '2018-05-03', 24),
(18, '2018-05-03', 24),
(19, '2018-05-03', 24),
(20, '2018-05-03', 24),
(21, '2018-05-03', 24),
(22, '2018-05-03', 24),
(23, '2018-05-03', 24),
(24, '2018-05-03', 24),
(25, '2018-05-03', 24),
(26, '2018-05-03', 24),
(27, '2018-05-03', 24),
(28, '2018-05-03', 24),
(29, '2018-05-03', 24),
(30, '2018-05-03', 24),
(31, '2018-05-03', 24),
(32, '2018-05-03', 24),
(33, '2018-05-03', 29),
(34, '2018-05-07', 30),
(35, '2018-05-09', 31),
(36, '2018-05-26', 27);

--
-- Triggers `commandec`
--
DROP TRIGGER IF EXISTS `Statcom`;
DELIMITER $$
CREATE TRIGGER `Statcom` AFTER INSERT ON `commandec` FOR EACH ROW BEGIN
Declare nb int;
select nbcom into nb
from client where id_cli=new.id_cli;
if nb is null 

then set nb=0;
end if;
UPDATE CLIENT 
set nbcom=nb+1 where id_cli=new.id_cli;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `Statcom2`;
DELIMITER $$
CREATE TRIGGER `Statcom2` AFTER DELETE ON `commandec` FOR EACH ROW BEGIN
Declare nb int;
select nbcom into nb
from client where id_cli=old.id_cli;
UPDATE CLIENT 
set nbcom=nb-1 where id_cli=old.id_cli;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `deleteCommande`;
DELIMITER $$
CREATE TRIGGER `deleteCommande` BEFORE DELETE ON `commandec` FOR EACH ROW BEGIN
delete from lignecommandc where lignecommande.id_commandc = old.id_commandc;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `commandef`
--

DROP TABLE IF EXISTS `commandef`;
CREATE TABLE IF NOT EXISTS `commandef` (
  `id_commandf` int(6) NOT NULL AUTO_INCREMENT,
  `date_commandf` date NOT NULL,
  `id_fourni` int(6) NOT NULL,
  PRIMARY KEY (`id_commandf`),
  KEY `FK_CommandF_id_fourni` (`id_fourni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `commercial`
--

DROP TABLE IF EXISTS `commercial`;
CREATE TABLE IF NOT EXISTS `commercial` (
  `id_com` int(6) NOT NULL AUTO_INCREMENT,
  `nom_com` varchar(25) NOT NULL,
  `prenom_com` varchar(25) NOT NULL,
  `mail_com` varchar(50) NOT NULL,
  `tel_com` int(10) NOT NULL,
  `id_cli` int(6) NOT NULL,
  PRIMARY KEY (`id_com`),
  KEY `FK_Commercial_id_cli` (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commercial`
--

INSERT INTO `commercial` (`id_com`, `nom_com`, `prenom_com`, `mail_com`, `tel_com`, `id_cli`) VALUES
(1, 'Skrilanka', 'Jerome', 'skrilanka@alume.com', 789541213, 1),
(2, 'Bachung', 'Ernesto', 'bachung@alume.com', 789652214, 24),
(3, 'Losange', 'Manuelle', 'losange@alume.com', 689241213, 25),
(4, 'Trumpin', 'Pascal', 'trumpin@alume.com', 689131418, 26),
(5, 'Veneci', 'Isabelle', 'veneci@alume.com', 649121855, 27),
(6, 'Mysthere', 'Felicia', 'Mysthere@alume.com', 789541213, 28);

-- --------------------------------------------------------

--
-- Table structure for table `depot`
--

DROP TABLE IF EXISTS `depot`;
CREATE TABLE IF NOT EXISTS `depot` (
  `id_depot` int(2) NOT NULL AUTO_INCREMENT,
  `nom_depot` varchar(25) NOT NULL,
  `adress_depot` varchar(255) NOT NULL,
  `cp_depot` int(5) NOT NULL,
  `tel_depot` int(10) NOT NULL,
  `mail_depot` varchar(50) DEFAULT NULL,
  `id_cam` int(6) DEFAULT NULL,
  PRIMARY KEY (`id_depot`),
  KEY `FK_Depot_id_cam` (`id_cam`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `depot`
--

INSERT INTO `depot` (`id_depot`, `nom_depot`, `adress_depot`, `cp_depot`, `tel_depot`, `mail_depot`, `id_cam`) VALUES
(1, 'D?pot Zone A', '5 rue de la Zone A', 75000, 123475000, 'depot_zone_a@yopmail.com', NULL),
(2, 'D?pot Zone B', '10 rue de la Zone B', 23000, 123423000, 'depot_zone_b@yopmail.com', NULL),
(3, 'D?pot Zone C', '15 rue de la Zone C', 13000, 123413000, 'depot_zone_c@yopmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `devis`
--

DROP TABLE IF EXISTS `devis`;
CREATE TABLE IF NOT EXISTS `devis` (
  `id_devis` int(6) NOT NULL AUTO_INCREMENT,
  `id_commandc` int(6) NOT NULL,
  `id_bonliv` int(6) NOT NULL,
  PRIMARY KEY (`id_devis`),
  KEY `FK_Devis_id_commandc` (`id_commandc`),
  KEY `FK_Devis_id_bonliv` (`id_bonliv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_fourni` int(6) NOT NULL AUTO_INCREMENT,
  `nom_fourni` varchar(25) NOT NULL,
  `adress_fourni` varchar(255) NOT NULL,
  `cp_fourni` int(5) NOT NULL,
  `tel_fourni` int(10) NOT NULL,
  `mail_fourni` varchar(50) NOT NULL,
  PRIMARY KEY (`id_fourni`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`id_fourni`, `nom_fourni`, `adress_fourni`, `cp_fourni`, `tel_fourni`, `mail_fourni`) VALUES
(1, 'Boisage', 'rue du chenes', 78000, 895668744, 'contact@boisage.fr'),
(2, 'Piscinemania', 'place de walter', 13000, 456603211, 'contact@piscmania.fr'),
(3, 'verriere', '6 place du sable', 45000, 895699980, 'commercial@verre'),
(4, 'fenwick', 'rue des roues', 78890, 966668744, 'contact@fen.com'),
(5, 'Toiturex5', 'rue laplace', 75001, 123335691, 'toiture.comml@gmail.fr'),
(6, 'Watership', 'rue du clan', 41000, 978561980, 'contact@water.fr'),
(7, 'Serruro', 'rue du piques', 75000, 877521912, 'benjamin@serruro.com');

-- --------------------------------------------------------

--
-- Table structure for table `ligne_commande_client`
--

DROP TABLE IF EXISTS `ligne_commande_client`;
CREATE TABLE IF NOT EXISTS `ligne_commande_client` (
  `id_lignec` int(6) NOT NULL AUTO_INCREMENT,
  `code_art` varchar(255) NOT NULL,
  `nom_artc` varchar(40) NOT NULL,
  `qte_lignec` int(4) NOT NULL,
  `id_commandc` int(6) NOT NULL,
  `prix_lignec` float NOT NULL,
  PRIMARY KEY (`id_lignec`,`id_commandc`,`code_art`),
  KEY `FK_Ligne_commande_client_code_art` (`code_art`),
  KEY `FK_Ligne_commande_client_id_commandc` (`id_commandc`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ligne_commande_client`
--

INSERT INTO `ligne_commande_client` (`id_lignec`, `code_art`, `nom_artc`, `qte_lignec`, `id_commandc`, `prix_lignec`) VALUES
(5, 'fen_11', 'Fenetre triple rotor', 1, 4, 350),
(6, 'fen_10', 'Fenetre bois ouvert', 5, 4, 300),
(7, 'port_11', 'Porte de garage grise', 1, 4, 350),
(8, 'fen_11', 'Fenetre triple rotor', 1, 4, 350),
(9, 'fen_10', 'Fenetre bois ouvert', 5, 4, 300),
(10, 'port_11', 'Porte de garage grise', 1, 4, 350),
(11, 'fen_11', 'Fenetre triple rotor', 1, 4, 350),
(12, 'fen_10', 'Fenetre bois ouvert', 5, 4, 300),
(13, 'port_11', 'Porte de garage grise', 1, 4, 350),
(14, 'fen_5', 'Fenetre PVC noir', 1, 4, 220),
(15, 'fen_10', 'Fenetre bois ouvert', 1, 4, 300),
(16, 'fen_10', 'Fenetre bois ouvert', 1, 4, 300),
(17, 'fen_10', 'Fenetre bois ouvert', 1, 4, 300),
(18, 'fen_10', 'Fenetre bois ouvert', 1, 4, 300),
(19, 'fen_11', 'Fenetre triple rotor', 1, 4, 350),
(20, 'fen_11', 'Fenetre triple rotor', 1, 4, 350),
(21, 'fen_1', 'Fenetre bois', 1, 13, 200),
(22, 'pisc_10', 'Piscine forme libre', 1, 13, 3500),
(23, 'fen_10', 'Fenetre bois ouvert', 1, 13, 300),
(24, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(25, 'fen_1', 'Fenetre bois', 1, 14, 200),
(26, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(27, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(28, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(29, 'fen_13', 'Fenetre porte', 1, 14, 400),
(30, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(31, 'fen_16', 'Fenetre petite', 1, 14, 410),
(32, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(33, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(34, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(35, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(36, 'fen_1', 'Fenetre bois', 1, 14, 200),
(37, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(38, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(39, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(40, 'fen_13', 'Fenetre porte', 1, 14, 400),
(41, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(42, 'fen_16', 'Fenetre petite', 1, 14, 410),
(43, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(44, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(45, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(46, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(47, 'fen_1', 'Fenetre bois', 1, 14, 200),
(48, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(49, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(50, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(51, 'fen_13', 'Fenetre porte', 1, 14, 400),
(52, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(53, 'fen_16', 'Fenetre petite', 1, 14, 410),
(54, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(55, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(56, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(57, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(58, 'fen_1', 'Fenetre bois', 1, 14, 200),
(59, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(60, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(61, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(62, 'fen_13', 'Fenetre porte', 1, 14, 400),
(63, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(64, 'fen_16', 'Fenetre petite', 1, 14, 410),
(65, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(66, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(67, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(68, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(69, 'fen_1', 'Fenetre bois', 1, 14, 200),
(70, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(71, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(72, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(73, 'fen_13', 'Fenetre porte', 1, 14, 400),
(74, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(75, 'fen_16', 'Fenetre petite', 1, 14, 410),
(76, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(77, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(78, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(79, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(80, 'fen_1', 'Fenetre bois', 1, 14, 200),
(81, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(82, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(83, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(84, 'fen_13', 'Fenetre porte', 1, 14, 400),
(85, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(86, 'fen_16', 'Fenetre petite', 1, 14, 410),
(87, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(88, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(89, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(90, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(91, 'fen_1', 'Fenetre bois', 1, 14, 200),
(92, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(93, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(94, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(95, 'fen_13', 'Fenetre porte', 1, 14, 400),
(96, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(97, 'fen_16', 'Fenetre petite', 1, 14, 410),
(98, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(99, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(100, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(101, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(102, 'fen_1', 'Fenetre bois', 1, 14, 200),
(103, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(104, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(105, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(106, 'fen_13', 'Fenetre porte', 1, 14, 400),
(107, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(108, 'fen_16', 'Fenetre petite', 1, 14, 410),
(109, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(110, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(111, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(112, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(113, 'fen_1', 'Fenetre bois', 1, 14, 200),
(114, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(115, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(116, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(117, 'fen_13', 'Fenetre porte', 1, 14, 400),
(118, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(119, 'fen_16', 'Fenetre petite', 1, 14, 410),
(120, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(121, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(122, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(123, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(124, 'fen_1', 'Fenetre bois', 1, 14, 200),
(125, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(126, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(127, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(128, 'fen_13', 'Fenetre porte', 1, 14, 400),
(129, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(130, 'fen_16', 'Fenetre petite', 1, 14, 410),
(131, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(132, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(133, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(134, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(135, 'fen_1', 'Fenetre bois', 1, 14, 200),
(136, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(137, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(138, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(139, 'fen_13', 'Fenetre porte', 1, 14, 400),
(140, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(141, 'fen_16', 'Fenetre petite', 1, 14, 410),
(142, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(143, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(144, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(145, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(146, 'fen_1', 'Fenetre bois', 1, 14, 200),
(147, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(148, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(149, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(150, 'fen_13', 'Fenetre porte', 1, 14, 400),
(151, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(152, 'fen_16', 'Fenetre petite', 1, 14, 410),
(153, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(154, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(155, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(156, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(157, 'fen_1', 'Fenetre bois', 1, 14, 200),
(158, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(159, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(160, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(161, 'fen_13', 'Fenetre porte', 1, 14, 400),
(162, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(163, 'fen_16', 'Fenetre petite', 1, 14, 410),
(164, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(165, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(166, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(167, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(168, 'fen_1', 'Fenetre bois', 1, 14, 200),
(169, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(170, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(171, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(172, 'fen_13', 'Fenetre porte', 1, 14, 400),
(173, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(174, 'fen_16', 'Fenetre petite', 1, 14, 410),
(175, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(176, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(177, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(178, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(179, 'fen_1', 'Fenetre bois', 1, 14, 200),
(180, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(181, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(182, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(183, 'fen_13', 'Fenetre porte', 1, 14, 400),
(184, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(185, 'fen_16', 'Fenetre petite', 1, 14, 410),
(186, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(187, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(188, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(189, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(190, 'fen_1', 'Fenetre bois', 1, 14, 200),
(191, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(192, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(193, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(194, 'fen_13', 'Fenetre porte', 1, 14, 400),
(195, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(196, 'fen_16', 'Fenetre petite', 1, 14, 410),
(197, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(198, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(199, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(200, 'fen_10', 'Fenetre bois ouvert', 2, 14, 300),
(201, 'fen_1', 'Fenetre bois', 1, 14, 200),
(202, 'fen_11', 'Fenetre triple rotor', 1, 14, 350),
(203, 'fen_12', 'Fenetre a rabat', 1, 14, 340),
(204, 'fen_14', 'Fenetre arrondie', 1, 14, 450),
(205, 'fen_13', 'Fenetre porte', 1, 14, 400),
(206, 'fen_18', 'Fenetre rectangulaire', 2, 14, 230),
(207, 'fen_16', 'Fenetre petite', 1, 14, 410),
(208, 'fen_19', 'Fenetre triple rotator', 1, 14, 210),
(209, 'pisc_10', 'Piscine forme libre', 1, 14, 3500),
(210, 'pisc_12', 'Piscine en retroviseur', 1, 14, 5500),
(211, 'fen_1', 'Fenetre bois', 1, 14, 200),
(212, 'fen_10', 'Fenetre bois ouvert', 1, 14, 300),
(213, 'fen_10', 'Fenetre bois ouvert', 1, 33, 300),
(214, 'fen_10', 'Fenetre bois ouvert', 1, 34, 300),
(215, 'pisc_11', 'Piscine en cacahuete', 1, 35, 2500),
(216, 'fen_1', 'Fenetre bois', 1, 35, 200),
(217, 'fen_12', 'Fenetre a rabat', 1, 36, 340);

-- --------------------------------------------------------

--
-- Table structure for table `ligne_commande_fournisseur`
--

DROP TABLE IF EXISTS `ligne_commande_fournisseur`;
CREATE TABLE IF NOT EXISTS `ligne_commande_fournisseur` (
  `qte_lignef` int(4) NOT NULL,
  `id_commandf` int(6) NOT NULL,
  `code_art` varchar(255) NOT NULL,
  PRIMARY KEY (`id_commandf`,`code_art`),
  KEY `FK_Ligne_commande_fournisseur_code_art` (`code_art`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rdv_cli`
--

DROP TABLE IF EXISTS `rdv_cli`;
CREATE TABLE IF NOT EXISTS `rdv_cli` (
  `id_rdv` int(6) NOT NULL AUTO_INCREMENT,
  `nom_rdv` varchar(100) NOT NULL,
  `prenom_rdv` varchar(50) NOT NULL,
  `email_rdv` varchar(100) NOT NULL,
  `date_rdv` date DEFAULT NULL,
  `heure_rdv` time DEFAULT NULL,
  `motif_rdv` varchar(100) NOT NULL,
  PRIMARY KEY (`id_rdv`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rdv_cli`
--

INSERT INTO `rdv_cli` (`id_rdv`, `nom_rdv`, `prenom_rdv`, `email_rdv`, `date_rdv`, `heure_rdv`, `motif_rdv`) VALUES
(1, 'dams', 'dami', 'd@gmail.com', '2024-06-15', '10:15:00', 'intemperie'),
(2, 'ABDERRA', 'CHOUAKI', 'dfr@gmail.com', '2011-09-19', '10:15:00', 'Retard '),
(3, 'fg', 'kii', 'jcjdj@kij.ju', '2009-12-08', '10:14:00', 'RETARD'),
(4, 'HJ', 'TY', 'IK@KI.FR', '2009-12-12', '11:20:00', 'RETARD'),
(5, 'HJ', 'TY', 'IK@KI.FR', '2009-12-12', '11:20:00', 'dddRETARD'),
(6, 'OUL', 'OKACH', 'NHY@OIK.JU', '2009-12-12', '11:20:00', 'RETARD'),
(7, 'NH', 'LO', 'HUU@KIJ.JU', '2009-09-09', '11:20:00', 'RETARD'),
(8, 'TY', 'RT', 'OLK@JU.JU', '2019-10-19', '11:19:00', 'RETARD'),
(9, 'ABIB', 'DAmien', 'damienabiib@gmail.com', '2019-07-15', '15:14:00', 'Li rendé vous');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(5) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `mdp` varchar(225) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `droits` enum('admin','user','autre') DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `email`, `mdp`, `nom`, `prenom`, `droits`) VALUES
(1, 'a@gmail.com', '123', 'Admin', 'Administrateur', 'admin'),
(2, 'u@gmail.com', '123', 'ben', 'oka', 'user'),
(3, 'abde@gmail.com', '123', 'oul', 'abd', 'user'),
(4, 'c@gmail.com', '123', 'clients', 'others', 'autre');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bon_livraison`
--
ALTER TABLE `bon_livraison`
  ADD CONSTRAINT `FK_Bon_livraison_id_cam` FOREIGN KEY (`id_cam`) REFERENCES `camion` (`id_cam`),
  ADD CONSTRAINT `FK_Bon_livraison_id_cli` FOREIGN KEY (`id_cli`) REFERENCES `client` (`id_cli`),
  ADD CONSTRAINT `FK_Bon_livraison_id_devis` FOREIGN KEY (`id_devis`) REFERENCES `devis` (`id_devis`);

--
-- Constraints for table `camion`
--
ALTER TABLE `camion`
  ADD CONSTRAINT `FK_Camion_id_chauf` FOREIGN KEY (`id_chauf`) REFERENCES `chauffeur` (`id_chauf`);

--
-- Constraints for table `commandef`
--
ALTER TABLE `commandef`
  ADD CONSTRAINT `FK_CommandF_id_fourni` FOREIGN KEY (`id_fourni`) REFERENCES `fournisseur` (`id_fourni`);

--
-- Constraints for table `depot`
--
ALTER TABLE `depot`
  ADD CONSTRAINT `FK_Depot_id_cam` FOREIGN KEY (`id_cam`) REFERENCES `camion` (`id_cam`);

--
-- Constraints for table `devis`
--
ALTER TABLE `devis`
  ADD CONSTRAINT `FK_Devis_id_bonliv` FOREIGN KEY (`id_bonliv`) REFERENCES `bon_livraison` (`id_bonliv`),
  ADD CONSTRAINT `FK_Devis_id_commandc` FOREIGN KEY (`id_commandc`) REFERENCES `commandec` (`id_commandc`);

--
-- Constraints for table `ligne_commande_fournisseur`
--
ALTER TABLE `ligne_commande_fournisseur`
  ADD CONSTRAINT `FK_Ligne_commande_fournisseur_code_art` FOREIGN KEY (`code_art`) REFERENCES `article` (`code_art`),
  ADD CONSTRAINT `FK_Ligne_commande_fournisseur_id_commandf` FOREIGN KEY (`id_commandf`) REFERENCES `commandef` (`id_commandf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
