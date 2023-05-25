CREATE DATABASE  AIRLINE;

CREATE TABLE appareil (
  `idappareil` INT NOT NULL,
  `type appareil` VARCHAR(4) NOT NULL,
  `Capacite passager` INT NOT NULL,
  PRIMARY KEY (`idappareil`));
  
  CREATE TABLE billet (
  `id billet` VARCHAR(5) NOT NULL,
  `id depart` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id billet`),
  INDEX `id depart_idx` (`id depart` ASC) ,
  CONSTRAINT `id depart`
    FOREIGN KEY (`id depart`)
    REFERENCES `AIRLINE`.`depart` (`id depart`));
   
   
   CREATE TABLE depart (
  `id depart` VARCHAR(5) NOT NULL,
  `Date de depart` VARCHAR(45) NOT NULL,
  `Numero de vol` INT NOT NULL,
  `place libre` INT NOT NULL,
  `Place occupe` INT NOT NULL,
  `id pilotes` VARCHAR(5) NOT NULL,
  `id hotesse` VARCHAR(5) NOT NULL,
  `id steward` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id depart`),
  INDEX `Numero de vol_idx` (`Numero de vol` ASC) ,
  INDEX `id pilotes_idx` (`id pilotes` ASC) ,
  INDEX `id hotesse_idx` (`id hotesse` ASC) ,
  INDEX `id steward_idx` (`id steward` ASC) ,
  CONSTRAINT `Numero de vol`
    FOREIGN KEY (`Numero de vol`)
    REFERENCES `AIRLINE`.`Vol` (`Numero de vol`),
  CONSTRAINT `id pilotes`
    FOREIGN KEY (`id pilotes`)
    REFERENCES `AIRLINE`.`pilotes` (`idpilotes`),
  CONSTRAINT `id hotesse`
    FOREIGN KEY (`id hotesse`)
    REFERENCES `AIRLINE`.`hotesse` (`id hotesse`),
  CONSTRAINT `id steward`
    FOREIGN KEY (`id steward`)
    REFERENCES `AIRLINE`.`Steward` (`id Steward`));
    
    CREATE TABLE employes (
  `id employes` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Prenom` VARCHAR(45) NOT NULL,
  `Adresse` VARCHAR(45) NOT NULL,
  `Numero de securite sociale` VARCHAR(45) NOT NULL,
  `Salaire` INT NOT NULL,
  `Fonction` VARCHAR(45) NOT NULL,
  `Numero de licence` VARCHAR(45),
  PRIMARY KEY (`id employes`));
  
  CREATE TABLE hotesse (
  `id hotesse` VARCHAR(5) NOT NULL,
  `id employes` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id hotesse`),
  INDEX `id employes_idx` (`id employes` ASC) ,
  CONSTRAINT `id employes`
    FOREIGN KEY (`id employes`)
    REFERENCES `AIRLINE`.`employes` (`id employes`));
    
    CREATE TABLE itineraire (
  `id itineraire` VARCHAR(5) NOT NULL,
  `Numero de vol` INT NOT NULL,
  `Ville d'origine` VARCHAR(45) NOT NULL,
  `ville de destination` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id itineraire`),
  INDEX `Numero de vol_idx` (`Numero de vol` ASC) ,
  CONSTRAINT `Numero de vol`
    FOREIGN KEY (`Numero de vol`)
    REFERENCES `AIRLINE`.`Vol` (`Numero de vol`));
    
    CREATE TABLE passager (
  `idpassager` VARCHAR(5) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Prenom` VARCHAR(45) NOT NULL,
  `sexe` VARCHAR(1) NOT NULL,
  `Adresse` VARCHAR(45) NOT NULL,
  `Profession` VARCHAR(45) NOT NULL,
  `Banque` VARCHAR(45) NOT NULL,
  `Nationalite` VARCHAR(45) NOT NULL,
  `Numero de telephone` INT NOT NULL,
  `Numero de billets` VARCHAR(5) NOT NULL,
  `Numero de ticket` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`idpassager`),
  INDEX `Numero de ticket_idx` (`Numero de ticket` ASC) ,
  INDEX `Numero de billet_idx` (`Numero de billets` ASC) ,
  CONSTRAINT `Numero de ticket`
    FOREIGN KEY (`Numero de ticket`)
    REFERENCES `AIRLINE`.`Ticket` (`Numero de ticket`),
  CONSTRAINT `Numero de billet`
    FOREIGN KEY (`Numero de billets`)
    REFERENCES `AIRLINE`.`billet` (`id billet`));
    
    
    CREATE TABLE pilotes (
  `idpilotes` VARCHAR(5) NOT NULL,
  `id employes` VARCHAR(45) NOT NULL,
  INDEX `id employes_idx` (`id employes` ASC) ,
  PRIMARY KEY (`idpilotes`),
  CONSTRAINT `id employes`
    FOREIGN KEY (`id employes`)
    REFERENCES `AIRLINE`.`employes` (`id employes`));
    
    CREATE TABLE Steward (
  `id Steward` VARCHAR(5) NOT NULL,
  `id employes` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id Steward`),
  INDEX `id employes_idx` (`id employes` ASC) ,
  CONSTRAINT `id employes`
    FOREIGN KEY (`id employes`)
    REFERENCES `AIRLINE`.`employes` (`id employes`));
   
   CREATE TABLE Ticket (
  `Numero de ticket` VARCHAR(5) NOT NULL,
  `Date d'emission` VARCHAR(15) NOT NULL,
  `Prix` INT NOT NULL,
  `idpassager` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`Numero de ticket`),
  INDEX `idpassager_idx` (`idpassager` ASC) ,
  CONSTRAINT `idpassager`
    FOREIGN KEY (`idpassager`)
    REFERENCES `AIRLINE`.`passager` (`idpassager`));
    
    CREATE TABLE Vol (
  `Numero de vol` INT NOT NULL,
  `Heure de depart` VARCHAR(5) NOT NULL,
  `Heure d'arrivee` VARCHAR(5) NOT NULL,
  `id itirenaire` VARCHAR(5) NOT NULL,
  `id appareil` INT NOT NULL,
  `id depart` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`Numero de vol`),
  INDEX `id appareil_idx` (`id appareil` ASC) ,
  INDEX `id itirenaire_idx` (`id itirenaire` ASC) ,
  INDEX `id depart_idx` (`id depart` ASC) ,
  CONSTRAINT `id appareil`
    FOREIGN KEY (`id appareil`)
    REFERENCES `AIRLINE`.`appareil` (`idappareil`),
  CONSTRAINT `id itirenaire`
    FOREIGN KEY (`id itirenaire`)
    REFERENCES `AIRLINE`.`itineraire` (`idi itineraire`),
  CONSTRAINT `id depart`
    FOREIGN KEY (`id depart`)
    REFERENCES `AIRLINE`.`depart` (`id depart`));
   
   
 INSERT INTO appareil (`idappareil`, `type appareil`, `Capacite passager`) VALUES (58GH, 'A320', 700);
