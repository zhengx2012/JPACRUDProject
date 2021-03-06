-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cheapeatsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cheapeatsdb` ;

-- -----------------------------------------------------
-- Schema cheapeatsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cheapeatsdb` DEFAULT CHARACTER SET utf8 ;
USE `cheapeatsdb` ;

-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant` ;

CREATE TABLE IF NOT EXISTS `restaurant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `phone_number` VARCHAR(15) NULL,
  `min_price` DECIMAL(4,2) UNSIGNED NULL,
  `max_price` DECIMAL(4,2) UNSIGNED NULL,
  `image_url` VARCHAR(200) NULL,
  `category_id` INT UNSIGNED NOT NULL,
  `address` VARCHAR(60) NOT NULL,
  `address2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category_id_idx` (`category_id` ASC),
  CONSTRAINT `fk_category_id_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip_code` VARCHAR(12) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO foodieuser@localhost;
 DROP USER foodieuser@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'foodieuser'@'localhost' IDENTIFIED BY 'foodie';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'foodieuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `cheapeatsdb`;
INSERT INTO `category` (`id`, `category_name`) VALUES (1, 'East Asian');
INSERT INTO `category` (`id`, `category_name`) VALUES (2, 'Indian');
INSERT INTO `category` (`id`, `category_name`) VALUES (3, 'Asian Fusion');
INSERT INTO `category` (`id`, `category_name`) VALUES (4, 'American');
INSERT INTO `category` (`id`, `category_name`) VALUES (5, 'Soul');
INSERT INTO `category` (`id`, `category_name`) VALUES (6, 'BBQ');
INSERT INTO `category` (`id`, `category_name`) VALUES (7, 'Latin');
INSERT INTO `category` (`id`, `category_name`) VALUES (8, 'Pizzeria');
INSERT INTO `category` (`id`, `category_name`) VALUES (9, 'Other');

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurant`
-- -----------------------------------------------------
START TRANSACTION;
USE `cheapeatsdb`;
INSERT INTO `restaurant` (`id`, `name`, `phone_number`, `min_price`, `max_price`, `image_url`, `category_id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (1, 'Lazo Empanadas', '(303) 296-6710', 1.50, 5.50, 'http://lazoempanadas.com/wp-content/uploads/2015/06/LAZO_Steak-QuesadillaWeb.jpg', 7, ' 1319 22nd St ', NULL, 'Denver', 'CO', '80205');
INSERT INTO `restaurant` (`id`, `name`, `phone_number`, `min_price`, `max_price`, `image_url`, `category_id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (2, 'Zeps Epiq Sandwiches', '(303) 534-0796', 2.00, 12.00, 'https://scontent-ams3-1.cdninstagram.com/vp/34e6e8cbf08d830f97fec1b568342c81/5B214BF6/t51.2885-15/s640x640/sh0.08/e35/26156458_165828794182824_5607107150984773632_n.jpg', 4, '1147 Broadway', NULL, 'Denver', 'CO', '80203');
INSERT INTO `restaurant` (`id`, `name`, `phone_number`, `min_price`, `max_price`, `image_url`, `category_id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (3, 'Cherry Cricket', '(303) 322-7666', 4.00, 12.00, 'https://i.pinimg.com/originals/65/96/0a/65960a4250cbc1f18b2f8d1226652d23.jpg', 4, '2641 E 2nd Ave', NULL, 'Denver', 'CO', '80206');
INSERT INTO `restaurant` (`id`, `name`, `phone_number`, `min_price`, `max_price`, `image_url`, `category_id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (4, 'Five on Black', '(720) 904-5505', 5, 6.95, 'https://photos.smugmug.com/Five-on-Black-Review/i-28NtVxg/0/ea135c97/L/FiveonBlack149-L.jpg', 9, '1617 California St', NULL, 'Denver', 'CO', '80202');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `cheapeatsdb`;
INSERT INTO `address` (`id`, `address`, `city`, `state`, `zip_code`) VALUES (1, '1319 22nd St', 'Denver', 'Colorado', '80205');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `zip_code`) VALUES (2, '1147 Broadway', 'Denver', 'Colorado', '80203');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `zip_code`) VALUES (3, '2641 E 2nd Ave', 'Denver', 'Colorado', '80206');
INSERT INTO `address` (`id`, `address`, `city`, `state`, `zip_code`) VALUES (4, '1617 California St', 'Denver', 'Colorado', '80202');

COMMIT;

