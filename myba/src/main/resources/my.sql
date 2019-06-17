CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO test.user (id, username, age, address)VALUES(1, 'summer', 100, 'shanghai,pudong');
INSERT INTO test.user (id, username, age, address)VALUES(2, 'college', 30, '重庆,渝北');
INSERT INTO test.user (id, username, age, address)VALUES(3, 'heigt', 20, '安徽,阜阳');
INSERT INTO test.user (id, username, age, address)VALUES(4, 'now', 40, 'shanghai,闸北');




CREATE TABLE `user_login_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL  COMMENT '登录ID',
  `login_date` datetime DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(16) DEFAULT NULL COMMENT '登录IP',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户登录日志'

INSERT INTO test.`user_login_log`(user_id, login_date, login_ip)VALUES( 1, now(), '127.0.0.1');
INSERT INTO test.`user_login_log`(user_id, login_date, login_ip)VALUES( 1, now(), '192.168.34.34');
INSERT INTO test.`user_login_log`(user_id, login_date, login_ip)VALUES( 3, now(), '192.168.65.98');
INSERT INTO test.`user_login_log`(user_id, login_date, login_ip)VALUES( 3, now(), '192.168.1.1');
INSERT INTO test.`user_login_log`(user_id, login_date, login_ip)VALUES( 5, now(), '192.33.41.1');




