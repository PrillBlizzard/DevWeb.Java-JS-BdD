-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.4.10-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage de la structure de la table sos_cine. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_categorie_parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_categorie_categorie` (`id_categorie_parent`),
  CONSTRAINT `FK_categorie_categorie` FOREIGN KEY (`id_categorie_parent`) REFERENCES `categorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table sos_cine.categorie : ~43 rows (environ)
INSERT INTO `categorie` (`id`, `nom`, `id_categorie_parent`) VALUES
	(1, 'Camera', NULL),
	(2, 'Batteries', 1),
	(3, 'Black Magic Design', 1),
	(4, 'Canon', 1),
	(5, 'RED', 1),
	(6, 'Action Cam', 1),
	(7, 'Nikon', 1),
	(8, 'Panasonic', 1),
	(9, 'Sony', 1),
	(10, 'DJI', 1),
	(11, 'Cartes', 1),
	(12, 'Gimble', NULL),
	(13, 'Câbles', 12),
	(14, 'Cages Caméra', 12),
	(15, 'Crosse épaule', 12),
	(16, 'EasyRIG', 12),
	(17, 'Follow Focus', 12),
	(18, 'Grip Caméra', 12),
	(19, 'Grue', 12),
	(20, 'Filtres', 12),
	(21, 'Slider', 12),
	(22, 'Stabilisateurs', 12),
	(23, 'Trépieds', 12),
	(24, 'Ventouses', 12),
	(25, 'Moniteurs', NULL),
	(26, 'Convertisseurs', 25),
	(27, 'Enregistreurs', 25),
	(28, 'Moniteurs', 25),
	(29, 'Streaming', 25),
	(30, 'Transmetteurs HF', 25),
	(31, 'Lumières', NULL),
	(32, 'Batteries', 32),
	(33, 'LED', 32),
	(34, 'Modeleurs pour LED', 32),
	(35, 'Panneaux LED', 32),
	(36, 'Projecteurs COB LED', 32),
	(37, 'Tubes LED', 32),
	(38, 'Son', NULL),
	(39, 'Accessoires Son', 38),
	(40, 'Enregistreurs Audio', 38),
	(41, 'Kits prose de son', 38),
	(42, 'Microphones', 38),
	(43, 'Modules Son pour caméras', 38);

