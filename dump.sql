CREATE TABLE `acrescimo` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `ativo` enum('s','n') NOT NULL DEFAULT 's',
  `idEmpresa` int(7) unsigned NOT NULL,
  `nome` varchar(45) NOT NULL,
  `valor` decimal(8,2) unsigned NOT NULL,
  `idAcrescimoService` mediumint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `empresa` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;