INSERT INTO appareil (`idappareil`, `type appareil`, `Capacite passager`) VALUES (57GH, 'B747', 800);

INSERT INTO billet (`id billet`, `id depart`) VALUES ('14FG', '1a');
INSERT INTO billet (`id billet`, `id depart`) VALUES ('15FG', '1b');

INSERT INTO depart (`id depart`, `Date de depart`, `Numero de vol`, `place libre`, `Place occupe`, `id pilotes`, `id hotesse`, `id steward`) VALUES ('1a', '10/01/2019', 1, 500, 800, '14C', '14D', '14E');
INSERT INTO depart (`id depart`, `Date de depart`, `Numero de vol`, `place libre`, `Place occupe`, `id pilotes`, `id hotesse`, `id steward`) VALUES ('1b', '11/01/2019', 2, 300, 900, '15C', '14D', '14E');

INSERT INTO employes (`id employes`, `Nom`, `Prenom`, `Adresse`, `Numero de securite sociale`, `Salaire`, `Fonction`, `Numero de licence`) VALUES ('AB1', 'KOUEMOU', 'YVAN', '16 RUE BARCELONE', '99AB12', 10000, 'pilote', '12345');
INSERT INTO employes (`id employes`, `Nom`, `Prenom`, `Adresse`, `Numero de securite sociale`, `Salaire`, `Fonction`, `Numero de licence`) VALUES ('BC5', 'MARFOURE', 'NICOLAS', '14 RUE MADRID', '99AB13', 10000, 'hotesse', '');
INSERT INTO employes (`id employes`, `Nom`, `Prenom`, `Adresse`, `Numero de securite sociale`, `Salaire`, `Fonction`, `Numero de licence`) VALUES ('DE6', 'CHAVANNE', 'LUCAS', '15 RUE DORTMUND', '99AB13', 50000, 'steward', DEFAULT);

