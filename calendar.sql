-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 21 2022 г., 17:57
-- Версия сервера: 8.0.24
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `calendar`
--

-- --------------------------------------------------------

--
-- Структура таблицы `calendar`
--

CREATE TABLE `calendar` (
  `id` int NOT NULL,
  `id_user` int NOT NULL COMMENT 'id владельца календаря',
  `id_event` int NOT NULL COMMENT 'id события'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `event`
--

CREATE TABLE `event` (
  `id` int NOT NULL COMMENT 'id события',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Название события',
  `start` date NOT NULL COMMENT 'Дата начала события',
  `end` date NOT NULL COMMENT 'Дата конца события'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL COMMENT 'id пользователя',
  `name` varchar(255) NOT NULL COMMENT 'Имя пользователя',
  `surname` varchar(255) NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(255) NOT NULL COMMENT 'Адрес электронной почты',
  `role` varchar(255) NOT NULL COMMENT 'Роль пользователя в системе'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `calendar_ibfk_2` (`id_event`);

--
-- Индексы таблицы `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `event`
--
ALTER TABLE `event`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id события', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id пользователя', AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `calendar`
--
ALTER TABLE `calendar`
  ADD CONSTRAINT `calendar_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `calendar_ibfk_2` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
