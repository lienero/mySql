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
-- 데이터베이스: `web_test`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `classics`
--

CREATE TABLE `classics` (
  `author` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `type` varchar(16) NOT NULL,
  `year` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `classics`
--

INSERT INTO `classics` (`author`, `title`, `type`, `year`) VALUES
('오현우', '나의 마음', '소설', '2020');

-- --------------------------------------------------------

--
-- 테이블 구조 `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `id` varchar(20) NOT NULL,
  `content` varchar(200) NOT NULL,
  `image` text NOT NULL,
  `date` datetime NOT NULL,
  `like_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `comment`
--

INSERT INTO `comment` (`comment_id`, `id`, `content`, `image`, `date`, `like_count`) VALUES
(1, '이경민', '오현우 크크루삥뽕', 'test2.jpg', '0000-00-00 00:00:00', 24),
(2, '이경민', '크크루삐삐뽕', 'test2.jpg', '0000-00-00 00:00:00', 0),
(3, '이경민', '오현우', 'test2.jpg', '0000-00-00 00:00:00', 0),
(4, '이경민', '크크루삥뽕', 'search.png', '0000-00-00 00:00:00', 0),
(5, '이경민', '크크루삥뽕', 'icon.png', '0000-00-00 00:00:00', 0),
(6, '이경민2', '크크루삥뽕', 'test3.jpg', '0000-00-00 00:00:00', 0),
(7, '이경민', '크크삥뽕', 'cook_1.jpg.png', '2020-08-07 00:00:00', 0),
(8, '이경민', '크크루 삥뽕', 'TheBack_Dark.png', '2020-08-08 05:45:40', 0),
(9, '이경민', '크크루 삥뽕', 'example1.jpg', '2020-08-08 05:47:49', 0),
(10, '이경민', '크크루삥뽕', 'test3.jpg', '2020-08-08 06:05:51', 0),
(11, '이경민', '크크루 삥뽕', 'cook_1.jpg.png', '2020-08-08 06:08:49', 0),
(12, '이경민', '크크루삥뽕', 'test2.jpg', '2020-08-08 14:15:19', 0);

-- --------------------------------------------------------

--
-- 테이블 구조 `member`
--

CREATE TABLE `member` (
  `id` varchar(20) NOT NULL,
  `pw` varchar(150) NOT NULL,
  `email` varchar(20) NOT NULL,
  `like_date` date DEFAULT NULL,
  `rank` varchar(10) NOT NULL DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `member`
--

INSERT INTO `member` (`id`, `pw`, `email`, `like_date`, `rank`) VALUES
('이경민', '$2y$10$1RfF3dFK9eIWbm53midGW.9KIAvNnT9KqsEpLtw2xwV04xPweR3T6', 'ohoh', '2020-08-11', 'manager'),
('이경민2', '$2y$10$zpMHV/KgxYsdQ7ZG79iqb.Us6p1593m/JTswmSdZVYUdt0frtpTPi', '7777@naver.com', '2020-08-12', 'member');

-- --------------------------------------------------------

--
-- 테이블 구조 `movie_info`
--

CREATE TABLE `movie_info` (
  `m_idx` int(11) NOT NULL,
  `m_name` varchar(35) NOT NULL,
  `m_local_role` varchar(40) NOT NULL,
  `m_Opening_date` date NOT NULL,
  `m_r_age` int(11) NOT NULL,
  `m_summary` varchar(200) NOT NULL,
  `m_r_time` varchar(20) NOT NULL,
  `m_director` varchar(20) NOT NULL,
  `m_lo_image_link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `movie_info`
--

INSERT INTO `movie_info` (`m_idx`, `m_name`, `m_local_role`, `m_Opening_date`, `m_r_age`, `m_summary`, `m_r_time`, `m_director`, `m_lo_image_link`) VALUES
(3, '이경민', '이경민', '2020-08-03', 12, '', '120분', '이경민', 'test.jpg');

-- --------------------------------------------------------

--
-- 테이블 구조 `test`
--

CREATE TABLE `test` (
  `no` int(11) NOT NULL,
  `author` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `test`
--

INSERT INTO `test` (`no`, `author`, `title`, `type`, `year`, `content`) VALUES
(1, '오현우', 'DB의 모든 것', '전문서적', 2020, '현역 프로그래머 오현우의 DB에 대한 모든 지식을 담았다.');

-- --------------------------------------------------------

--
-- 테이블 구조 `testphp`
--

CREATE TABLE `testphp` (
  `sno` int(11) NOT NULL,
  `name` char(10) DEFAULT NULL,
  `det` char(20) DEFAULT NULL,
  `addr` char(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 테이블 구조 `user`
--

CREATE TABLE `user` (
  `u_id` text NOT NULL,
  `password` int(11) NOT NULL,
  `e_mail` text NOT NULL,
  `b_day` date NOT NULL,
  `gender` text NOT NULL,
  `u_name` text NOT NULL,
  `profile` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `user`
--

INSERT INTO `user` (`u_id`, `password`, `e_mail`, `b_day`, `gender`, `u_name`, `profile`) VALUES
('이이', 7777, 'lsc@lsc', '2020-07-29', 'male', '이이', '이이'),
('오현우', 7777, 'ohhyunwoo@com', '2020-07-30', 'male', '오현우', '저는 오현우입니다.');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- 테이블의 인덱스 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `movie_info`
--
ALTER TABLE `movie_info`
  ADD PRIMARY KEY (`m_idx`);

--
-- 테이블의 인덱스 `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`no`);

--
-- 테이블의 인덱스 `testphp`
--
ALTER TABLE `testphp`
  ADD PRIMARY KEY (`sno`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 테이블의 AUTO_INCREMENT `movie_info`
--
ALTER TABLE `movie_info`
  MODIFY `m_idx` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 테이블의 AUTO_INCREMENT `test`
--
ALTER TABLE `test`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