INSERT INTO hotesse (`id hotesse`, `id employes`) VALUES ('14D', 'BC5');

INSERT INTO itineraire (`id itineraire`, `Numero de vol`, `Ville d'origine`, `ville de destination`) VALUES ('78OP', 1, 'STRASBOURG', 'PARIS');
INSERT INTO itineraire (`id itineraire`, `Numero de vol`, `Ville d'origine`, `ville de destination`) VALUES ('79OP', 2, 'DUBAI', 'DOUALA');
   
INSERT INTO passager (`idpassager`, `Nom`, `Prenom`, `sexe`, `Adresse`, `Profession`, `Banque`, `Nationalite`, `Numero de telephone`, `Numero de billets`, `Numero de ticket`) VALUES ('78ZA', 'MESSI', 'LIONEL', 'M', '14 ROUTE BARCELONE', 'FOOTBALLEUR', 'SG', 'ARGENTIN', 0145565582, '14FG', '16GH');
INSERT INTO passager (`idpassager`, `Nom`, `Prenom`, `sexe`, `Adresse`, `Profession`, `Banque`, `Nationalite`, `Numero de telephone`, `Numero de billets`, `Numero de ticket`) VALUES ('77ZA ', 'NEYMAR', 'JUNIOR', 'M', '14 ROUTE PARIS', 'FOOTBALLEUR', 'SG', 'BRESILIEN', 1202525525, '15FG', '15GH');

INSERT INTO pilotes (`idpilotes`, `id employes`) VALUES ('14C', 'AB1');

INSERT INTO Steward (`id Steward`, `id employes`) VALUES ('14E', 'DE6');

INSERT INTO Ticket (`Numero de ticket`, `Date d'emission`, `Prix`, `idpassager`) VALUES ('16GH', '25/12/2018', 1000, '78ZA');
INSERT INTO Ticket (`Numero de ticket`, `Date d'emission`, `Prix`, `idpassager`) VALUES ('15GH', '23/11/2018', 1000, '77ZA');

INSERT INTO Vol (`Numero de vol`, `Heure de depart`, `Heure d'arrivee`, `id itirenaire`, `id appareil`, `id depart`) VALUES (1, '05H00', '10H00', '78OP', 58GH, '1a');
INSERT INTO Vol (`Numero de vol`, `Heure de depart`, `Heure d'arrivee`, `id itirenaire`, `id appareil`, `id depart`) VALUES (2, '11H00', '14H00', '79OP', 57GH, '1b');

select* from appareil;

select* from employes
where Salaire = 10000;

select* from employes;

select* from passager;

select* from vol
where 'id itirenaire' = '78OP';

select* from depart
where 'Date de depart' = '10/01/2019';

select 'ville de destination' from itineraire;

select* from employes
where 'Date de validite' > '01/03/2024';


