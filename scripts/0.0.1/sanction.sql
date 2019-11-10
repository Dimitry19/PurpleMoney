-- ----------------------------
--  Table structure for `SANCTION`
-- ----------------------------
DROP TABLE IF EXISTS `SANCTION`;
CREATE TABLE `SANCTION` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `R_ASSOCIATION` varchar(3) NOT NULL,
  `DATE` DATE default current_date,
  `ID_SANCTION` char(10) NOT NULL,
  `R_MEMBER` varchar(25)  DEFAULT null ,
  `TIMESTAMP` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`ID`,`R_ASSOCIATION`,`DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into SANCTION (R_ASSOCIATION,  ID_SANCTION, R_MEMBER) values ('P10','RETARD', 'LION');
insert into SANCTION (R_ASSOCIATION,  ID_SANCTION, R_MEMBER) values ('P10','RETARD_FC', 'LION');

