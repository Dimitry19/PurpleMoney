-- ----------------------------
--  Table structure for `LANGUAGES`
-- ----------------------------

DROP TABLE IF EXISTS `LANGUAGES`;
CREATE TABLE LANGUAGES
(
	ID VARCHAR(2) not null,
	COUNTRY_CODE VARCHAR(2) not null,
	VALUE VARCHAR(255) default 'NULL',
	PRIMARY KEY  (ID, COUNTRY_CODE)
)
;
INSERT INTO PUBLIC.LANGUAGES (ID, COUNTRY_CODE, VALUE) VALUES ('it', 'IT', 'common.menu.language.italian');
INSERT INTO PUBLIC.LANGUAGES (ID, COUNTRY_CODE, VALUE) VALUES ('fr', 'FR', 'common.menu.language.french');
INSERT INTO PUBLIC.LANGUAGES (ID, COUNTRY_CODE, VALUE) VALUES ('en', 'US', 'common.menu.language.english');


