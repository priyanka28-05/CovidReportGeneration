CREATE DATABASE users

CREATE TABLE `login` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) 

INSERT INTO `users`.`login` (`username`, `password`) VALUES ("admin", "admin");