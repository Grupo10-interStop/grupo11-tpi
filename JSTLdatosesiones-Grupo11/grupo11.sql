# Host: localhost  (Version 5.5.5-10.1.13-MariaDB)
# Date: 2020-11-22 02:07:23
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "libro"
#

DROP TABLE IF EXISTS `libro`;
CREATE TABLE `libro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(255) COLLATE utf8_spanish_ci NOT NULL DEFAULT '',
  `titulo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `autor` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `editorial` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

#
# Data for table "libro"
#

INSERT INTO `libro` VALUES (1,'9788423973378','LA ILIADA','Homero','S.L.U. ESPASA LIBROS'),(2,'9788424926335','La Odisea','Homero','GREDOS'),(3,'9788426108814','La Eneida','Publio Virgilio Maron','Juventud');
