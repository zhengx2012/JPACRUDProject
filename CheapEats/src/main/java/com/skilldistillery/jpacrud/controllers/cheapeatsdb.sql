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
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone_number` VARCHAR(15) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip_code` VARCHAR(12) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurants` ;

CREATE TABLE IF NOT EXISTS `restaurants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `min_price` INT UNSIGNED NULL,
  `max_price` INT UNSIGNED NULL,
  `image_url` VARCHAR(200) NULL,
  `category_id` INT UNSIGNED NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category_id_idx` (`category_id` ASC),
  INDEX `fk_address_id_address_idx` (`address_id` ASC),
  CONSTRAINT `fk_category_id_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_id_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `cheapeatsdb`;
INSERT INTO `address` (`id`, `phone_number`, `address`, `city`, `state`, `zip_code`) VALUES (1, NULL, '1319 22nd St', 'Denver', 'CO', '80205');

COMMIT;


-- -----------------------------------------------------
-- Data for table `restaurants`
-- -----------------------------------------------------
START TRANSACTION;
USE `cheapeatsdb`;
INSERT INTO `restaurants` (`id`, `name`, `min_price`, `max_price`, `image_url`, `category_id`, `address_id`) VALUES (1, 'Lazo Empanadas', NULL, NULL, NULL, 7, 1);

COMMIT;
