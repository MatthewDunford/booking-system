


DROP DATABASE IF EXISTS `booking_system`;

CREATE DATABASE `booking_system` DEFAULT CHARACTER SET utf8mb4;

USE `booking_system`;

--
-- table: member
--

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  CONSTRAINT `pk_member` PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;







--
-- table: team
--



DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
  `team_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL DEFAULT '',
  `hourly_rate` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  CONSTRAINT `pk_team` PRIMARY KEY (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;







--
-- table: venue
--




DROP TABLE IF EXISTS `venue`;

CREATE TABLE `venue` (
  `venue_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL  DEFAULT '',
  `capacity` INT NOT NULL DEFAULT 0,
  `max_booking_fee` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `location` VARCHAR(255) NOT NULL DEFAULT '',
  `phone` VARCHAR(20) NOT NULL DEFAULT '',
  `email` VARCHAR(255) NOT NULL DEFAULT '',
  CONSTRAINT `pk_venue` PRIMARY KEY (`venue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





--
-- table: presentation
--

DROP TABLE IF EXISTS `presentation`;

CREATE TABLE `presentation` (
    `presentation_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `length_in_hours` INT NOT NULL DEFAULT 0,
    `topic` VARCHAR(100) NOT NULL DEFAULT '',
    CONSTRAINT PK_presentation PRIMARY KEY (`presentation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- table: expert_guide
--


DROP TABLE IF EXISTS `expert_guide`;

CREATE TABLE `expert_guide` (
    `expert_guide_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `phone` VARCHAR(20) NOT NULL DEFAULT '',
    `email` VARCHAR(255) NOT NULL DEFAULT '',
    CONSTRAINT `PK_expert_guide` PRIMARY KEY (`expert_guide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




--
-- table: team_presentation (join table)
--

DROP TABLE IF EXISTS `team_presentation`;

CREATE TABLE `team_presentation` (
  `team_presentation_id` INT NOT NULL AUTO_INCREMENT,
  `team_id` INT NOT NULL,
  `presentation_id` INT NOT NULL,
  CONSTRAINT pk_team_presentation PRIMARY KEY (`team_presentation_id`),
  CONSTRAINT FK_team_presentation_to_team FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE,
  CONSTRAINT FK_team_presentation_to_presentation FOREIGN KEY (`presentation_id`)  REFERENCES `presentation` (`presentation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;









--
-- table: booking
--

DROP TABLE IF EXISTS `booking`;

CREATE TABLE booking (
    `booking_id` INT NOT NULL AUTO_INCREMENT,
    `team_presentation_id` INT NULL, -- remove not null on purpose 
    `venue_id` INT NULL,  -- remove not null on purpose 
    `start_datetime` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
    `end_datetime` DATETIME NOT NULL DEFAULT '1000-01-01 00:00:00',
    CONSTRAINT `PK_booking` PRIMARY KEY (`booking_id`),
    CONSTRAINT `FK_booking_to_team_presentation_id` FOREIGN KEY (`team_presentation_id`) REFERENCES `team_presentation` (`team_presentation_id`) ON DELETE CASCADE,
    CONSTRAINT `FK_booking_to_venue` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;














--
-- table: target_audience
--


DROP TABLE IF EXISTS `target_audience`;

CREATE TABLE `target_audience` (
    `target_id` INT NOT NULL AUTO_INCREMENT,
    `target_type` VARCHAR(50) NOT NULL DEFAULT '',
    CONSTRAINT `PK_target_audience` PRIMARY KEY (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





--
-- table: team_has_member (join table)
--

DROP TABLE IF EXISTS `team_has_member`;

CREATE TABLE `team_has_member` (
  `team_join` INT NOT NULL AUTO_INCREMENT,
  `team_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  CONSTRAINT `pk_team_has_member` PRIMARY KEY (`team_join`),
  CONSTRAINT `fk_team_has_member_to_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_team_has_member_to_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





--
-- table: team_audience (join table)
--



DROP TABLE IF EXISTS `team_audience`;

CREATE TABLE `team_audience` (
    `team_target` INT NOT NULL AUTO_INCREMENT,
    `team_id` INT NOT NULL,
    `target_id` INT NOT NULL,
    CONSTRAINT `PK_team_audience` PRIMARY KEY (`team_target`),
    CONSTRAINT `FK_team_audience_to_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE,
    CONSTRAINT `FK_team_audience_to_target_audience` FOREIGN KEY (`target_id`)  REFERENCES `target_audience` (`target_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





--
-- table: presentation_audience (join table)
--


DROP TABLE IF EXISTS `presentation_audience`;

CREATE TABLE `presentation_audience` (
    `presentation_target` INT NOT NULL AUTO_INCREMENT,
    `presentation_id` INT NOT NULL,
    `target_id` INT NOT NULL, 
    CONSTRAINT `PK_presentation_audience` PRIMARY KEY (`presentation_target`),
    CONSTRAINT `FK_presentation_audience_to_presentation` FOREIGN KEY (`presentation_id`) REFERENCES `presentation` (`presentation_id`) ON DELETE CASCADE,
    CONSTRAINT `FK_presentation_audience_to_target_audience` FOREIGN KEY (`target_id`)  REFERENCES `target_audience` (`target_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- table: expert_guide_audience (join table)
--



DROP TABLE IF EXISTS `expert_guide_audience`;

CREATE TABLE `expert_guide_audience` (
    `expert_guide_target` INT NOT NULL AUTO_INCREMENT,
    `expert_guide_id` INT NOT NULL,
    `target_id` INT NOT NULL,
    CONSTRAINT `PK_expert_guide_audience` PRIMARY KEY (`expert_guide_target`),
    CONSTRAINT `FK_expert_guide_audience_guide` FOREIGN KEY (`expert_guide_id`) REFERENCES `expert_guide` (`expert_guide_id`) ON DELETE CASCADE,
    CONSTRAINT `FK_expert_guide_audience_target` FOREIGN KEY (`target_id`)  REFERENCES `target_audience` (`target_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





--
-- table: venue_audience (join table)
--




DROP TABLE IF EXISTS `venue_audience`;
CREATE TABLE `venue_audience` (
  `venue_audience_id` INT NOT NULL AUTO_INCREMENT,
  `venue_id` INT NOT NULL,
  `target_audience_id` INT NOT NULL,
  CONSTRAINT `PK_venue_audience` PRIMARY KEY (`venue_audience_id`),
  CONSTRAINT `FK_venue_audience_venue` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`venue_id`),
  CONSTRAINT `FK_venue_audience_target` FOREIGN KEY (`target_audience_id`)  REFERENCES `target_audience` (`target_audience_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
















