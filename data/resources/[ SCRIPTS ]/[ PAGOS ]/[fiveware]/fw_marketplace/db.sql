CREATE TABLE `fw_marketplace_items`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` varchar(255) NULL DEFAULT NULL,
  `author_identifier` varchar(255) NOT NULL,
  `author_name` varchar(255) NULL DEFAULT NULL,
  `phone_number` varchar(255) NULL DEFAULT NULL,
  `description` varchar(255) NULL DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `sold` tinyint(1) NOT NULL DEFAULT 0,
  `start_date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);