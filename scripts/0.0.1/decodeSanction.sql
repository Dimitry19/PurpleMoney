-- ----------------------------
--  Table structure for `DECODE_SANCTION`
-- ----------------------------
DROP TABLE IF EXISTS `DECODE_SANCTION`;
CREATE TABLE `DECODE_SANCTION` (
  `ID_SANCTION` char(10) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TAUX` bigint(20) not  null ,
  `TIMESTAMP` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`ID_SANCTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into DECODE_SANCTION (ID_SANCTION,DESCRIPTION, TAUX) values ('RETARD_FC','Retard fond de caisse', 10);
insert into DECODE_SANCTION (ID_SANCTION,DESCRIPTION, TAUX) values ('RETARD','Retard', 5);
insert into DECODE_SANCTION (ID_SANCTION,DESCRIPTION, TAUX) values ('ABS_TROIS','Absence trois mois', 25);
insert into DECODE_SANCTION (ID_SANCTION,DESCRIPTION, TAUX) values ('ABS_SIX','Absence  six mois', 50);

