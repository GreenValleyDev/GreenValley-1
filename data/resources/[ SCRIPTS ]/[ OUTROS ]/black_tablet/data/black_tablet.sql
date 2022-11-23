
DROP TABLE IF EXISTS `black_tablet`;
CREATE TABLE `black_tablet` (
  `user_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `officer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `black_tablet_img`;
CREATE TABLE `black_tablet_img` (
  `user_id` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

