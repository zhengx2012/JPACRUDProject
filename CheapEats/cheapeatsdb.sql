-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state` VARCHAR(45) NULL DEFAULT NULL,
  `zip_code` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant` ;

CREATE TABLE IF NOT EXISTS `restaurant` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `phone_number` VARCHAR(15) NULL DEFAULT NULL,
  `min_price` DECIMAL(4,2) UNSIGNED NULL DEFAULT NULL,
  `max_price` DECIMAL(4,2) UNSIGNED NULL DEFAULT NULL,
  `image_url` VARCHAR(200) NULL DEFAULT NULL,
  `category_id` INT(10) UNSIGNED NOT NULL,
  `address` VARCHAR(60) NOT NULL,
  `address2` VARCHAR(45) NULL DEFAULT NULL,
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
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO foodieuser@localhost;
 DROP USER foodieuser@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'foodieuser'@'localhost' IDENTIFIED BY 'foodie';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'foodieuser'@'localhost';
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
INSERT INTO `restaurant` (`id`, `name`, `phone_number`, `min_price`, `max_price`, `image_url`, `category_id`, `address`, `address2`, `city`, `state`, `zip_code`) VALUES (1, 'Lazo Empanadas', '(303) 296-6710', 1.50, 5.50, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcYQIpygWNZDIGj32_erZ-E6dKcsMLR3fIbMwTboYEg4z3vKA0', 7, '1319 22nd St', NULL, 'Denver', 'CO', '80205');

COMMIT;

