--drop supprime la base de données gescom si elle existe
DROP DATABASE IF EXISTS gescom_afpa;
-- on la recrée si elle existait déjà
CREATE DATABASE gescom_afpa;
--on utilise cette bdd pour nos requêtes
USE gescom_afpa;


--on supprime la base de données si elle existe
DROP TABLE IF EXISTS `categories`;
--on la crée si elle n'existait pas
CREATE TABLE IF NOT EXISTS `categories`
(
    --c'est une clé primaire
  `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  `cat_parent_id` int(10) UNSIGNED DEFAULT NULL,
  --c'est une clé secondaire
  PRIMARY KEY (`cat_id`),
  KEY `cat_parent_id` (`cat_parent_id`)


--on supprime la base de données si elle existe
  DROP TABLE IF EXISTS `countries`;
  --on la crée si elle n'existait pas
CREATE TABLE IF NOT EXISTS `countries` (
  `cou_id` char(2)  NOT NULL,
  `cou_name` varchar(45)  NOT NULL,
  UNIQUE KEY `alpha2` (`cou_id`)


--on supprime la base de données si elle existe
  DROP TABLE IF EXISTS `customers`;
  --on la crée si elle n'existait pas
CREATE TABLE IF NOT EXISTS `customers` (
    --c'est une clé primaire
  `cus_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cus_lastname` varchar(50) NOT NULL,
  `cus_firstname` varchar(50) NOT NULL,
  `cus_address` varchar(150) NOT NULL,
  `cus_zipcode` varchar(5) NOT NULL,
  `cus_city` varchar(50) NOT NULL,
  `cus_countries_id` char(2) NOT NULL,
  `cus_mail` varchar(255)  NOT NULL,
  `cus_phone` varchar(10) NOT NULL,
  `cus_password` varchar(60) NOT NULL,
  `cus_add_date` datetime NOT NULL,
  `cus_update_date` datetime DEFAULT NULL,
  --c'est une clé secondaire
  PRIMARY KEY (`cus_id`),
  KEY `ibfk_customers_countries` (`cus_countries_id`)


--on supprime la base de données si elle existe
  DROP TABLE IF EXISTS `employees`;
  --on la crée si elle n'existait pas
CREATE TABLE IF NOT EXISTS `employees` (
    --c'est une clé primaire
  `emp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_superior_id` int(10) UNSIGNED DEFAULT NULL,
  `emp_pos_id` int(10) UNSIGNED NOT NULL,
  `emp_lastname` varchar(50)  NOT NULL,
  `emp_firstname` varchar(50)  NOT NULL,
  `emp_address` varchar(150)  NOT NULL,
  `emp_zipcode` varchar(5)  NOT NULL,
  `emp_city` varchar(50)  NOT NULL,
  `emp_mail` varchar(255)  NOT NULL,
  `emp_phone` varchar(10) NOT NULL,
  `emp_salary` decimal(8,2) UNSIGNED DEFAULT NULL,
  `emp_enter_date` date NOT NULL,
  `emp_gender` char(1) NOT NULL,
  `emp_children` tinyint(2) NOT NULL,
  `emp_sho_id` tinyint(3) UNSIGNED NOT NULL,
  `emp_dep_id` tinyint(3) UNSIGNED NOT NULL,
  --c'est une clé secondaire
  PRIMARY KEY (`emp_id`),
  KEY `emp_superior_id` (`emp_superior_id`),
  KEY `emp_pos_id` (`emp_pos_id`),
  KEY `emp_shop_id` (`emp_sho_id`),
  KEY `emp_dep_id` (`emp_dep_id`)


--on supprime la base de données si elle existe
  DROP TABLE IF EXISTS `orders`;
  --on la crée si elle n'existait pas
CREATE TABLE IF NOT EXISTS `orders` (
    --c'est une clé primaire
  `ord_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ord_order_date` date NOT NULL,
  `ord_payment_date` date DEFAULT NULL,
  `ord_ship_date` date DEFAULT NULL,
  `ord_reception_date` date DEFAULT NULL,
  `ord_status` varchar(25)  DEFAULT NULL,
  `ord_cus_id` int(10) UNSIGNED NOT NULL,
  --c'est une clé secondaire
  PRIMARY KEY (`ord_id`),
  KEY `ord_cus_id` (`ord_cus_id`) USING BTREE


--on supprime la base de données si elle existe
  DROP TABLE IF EXISTS `orders_details`;
  --on la crée si elle n'existait pas
CREATE TABLE IF NOT EXISTS `orders_details` (
    --c'est une clé primaire
  `ode_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ode_unit_price` decimal(7,2) NOT NULL,
  `ode_discount` decimal(4,2) DEFAULT NULL,
  `ode_quantity` int(5) NOT NULL,
  `ode_ord_id` int(10) UNSIGNED NOT NULL,
  `ode_pro_id` int(10) UNSIGNED NOT NULL,
  --c'est une clé secondaire
  PRIMARY KEY (`ode_id`),
  KEY `ode_ord_id` (`ode_ord_id`) USING BTREE,
  KEY `ode_pro_id` (`ode_pro_id`) USING BTREE


--on supprime la base de données si elle existe
  DROP TABLE IF EXISTS `products`;
  --on la crée si elle n'existait pas
CREATE TABLE IF NOT EXISTS `products` (
    --c'est une clé primaire
  `pro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pro_cat_id` int(10) UNSIGNED NOT NULL,
  `pro_price` decimal(7,2) NOT NULL,
  `pro_ref` varchar(8)  NOT NULL,
  `pro_ean` varchar(13)  DEFAULT NULL,
  `pro_stock` int(5) UNSIGNED NOT NULL,
  `pro_stock_alert` int(5) UNSIGNED NOT NULL,
  `pro_color` varchar(30)  NOT NULL,
  `pro_name` varchar(50)  NOT NULL,
  `pro_desc` text  NOT NULL,
  `pro_publish` tinyint(1) NOT NULL,
  `pro_sup_id` int(10) UNSIGNED NOT NULL,
  `pro_add_date` datetime NOT NULL,
  `pro_update_date` datetime DEFAULT NULL,
  `pro_picture` varchar(50) DEFAULT NULL,
  --c'est une clé secondaire
  PRIMARY KEY (`pro_id`),
  KEY `pro_sup_id` (`pro_sup_id`) USING BTREE,
  KEY `pro_cat_id` (`pro_cat_id`) USING BTREE


--on supprime la base de données si elle existe
  DROP TABLE IF EXISTS `shops`;
  --on la crée si elle n'existait pas
CREATE TABLE IF NOT EXISTS `shops` (
    --c'est une clé primaire
  `sho_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sho_name` varchar(26) NOT NULL,
  `sho_address` varchar(100) NOT NULL,
  `sho_zipcode` varchar(5) NOT NULL,
  `sho_city` varchar(26) NOT NULL,
  PRIMARY KEY (`sho_id`)


--on supprime la base de données si elle existe
  DROP TABLE IF EXISTS `suppliers`;
  --on la crée si elle n'existait pas
CREATE TABLE IF NOT EXISTS `suppliers` (
    --c'est une clé primaire
  `sup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(50)  NOT NULL,
  `sup_city` varchar(50)  NOT NULL,
  `sup_countries_id` char(2) NOT NULL,
  `sup_address` varchar(150) NOT NULL,
  `sup_zipcode` varchar(5)  NOT NULL,
  `sup_contact` varchar(100) NOT NULL,
  `sup_phone` varchar(10)  NOT NULL,
  `sup_mail` varchar(75) NOT NULL,
  --c'est une clé secondaire
  PRIMARY KEY (`sup_id`),
  KEY `sup_countries_id` (`sup_countries_id`)