/*
MySQL Data Transfer
Source Host: localhost
Source Database: board
Target Host: localhost
Target Database: board
Date: 2008/12/17 ¤U¤È 11:03:34
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for guestbook
-- ----------------------------
DROP TABLE IF EXISTS `guestbook`;
CREATE TABLE `guestbook` (
  `no` tinyint(4) NOT NULL auto_increment,
  `name` varchar(10) default NULL,
  `mail` varchar(30) default NULL,
  `subject` varchar(30) default NULL,
  `content` text,
  `putdate` date default NULL,
  `ip` varchar(20) default NULL,
  PRIMARY KEY  (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `guestbook` VALUES ('6', 'test', 'tet', 'ete', 'tett', '2008-12-04', null);
INSERT INTO `guestbook` VALUES ('7', 'test', 'tet', 'ete', 'tett', '2008-12-04', null);
INSERT INTO `guestbook` VALUES ('8', 'test', 'ts', 'tet', 'etete', '2008-12-04', null);

