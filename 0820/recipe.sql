-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 20-08-20 10:50
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
-- 데이터베이스: `recipe`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `comment`
--

CREATE TABLE `comment` (
  `con_seq` int(11) NOT NULL,
  `recipe_seq` int(11) NOT NULL,
  `mem_id` varchar(60) NOT NULL,
  `com_cont` text NOT NULL,
  `com_img` varchar(45) DEFAULT NULL,
  `com_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `comment`
--

INSERT INTO `comment` (`con_seq`, `recipe_seq`, `mem_id`, `com_cont`, `com_img`, `com_date`) VALUES
(1, 0, '이경민', '오현우@!', '', '2020-08-20 15:32:39'),
(2, 0, '이경민', '오현우', '', '2020-08-20 15:33:33'),
(3, 0, '이경민', '오현우씨', '', '2020-08-20 15:37:17'),
(4, 0, '이경민', '오현우니무', '', '2020-08-20 15:37:24'),
(5, 0, '이경민', '오현우 뭐함', '', '2020-08-20 15:52:46'),
(6, 0, '이경민', '뭐하냐고!@!!!', '', '2020-08-20 15:52:53'),
(7, 0, '이경민', '이경민입니다', '', '2020-08-20 15:54:11'),
(8, 0, '이경민', '오현우!!', '', '2020-08-20 16:13:14'),
(9, 0, '이경민', '이리리', '', '2020-08-20 17:22:35'),
(10, 0, '이경민', '에지지지', '', '2020-08-20 17:22:39'),
(11, 0, '이경민', '엣지오', '', '2020-08-20 17:22:43');

-- --------------------------------------------------------

--
-- 테이블 구조 `member`
--

CREATE TABLE `member` (
  `mem_id` varchar(45) NOT NULL,
  `mem_pw` varchar(200) NOT NULL,
  `mem_email` varchar(45) DEFAULT NULL,
  `rank` varchar(45) NOT NULL DEFAULT 'member',
  `mem_spicy` varchar(30) DEFAULT NULL,
  `mem_filter` varchar(80) DEFAULT NULL,
  `likes` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `member`
--

INSERT INTO `member` (`mem_id`, `mem_pw`, `mem_email`, `rank`, `mem_spicy`, `mem_filter`, `likes`) VALUES
('이경민', '$2y$10$CPg9LvBOqK6I4/bdFalel.r7sQmW6J63dAtPAE.703cbAK/RBbU2K', '오현우미안@naver.com', 'member', ',,2,', ',beef,,,,', NULL),
('이경민2', '$2y$10$cMHeZF1xy6PXBa/pS/ZoROU.nA6dKeD8/BjlVmhNUqSo9E8i61Oo2', '오현우바보@gmail.com', 'member', NULL, NULL, NULL),
('이경민3', '$2y$10$ZXY1AaniVqOfRueLPc8jeuFblc/2tKX6/oP3pfxHJ/eCiPs6rpjGG', '강화림짱@naver.com', 'member', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `recipe`
--

CREATE TABLE `recipe` (
  `recipe_seq` int(11) NOT NULL,
  `mem_id` varchar(45) NOT NULL,
  `recipe_name` varchar(300) NOT NULL,
  `recipe_contant` text DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `recipe_likes` int(11) NOT NULL DEFAULT 0,
  `recipe_spicy` text DEFAULT NULL,
  `recipe_food` varchar(100) NOT NULL,
  `recipe_cate1` varchar(60) NOT NULL DEFAULT 'all',
  `recipe_cate2` varchar(60) NOT NULL DEFAULT 'all'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `recipe`
--

INSERT INTO `recipe` (`recipe_seq`, `mem_id`, `recipe_name`, `recipe_contant`, `img`, `recipe_likes`, `recipe_spicy`, `recipe_food`, `recipe_cate1`, `recipe_cate2`) VALUES
(1, '이경민', 'test', '테스트하겠습니다.', NULL, 0, '3', 'pork,beef', 'all', 'all'),
(2, '이경민', '멘탈트레이너', '이힝힝', NULL, 0, '2', 'chicken', 'all', 'all');

-- --------------------------------------------------------

--
-- 테이블 구조 `recipe_img`
--

CREATE TABLE `recipe_img` (
  `img_seq` int(11) NOT NULL,
  `recipe_seq` int(11) NOT NULL,
  `recipe_img` varchar(100) DEFAULT NULL,
  `img_cont` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 테이블 구조 `review`
--

CREATE TABLE `review` (
  `review_seq` int(11) NOT NULL,
  `mem_id` varchar(60) NOT NULL,
  `review_kind` varchar(45) NOT NULL,
  `review_name` varchar(100) NOT NULL,
  `review_cont` text NOT NULL,
  `review_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 테이블 구조 `review_seq`
--

CREATE TABLE `review_seq` (
  `img_seq` int(11) NOT NULL,
  `review_seq` int(11) NOT NULL,
  `review_img` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`con_seq`);

--
-- 테이블의 인덱스 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`mem_id`);

--
-- 테이블의 인덱스 `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipe_seq`);

--
-- 테이블의 인덱스 `recipe_img`
--
ALTER TABLE `recipe_img`
  ADD PRIMARY KEY (`img_seq`);

--
-- 테이블의 인덱스 `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_seq`);

--
-- 테이블의 인덱스 `review_seq`
--
ALTER TABLE `review_seq`
  ADD PRIMARY KEY (`img_seq`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `con_seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 테이블의 AUTO_INCREMENT `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipe_seq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 테이블의 AUTO_INCREMENT `recipe_img`
--
ALTER TABLE `recipe_img`
  MODIFY `img_seq` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `review`
--
ALTER TABLE `review`
  MODIFY `review_seq` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `review_seq`
--
ALTER TABLE `review_seq`
  MODIFY `img_seq` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
