-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 20-08-24 09:25
-- 서버 버전: 10.4.13-MariaDB
-- PHP 버전: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `p1`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `po_comment`
--

CREATE TABLE `po_comment` (
  `con_seq` int(11) NOT NULL,
  `recipe_seq` int(11) NOT NULL,
  `mem_id` varchar(60) NOT NULL,
  `com_cont` text NOT NULL,
  `com_img` varchar(45) DEFAULT NULL,
  `com_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 테이블 구조 `po_member`
--

CREATE TABLE `po_member` (
  `mem_id` varchar(45) NOT NULL,
  `mem_pw` varchar(200) NOT NULL,
  `mem_email` varchar(45) DEFAULT NULL,
  `rank` varchar(45) NOT NULL DEFAULT 'member',
  `mem_spicy` varchar(30) DEFAULT NULL,
  `mem_filter` varchar(80) DEFAULT NULL,
  `likes` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `po_member`
--

INSERT INTO `po_member` (`mem_id`, `mem_pw`, `mem_email`, `rank`, `mem_spicy`, `mem_filter`, `likes`) VALUES
('이경민', '$2y$10$WauFlGtkokRTj57P.9SrtuKViPBcR8A89AGW7cYjewix7JlmLryoG', '4444@gmail.com', 'member', ',,,3', ',beef,chicken,,,', NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `po_recipe`
--

CREATE TABLE `po_recipe` (
  `recipe_seq` int(11) NOT NULL,
  `mem_id` varchar(45) NOT NULL,
  `recipe_name` varchar(300) NOT NULL,
  `recipe_contant` text DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `recipe_likes` int(11) NOT NULL DEFAULT 0,
  `recipe_spicy` varchar(30) DEFAULT NULL,
  `recipe_food` varchar(100) NOT NULL,
  `recipe_cate1` varchar(60) NOT NULL DEFAULT 'all',
  `recipe_cate2` varchar(60) NOT NULL DEFAULT 'all'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 테이블 구조 `po_recipe_img`
--

CREATE TABLE `po_recipe_img` (
  `img_seq` int(11) NOT NULL,
  `recipe_seq` int(11) NOT NULL,
  `recipe_img` varchar(100) DEFAULT NULL,
  `img_cont` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 테이블 구조 `po_review`
--

CREATE TABLE `po_review` (
  `review_seq` int(11) NOT NULL,
  `mem_id` varchar(60) NOT NULL,
  `review_kind` varchar(45) NOT NULL,
  `review_name` varchar(100) NOT NULL,
  `review_cont` text NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 테이블 구조 `po_review_seq`
--

CREATE TABLE `po_review_seq` (
  `img_seq` int(11) NOT NULL,
  `review_seq` int(11) NOT NULL,
  `review_img` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `po_comment`
--
ALTER TABLE `po_comment`
  ADD PRIMARY KEY (`con_seq`);

--
-- 테이블의 인덱스 `po_member`
--
ALTER TABLE `po_member`
  ADD PRIMARY KEY (`mem_id`);

--
-- 테이블의 인덱스 `po_recipe`
--
ALTER TABLE `po_recipe`
  ADD PRIMARY KEY (`recipe_seq`);

--
-- 테이블의 인덱스 `po_recipe_img`
--
ALTER TABLE `po_recipe_img`
  ADD PRIMARY KEY (`img_seq`);

--
-- 테이블의 인덱스 `po_review`
--
ALTER TABLE `po_review`
  ADD PRIMARY KEY (`review_seq`);

--
-- 테이블의 인덱스 `po_review_seq`
--
ALTER TABLE `po_review_seq`
  ADD PRIMARY KEY (`img_seq`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `po_comment`
--
ALTER TABLE `po_comment`
  MODIFY `con_seq` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `po_recipe`
--
ALTER TABLE `po_recipe`
  MODIFY `recipe_seq` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `po_recipe_img`
--
ALTER TABLE `po_recipe_img`
  MODIFY `img_seq` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `po_review`
--
ALTER TABLE `po_review`
  MODIFY `review_seq` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `po_review_seq`
--
ALTER TABLE `po_review_seq`
  MODIFY `img_seq` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
