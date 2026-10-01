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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema test1
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`χωρα`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`χωρα` (
  `key` INT NOT NULL,
  `ονομα` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ηθοποιος`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ηθοποιος` (
  `key` INT NOT NULL,
  `ονομα` VARCHAR(45) NOT NULL,
  `επωνυμο` VARCHAR(45) NOT NULL,
  `φωτογραφια` BLOB NULL,
  `ημερομηνια γεννησης` DATE NULL,
  `προγραμμα εκπαιδευσης_key` INT NOT NULL,
  `συμβολαιο_key` INT NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`διοργανωση`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`διοργανωση` (
  `key` INT NOT NULL,
  `ονομα` VARCHAR(45) NULL,
  `ημερομηνια διεξαγωγης` DATE NULL,
  `σελιδες στα σοσιαλ` VARCHAR(45) NULL,
  `στατιστικα` VARCHAR(45) NULL,
  `βραβεια_key` INT NOT NULL,
  `χωρα_key` INT NOT NULL,
  PRIMARY KEY (`key`, `βραβεια_key`),
  INDEX `fk_διοργανωση_χωρα1_idx` (`χωρα_key` ASC) VISIBLE,
  CONSTRAINT `fk_διοργανωση_χωρα1`
    FOREIGN KEY (`χωρα_key`)
    REFERENCES `mydb`.`χωρα` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ΑΙ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ΑΙ` (
  `key` INT NOT NULL,
  `ονομα` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`εταιρεια παραγωγης`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`εταιρεια παραγωγης` (
  `key` INT NOT NULL,
  `ονομα` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ειδος ταινιας`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ειδος ταινιας` (
  `key` INT NOT NULL,
  `περιγραφη` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ταινια`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ταινια` (
  `key` INT NOT NULL,
  `τιτλος` VARCHAR(45) NOT NULL,
  `ετος παραγωγης` INT NOT NULL,
  `διαρκεια` VARCHAR(45) NOT NULL,
  `χωρα_key` INT NOT NULL,
  `εταιρεια παραγωγης_key` INT NOT NULL,
  `ειδος ταινιας_key` INT NOT NULL,
  PRIMARY KEY (`key`),
  INDEX `fk_ταινια_χωρα1_idx` (`χωρα_key` ASC) VISIBLE,
  INDEX `fk_ταινια_εταιρεια παραγωγης1_idx` (`εταιρεια παραγωγης_key` ASC) VISIBLE,
  INDEX `fk_ταινια_ειδος ταινιας1_idx` (`ειδος ταινιας_key` ASC) VISIBLE,
  CONSTRAINT `fk_ταινια_χωρα1`
    FOREIGN KEY (`χωρα_key`)
    REFERENCES `mydb`.`χωρα` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ταινια_εταιρεια παραγωγης1`
    FOREIGN KEY (`εταιρεια παραγωγης_key`)
    REFERENCES `mydb`.`εταιρεια παραγωγης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ταινια_ειδος ταινιας1`
    FOREIGN KEY (`ειδος ταινιας_key`)
    REFERENCES `mydb`.`ειδος ταινιας` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`σεναριο`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`σεναριο` (
  `key` INT NOT NULL,
  `κειμενο` VARCHAR(45) NOT NULL,
  `ΑΙ_key` INT NOT NULL,
  `ταινια_key` INT NOT NULL,
  PRIMARY KEY (`key`),
  INDEX `fk_σεναριο_ΑΙ1_idx` (`ΑΙ_key` ASC) VISIBLE,
  INDEX `fk_σεναριο_ταινια1_idx` (`ταινια_key` ASC) VISIBLE,
  CONSTRAINT `fk_σεναριο_ΑΙ1`
    FOREIGN KEY (`ΑΙ_key`)
    REFERENCES `mydb`.`ΑΙ` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_σεναριο_ταινια1`
    FOREIGN KEY (`ταινια_key`)
    REFERENCES `mydb`.`ταινια` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`προγραμμα εκπαιδευσης`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`προγραμμα εκπαιδευσης` (
  `key` INT NOT NULL,
  `περιγραφη` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`συμβολαιο`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`συμβολαιο` (
  `key` INT NOT NULL,
  `ημερομηνια εναρξης` DATE NOT NULL,
  `ημερομηνια ληξης` DATE NOT NULL,
  `ετησιες απολαβες` INT NOT NULL,
  `ηθοποιος_key` INT NOT NULL,
  `ταινια_key` INT NOT NULL,
  PRIMARY KEY (`key`, `ταινια_key`),
  INDEX `fk_συμβολαιο_ηθοποιος1_idx` (`ηθοποιος_key` ASC) VISIBLE,
  INDEX `fk_συμβολαιο_ταινια1_idx` (`ταινια_key` ASC) VISIBLE,
  CONSTRAINT `fk_συμβολαιο_ηθοποιος1`
    FOREIGN KEY (`ηθοποιος_key`)
    REFERENCES `mydb`.`ηθοποιος` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_συμβολαιο_ταινια1`
    FOREIGN KEY (`ταινια_key`)
    REFERENCES `mydb`.`ταινια` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ρολος`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ρολος` (
  `key` INT NOT NULL,
  `περιγραφη` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`κατηγορια χαρακτηριστκου`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`κατηγορια χαρακτηριστκου` (
  `key` INT NOT NULL,
  `ονομα κατηγοριας` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`χαρακτηριστικα`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`χαρακτηριστικα` (
  `key` INT NOT NULL,
  `περιγραφη` INT NOT NULL,
  `κατηγορια χαρακτηριστκου_key` INT NOT NULL,
  PRIMARY KEY (`key`),
  INDEX `fk_χαρακτηριστικα_κατηγορια χαρα_idx` (`κατηγορια χαρακτηριστκου_key` ASC) VISIBLE,
  CONSTRAINT `fk_χαρακτηριστικα_κατηγορια χαρακ1`
    FOREIGN KEY (`κατηγορια χαρακτηριστκου_key`)
    REFERENCES `mydb`.`κατηγορια χαρακτηριστκου` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`πανθεον`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`πανθεον` (
  `key` INT NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`παίκτης`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`παίκτης` (
  `key` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`key`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`παιχνίδι`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`παιχνίδι` (
  `key` INT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL,
  `παίκτης_key` INT NOT NULL,
  PRIMARY KEY (`key`),
  INDEX `fk_παιχνίδι_παίκτης1_idx` (`παίκτης_key` ASC) VISIBLE,
  CONSTRAINT `fk_παιχνίδι_παίκτης1`
    FOREIGN KEY (`παίκτης_key`)
    REFERENCES `mydb`.`παίκτης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`διεθνής`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`διεθνής` (
  `key` INT NOT NULL,
  PRIMARY KEY (`key`),
  CONSTRAINT `fk_διεθνης ταινία_ταινια1`
    FOREIGN KEY (`key`)
    REFERENCES `mydb`.`ταινια` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`εγχώρια`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`εγχώρια` (
  `key` INT NOT NULL,
  `χωρα_key` INT NOT NULL,
  PRIMARY KEY (`key`),
  INDEX `fk_εγχώρια ταινία_χωρα1_idx` (`χωρα_key` ASC) VISIBLE,
  CONSTRAINT `fk_εγχώρια ταινία_ταινια1`
    FOREIGN KEY (`key`)
    REFERENCES `mydb`.`ταινια` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_εγχώρια ταινία_χωρα1`
    FOREIGN KEY (`χωρα_key`)
    REFERENCES `mydb`.`χωρα` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`σκηνοθετης`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`σκηνοθετης` (
  `key` INT NOT NULL,
  `ονομα` VARCHAR(45) NOT NULL,
  `επωνυμο` VARCHAR(45) NOT NULL,
  `ημερομηνια γεννησης` DATE NOT NULL,
  `ποντοι` INT NULL,
  `διεθνης ταινια_key` INT NOT NULL,
  `πανθεον_key` INT NOT NULL,
  `παιχνίδι_key` INT NOT NULL,
  `διεθνής_key` INT NOT NULL,
  `εγχώρια_key` INT NOT NULL,
  PRIMARY KEY (`key`, `διεθνής_key`, `εγχώρια_key`),
  INDEX `fk_σκηνοθετης_πανθεον1_idx` (`πανθεον_key` ASC) VISIBLE,
  INDEX `fk_σκηνοθετης_παιχνίδι1_idx` (`παιχνίδι_key` ASC) VISIBLE,
  INDEX `fk_σκηνοθετης_διεθνής1_idx` (`διεθνής_key` ASC) VISIBLE,
  INDEX `fk_σκηνοθετης_εγχώρια1_idx` (`εγχώρια_key` ASC) VISIBLE,
  CONSTRAINT `fk_σκηνοθετης_πανθεον1`
    FOREIGN KEY (`πανθεον_key`)
    REFERENCES `mydb`.`πανθεον` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_σκηνοθετης_παιχνίδι1`
    FOREIGN KEY (`παιχνίδι_key`)
    REFERENCES `mydb`.`παιχνίδι` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_σκηνοθετης_διεθνής1`
    FOREIGN KEY (`διεθνής_key`)
    REFERENCES `mydb`.`διεθνής` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_σκηνοθετης_εγχώρια1`
    FOREIGN KEY (`εγχώρια_key`)
    REFERENCES `mydb`.`εγχώρια` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`βραβειο`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`βραβειο` (
  `key` INT NOT NULL,
  `ειδος βραβειου` VARCHAR(45) NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`εθνικοτητα`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`εθνικοτητα` (
  `key` INT NOT NULL,
  `τίτλος` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`σκηνοθετης_has_εθνικοτητα`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`σκηνοθετης_has_εθνικοτητα` (
  `σκηνοθετης_key` INT NOT NULL,
  `εθνικοτητα_key` INT NOT NULL,
  PRIMARY KEY (`σκηνοθετης_key`, `εθνικοτητα_key`),
  INDEX `fk_σκηνοθετης_has_εθνικοτητα_εθνικ_idx` (`εθνικοτητα_key` ASC) VISIBLE,
  INDEX `fk_σκηνοθετης_has_εθνικοτητα_σκηνο_idx` (`σκηνοθετης_key` ASC) VISIBLE,
  CONSTRAINT `fk_σκηνοθετης_has_εθνικοτητα_σκηνοθ1`
    FOREIGN KEY (`σκηνοθετης_key`)
    REFERENCES `mydb`.`σκηνοθετης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_σκηνοθετης_has_εθνικοτητα_εθνικο1`
    FOREIGN KEY (`εθνικοτητα_key`)
    REFERENCES `mydb`.`εθνικοτητα` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`παιχνίδι_has_παίκτης`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`παιχνίδι_has_παίκτης` (
  `παιχνίδι_key` INT NOT NULL,
  `παίκτης_key` INT NOT NULL,
  PRIMARY KEY (`παιχνίδι_key`, `παίκτης_key`),
  INDEX `fk_παιχνίδι_has_παίκτης_παίκτης1_idx` (`παίκτης_key` ASC) VISIBLE,
  INDEX `fk_παιχνίδι_has_παίκτης_παιχνίδι1_idx` (`παιχνίδι_key` ASC) VISIBLE,
  CONSTRAINT `fk_παιχνίδι_has_παίκτης_παιχνίδι1`
    FOREIGN KEY (`παιχνίδι_key`)
    REFERENCES `mydb`.`παιχνίδι` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_παιχνίδι_has_παίκτης_παίκτης1`
    FOREIGN KEY (`παίκτης_key`)
    REFERENCES `mydb`.`παίκτης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`σκηνοθετης_has_πρότυπο_ταινια`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`σκηνοθετης_has_πρότυπο_ταινια` (
  `σκηνοθετης_key` INT NOT NULL,
  `ταινια_key` INT NOT NULL,
  PRIMARY KEY (`σκηνοθετης_key`, `ταινια_key`),
  INDEX `fk_σκηνοθετης_has_ταινια_ταινια1_idx` (`ταινια_key` ASC) VISIBLE,
  INDEX `fk_σκηνοθετης_has_ταινια_σκηνοθετη_idx` (`σκηνοθετης_key` ASC) VISIBLE,
  CONSTRAINT `fk_σκηνοθετης_has_ταινια_σκηνοθετης1`
    FOREIGN KEY (`σκηνοθετης_key`)
    REFERENCES `mydb`.`σκηνοθετης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_σκηνοθετης_has_ταινια_ταινια1`
    FOREIGN KEY (`ταινια_key`)
    REFERENCES `mydb`.`ταινια` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`σκηνοθετης_has_πρότυπο_σκηνοθετης`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`σκηνοθετης_has_πρότυπο_σκηνοθετης` (
  `σκηνοθετης_key` INT NOT NULL,
  `σκηνοθετης_key1` INT NOT NULL,
  PRIMARY KEY (`σκηνοθετης_key`, `σκηνοθετης_key1`),
  INDEX `fk_σκηνοθετης_has_σκηνοθετης_σκηνο_idx` (`σκηνοθετης_key1` ASC) VISIBLE,
  INDEX `fk_σκηνοθετης_has_σκηνοθετης_σκηνο_idx1` (`σκηνοθετης_key` ASC) VISIBLE,
  CONSTRAINT `fk_σκηνοθετης_has_σκηνοθετης_σκηνοθ1`
    FOREIGN KEY (`σκηνοθετης_key`)
    REFERENCES `mydb`.`σκηνοθετης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_σκηνοθετης_has_σκηνοθετης_σκηνοθ2`
    FOREIGN KEY (`σκηνοθετης_key1`)
    REFERENCES `mydb`.`σκηνοθετης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`πόλη`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`πόλη` (
  `key` INT NOT NULL,
  `ονομα` VARCHAR(45) NOT NULL,
  `χωρα_key` INT NOT NULL,
  PRIMARY KEY (`key`),
  INDEX `fk_πόλη_χωρα1_idx` (`χωρα_key` ASC) VISIBLE,
  CONSTRAINT `fk_πόλη_χωρα1`
    FOREIGN KEY (`χωρα_key`)
    REFERENCES `mydb`.`χωρα` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`σκηνικά`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`σκηνικά` (
  `key` INT NOT NULL,
  `ονομα` VARCHAR(45) NOT NULL,
  `χωρα_key` INT NOT NULL,
  `διεθνής_key` INT NOT NULL,
  PRIMARY KEY (`key`),
  INDEX `fk_σκηνικά_χωρα1_idx` (`χωρα_key` ASC) VISIBLE,
  INDEX `fk_σκηνικά_διεθνής1_idx` (`διεθνής_key` ASC) VISIBLE,
  CONSTRAINT `fk_σκηνικά_χωρα1`
    FOREIGN KEY (`χωρα_key`)
    REFERENCES `mydb`.`χωρα` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_σκηνικά_διεθνής1`
    FOREIGN KEY (`διεθνής_key`)
    REFERENCES `mydb`.`διεθνής` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`εγχώρια_has_σκηνικά`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`εγχώρια_has_σκηνικά` (
  `εγχώρια_key` INT NOT NULL,
  `σκηνικά_key` INT NOT NULL,
  PRIMARY KEY (`εγχώρια_key`, `σκηνικά_key`),
  INDEX `fk_εγχώρια_has_σκηνικά_σκηνικά1_idx` (`σκηνικά_key` ASC) VISIBLE,
  INDEX `fk_εγχώρια_has_σκηνικά_εγχώρια1_idx` (`εγχώρια_key` ASC) VISIBLE,
  CONSTRAINT `fk_εγχώρια_has_σκηνικά_εγχώρια1`
    FOREIGN KEY (`εγχώρια_key`)
    REFERENCES `mydb`.`εγχώρια` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_εγχώρια_has_σκηνικά_σκηνικά1`
    FOREIGN KEY (`σκηνικά_key`)
    REFERENCES `mydb`.`σκηνικά` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`διεθνής_has_χωρα`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`διεθνής_has_χωρα` (
  `διεθνής_key` INT NOT NULL,
  `χωρα_key` INT NOT NULL,
  PRIMARY KEY (`διεθνής_key`, `χωρα_key`),
  INDEX `fk_διεθνής_has_χωρα_χωρα1_idx` (`χωρα_key` ASC) VISIBLE,
  INDEX `fk_διεθνής_has_χωρα_διεθνής1_idx` (`διεθνής_key` ASC) VISIBLE,
  CONSTRAINT `fk_διεθνής_has_χωρα_διεθνής1`
    FOREIGN KEY (`διεθνής_key`)
    REFERENCES `mydb`.`διεθνής` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_διεθνής_has_χωρα_χωρα1`
    FOREIGN KEY (`χωρα_key`)
    REFERENCES `mydb`.`χωρα` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`χορηγος`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`χορηγος` (
  `key` INT NOT NULL,
  `ονομα` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`χορηγεί`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`χορηγεί` (
  `χορηγος_key` INT NOT NULL,
  `ταινια_key` INT NOT NULL,
  `ποσο` INT NOT NULL,
  PRIMARY KEY (`χορηγος_key`, `ταινια_key`),
  INDEX `fk_χορηγος_has_ταινια_ταινια1_idx` (`ταινια_key` ASC) VISIBLE,
  INDEX `fk_χορηγος_has_ταινια_χορηγος1_idx` (`χορηγος_key` ASC) VISIBLE,
  CONSTRAINT `fk_χορηγος_has_ταινια_χορηγος1`
    FOREIGN KEY (`χορηγος_key`)
    REFERENCES `mydb`.`χορηγος` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_χορηγος_has_ταινια_ταινια1`
    FOREIGN KEY (`ταινια_key`)
    REFERENCES `mydb`.`ταινια` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`κειμενο`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`κειμενο` (
  `key` INT NOT NULL,
  `περιεχομενο` VARCHAR(45) NOT NULL,
  `σεναριο_key` INT NOT NULL,
  `προηγουμενο_κειμενο_key` INT NULL,
  `διαρκεια` INT NOT NULL,
  PRIMARY KEY (`key`),
  INDEX `fk_κειμενο_σεναριο1_idx` (`σεναριο_key` ASC) VISIBLE,
  INDEX `fk_κειμενο_κειμενο1_idx` (`προηγουμενο_κειμενο_key` ASC) VISIBLE,
  CONSTRAINT `fk_κειμενο_σεναριο1`
    FOREIGN KEY (`σεναριο_key`)
    REFERENCES `mydb`.`σεναριο` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_κειμενο_κειμενο1`
    FOREIGN KEY (`προηγουμενο_κειμενο_key`)
    REFERENCES `mydb`.`κειμενο` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ταινια_has_ηθοποιος`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ταινια_has_ηθοποιος` (
  `ταινια_key` INT NOT NULL,
  `ηθοποιος_key` INT NOT NULL,
  PRIMARY KEY (`ταινια_key`, `ηθοποιος_key`),
  INDEX `fk_ταινια_has_ηθοποιος_ηθοποιος1_idx` (`ηθοποιος_key` ASC) VISIBLE,
  INDEX `fk_ταινια_has_ηθοποιος_ταινια1_idx` (`ταινια_key` ASC) VISIBLE,
  CONSTRAINT `fk_ταινια_has_ηθοποιος_ταινια1`
    FOREIGN KEY (`ταινια_key`)
    REFERENCES `mydb`.`ταινια` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ταινια_has_ηθοποιος_ηθοποιος1`
    FOREIGN KEY (`ηθοποιος_key`)
    REFERENCES `mydb`.`ηθοποιος` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`χωρα_has_ηθοποιος`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`χωρα_has_ηθοποιος` (
  `χωρα_key` INT NOT NULL,
  `ηθοποιος_key` INT NOT NULL,
  PRIMARY KEY (`χωρα_key`, `ηθοποιος_key`),
  INDEX `fk_χωρα_has_ηθοποιος_ηθοποιος1_idx` (`ηθοποιος_key` ASC) VISIBLE,
  INDEX `fk_χωρα_has_ηθοποιος_χωρα1_idx` (`χωρα_key` ASC) VISIBLE,
  CONSTRAINT `fk_χωρα_has_ηθοποιος_χωρα1`
    FOREIGN KEY (`χωρα_key`)
    REFERENCES `mydb`.`χωρα` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_χωρα_has_ηθοποιος_ηθοποιος1`
    FOREIGN KEY (`ηθοποιος_key`)
    REFERENCES `mydb`.`ηθοποιος` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ηθοποιος_has_ρολος`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ηθοποιος_has_ρολος` (
  `ηθοποιος_key` INT NOT NULL,
  `ρολος_key` INT NOT NULL,
  PRIMARY KEY (`ηθοποιος_key`, `ρολος_key`),
  INDEX `fk_ηθοποιος_has_ρολος_ρολος1_idx` (`ρολος_key` ASC) VISIBLE,
  INDEX `fk_ηθοποιος_has_ρολος_ηθοποιος1_idx` (`ηθοποιος_key` ASC) VISIBLE,
  CONSTRAINT `fk_ηθοποιος_has_ρολος_ηθοποιος1`
    FOREIGN KEY (`ηθοποιος_key`)
    REFERENCES `mydb`.`ηθοποιος` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ηθοποιος_has_ρολος_ρολος1`
    FOREIGN KEY (`ρολος_key`)
    REFERENCES `mydb`.`ρολος` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ηθοποιος_has_χαρακτηριστικα`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ηθοποιος_has_χαρακτηριστικα` (
  `ηθοποιος_key` INT NOT NULL,
  `χαρακτηριστικα_key` INT NOT NULL,
  `τιμη` FLOAT NOT NULL,
  PRIMARY KEY (`ηθοποιος_key`, `χαρακτηριστικα_key`),
  INDEX `fk_ηθοποιος_has_χαρακτηριστικα_χαρ_idx` (`χαρακτηριστικα_key` ASC) VISIBLE,
  INDEX `fk_ηθοποιος_has_χαρακτηριστικα_ηθο_idx` (`ηθοποιος_key` ASC) VISIBLE,
  CONSTRAINT `fk_ηθοποιος_has_χαρακτηριστικα_ηθοπ1`
    FOREIGN KEY (`ηθοποιος_key`)
    REFERENCES `mydb`.`ηθοποιος` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ηθοποιος_has_χαρακτηριστικα_χαρα1`
    FOREIGN KEY (`χαρακτηριστικα_key`)
    REFERENCES `mydb`.`χαρακτηριστικα` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ηθοποιος_has_προγραμμα εκπαιδευσης`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ηθοποιος_has_προγραμμα εκπαιδευσης` (
  `ηθοποιος_key` INT NOT NULL,
  `προγραμμα εκπαιδευσης_key` INT NOT NULL,
  PRIMARY KEY (`ηθοποιος_key`, `προγραμμα εκπαιδευσης_key`),
  INDEX `fk_ηθοποιος_has_προγραμμα εκπαιδευ_idx` (`προγραμμα εκπαιδευσης_key` ASC) VISIBLE,
  INDEX `fk_ηθοποιος_has_προγραμμα εκπαιδευ_idx1` (`ηθοποιος_key` ASC) VISIBLE,
  CONSTRAINT `fk_ηθοποιος_has_προγραμμα εκπαιδευσ1`
    FOREIGN KEY (`ηθοποιος_key`)
    REFERENCES `mydb`.`ηθοποιος` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ηθοποιος_has_προγραμμα εκπαιδευσ2`
    FOREIGN KEY (`προγραμμα εκπαιδευσης_key`)
    REFERENCES `mydb`.`προγραμμα εκπαιδευσης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`προγραμμα εκπαιδευσης_has_χαρακτηριστικα`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`προγραμμα εκπαιδευσης_has_χαρακτηριστικα` (
  `προγραμμα εκπαιδευσης_key` INT NOT NULL,
  `χαρακτηριστικα_key` INT NOT NULL,
  `Συντελεστης` INT NULL,
  PRIMARY KEY (`προγραμμα εκπαιδευσης_key`, `χαρακτηριστικα_key`),
  INDEX `fk_προγραμμα εκπαιδευσης_has_χαρακ_idx` (`χαρακτηριστικα_key` ASC) VISIBLE,
  INDEX `fk_προγραμμα εκπαιδευσης_has_χαρακ_idx1` (`προγραμμα εκπαιδευσης_key` ASC) VISIBLE,
  CONSTRAINT `fk_προγραμμα εκπαιδευσης_has_χαρακτ1`
    FOREIGN KEY (`προγραμμα εκπαιδευσης_key`)
    REFERENCES `mydb`.`προγραμμα εκπαιδευσης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_προγραμμα εκπαιδευσης_has_χαρακτ2`
    FOREIGN KEY (`χαρακτηριστικα_key`)
    REFERENCES `mydb`.`χαρακτηριστικα` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ΑΙ_has_ειδος ταινιας`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ΑΙ_has_ειδος ταινιας` (
  `ΑΙ_key` INT NOT NULL,
  `ειδος ταινιας_key` INT NOT NULL,
  PRIMARY KEY (`ΑΙ_key`, `ειδος ταινιας_key`),
  INDEX `fk_ΑΙ_has_ειδος ταινιας_ειδος ταινι_idx` (`ειδος ταινιας_key` ASC) VISIBLE,
  INDEX `fk_ΑΙ_has_ειδος ταινιας_ΑΙ1_idx` (`ΑΙ_key` ASC) VISIBLE,
  CONSTRAINT `fk_ΑΙ_has_ειδος ταινιας_ΑΙ1`
    FOREIGN KEY (`ΑΙ_key`)
    REFERENCES `mydb`.`ΑΙ` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ΑΙ_has_ειδος ταινιας_ειδος ταινια1`
    FOREIGN KEY (`ειδος ταινιας_key`)
    REFERENCES `mydb`.`ειδος ταινιας` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`διοργανωση_has_σκηνοθετης`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`διοργανωση_has_σκηνοθετης` (
  `διοργανωση_key` INT NOT NULL,
  `σκηνοθετης_key` INT NOT NULL,
  PRIMARY KEY (`διοργανωση_key`, `σκηνοθετης_key`),
  INDEX `fk_διοργανωση_has_σκηνοθετης_σκηνο_idx` (`σκηνοθετης_key` ASC) VISIBLE,
  INDEX `fk_διοργανωση_has_σκηνοθετης_διοργ_idx` (`διοργανωση_key` ASC) VISIBLE,
  CONSTRAINT `fk_διοργανωση_has_σκηνοθετης_διοργα1`
    FOREIGN KEY (`διοργανωση_key`)
    REFERENCES `mydb`.`διοργανωση` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_διοργανωση_has_σκηνοθετης_σκηνοθ1`
    FOREIGN KEY (`σκηνοθετης_key`)
    REFERENCES `mydb`.`σκηνοθετης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`διοργανωση_has_ταινια`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`διοργανωση_has_ταινια` (
  `διοργανωση_key` INT NOT NULL,
  `διοργανωση_βραβεια_key` INT NOT NULL,
  `ταινια_key` INT NOT NULL,
  `στατιστικα ταινιας` VARCHAR(45) NULL,
  PRIMARY KEY (`διοργανωση_key`, `διοργανωση_βραβεια_key`, `ταινια_key`),
  INDEX `fk_διοργανωση_has_ταινια_ταινια1_idx` (`ταινια_key` ASC) VISIBLE,
  INDEX `fk_διοργανωση_has_ταινια_διοργανωσ_idx` (`διοργανωση_key` ASC, `διοργανωση_βραβεια_key` ASC) VISIBLE,
  CONSTRAINT `fk_διοργανωση_has_ταινια_διοργανωση1`
    FOREIGN KEY (`διοργανωση_key` , `διοργανωση_βραβεια_key`)
    REFERENCES `mydb`.`διοργανωση` (`key` , `βραβεια_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_διοργανωση_has_ταινια_ταινια1`
    FOREIGN KEY (`ταινια_key`)
    REFERENCES `mydb`.`ταινια` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`κοινωνικοδικτυο`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`κοινωνικοδικτυο` (
  `key` INT NOT NULL,
  PRIMARY KEY (`key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`διοργανωση_has_κοινωνικοδικτυο`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`διοργανωση_has_κοινωνικοδικτυο` (
  `διοργανωση_key` INT NOT NULL,
  `κοινωνικοδικτυο_key` INT NOT NULL,
  PRIMARY KEY (`διοργανωση_key`, `κοινωνικοδικτυο_key`),
  INDEX `fk_διοργανωση_has_κοινωνικοδικτυο__idx` (`κοινωνικοδικτυο_key` ASC) VISIBLE,
  INDEX `fk_διοργανωση_has_κοινωνικοδικτυο__idx1` (`διοργανωση_key` ASC) VISIBLE,
  CONSTRAINT `fk_διοργανωση_has_κοινωνικοδικτυο_δ1`
    FOREIGN KEY (`διοργανωση_key`)
    REFERENCES `mydb`.`διοργανωση` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_διοργανωση_has_κοινωνικοδικτυο_κ1`
    FOREIGN KEY (`κοινωνικοδικτυο_key`)
    REFERENCES `mydb`.`κοινωνικοδικτυο` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ταινια_has_κοινωνικοδικτυο`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ταινια_has_κοινωνικοδικτυο` (
  `ταινια_key` INT NOT NULL,
  `κοινωνικοδικτυο_key` INT NOT NULL,
  `likes` INT NULL,
  PRIMARY KEY (`ταινια_key`, `κοινωνικοδικτυο_key`),
  INDEX `fk_ταινια_has_κοινωνικοδικτυο_κοιν_idx` (`κοινωνικοδικτυο_key` ASC) VISIBLE,
  INDEX `fk_ταινια_has_κοινωνικοδικτυο_ταιν_idx` (`ταινια_key` ASC) VISIBLE,
  CONSTRAINT `fk_ταινια_has_κοινωνικοδικτυο_ταινι1`
    FOREIGN KEY (`ταινια_key`)
    REFERENCES `mydb`.`ταινια` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ταινια_has_κοινωνικοδικτυο_κοινω1`
    FOREIGN KEY (`κοινωνικοδικτυο_key`)
    REFERENCES `mydb`.`κοινωνικοδικτυο` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`σκηνοθετης_has_φιλο_σκηνοθετης`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`σκηνοθετης_has_φιλο_σκηνοθετης` (
  `σκηνοθετης_key` INT NOT NULL,
  `σκηνοθετης_key1` INT NOT NULL,
  PRIMARY KEY (`σκηνοθετης_key`, `σκηνοθετης_key1`),
  INDEX `fk_σκηνοθετης_has_σκηνοθετης_σκηνο_idx` (`σκηνοθετης_key1` ASC) VISIBLE,
  INDEX `fk_σκηνοθετης_has_σκηνοθετης_σκηνο_idx1` (`σκηνοθετης_key` ASC) VISIBLE,
  CONSTRAINT `fk_σκηνοθετης_has_σκηνοθετης_σκηνοθ3`
    FOREIGN KEY (`σκηνοθετης_key`)
    REFERENCES `mydb`.`σκηνοθετης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_σκηνοθετης_has_σκηνοθετης_σκηνοθ4`
    FOREIGN KEY (`σκηνοθετης_key1`)
    REFERENCES `mydb`.`σκηνοθετης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`διοργανωση_has_βραβειο`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`διοργανωση_has_βραβειο` (
  `διοργανωση_key` INT NOT NULL,
  `διοργανωση_βραβεια_key` INT NOT NULL,
  `βραβειο_key` INT NOT NULL,
  PRIMARY KEY (`διοργανωση_key`, `διοργανωση_βραβεια_key`, `βραβειο_key`),
  INDEX `fk_διοργανωση_has_βραβειο_βραβειο1_idx` (`βραβειο_key` ASC) VISIBLE,
  INDEX `fk_διοργανωση_has_βραβειο_διοργανω_idx` (`διοργανωση_key` ASC, `διοργανωση_βραβεια_key` ASC) VISIBLE,
  CONSTRAINT `fk_διοργανωση_has_βραβειο_διοργανωσ1`
    FOREIGN KEY (`διοργανωση_key` , `διοργανωση_βραβεια_key`)
    REFERENCES `mydb`.`διοργανωση` (`key` , `βραβεια_key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_διοργανωση_has_βραβειο_βραβειο1`
    FOREIGN KEY (`βραβειο_key`)
    REFERENCES `mydb`.`βραβειο` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`σκηνοθετης_has_κοινωνικοδικτυο`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`σκηνοθετης_has_κοινωνικοδικτυο` (
  `σκηνοθετης_key` INT NOT NULL,
  `κοινωνικοδικτυο_key` INT NOT NULL,
  PRIMARY KEY (`σκηνοθετης_key`, `κοινωνικοδικτυο_key`),
  INDEX `fk_σκηνοθετης_has_κοινωνικοδικτυο__idx` (`κοινωνικοδικτυο_key` ASC) VISIBLE,
  INDEX `fk_σκηνοθετης_has_κοινωνικοδικτυο__idx1` (`σκηνοθετης_key` ASC) VISIBLE,
  CONSTRAINT `fk_σκηνοθετης_has_κοινωνικοδικτυο_σ1`
    FOREIGN KEY (`σκηνοθετης_key`)
    REFERENCES `mydb`.`σκηνοθετης` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_σκηνοθετης_has_κοινωνικοδικτυο_κ1`
    FOREIGN KEY (`κοινωνικοδικτυο_key`)
    REFERENCES `mydb`.`κοινωνικοδικτυο` (`key`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