-- Listage de la structure de la table sos_cine. categorie_materiel
CREATE TABLE IF NOT EXISTS `categorie_materiel` (
  `id_materiel` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  PRIMARY KEY (`id_materiel`,`id_categorie`),
  KEY `FK_categorie_materiel_categorie` (`id_categorie`),
  CONSTRAINT `FK_categorie_materiel_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_categorie_materiel_materiel` FOREIGN KEY (`id_materiel`) REFERENCES `materiel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table sos_cine.categorie_materiel : ~29 rows (environ)
INSERT INTO `categorie_materiel` (`id_materiel`, `id_categorie`) VALUES
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 3),
	(5, 3),
	(6, 3),
	(7, 4),
	(8, 4),
	(9, 5),
	(10, 5),
	(11, 6),
	(12, 6),
	(13, 6),
	(14, 7),
	(15, 7),
	(16, 10),
	(17, 13),
	(18, 13),
	(19, 13),
	(20, 13),
	(21, 14),
	(22, 14),
	(23, 15),
	(24, 15),
	(25, 15),
	(26, 16),
	(27, 16),
	(28, 19),
	(29, 20),
	(30, 20),
	(31, 10),
	(31, 20);

-- Listage de la structure de la table sos_cine. client
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` text COLLATE utf8_unicode_ci NOT NULL,
  `code_postal` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table sos_cine.client : ~8 rows (environ)
INSERT INTO `client` (`id`, `nom`, `prenom`, `adresse`, `code_postal`, `ville`, `telephone`, `mail`) VALUES
	(1, 'SCHMITT', 'Patrick', '974, rue Guillaume Riou', '03162', 'David-sur-Mer', '01 89 17 84 03', 'victor82@yahoo.fr'),
	(2, 'CHEVALIER', 'Louise', '70, avenue de Diaz', '38406', 'Royer', '05 55 53 62 94', 'briand.laetitia@meyer.fr'),
	(3, 'BAILLY', 'Josette', '62, place de Simon', '58814', 'Peron', '05 86 99 74 93', 'ccollet@wanadoo.fr'),
	(4, 'CHARTIER', 'Julie', 'Impasse Julien', '22987', 'Marchal-sur-Guilbert', '07 95 21 38 70', 'honore.rocher@ifrance.com'),
	(5, 'GUILBERT', 'Eric', '673, Rue de Lejeune', '19666', 'Maillotbourg', '06 10 32 91 10', 'gilles93@laposte.net'),
	(6, 'DU LETELLIER', 'Lorraine', '35, Chemin de Leroux', '91135', 'Marques', '02 58 18 83 81', 'alves.thibault@lemoine.fr'),
	(7, 'MAURY', 'Julien', '5, Impasse Pinto', '61908', 'Allard', '05 51 85 51 14', 'laetitia51@bruneau.fr'),
	(8, 'HERNANDEZ-BOUCHER', 'Philippine', '35, Boulevard Rousset', '36315', 'Durand-La-Forêt', '03 93 91 36 76', 'dupuy.josephine@orange.fr'),
	(9, 'GEORGES', 'François', '92, rue Lombard', '66178', 'Devaux', '05 58 44 07 64', 'uteixeira@orange.fr'),
	(10, 'GIRARD', 'Benjamin', 'uteixeira@orange.fr', '93660', 'Camus', '06 71 43 96 91', 'devaux.charlotte@royer.com');

-- Listage de la structure de la table sos_cine. etat
CREATE TABLE IF NOT EXISTS `etat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table sos_cine.etat : ~2 rows (environ)
INSERT INTO `etat` (`id`, `nom`) VALUES
	(1, 'Disponible'),
	(2, 'En panne'),
	(3, 'En réparation');

-- Listage de la structure de la table sos_cine. etat_materiel
CREATE TABLE IF NOT EXISTS `etat_materiel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_constat` datetime NOT NULL,
  `id_materiel` int(11) NOT NULL,
  `id_etat` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_etat_materiel_materiel` (`id_materiel`),
  KEY `FK_etat_materiel_etat` (`id_etat`),
  CONSTRAINT `FK_etat_materiel_etat` FOREIGN KEY (`id_etat`) REFERENCES `etat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_etat_materiel_materiel` FOREIGN KEY (`id_materiel`) REFERENCES `materiel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table sos_cine.etat_materiel : ~50 rows (environ)
INSERT INTO `etat_materiel` (`id`, `date_constat`, `id_materiel`, `id_etat`) VALUES
	(1, '2021-02-14 10:35:00', 3, 2),
	(2, '2020-07-23 16:45:00', 7, 1),
	(3, '2022-01-01 09:20:00', 11, 3),
	(4, '2021-10-05 14:10:00', 16, 1),
	(5, '2022-08-12 11:30:00', 21, 2),
	(6, '2020-03-18 08:15:00', 25, 3),
	(7, '2022-05-28 13:55:00', 28, 1),
	(8, '2021-06-10 17:40:00', 31, 2),
	(9, '2020-02-27 10:25:00', 9, 1),
	(10, '2022-11-19 15:50:00', 14, 3),
	(11, '2022-01-22 11:05:00', 2, 2),
	(12, '2021-07-03 15:15:00', 4, 3),
	(13, '2020-04-17 14:50:00', 8, 1),
	(14, '2021-03-20 09:25:00', 10, 2),
	(15, '2022-12-01 12:35:00', 12, 1),
	(16, '2020-08-08 16:20:00', 15, 3),
	(17, '2021-12-07 10:10:00', 18, 2),
	(18, '2022-03-15 14:45:00', 20, 1),
	(19, '2020-11-02 09:55:00', 22, 2),
	(20, '2022-02-10 11:25:00', 26, 3),
	(21, '2020-10-09 14:30:00', 29, 1),
	(22, '2021-04-05 16:55:00', 30, 2),
	(23, '2022-07-01 09:40:00', 1, 3),
	(24, '2021-09-16 12:10:00', 5, 1),
	(25, '2022-04-22 10:20:00', 13, 2),
	(26, '2020-05-14 08:05:00', 17, 1),
	(27, '2021-01-08 14:15:00', 19, 3),
	(28, '2022-10-06 16:50:00', 23, 1),
	(29, '2020-12-24 11:30:00', 27, 2),
	(30, '2021-08-11 13:45:00', 31, 3),
	(31, '2020-10-14 11:00:00', 2, 1),
	(32, '2022-01-08 14:20:00', 4, 2),
	(33, '2021-03-17 16:15:00', 7, 3),
	(34, '2022-02-05 09:50:00', 9, 1),
	(35, '2020-08-22 11:35:00', 11, 2),
	(36, '2021-12-20 14:45:00', 14, 1),
	(37, '2022-03-30 16:20:00', 17, 3),
	(38, '2020-11-27 09:25:00', 19, 2),
	(39, '2021-09-05 12:35:00', 22, 1),
	(40, '2022-05-12 16:55:00', 24, 2),
	(41, '2020-06-03 10:10:00', 27, 3),
	(42, '2021-05-19 14:45:00', 29, 1),
	(43, '2022-10-14 09:55:00', 3, 2),
	(44, '2021-07-22 12:30:00', 6, 3),
	(45, '2020-04-08 14:20:00', 13, 1),
	(46, '2021-02-03 10:25:00', 16, 2),
	(47, '2022-11-09 11:50:00', 21, 1),
	(48, '2020-12-06 16:20:00', 23, 2),
	(49, '2021-08-02 09:45:00', 26, 3),
	(50, '2022-04-01 11:15:00', 31, 1);

-- Listage de la structure de la table sos_cine. location
CREATE TABLE IF NOT EXISTS `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference` (`reference`),
  KEY `FK_location_client` (`id_client`),
  CONSTRAINT `FK_location_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table sos_cine.location : ~8 rows (environ)
INSERT INTO `location` (`id`, `reference`, `id_client`) VALUES
	(1, '2021KFI78964', 2),
	(2, '2020NLU43709', 9),
	(3, '2022XOK27543', 8),
	(4, '2023KTR56894', 1),
	(5, '2021HJM34675', 3),
	(6, '2022RDE87591', 1),
	(7, '2020ZQA92386', 4),
	(8, '2023LPW15682', 10),
	(9, '2022YXB63928', 6),
	(10, '2021GKH45270', 3);

-- Listage de la structure de la table sos_cine. location_materiel
CREATE TABLE IF NOT EXISTS `location_materiel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_emprunt` datetime DEFAULT NULL,
  `date_retour` datetime DEFAULT NULL,
  `etat_emprunt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `etat_retour` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_location` int(11) NOT NULL,
  `id_materiel` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_location_materiel_location` (`id_location`),
  KEY `FK_location_materiel_materiel` (`id_materiel`),
  CONSTRAINT `FK_location_materiel_location` FOREIGN KEY (`id_location`) REFERENCES `location` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_location_materiel_materiel` FOREIGN KEY (`id_materiel`) REFERENCES `materiel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table sos_cine.location_materiel : ~33 rows (environ)
INSERT INTO `location_materiel` (`id`, `date_emprunt`, `date_retour`, `etat_emprunt`, `etat_retour`, `id_location`, `id_materiel`) VALUES
	(1, '2020-02-12 14:30:00', '2020-02-19 14:30:00', 'neuf', 'comme neuf', 1, 5),
	(2, '2020-03-01 10:15:00', '2020-03-07 16:30:00', 'rayé sur le coté gauche', 'égratigné sur le coin supérieur droit', 3, 23),
	(3, '2020-05-23 16:45:00', '2020-05-30 14:00:00', 'usé', 'endommagé au niveau de la poignée', 2, 12),
	(4, '2020-07-15 11:00:00', NULL, 'neuf', NULL, 4, 9),
	(5, '2020-08-20 08:30:00', '2020-08-27 09:45:00', 'rayé sur le coté gauche', 'rayé sur le coin supérieur droit', 5, 31),
	(6, '2020-09-01 14:00:00', '2020-09-09 16:00:00', 'endommagé', 'endommagé', 7, 14),
	(7, '2020-10-15 09:00:00', NULL, 'rayé sur le coté droit', NULL, 6, 18),
	(8, '2020-12-02 11:00:00', '2020-12-10 12:30:00', 'neuf', 'comme neuf', 1, 8),
	(9, '2020-12-18 16:00:00', NULL, 'usé', NULL, 2, 6),
	(10, '2021-01-05 13:00:00', '2021-01-12 14:15:00', 'rayé sur le coté gauche', 'rayé sur le coin supérieur droit', 3, 19),
	(11, '2021-02-10 08:00:00', NULL, 'neuf', NULL, 4, 9),
	(12, '2021-03-07 14:00:00', '2021-03-10 12:30:00', 'endommagé', 'endommagé', 5, 26),
	(13, '2021-05-01 10:00:00', '2021-05-08 08:15:00', 'usé', 'endommagé au niveau de la poignée', 6, 12),
	(14, '2021-06-15 12:00:00', NULL, 'neuf', NULL, 7, 30),
	(15, '2021-07-20 09:00:00', '2021-07-27 11:45:00', 'rayé sur le coté droit', 'rayé sur le coin inférieur gauche', 8, 5),
	(16, '2021-08-05 10:30:00', '2021-08-09 10:30:00', 'neuf', 'comme neuf', 1, 5),
	(17, '2022-04-22 09:15:00', '2022-04-29 09:15:00', 'rayé sur le coté gauche', 'égratigné sur le coin supérieur droit', 3, 23),
	(18, '2020-09-23 16:45:00', '2020-09-30 16:45:00', 'usé', 'endommagé au niveau de la poignée', 2, 12),
	(19, '2022-01-01 10:00:00', '2022-01-07 10:00:00', 'en bon état', 'légèrement rayé sur le côté gauche', 1, 5),
	(20, '2022-02-01 14:30:00', NULL, 'en bon état', NULL, 2, 12),
	(21, '2022-03-01 08:00:00', '2022-03-08 08:00:00', 'légèrement abîmé sur le dessus', 'abîmé sur le dessus', 3, 18),
	(22, '2022-04-01 16:00:00', NULL, 'neuf', NULL, 4, 2),
	(23, '2022-05-01 12:00:00', '2022-05-08 12:00:00', 'rayé sur le côté droit', 'rayé sur le côté droit et légèrement abîmé sur le dessous', 5, 29),
	(24, '2022-06-01 09:00:00', '2022-06-07 09:00:00', 'en bon état', 'légèrement rayé sur le dessus', 6, 10),
	(25, '2022-07-01 15:30:00', NULL, 'abîmé sur le dessous', NULL, 7, 24),
	(26, '2022-08-01 07:00:00', '2022-08-08 07:00:00', 'neuf', 'légèrement abîmé sur le côté gauche', 8, 15),
	(27, '2022-09-01 11:00:00', NULL, 'en bon état', NULL, 9, 27),
	(28, '2022-10-01 13:30:00', '2022-10-08 13:30:00', 'légèrement abîmé sur le côté gauche', 'abîmé sur le côté gauche et rayé sur le dessous', 10, 7),
	(29, '2022-11-01 18:00:00', NULL, 'en bon état', NULL, 1, 21),
	(30, '2022-12-01 10:00:00', '2022-12-08 10:00:00', 'rayé sur le dessous', 'rayé sur le dessous et légèrement abîmé sur le côté droit', 2, 14),
	(31, '2023-01-01 14:30:00', '2023-01-08 14:30:00', 'en bon état', 'rayé sur le côté droit', 3, 19),
	(32, '2023-02-01 08:00:00', NULL, 'abîmé sur le côté droit', NULL, 4, 6),
	(33, '2023-03-01 16:00:00', '2023-03-08 16:00:00', 'neuf', 'en bon état', 5, 30);

-- Listage de la structure de la table sos_cine. materiel
CREATE TABLE IF NOT EXISTS `materiel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table sos_cine.materiel : ~27 rows (environ)
INSERT INTO `materiel` (`id`, `nom`, `prix`, `quantite`) VALUES
	(1, 'Batterie FXLion Nano Two 98Wh V-Lock', 8.80, 7),
	(2, 'Batterie Hedbox RP NPF970', 4.40, 3),
	(3, 'Batterie LPE6 Canon R5', 2.20, 12),
	(4, 'Blackmagic Pocket 6K', 77.00, 3),
	(5, 'Blackmagic Pocket 6K Pro', 88.00, 5),
	(6, 'Blackmagic Pocket Cinema 4K', 55.00, 11),
	(7, 'Canon C70', 99.00, 8),
	(8, 'Canon EOS R5', 110.00, 5),
	(9, 'RED Komodo 6K', 187.00, 4),
	(10, 'RED V-Raptor 8K', 440.00, 6),
	(11, 'DJI Osmo Action 2', 33.00, 18),
	(12, 'GoPro HERO 10 Black', 33.00, 30),
	(13, 'Go Pro HERO 8 Black', 22.00, 20),
	(14, 'Nikon Z6', 55.00, 14),
	(15, 'Nikon Z9', 121.00, 6),
	(16, 'DJI Ronin 4D (Monture E)', 220.00, 12),
	(17, 'Câble BNC (SDI)', 2.20, 50),
	(18, 'Câble Dtap vers DC 12V', 1.10, 50),
	(19, 'Câble HDMI 10 mètres', 5.50, 30),
	(20, 'Touret SDI 50 mètres', 11.00, 10),
	(21, 'Cage A7SII SmallRig', 8.80, 7),
	(22, 'Cage GH5', 11.00, 3),
	(23, 'Crosse épaule Arri', 50.00, 5),
	(24, 'Crosse épaule Shape', 16.50, 8),
	(25, 'Crosse épaule Caméra SmallRig', 8.80, 19),
	(26, 'EasyRig MiniMax Stabil Light (2-7 Kg)', 60.50, 9),
	(27, 'EasyRig Vario (5-17 Kg)', 88.00, 4),
	(28, 'Grue Vidéo iFootage Mini Crane M1 III', 44.00, 3),
	(29, 'Filtre polarisant NiSi CPL Pro', 11.00, 15),
	(30, 'Filtre Poignée Kaléidoscope Blue Flare', 8.80, 10),
	(31, 'Filtre ND pour DJI Action 2', 11.00, 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
