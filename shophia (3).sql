-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 07 2019 г., 10:43
-- Версия сервера: 5.7.20
-- Версия PHP: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shophia`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blog`
--

CREATE TABLE `blog` (
  `id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `title` varchar(120) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(120) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`id`, `title`, `content`, `image`, `slug`, `cat_id`) VALUES
(1, 'zara', 'k', 'Y689lKIujyrFCVDgWDSMc2eWDyQKeeCv.jpg', 'zara', NULL),
(2, 'burberry', 'k', 'PZWWTrUXmMRnXhoCwjnJZ7WrT3kieFL_.jpg', 'burberry', NULL),
(3, 'boss', 'c', 'o2KENH2HDyK8dXneCErYzEfhsvAZhkYR.jpg', 'boss', NULL),
(4, 'cucci', 'c', '_IfyBt4mP3ZW_MVej6qVs39TYYsmViia.jpg', 'cucci', NULL),
(5, 'chanel ', ' c', 'M9dQlS0mibayc-Ui5iPmOXoYopG4IbFB.png', 'chanel', NULL),
(6, 'dolchegabanna', 'd', 'oXg9Q709R6dCul553Oy45UCJobRU1Hjk.jpg', 'dolchegabanna', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(120) NOT NULL,
  `content` text,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `content`, `image`, `slug`) VALUES
(1, 'Women', 'cdssssssssssc', 'Vmut3vZums22eewu--bU7xpWnY9AEEEE.jpg', 'women'),
(2, 'Men', 'vvvvvvvvvv', '5nVw0SLB5x2GVNzrK-PYqAbFbsAGMQrP.jpg', 'men'),
(3, 'Kids', '', '78G5PCogugs62fegf-V4dnfkr9lu03eP.png', 'kids'),
(4, 'newborn', '', 'ypcZQcpy7Y0F-zyhPsJsTnhxPh1SZytJ.jpg', 'newborn'),
(8, 'accessories', 'f', '-FUuQbQ7DSH6JDBl3TS-ltqggQAEE6G9.jpg', 'accessories'),
(9, 'pregnant', 'pregnant', '_n5ig4QKuU-kahvTODhfOGYJbSNKewat.jpg', 'pregnant');

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(255) NOT NULL,
  `blog_id` int(255) NOT NULL,
  `comment` text NOT NULL,
  `user_id` int(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `info`
--

INSERT INTO `info` (`id`, `type`, `content`) VALUES
(1, 'phone', '+374555555555'),
(2, 'email', 'shophia@gmail.com'),
(3, 'info', 'xxx'),
(4, 'language', 'EN, AM, RU');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1546961441),
('m130524_201442_init', 1546961726);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `larg_image` varchar(255) DEFAULT NULL,
  `small_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` float DEFAULT NULL,
  `sale_price` float DEFAULT NULL,
  `content` text,
  `image` varchar(255) DEFAULT NULL,
  `sku` varchar(120) NOT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `is_new` enum('0','1') NOT NULL DEFAULT '0',
  `slug` varchar(255) NOT NULL,
  `is_feature` enum('0','1') NOT NULL DEFAULT '0',
  `available_stock` int(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `for_stylish` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `sale_price`, `content`, `image`, `sku`, `cat_id`, `brand_id`, `is_new`, `slug`, `is_feature`, `available_stock`, `quantity`, `for_stylish`) VALUES
(3, 'dress', 14, 12, 'dgdffdgretret', 'UuFC7VBfkgsUmqBUtQZJGaOh9wrWCSp7.jpg', 'dfgdfgdfg', 1, 2, '0', 'dress', '1', 12, 1, '0'),
(4, 'dasdsad', 16, NULL, '', 'v8CvtAOEdj7B-X6vT34Q1l2vnFeEpFiI.png', 'asdsadsad', 2, NULL, '0', 'ff', '1', 0, 0, '0'),
(7, 'new product', 23, NULL, 'adfasd', 'IFcHVPRJAVGdD10XPOweSQVSP7dhiFXg.jpg', 'adfasdsad', NULL, NULL, '0', 'ff', '1', 0, 0, '0'),
(8, 'dressess', 15, 12, 'cccccccc', 'DlgOUkdN04Ms1bKBxH_1x6hPaLijT5SU.png', 'cccccccccc', 1, NULL, '0', 'ff', '1', 0, 0, '0'),
(9, 'women', 1250, 1100, '', 'bRx6hpXuNpX5suV1n4uOLId8umSxVsuo.jpg', 'dff', 1, NULL, '0', 'ff', '1', 12, 11, '1'),
(12, 'dresses', 150, 110, '', 's_a8c_LKiAmfXPmjIDox8QsIRWDYVWlJ.jpg', 'fds', 3, 4, '1', 'dresses', '0', 12, 0, '1'),
(13, 'short', 110, 50, '', 'oxYLkA6uwputFkwWJJLTNtAJ4wAoG6-n.jpg', 'sf', 1, NULL, '0', 'd', '1', 11, 5, '1'),
(14, 'sort', 54, 52, '', 'aBakQQOBRNCxvoPgAL2ybhBaQ0KeGoYY.jpg', 'dfg', 2, 6, '1', 'ff', '0', 12, 1, '0'),
(15, 'sort', 54, 52, ',', 'vxxLE52Hgsf2JRThgQQJx4MO9kwXXPe6.jpg', 'gdfdffff', 1, 1, '0', 'ff', '0', 12, 1, '0'),
(16, 'sortc', 54, 52, 's', 'Vt-qmS-2f4i9iL4kXAoabr48oNJKtR1M.png', 'sssssss', 2, 1, '0', 'ssss', '1', 12, 1, '0'),
(17, 'short', 125, 120, '', '1S3WdNHJdTjkn_Kn9BbHRBU1B4V-LyMO.jpg', 'gdfdffffs', 2, 1, '0', 's', '1', 12, 1, '0'),
(18, 'short', 54, 52, '', 'ojMdSq4d64KblUKpjm1Fb88aW3c3MoXp.jpg', 'gdfdffffsd', 2, 1, '0', 'ssss', '1', 12, 1, '1'),
(19, 'sortc', 54, 52, '', 'PJ-1O49cUPCeqDGXhQ6_bUU5su89BlOm.jpg', 'gdfdfffffffffff', 2, 5, '0', 'ssssdd', '0', 12, 1, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `url` text,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `is_admin` enum('0','1') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'admin', 'f-xMBt7KRm-LWCzOSkHWMxPIWQ-MvgbR', '$2y$13$n6B2fvtLIToORYV8Zv5RYeXyB7KcMiqoU1ueomRro1PeNm2TNR7.K', NULL, 'annag9090@mail.ru', 10, 1546962457, 1546962457, NULL),
(2, 'Astghik', 'VmFSsmfST0jkvdUPcgVi15vOsfgHo73j', '$2y$13$nPFua5XNxDbZgonW5BAptemjndmQbfuu8987vJSNhqi2PH8meGehK', NULL, 'astghik.mirijanyan@gmail.com', 10, 1548058634, 1548058634, '1'),
(3, 'aram', 'm5kAIa7SH1E6fVRalW1P_LhieoQQw_Kp', '$2y$13$bt43ehQUUrbJB4Ig5ANRr.zACco3ul0Eb9iGmg5ShoZbqKPQQnVLW', NULL, 'astghiak.mirijanyan@gmail.com', 10, 1548864216, 1548864216, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_3` (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id_2` (`product_id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `blog_id` (`blog_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Индексы таблицы `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku_2` (`sku`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `sku` (`sku`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `brand_id_2` (`brand_id`);

--
-- Индексы таблицы `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `productsCatgroyFK` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
