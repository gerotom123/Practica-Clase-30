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
insert into `usuarios`  values (11, 'martin', 'tinchocarp@gmail.com');
insert into `usuarios` values (8, 'gonza', 'gonza@DH.com');
insert into `usuarios`  values (9, 'rodriverdu', 'rodrikpo@yahoo.com');
insert into `usuarios` values (10, 'fede', 'fede_canalla@hotmail.com');



/*select *
from usuarios u */


 
 CREATE TABLE `notas` (
  `idNota` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idUser` int(10) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci,
  `descripcion` text COLLATE utf8_unicode_ci,
  `can_deleted` boolean not NULL default 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idNota`),
  /*key `usuarios_idUser_foreign` (`idUser`),*/
  CONSTRAINT `usuarios_idUser_foreign` FOREIGN KEY (`idUser`) REFERENCES `usuarios` (`idUser`)
  
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert into notas (idNota, idUser, title, descripcion, can_deleted, created_at, updated_at) values
(1, 1, 'Norma Jean & Marilyn', 'Nondisp fx of olecran pro w intartic extn right ulna, init', false, '2020-04-29 06:00:12', '2019-07-19 18:26:59'),
(2, 1, 'My Mother''s Smile (a.k.a. The Religion Hour) (L''ora di religione) (Il sorriso di mia madre)', 'Sprain of interphalangeal joint of right great toe, subs', true, '2020-04-25 14:45:00', '2019-12-28 18:20:51'),
(3, 1, 'Sea Wolves, The', 'Injury of nerves at ankle and foot level, right leg, subs', true, '2020-01-01 16:03:36', '2020-03-05 13:48:46'),
(4, 1, 'Nightmare Before Christmas, The', 'Nondisp fx of dist phalanx of r thm, 7thG', true, '2020-01-17 00:37:48', '2019-12-08 12:40:43'),
(5, 1, 'Murder on a Sunday Morning (Un coupable idéal)', 'Adverse effect of methadone, sequela', true, '2019-07-27 03:47:16', '2019-09-18 19:07:23'),
(6, 1, 'The Conrad Boys', 'Displ unsp condyle fx low end r femr, 7thE', true, '2019-07-09 21:56:29', '2019-08-30 03:37:55'),
(7, 1, 'Prisoner of Zenda, The', 'Displ suprcndl fx w intrcndl extn low end r femr, 7thD', false, '2019-07-10 19:38:45', '2020-03-23 17:14:12'),
(8, 1, 'Beauty and the Bastard (Tyttö sinä olet tähti)', 'Poisoning by oth topical agents, accidental, init', false, '2020-01-12 10:42:29', '2020-04-02 02:55:01'),
(9, 1, 'Burn Notice: The Fall of Sam Axe', 'Leucocoria', true, '2020-01-13 06:33:42', '2020-03-31 19:01:20'),
(10, 1, 'Europa Europa (Hitlerjunge Salomon)', 'Milt op w explosn of improv explosv device, civilian, subs', true, '2020-03-13 16:04:15', '2019-10-20 12:12:04');

/*drop table notas*/
/*select *
from notas n */


CREATE TABLE `categorias` (
  `IdCat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci,
  PRIMARY KEY (`idCat`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; 

insert into categorias (idCat, name) values (2, 'Mecanica');
insert into categorias (idCat, name) values (3, 'Electrodomesticos');
insert into categorias (idCat, name) values (4, 'Ropa niños');
insert into categorias (idCat, name) values (5, 'Ropa');
insert into categorias (idCat, name) values (7, 'Alimentos');
insert into categorias (idCat, name) values (8, 'Garage');
insert into categorias (idCat, name) values (9, 'Zapatillas');

/* select *
from categorias  */
 
 
CREATE TABLE `notas_categorias` (
  `Id_nota_categoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdCat`  int(10) unsigned NOT NULL,
  `IdNota`  int(10) unsigned NOT null,
  PRIMARY KEY (`id_nota_categoria`),
  CONSTRAINT `categoria_idCat_foreign` FOREIGN KEY (`IdCat`) REFERENCES `categorias` (`IdCat`),
  CONSTRAINT `notas_idNota_foreign` FOREIGN KEY (`IdNota`) REFERENCES `notas` (`IdNota`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
 insert into notas_categorias (IdCat, IdNota) values 
 (1, 1), (1, 2), (1, 3), (2,4), (2,5), (2,6), (3,7), (4,8), (4, 9), (4,10);

/* select * from notas_categorias  n ;*/

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
 

/*select * from auditoria a ;*/
