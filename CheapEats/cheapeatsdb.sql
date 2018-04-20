-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cheapeats
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cheapeats` ;

-- -----------------------------------------------------
-- Schema cheapeats
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cheapeats` DEFAULT CHARACTER SET utf8 ;
USE `cheapeats` ;

-- -----------------------------------------------------
-- Table `restaurants`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurants` ;

CREATE TABLE IF NOT EXISTS `restaurants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `phone_number` VARCHAR(12) NULL,
  `address` VARCHAR(45) NULL,
  `zip_code` VARCHAR(12) NULL,
  `min_price` INT UNSIGNED NULL,
  `max_price` INT UNSIGNED NULL,
  `image_url` VARCHAR(200) NULL,
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
