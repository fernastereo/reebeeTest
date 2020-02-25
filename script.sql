-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.24


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema reebeetest
--

CREATE DATABASE IF NOT EXISTS reebeetest;
USE reebeetest;

--
-- Definition of table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  `modified_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Definition of table `flyers`
--

DROP TABLE IF EXISTS `flyers`;
CREATE TABLE `flyers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `flyerPriority` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` date NOT NULL,
  `modified_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flyers`
--

/*!40000 ALTER TABLE `flyers` DISABLE KEYS */;
/*!40000 ALTER TABLE `flyers` ENABLE KEYS */;


--
-- Definition of table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `flyer_id` int(10) unsigned NOT NULL,
  `pageNumber` int(10) unsigned NOT NULL,
  `fileName` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL,
  `modified_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


--
-- Definition of table `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  `modified_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stores`
--

/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

ALTER TABLE `reebeetest`.`flyers` ADD CONSTRAINT `flyers_categories_id` FOREIGN KEY `flyers_categories_id` (`category_id`)
    REFERENCES `categories` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;


ALTER TABLE `reebeetest`.`flyers` ADD CONSTRAINT `flyers_stores_id` FOREIGN KEY `flyers_stores_id` (`store_id`)
    REFERENCES `stores` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE `reebeetest`.`pages` ADD CONSTRAINT `pages_flyers_id` FOREIGN KEY `pages_flyers_id` (`flyer_id`)
    REFERENCES `flyers` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

