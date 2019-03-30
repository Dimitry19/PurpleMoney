-- ----------------------------
--  Table structure for `SANCTION`
-- ----------------------------
DROP TABLE IF EXISTS `SANCTION`;
CREATE TABLE `SANCTION` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `R_ASSOCIATION` varchar(3) NOT NULL,
  `DATE` DATE default current_date,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `R_MEMBER` varchar(25)  DEFAULT null ,
  PRIMARY KEY (`ID`,`R_ASSOCIATION`,`DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into SANCTION (R_ASSOCIATION,  DESCRIPTION, R_MEMBER) values ('P10','RETARD', 'LION');
