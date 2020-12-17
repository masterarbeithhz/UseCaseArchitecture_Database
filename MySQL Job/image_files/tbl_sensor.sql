-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2018 at 11:30 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET
  time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8 */
;

--
-- Database: `phppot`
--
-- --------------------------------------------------------
CREATE DATABASE IF NOT EXISTS testdb;

USE testdb;

--
-- Table structure for table `devices`
--
CREATE TABLE IF NOT EXISTS `devices` (
  `id` int(10) unsigned NOT NULL,
  `dev_id` varchar(35) NOT NULL,
  `dev_location_name` varchar(35) NOT NULL,
  `dev_latitude` real NOT NULL,
  `dev_longitude` real NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8;

--
-- Dumping data for table `devices`
--
INSERT INTO
  `devices` (
    `id`,
    `dev_id`,
    `dev_location_name`,
    `dev_latitude`,
    `dev_longitude`
  )
VALUES
  (
    1,
    '101',
    'Eberhardstrasse',
    48.896941,
    9.1927511
  ),
  (2, '202', 'Eberhardstrasse', 48.897328, 9.192156),
  (3, '303', 'Stadthalle', 00.00000, 0.00000),
  (4, '404', 'Stadthalle', 48.8944303, 9.190356),
  (5, '505', 'Freibad', 00.00000, 0.00000),
  (6, '606', 'Freibad', 00.00000, 0.00000),
  (7, '707', 'Kirche', 00.00000, 0.00000),
  (8, '808', 'Kirche', 00.00000, 0.00000);

--
-- Indexes for dumped tables
--
--
-- Indexes for table `devices`
--
ALTER TABLE
  `devices`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE
  `devices`
MODIFY
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 9;

--#########################################################################################
CREATE TABLE IF NOT EXISTS `readings` (
  `id` int(10) unsigned NOT NULL,
  `dev_id` varchar(35) NOT NULL,
  `received_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `count_wifi` int(10) unsigned NOT NULL,
  `count_ble` int(10) unsigned NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8;

INSERT INTO
  `readings` (
    `id`,
    `dev_id`,
    `count_wifi`,
    `count_ble`
  )
VALUES
  (1, '101', 10, 5),
  (2, '101', 11, 6),
  (3, '101', 12, 7),
  (4, '202', 20, 10),
  (5, '303', 10, 5),
  (6, '404', 20, 10),
  (7, '707', 10, 50),
  (8, '808', 20, 10),
  (9, '505', 40, 20);

ALTER TABLE
  `readings`
ADD
  PRIMARY KEY (`id`);

ALTER TABLE
  `readings`
MODIFY
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 10;

--#########################################################################################
CREATE TABLE IF NOT EXISTS `nodeRedResults` (
  `id` int(10) unsigned NOT NULL,
  `received_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `dev_location_name` varchar(35) NOT NULL,
  `pax_counter` int(10) unsigned NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8;

INSERT INTO
  `nodeRedResults` (
    `id`,
    `dev_location_name`,
    `pax_counter`
  )
VALUES
  (1, 'Eberhardstrasse', 15),
  (2, 'Stadthalle', 17),
  (3, 'Freibad', 19),
  (4, 'Kirche', 30);

ALTER TABLE
  `nodeRedResults`
ADD
  PRIMARY KEY (`id`);

ALTER TABLE
  `nodeRedResults`
MODIFY
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 5;

--#########################################################################################
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(35) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8;

INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`
  )
VALUES
  (1, 'admin', 'pw'),
  (2, 'test', 'pw2');

ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`);

ALTER TABLE
  `users`
MODIFY
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;