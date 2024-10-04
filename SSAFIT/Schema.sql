CREATE DATABASE IF NOT EXISTS SSAFIT;

USE SSAFIT;

CREATE TABLE IF NOT EXISTS `SSAFIT_Videos` (
  `video_id` INTEGER PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `part` VARCHAR(50),
  `channel_name` VARCHAR(100),
  `url` VARCHAR(255),
  `views` INT,
  `created_at` TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `SSAFIT_Bookmarks` (
  `bookmark_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `user_id_no` INTEGER NOT NULL,
  `video_id` INTEGER NOT NULL,
  `bookmark_date` TIMESTAMP
);

CREATE TABLE `SSAFIT_Reviews` (
  `video_id` int,
  `user_id_no` int NOT NULL,
  `user_name` varchar(20),
  `review_id` varchar(20) PRIMARY KEY NOT NULL,
  `review_title` varchar(20) NOT NULL,
  `review_content` text NOT NULL,
  `review_score` int,
  `review_date` timestamp,
  `review_cnt` int DEFAULT 0
);

CREATE TABLE `SSAFIT_Users` (
  `user_id_no` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `user_id` VARCHAR(100) UNIQUE NOT NULL,
  `user_pass` VARCHAR(255) NOT NULL,
  `user_name` VARCHAR(100) NOT NULL,
  `user_date` TIMESTAMP
);

CREATE TABLE `SSAFIT_Follows` (
  `follow_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `follower_user_id` INTEGER NOT NULL,
  `following_user_id` INTEGER NOT NULL,
  `follow_date` TIMESTAMP
);

ALTER TABLE `SSAFIT_Follows` ADD FOREIGN KEY (`follower_user_id`) REFERENCES `SSAFIT_Users` (`user_id_no`) ON DELETE CASCADE;

ALTER TABLE `SSAFIT_Follows` ADD FOREIGN KEY (`following_user_id`) REFERENCES `SSAFIT_Users` (`user_id_no`) ON DELETE CASCADE;

ALTER TABLE `SSAFIT_Bookmarks` ADD FOREIGN KEY (`user_id_no`) REFERENCES `SSAFIT_Users` (`user_id_no`) ON DELETE CASCADE;

ALTER TABLE `SSAFIT_Bookmarks` ADD FOREIGN KEY (`video_id`) REFERENCES `SSAFIT_Videos` (`video_id`) ON DELETE CASCADE;

ALTER TABLE `SSAFIT_Reviews` ADD FOREIGN KEY (`user_id_no`) REFERENCES `SSAFIT_Users` (`user_id_no`) ON DELETE CASCADE;

ALTER TABLE `SSAFIT_Reviews` ADD FOREIGN KEY (`video_id`) REFERENCES `SSAFIT_Videos` (`video_id`) ON DELETE CASCADE;
