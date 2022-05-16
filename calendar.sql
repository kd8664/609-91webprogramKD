-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 16 2022 г., 05:03
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

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
  `id` int NOT NULL COMMENT 'id события',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Название события',
  `start` date NOT NULL COMMENT 'Дата начала события',
  `end` date NOT NULL COMMENT 'Дата конца события'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `calendar`
--

INSERT INTO `calendar` (`id`, `title`, `start`, `end`) VALUES
(1, 'Первое событие', '2022-05-09', '2022-05-09'),
(2, 'Второе событие', '2022-05-15', '2022-05-16');

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
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `email`, `role`) VALUES
(1, 'Кирилл', 'Джетписов', '1', 'admin'),
(2, 'Александр', 'Петров', 'apetrov@mail.ru', 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `userscalendar`
--

CREATE TABLE `userscalendar` (
  `id` int NOT NULL,
  `id_user` int NOT NULL COMMENT 'id владельца календаря'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `userscalendar`
--

INSERT INTO `userscalendar` (`id`, `id_user`) VALUES
(1, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `userscalendar`
--
ALTER TABLE `userscalendar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id события', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id пользователя', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `userscalendar`
--
ALTER TABLE `userscalendar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `userscalendar`
--
ALTER TABLE `userscalendar`
  ADD CONSTRAINT `userscalendar_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
