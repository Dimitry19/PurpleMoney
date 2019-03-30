-- ----------------------------
--  Table structure for `SCHEDULE`
-- ----------------------------
DROP TABLE IF EXISTS `SCHEDULE`;
CREATE TABLE `SCHEDULE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `R_ASSOCIATION` varchar(3) NOT NULL,
  `DATE` DATE NOT NULL,
  `R_MEMBER` varchar(25)  DEFAULT NULL ,
  PRIMARY KEY (`ID`,`R_ASSOCIATION`,`DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


