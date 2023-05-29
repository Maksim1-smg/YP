-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 29 2023 г., 22:25
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `count` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `code`) VALUES
(1, 'Стол', 'table'),
(2, 'Стул', 'chair'),
(3, 'Диван', 'sofa'),
(4, 'Шкаф', 'closet'),
(5, 'Кровать', 'bed'),
(6, 'Кресла', 'armchairs'),
(7, 'Тумба', 'pedestal'),
(8, 'Комод', 'komod');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `order_status_id` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_list`
--

CREATE TABLE `order_list` (
  `id` int NOT NULL,
  `count` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_status`
--

CREATE TABLE `order_status` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'Ждет подтверждения'),
(2, 'Готовится к отправлению'),
(3, 'Отправлено в место назначения'),
(4, 'Получено');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `model` varchar(32) NOT NULL,
  `rate` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `amount` int NOT NULL,
  `photo_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text NOT NULL,
  `category_id` int NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `model`, `rate`, `price`, `amount`, `photo_file`, `description`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Стол \"Регина\"', '312-А', 125, '10000.00', 10, 'Zno5anzbgAlDun24aULYOMNqqsKlAIv8shDHaRyA.jpg', 'Стильный и удобный стол \"Регина\" сделан из качественных материалов и имеет прочную конструкцию. Он идеально подходит для организации рабочего места в домашнем офисе или кабинете.', 1, '0000-00-00 00:00:00', '2023-05-29 12:26:37'),
(2, '\"Ретро-диван\"', 'RD-300', 150, '15000.00', 10, NULL, 'Этот диван в стиле ретро имеет красивую кожаную обивку и мягкие подушки для комфортного отдыха. Он идеально подойдет для гостиной или кабинета.', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '\"Модерн-шкаф\"', 'MS-200', 80, '8000.00', 5, NULL, 'Этот шкаф в современном стиле имеет гладкую поверхность и много места для хранения вещей. Он идеально подойдет для спальни или гостиной.', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '\"Классический стул\"', 'CS-100', 200, '2000.00', 20, NULL, 'Этот классический стул имеет красивую деревянную раму и мягкую обивку для комфортного сидения. Он идеально подойдет для столовой или кухни.', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '\"Скандинавский стол\"', 'SS-400', 120, '12000.00', 8, NULL, 'Этот стол в скандинавском стиле имеет простую, но элегантную конструкцию и идеально подойдет для обеденной зоны или кабинета.', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '\"Ретро-комод\"', 'RC-500', 90, '9000.00', 6, NULL, 'Этот комод в стиле ретро имеет красивую деревянную отделку и много места для хранения. Он идеально подойдет для спальни или гостиной.', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '\"Атланта\" ', '2023', 250, '45000.00', 10, NULL, 'Элегантный диван с мягкими подушками и удобными подлокотниками. Идеально подходит для уютного отдыха в гостиной или спальне.', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Милан\"', 'FAHOLSI', 150, '25000.00', 15, NULL, 'Просторный шкаф с двумя отделениями и множеством полок для хранения одежды, обуви и аксессуаров. Изготовлен из качественных материалов и прочен в использовании.', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '\"Оксфорд\"', 'AFS4', 100, '15000.00', 26, NULL, 'Стильный и практичный стол для рабочего места или обеденного уголка. Изготовлен из прочных материалов и имеет удобные ящики для хранения мелочей.', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `name`, `code`) VALUES
(1, 'Админ', 'admin'),
(2, 'Менеджер', 'manager'),
(3, 'Клиент', 'client');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `surname` varchar(32) NOT NULL,
  `patronymic` varchar(32) DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  `photo_file` varchar(255) DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `role_id` int NOT NULL DEFAULT '3',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `patronymic`, `login`, `password`, `telephone`, `photo_file`, `api_token`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 'Антон', 'Кольмай', NULL, 'admin', 'admin', '89669663322', NULL, '$2y$10$3cgNxGyCyXqZ4sJgMpUcDO97X1ykxGrQitgQaa08dgwgQ4MQi8a52', 1, NULL, '2023-05-29 12:28:12'),
(2, 'Вася', 'Алексеевич', 'Владимирович', 'manager', 'manager', '89669663323', NULL, NULL, 2, NULL, '2023-05-13 12:10:09'),
(3, 'Уолтер ', 'Хартвелл ', 'Уайт ', 'heisenberg', 'heisenberg123', '89996201796', NULL, NULL, 1, NULL, NULL),
(4, 'Екатерина ', 'Михайлова ', 'Андреевна', 'ekaterina_mihaylova', '9x#2Kp', '79261234567', NULL, NULL, 3, NULL, NULL),
(5, 'Степан ', 'Ковалев', 'Владимирович', 'stepan_kovalev', '3qN!7f', '79269876543', NULL, NULL, 3, NULL, NULL),
(6, 'Анастасия', 'Петрова', 'Александровна', 'stepan_kovalev', '3qN!7f', '79265555555', NULL, NULL, 3, NULL, NULL),
(9, 'Иван', 'Иванов', 'Иванович', 'ivan_ivanov', 'Dp9@5t', '79261111111', NULL, NULL, 3, NULL, NULL),
(10, 'Марина', 'Сидорова', 'Алексеевна', 'marina_sidorova', '6m#J7c', '79262222222', NULL, NULL, 3, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_status_id` (`order_status_id`);

--
-- Индексы таблицы `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`category_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telephone` (`telephone`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
