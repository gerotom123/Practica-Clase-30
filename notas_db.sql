DROP DATABASE IF EXISTS notas_db;
CREATE DATABASE notas_db;
USE notas_db;

CREATE TABLE `usuarios` (
  `idUser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci,
  `email` varchar(100) COLLATE utf8_unicode_ci,
  PRIMARY KEY (`idUser`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into `usuarios`  values (1, 'Gero', 'geronimo.tomsin@hotmail.com');
insert into `usuarios` values (2, 'mati', 'matimorz@gmail.com');
insert into `usuarios` values (3, 'lucas', 'lucasDev@nasa.gov');
insert into `usuarios`  values (4, 'sol', 'solstu@gmail.com');
insert into `usuarios`  values (5, 'camila', 'camila.perez@yahoo.com');
insert into `usuarios`  values (6, 'Vero', 'veritas@gmail.com');
insert into `usuarios`  values (7, 'martin', 'tinchocarp@gmail.com');
insert into `usuarios` values (8, 'gonza', 'gonza@DH.com');
insert into `usuarios`  values (9, 'rodri', 'rodrikpo@yahoo.com');
insert into `usuarios` values (10, 'fede', 'fede_canalla@hotmail.com');





 
 CREATE TABLE `notas` (
  `idNota` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int(10) unsigned NOT NULL,
  `tittle` varchar(100) COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `can_deleted` boolean not NULL default 1,
  `updated_at` timestamp NULL DEFAULT NULL,
   `created_at` timestamp NULL DEFAULT NULL,

  PRIMARY KEY (`idNota`),
 
  CONSTRAINT `usuarios_idUser_foreign` FOREIGN KEY (`idUser`) REFERENCES `usuarios` (`idUser`)
  
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into notas (idNota, idUser, tittle, description, can_deleted, created_at, updated_at) values
(1, 1, 'Prohaska', 'intartic extn right ulna, init', true, '2019-09-19 12:53:36', '2021-08-15 20:48:40'),
(2, 2, 'Lindgren-Ledner''s Smile  (Il sorriso di mia madre)', 'Sprain of interphalangeal joint of right great toe, subs', false, '2020-05-17 23:13:49', '2021-06-21 06:21:48'),
(3, 3, 'Strosin  Wolves, The', 'Injury of nerves at ankle and foot level, right leg, subs', false, '2018-06-21 23:02:10', '2021-06-17 07:20:02'),
(4, 4, 'Luettgen LLC, The', 'Nondisp fx of dist phalanx of r thm, 7thG', false, '2021-06-07 07:48:26', '2021-09-01 06:05:30'),
(5, 5, 'McLaughlin-Grady', 'Adverse effect of methadone, sequela', true, '2018-06-03 12:00:48', '2021-10-14 23:23:05'),
(6, 6, 'Bahringer-Cartwright', 'Displ unsp condyle fx low end r femr, 7thE', true, '2018-05-20 02:14:41', '2021-09-06 18:54:45'),
(7, 7, 'Howell, The', 'Displ suprcndl fx w intrcndl extn low end r femr, 7thD', true, '2018-08-10 00:41:52', '2021-12-30 21:24:12'),
(8, 8, 'Prosacco, Bernhard and Homenick', 'Poisoning by oth topical agents, accidental, init', false, '2017-02-11 10:42:29', '2022-04-02 02:55:01'),
(9, 9, 'Pfannerstill, Schmitt and Kunze', 'Leucocoria', true, '2010-01-13 06:33:42', '2022-04-12 19:01:20'),
(10, 10, 'Harvey-Marvin', 'civilian, subs', true, '2020-03-13 16:04:15', '2019-10-20 12:12:04');



CREATE TABLE `categorias` (
  `IdCat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci,
  PRIMARY KEY (`idCat`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

insert into categorias (idCat, name) values (1, 'Mecanica');
insert into categorias (idCat, name) values (2, 'Electrodomesticos');
insert into categorias (idCat, name) values (3, 'Ropa niños');
insert into categorias (idCat, name) values (4, 'Ropa');
insert into categorias (idCat, name) values (5, 'Alimentos');
insert into categorias (idCat, name) values (6, 'Garage');
insert into categorias (idCat, name) values (7, 'Zapatillas');


 
 
CREATE TABLE `notas_categorias` (
  `Id_nota_categoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdCat`  int(10) unsigned NOT NULL,
  `IdNota`  int(10) unsigned NOT null,
  PRIMARY KEY (`id_nota_categoria`),
  CONSTRAINT `categoria_idCat_foreign` FOREIGN KEY (`IdCat`) REFERENCES `categorias` (`IdCat`),
  CONSTRAINT `notas_idNota_foreign` FOREIGN KEY (`IdNota`) REFERENCES `notas` (`IdNota`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
 insert into notas_categorias (IdCat, IdNota) values 
 (1, 1), (1, 2), (1, 3), (1,4), (1,5), (1,6), (1,7), (1,8), (1, 9), (1,10);


CREATE TABLE `auditoria` (
  `idAudit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idNota` int(10) unsigned NOT NULL,
  `idUser` int(10) unsigned NOT NULL,
  `gestion` enum('creación','modificación','eliminación') NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idAudit`),
  CONSTRAINT `auditoria_notas_idNota` FOREIGN KEY (`idNota`) REFERENCES `notas` (`idNota`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auditoria_usuarios_idUser` FOREIGN KEY (`idUser`) REFERENCES `usuarios` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into auditoria (idNota, idUser, gestion) values 
(1,1, 'creación' ), (2,1, 'creación' ), (3,1, 'creación' ),
(4,1, 'creación' ), (5,1, 'creación' ), (6,1, 'creación' ),
(7,1, 'creación' ), (8,1, 'creación' ), (9,1, 'creación' ), (10,1, 'creación' );
 


