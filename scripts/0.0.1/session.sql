
-- ----------------------------
--  Table structure for `SESSION`
-- ----------------------------
DROP TABLE IF EXISTS `SESSION`;
CREATE TABLE `SESSION` (
  `R_ASSOCIATION` varchar(3) NOT NULL,
  `R_MEMBER` varchar(25) NOT NULL,
  `R_AMOUNT` bigint(20) ,
  `STATUS`    BOOLEAN,
  `DATE` DATE  default current_date  ,
  PRIMARY KEY (`R_ASSOCIATION`,`R_MEMBER`,`DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


