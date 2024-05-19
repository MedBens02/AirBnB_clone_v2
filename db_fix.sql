DROP DATABASE IF EXISTS hbnb_dev_db;
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;
USE hbnb_dev_db;

-- Table structure for table `states`
CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `cities`
CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  `state_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `users`
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `places`
CREATE TABLE `places` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `number_rooms` int(11) NOT NULL DEFAULT '0',
  `number_bathrooms` int(11) NOT NULL DEFAULT '0',
  `max_guest` int(11) NOT NULL DEFAULT '0',
  `price_by_night` int(11) NOT NULL DEFAULT '0',
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert sample data into `states` table
INSERT INTO `states` (`id`, `created_at`, `updated_at`, `name`) VALUES
('421a55f4-7d82-47d9-b54c-a76916479545', '2017-03-25 19:42:40', '2017-03-25 19:42:40', 'Alabama'),
('421a55f4-7d82-47d9-b54c-a76916479546', '2017-03-25 19:42:40', '2017-03-25 19:42:40', 'Arizona');

-- Insert sample data into `cities` table
INSERT INTO `cities` (`id`, `created_at`, `updated_at`, `name`, `state_id`) VALUES
('521a55f4-7d82-47d9-b54c-a76916479545', '2017-03-25 19:42:40', '2017-03-25 19:42:40', 'Akron', '421a55f4-7d82-47d9-b54c-a76916479545'),
('521a55f4-7d82-47d9-b54c-a76916479546', '2017-03-25 19:42:40', '2017-03-25 19:42:40', 'Douglas', '421a55f4-7d82-47d9-b54c-a76916479546');

-- Insert sample data into `users` table
INSERT INTO `users` (`id`, `created_at`, `updated_at`, `email`, `password`, `first_name`, `last_name`) VALUES
('731a55f4-7d82-47d9-b54c-a76916479545', '2017-03-25 19:42:40', '2017-03-25 19:42:40', 'user1@example.com', 'password1', 'User', 'One'),
('731a55f4-7d82-47d9-b54c-a76916479546', '2017-03-25 19:42:40', '2017-03-25 19:42:40', 'user2@example.com', 'password2', 'User', 'Two');

-- Insert sample data into `places` table
INSERT INTO `places` (`id`, `created_at`, `updated_at`, `city_id`, `user_id`, `name`, `description`, `number_rooms`, `number_bathrooms`, `max_guest`, `price_by_night`, `latitude`, `longitude`) VALUES
('821a55f4-7d82-47d9-b54c-a76916479545', '2017-03-25 19:42:40', '2017-03-25 19:42:40', '521a55f4-7d82-47d9-b54c-a76916479545', '731a55f4-7d82-47d9-b54c-a76916479545', 'Place One', 'A nice place', 3, 2, 5, 100, NULL, NULL),
('821a55f4-7d82-47d9-b54c-a76916479546', '2017-03-25 19:42:40', '2017-03-25 19:42:40', '521a55f4-7d82-47d9-b54c-a76916479546', '731a55f4-7d82-47d9-b54c-a76916479546', 'Place Two', 'Another nice place', 2, 1, 3, 80, NULL, NULL);

