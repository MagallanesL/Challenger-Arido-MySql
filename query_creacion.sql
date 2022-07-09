-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BDArido
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BDArido
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDArido` ;
USE `BDArido` ;

-- -----------------------------------------------------
-- Table `BDArido`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDArido`.`Usuarios` (
  `idalias` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(2000) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idalias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDArido`.`Grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDArido`.`Grupos` (
  `idgroups` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(2000) NULL,
  PRIMARY KEY (`idgroups`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDArido`.`Access_Level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDArido`.`Access_Level` (
  `idaccess` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`idaccess`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDArido`.`Users_Segurity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDArido`.`Users_Segurity` (
  `idalias` VARCHAR(45) NOT NULL,
  `idgroups` INT NOT NULL,
  `idAccess` INT NOT NULL,
  PRIMARY KEY (`idalias`, `idgroups`, `idAccess`),
  INDEX `groups_us_idx` (`idgroups` ASC) VISIBLE,
  INDEX `access_us_idx` (`idAccess` ASC) VISIBLE,
  CONSTRAINT `user_us`
    FOREIGN KEY (`idalias`)
    REFERENCES `BDArido`.`Usuarios` (`idalias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `groups_us`
    FOREIGN KEY (`idgroups`)
    REFERENCES `BDArido`.`Grupos` (`idgroups`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `access_us`
    FOREIGN KEY (`idAccess`)
    REFERENCES `BDArido`.`Access_Level` (`idaccess`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
