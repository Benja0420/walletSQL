-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wallet` DEFAULT CHARACTER SET utf8 ;
USE `wallet` ;

-- -----------------------------------------------------
-- Table `wallet`.`money`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wallet`.`money` (
  `currency_id` INT NOT NULL AUTO_INCREMENT,
  `currency_name` VARCHAR(45) NOT NULL,
  `currency_symbol` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`currency_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wallet`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wallet`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `balance` DECIMAL(15,2) NOT NULL,
  `symbol` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_money_symbol_idx` (`symbol` ASC) VISIBLE,
  CONSTRAINT `fk_money_symbol`
    FOREIGN KEY (`symbol`)
    REFERENCES `wallet`.`money` (`currency_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wallet`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wallet`.`transaction` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `sender_user_id` INT NOT NULL,
  `receiver_user_id` INT NOT NULL,
  `amount` DECIMAL(15,2) NOT NULL,
  `transaction_date` DATE NOT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `fk_sender_user_id` (`sender_user_id` ASC) VISIBLE,
  INDEX `fk_receiver_user_id` (`receiver_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_sender_user_id`
    FOREIGN KEY (`sender_user_id`)
    REFERENCES `wallet`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receiver_user_id`
    FOREIGN KEY (`receiver_user_id`)
    REFERENCES `wallet`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
