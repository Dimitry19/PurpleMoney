-- ----------------------------
--  Table structure for `EVENT_TYPE`
-- ----------------------------
DROP TABLE IF EXISTS `EVENT_TYPE`;
CREATE TABLE `EVENT_TYPE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EVENT_ID` varchar(8) NOT NULL,
  `R_LANGUAGE` char(2) NOT NULL,
  `DESCRIPTION` varchar(50) NOT NULL,
  `TIMESTAMP` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('RBM/fr','fr','Remboursement pret');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('REU/fr','fr','Reunion');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('SCN/fr','fr','Paiement sanction');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('FDC/fr','fr','Fond de Caisse a Completer');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('NFDC/fr','fr','Fond de caisse complet');


INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('RBM/en','en','Refund loan');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('SCN/en','en','Payment penalty');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('REU/en','en','Meeting');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('FDC/en','en','Cashier"s background');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('NFDC/en','en','Cashier  completed');


INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('RBM/it','it','Rimborso prestito');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('SCN/it','it','Pagamento sanzione');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('REU/it','it','Riunione');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('FDC/it','it','Fondo da Completare');
INSERT INTO `EVENT_TYPE`   (EVENT_ID,`R_LANGUAGE` ,DESCRIPTION) values ('NFDO/it','it','Fondo  completato');






