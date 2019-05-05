-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Янв 26 2019 г., 21:10
-- Версия сервера: 5.7.22-22-log
-- Версия PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `a251598_1`
--
CREATE DATABASE IF NOT EXISTS `a251598_1` DEFAULT CHARACTER SET cp1251 COLLATE cp1251_general_ci;
USE `a251598_1`;

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Additional_expenses`
--

CREATE TABLE `Pricelist_Additional_expenses` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` decimal(5,1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ДОПОЛНИТЕЛЬНЫЕ РАСХОДЫ НА САНТЕХНИЧЕСКИЕ РАБОТЫ';

--
-- Дамп данных таблицы `Pricelist_Additional_expenses`
--

INSERT INTO `Pricelist_Additional_expenses` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Работа в стесненных условиях (менее 30 см до ближайшего предмета или стен)', 'коэф.', '1.3'),
(2, 'Коэффициент на работы с дорогостоящими материалами и оборудованием', 'коэф.', '2.5'),
(3, 'Монтаж оборудования в готовый короб', 'коэф.', '1.4');

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Bath`
--

CREATE TABLE `Pricelist_Bath` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ВАННЫ И ДУШЕВЫЕ КОЛОНКИ';

--
-- Дамп данных таблицы `Pricelist_Bath`
--

INSERT INTO `Pricelist_Bath` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Монтаж ванны стальной (акриловой)', 'шт.', 2000),
(2, 'Монтаж ванны чугунной', 'шт.', 2500),
(3, 'Монтаж ванны нестандартных размеров (без гидромассажа)', 'шт.', 3000),
(4, 'Монтаж ванны (с гидромассажем)', 'шт.', 3500),
(5, 'Монтаж ванны нестандартных размеров (с гидромассажем)', 'шт.', 4500),
(6, 'Монтаж сифона под ванну с обвязкой пластик', 'шт.', 600),
(7, 'Монтаж сифона под ванну с обвязкой медь', 'шт.', 1000),
(8, 'Гидроизоляция швов ванной', 'м.п.', 300),
(9, 'Монтаж экрана под ванну', 'шт.', 600),
(10, 'Монтаж душевой штанги', 'шт.', 300),
(11, 'Установка поддона акрилового с подключением', 'шт.', 1500);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Boiler`
--

CREATE TABLE `Pricelist_Boiler` (
  `number` int(11) UNSIGNED NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(10) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='УСТАНОВКА КОТЛОВ И КОТЕЛЬНОГО ОБОРУДОВАНИЯ';

--
-- Дамп данных таблицы `Pricelist_Boiler`
--

INSERT INTO `Pricelist_Boiler` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Монтаж настенного котла (одноконтурный)', 'шт.', 6000),
(2, 'Монтаж настенного котла (двухконтурный)', 'шт.', 8000),
(3, 'Монтаж напольного газового котла до 60 кВт', 'шт.', 18000),
(4, 'Монтаж напольного газового котла до 140 кВт', 'шт.', 25000),
(5, 'Монтаж бойлера косвенного нагрева до 300 л', 'шт.', 5500),
(6, 'Монтаж бойлера косвенного нагрева свыше 300 л', 'шт.', 8500),
(7, 'Монтаж бойлера прямого нагрева до 300 л', 'шт.', 5500),
(8, 'Монтаж бойлера прямого нагрева свыше 300 л', 'шт.', 8500),
(9, 'Монтаж дымохода диаметром до 140 мм', 'м.п.', 1500),
(10, 'Монтаж дымохода диаметром свыше 140 мм', 'м.п.', 2100),
(11, 'Монтаж группы безопасности котла', NULL, 1800),
(12, 'Монтаж расширительного бака', 'шт.', 2100),
(13, 'Монтаж циркуляционного насоса', 'шт.', 2100),
(14, 'Монтаж основного распределительного коллектора до 70 кВт', 'пр.', 1500),
(15, 'Монтаж основного распределительного коллектора от 70 кВт до 117 кВт', 'пр.', 3500),
(16, 'Монтаж термогидравлического распределителя (ГИДРОСТРЕЛКА)', NULL, 2500),
(17, 'Монтаж насосной группы', 'шт.', 2500),
(18, 'Монтаж вторичного теплообменника', 'шт.', 5500),
(19, 'Монтаж емкости для дизельного топлива', 'шт.', 9500),
(20, 'Электромонтажные работы', NULL, 5500),
(21, 'Пуско-наладочные работы', NULL, 5500);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Connecting_home_appliances`
--

CREATE TABLE `Pricelist_Connecting_home_appliances` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='МОНТАЖ И ПОДКЛЮЧЕНИЕ БЫТОВОЙ ТЕХНИКИ';

--
-- Дамп данных таблицы `Pricelist_Connecting_home_appliances`
--

INSERT INTO `Pricelist_Connecting_home_appliances` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Подключение к водопроводу стиральной машины (при наличии паспорта и инструкции)', 'шт.', 1000),
(2, 'Подключение к водопроводу посудомоечной машины (при наличии паспорта и инструкции)', 'шт.', 1000),
(3, 'Монтаж водонагревателя проточного', 'шт.', 1500),
(4, 'Монтаж водонагревателя накопительного (50 – 80 л)', 'шт.', 2400);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Dismantling`
--

CREATE TABLE `Pricelist_Dismantling` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ДЕМОНТАЖ';

--
-- Дамп данных таблицы `Pricelist_Dismantling`
--

INSERT INTO `Pricelist_Dismantling` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Демонтаж раздвижной шторы на ванну (пластиковая)', 'шт.', 250),
(2, 'Демонтаж раздвижной шторы на ванну (стеклянная)', 'шт.', 400),
(3, 'Демонтаж ванны с обвязкой (без выноса)', 'шт.', 700),
(4, 'Демонтаж полотенцесушителя', 'шт.', 300),
(5, 'Демонтаж радиатора (алюминиевого)', 'шт.', 300),
(6, 'Демонтаж радиатора (чугунного)', 'шт.', 500),
(7, 'Демонтаж унитаза, биде', 'шт.', 400),
(8, 'Демонтаж бачка', 'шт.', 400),
(9, 'Демонтаж раковины', 'шт.', 350),
(10, 'Демонтаж сифона раковины', 'шт.', 250),
(11, 'Демонтаж смесителя', 'шт.', 250),
(12, 'Демонтаж машины посудомоечной', 'шт.', 400),
(13, 'Демонтаж машины стиральной', 'шт.', 300),
(14, 'Демонтаж стояка водоснабжения', 'шт.', 1000),
(15, 'Демонтаж труб водопроводных', 'компл.', 2000),
(16, 'Демонтаж труб канализации', 'компл.', 1500),
(17, 'Демонтаж фанового тройника', 'шт.', 2500),
(18, 'Демонтаж распределительного коллектора', 'шт.', 500),
(19, 'Демонтаж отсекающего вентиля', 'шт.', 150),
(20, 'Демонтаж водосчетчика', 'шт.', 200),
(21, 'Демонтаж водонагревателя проточного', 'шт.', 400),
(22, 'Демонтаж водонагревателя накопительного', 'шт.', 600),
(23, 'Демонтаж и зачистка герметизационных швов', 'м.п.', 300),
(24, 'Демонтаж пластиковой / латунной обвязки', 'шт.', 400),
(25, 'Демонтаж чугунной обвязки', 'шт.', 1000),
(26, 'Демонтаж душевой штанги', 'шт.', 150),
(27, 'Демонтаж экрана под ванной', 'шт.', 200),
(28, 'Демонтаж фильтра грубой очистки', 'шт.', 200),
(29, 'Демонтаж фильтра тонкой очистки', 'шт.', 300),
(30, 'Демонтаж подиума высотой до 15 см', 'м2', 1500),
(31, 'Демонтаж душевой кабины', 'шт.', 1000),
(32, 'Демонтаж душевой кабины с сохранением', 'шт.', 2000),
(33, 'Демонтаж душевого поддона', 'шт.', 1000);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Expert_departure`
--

CREATE TABLE `Pricelist_Expert_departure` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ВЫЕЗД СПЕЦИАЛИСТА НА ОБЪЕКТ';

--
-- Дамп данных таблицы `Pricelist_Expert_departure`
--

INSERT INTO `Pricelist_Expert_departure` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Выезд специалиста в пределах окружной', NULL, 500),
(2, 'Выезд специалиста 10 км от окружной', NULL, 750),
(3, 'Выезд специалиста 20 км от окружной', NULL, 1000),
(4, 'Выезд специалиста 30 км от окружной', NULL, 1250),
(5, 'Выезд специалиста 40 км от окружной', NULL, 1500),
(6, 'Выезд специалиста 50 км от окружной', NULL, 2000),
(7, 'Выезд специалиста 100 км от окружной', NULL, 3000);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Filters`
--

CREATE TABLE `Pricelist_Filters` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ФИЛЬТРЫ ДЛЯ ОЧИСТКИ ВОДЫ';

--
-- Дамп данных таблицы `Pricelist_Filters`
--

INSERT INTO `Pricelist_Filters` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Монтаж фильтров грубой очистки', 'шт.', 300),
(2, 'Монтаж фильтров тонкой очистки', 'шт.', 800),
(3, 'Замена картриджей фильтров', 'шт.', 850);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Heating_system`
--

CREATE TABLE `Pricelist_Heating_system` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Система отопления';

--
-- Дамп данных таблицы `Pricelist_Heating_system`
--

INSERT INTO `Pricelist_Heating_system` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Разводка системы отопления', 'м.п.', 300),
(2, 'Опрессовка системы отопления', NULL, 5500),
(3, 'Опрессовка напольной системы отопления (теплый пол)', NULL, 5500);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Mixer`
--

CREATE TABLE `Pricelist_Mixer` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='СМЕСИТЕЛИ';

--
-- Дамп данных таблицы `Pricelist_Mixer`
--

INSERT INTO `Pricelist_Mixer` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Монтаж смесителя (настенного)', 'шт.', 900),
(2, 'Монтаж смесителя (с подводкой снизу)', 'шт.', 850),
(3, 'Монтаж смесителя (моноблочного)', 'шт.', 1600),
(4, 'Монтаж смесителя на борт ванны (за одно отверстие)', 'шт.', 1600),
(5, 'Монтаж смесителя с душевой лейкой', 'шт.', 1050),
(6, 'Сверление отверстия в мойке, раковине под смеситель', 'шт.', 450),
(7, 'Монтаж настенного смесителя с терморегулятором', 'шт.', 2200),
(8, 'Монтаж электронного (бесконтактного) смесителя', 'шт.', 3000),
(9, 'Монтаж смесителя для биде', 'шт.', 900);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Pipes`
--

CREATE TABLE `Pricelist_Pipes` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ТРУБЫ И СТОЯКИ';

--
-- Дамп данных таблицы `Pricelist_Pipes`
--

INSERT INTO `Pricelist_Pipes` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Монтаж стояка водоснабжения ( в пределах квартиры)', 'шт.', 2500),
(2, 'Проход стояка водоснабжения через одно перекрытие', 'шт.', 600),
(3, 'Прокладка труб канализации ПВХ (комплект – ванна, раковина, унитаз, стиральная машина)', 'компл.', 3000),
(4, 'Монтаж трубы фанового лежака', 'м.п.', 600),
(5, 'Монтаж трубы фанового тройника', 'шт.', 1200),
(6, 'Расчеканка фанового раструба в стояке канализации', 'шт.', 1400),
(7, 'Замена стояка канализации (в пределах квартиры)', 'шт.', 4500),
(8, 'Монтаж канализационного трапа', 'шт.', 1500),
(9, 'Разводка труб х/г водоснабжения', 'точка', 2500),
(10, 'Разводка труб х/г водоснабжения', 'м.п.', 400),
(11, 'Крепление труб при монтаже (бурение отверстия, дюбель, за крепление)', 'шт.', 30),
(12, 'Монтаж разводящего коллектора (типа гребенка)', 'шт.', 900),
(13, 'Монтаж крана (шарового, вентильного)', 'шт.', 300),
(14, 'Монтаж тройника, муфты, уголка, переходника, соединения типа \"американка\" и т.д.', 'шт.', 300),
(15, 'Монтаж регуляторов давления воды', 'шт.', 400),
(16, 'Монтаж заглушки на трубопроводе', 'шт.', 900),
(17, 'Монтаж обратного клапана (водопровод, отопление)', 'шт.', 900);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Pipes_strobe`
--

CREATE TABLE `Pricelist_Pipes_strobe` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ШТРОБЛЕНИЕ ПОД САНТЕХНИЧЕСКИЕ ТРУБЫ';

--
-- Дамп данных таблицы `Pricelist_Pipes_strobe`
--

INSERT INTO `Pricelist_Pipes_strobe` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Штроба по бетону до 40 мм под сантехнические трубы (без оштукатуривания)', 'м.п.', 550),
(2, 'Штроба по кирпичу до 40 мм под сантехнические трубы (без оштукатуривания)', 'м.п.', 400),
(3, 'Штроба в армированной высотных зданий', 'м.п.', 1200),
(4, 'Штробление под инсталляцию (ниша) условный размер (600*1000*200 мм) (кирпич, пеноблок)', 'шт.', 6000),
(5, 'Штробление под инсталляцию (ниша) условный размер (600*1000*200 мм) (бетон)', 'шт.', 8000),
(6, 'Бурение отверстия под трубы (зависит от диаметра)', 'шт.', 400);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Pipes_thread`
--

CREATE TABLE `Pricelist_Pipes_thread` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='НАРЕЗКА РЕЗЬБЫ ТРУБЫ';

--
-- Дамп данных таблицы `Pricelist_Pipes_thread`
--

INSERT INTO `Pricelist_Pipes_thread` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Нарезка резьбы (диаметр ½)', 'шт.', 400),
(2, 'Нарезка резьбы (диаметр ¾)', 'шт.', 500),
(3, 'Нарезка резьбы (диаметр 1 и более)', 'шт.', 600);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Plumbing_repair`
--

CREATE TABLE `Pricelist_Plumbing_repair` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='РЕМОНТ САНТЕХНИЧЕСКИХ КОММУНИКАЦИЙ, НАВЕСКА АКСЕССУАРОВ';

--
-- Дамп данных таблицы `Pricelist_Plumbing_repair`
--

INSERT INTO `Pricelist_Plumbing_repair` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Замена гибкой подводки', 'шт.', 200),
(2, 'Ремонт смесителя (замена кранбуксы, прокладки)', 'шт.', 1200),
(3, 'Замена арматуры в бачке (без гарантии)', 'компл.', 1000),
(4, 'Монтаж манжета резинового (кольцо уплотнительное)', 'шт.', 300),
(5, 'Устранение засора труб', 'шт.', 1200),
(6, 'Монтаж сифона (пластик)', 'шт.', 350),
(7, 'Монтаж гофры', 'шт.', 450),
(8, 'Монтаж гибкой подводки', 'шт.', 150),
(9, 'Монтаж резиновых манжет', 'шт.', 90),
(10, 'Установка кронштейна для душа', 'шт.', 300),
(11, 'Навеска аксессуаров для ванной и туалета (бумагодержатель, венчик и т.д.)', 'шт.', 200);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Polote_dryer`
--

CREATE TABLE `Pricelist_Polote_dryer` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ПОЛОТЕНЦЕСУШИТЕЛИ';

--
-- Дамп данных таблицы `Pricelist_Polote_dryer`
--

INSERT INTO `Pricelist_Polote_dryer` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Монтаж полотенцесушителя', 'шт.', 1500),
(2, 'Сборка и монтаж байпаса для полотенцесушителя', 'шт.', 1000);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Radiator`
--

CREATE TABLE `Pricelist_Radiator` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='РАДИАТОРЫ ОТОПЛЕНИЯ, КОНВЕКТОРЫ, ТЕПЛЫЕ ПОЛЫ';

--
-- Дамп данных таблицы `Pricelist_Radiator`
--

INSERT INTO `Pricelist_Radiator` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Монтаж кронштейнов для радиаторов отопления', 'шт.', 350),
(2, 'Монтаж радиатора алюминиевого (без установки вентилей и замены труб.)', 'шт.', 2000),
(3, 'Монтаж радиатора чугунного (без установки вентилей и замены труб.)', 'шт.', 2500),
(4, 'Установка конвектора встроенного в пол (до 1500 мм длиной)', 'шт.', 3700),
(5, 'Установка конвектора встроенного в пол (свыше 1500 мм длиной)', 'шт.', 4200),
(6, 'Установка конвектора напольного', 'шт.', 3700),
(8, 'Укладка теплого пола водяного (подложка, направляющие для трубы, укладка трубы, демпферная лента)', 'м2', 500),
(9, 'Монтаж терморегулятора для радиатора отопления', 'шт.', 750),
(10, 'Монтаж запорно–регулирующей арматуры для радиаторов отопления', 'шт.', 300),
(11, 'Врезка фитингов в действующую подводку', 'шт.', 350);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Shower_cabin`
--

CREATE TABLE `Pricelist_Shower_cabin` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ДУШЕВЫЕ КАБИНЫ';

--
-- Дамп данных таблицы `Pricelist_Shower_cabin`
--

INSERT INTO `Pricelist_Shower_cabin` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Сборка и установка душевой кабины простой (не китайского производства)', 'шт.', 5700),
(2, 'Сборка и установка душевой кабины простой (производства Китай)', 'шт.', 9000),
(3, 'Сборка и установка душевой кабины с гидромассажем', 'шт.', 8200),
(4, 'Гидроизоляция швов душевой кабины', 'м.п.', 300),
(5, 'Подключение дополнительного оборудования (радио, телефон)', 'шт.', 300);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Sink`
--

CREATE TABLE `Pricelist_Sink` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='РАКОВИНЫ, МОЙКИ – БЕЗ СМЕСИТЕЛЕЙ';

--
-- Дамп данных таблицы `Pricelist_Sink`
--

INSERT INTO `Pricelist_Sink` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Монтаж раковины', 'шт.', 500),
(2, 'Монтаж раковины с пьедесталом', 'шт.', 1300),
(3, 'Монтаж раковины над стиральной машиной', 'шт.', 1200),
(4, 'Монтаж раковины на шкафчике со сборкой', 'шт.', 2000),
(5, 'Монтаж кухонной мойки врезной и накладной', 'шт.', 800),
(6, 'Монтаж кухонной мойки врезной и накладной (гранит)', 'шт.', 1000),
(7, 'Монтаж и сборка сифона под раковину', 'шт.', 400),
(8, 'Вырез отверстия под раковину', 'шт.', 800),
(9, 'Гидроизоляция швов раковины', 'м.п.', 250),
(10, 'Сборка и монтаж тумбы под раковину', 'шт.', 1200);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Toilet`
--

CREATE TABLE `Pricelist_Toilet` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='УНИТАЗЫ, БИДЕ, ПИССУАРЫ';

--
-- Дамп данных таблицы `Pricelist_Toilet`
--

INSERT INTO `Pricelist_Toilet` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Установка унитаза напольного, биде (в сборе) с подключением', 'шт.', 1450),
(2, 'Установка нестандартного унитаза (угловой и т.п.)', 'шт.', 2500),
(3, 'Установка инсталляции (механизм, рама) без чаши унитаза', 'шт.', 3800),
(4, 'Установка чаши унитаза подвесного', 'шт.', 1100),
(5, 'Разворот унитаза (без доработки коммуникаций)', 'шт.', 2000),
(6, 'Замена сливного бачка унитаза', 'шт.', 1200),
(7, 'Монтаж писсуара с обвязкой', 'шт.', 1800),
(8, 'Замена гофры на унитаз (сальника)', 'шт.', 450);

-- --------------------------------------------------------

--
-- Структура таблицы `Pricelist_Water_meter`
--

CREATE TABLE `Pricelist_Water_meter` (
  `number` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `metrics` varchar(20) DEFAULT NULL,
  `cost` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='СЧЕТЧИКИ ВОДЫ И ПРИБОРЫ В СИСТЕМУ ВОДОСНАБЖЕНИЯ';

--
-- Дамп данных таблицы `Pricelist_Water_meter`
--

INSERT INTO `Pricelist_Water_meter` (`number`, `name`, `metrics`, `cost`) VALUES
(1, 'Монтаж редукторов давления', 'шт.', 1200),
(2, 'Монтаж реле давления', 'шт.', 2300),
(3, 'Монтаж системы защиты от протечек воды (2 крана + блок + 2 датчика)', 'шт.', 5500),
(4, 'Монтаж счетчика воды (замена)', 'шт.', 600),
(5, 'Стандартная схема подключения счетчика: установка фильтра, шарового вентиля, счетчика', 'шт.', 1200);

-- --------------------------------------------------------

--
-- Структура таблицы `Registration_User`
--

CREATE TABLE `Registration_User` (
  `id` int(11) NOT NULL,
  `login` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `date` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `foto` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `Registration_User`
--

INSERT INTO `Registration_User` (`id`, `login`, `password`, `date`, `name`, `phone`, `email`, `foto`) VALUES
(1, 'guest', '084e0343a0486ff05530df6c705c8bb4', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Service_Order`
--

CREATE TABLE `Service_Order` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `item` json NOT NULL,
  `date` int(20) NOT NULL,
  `status` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ЗАКАЗЫ НА УСЛУГИ';

--
-- Дамп данных таблицы `Service_Order`
--

INSERT INTO `Service_Order` (`id`, `user`, `item`, `date`, `status`) VALUES
(1, 1, '{}', 0, 'Сформирован'),
(3, 1, '[5]', 1543359042, 'Сформирован'),
(4, 1, '[null]', 1543360349, 'Сформирован'),
(5, 1, '[null]', 1543360580, 'Сформирован'),
(6, 1, '[null]', 1543360671, 'Сформирован'),
(7, 1, '[null]', 1543360693, 'Сформирован'),
(8, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543360881, 'Сформирован'),
(9, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543361639, 'Сформирован'),
(10, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543361671, 'Сформирован'),
(11, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543362136, 'Сформирован'),
(12, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543362215, 'Сформирован'),
(13, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543447417, 'Сформирован'),
(14, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543448649, 'Сформирован'),
(15, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543449452, 'Сформирован'),
(16, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543527500, 'Сформирован'),
(17, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543529643, 'Сформирован'),
(18, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543531542, 'Сформирован'),
(19, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543532541, 'Отправлен'),
(20, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}]', 1543612851, 'Сформирован'),
(21, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543617932, 'Отправлен'),
(22, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543623186, 'Сформирован'),
(23, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543624675, 'Отправлен'),
(24, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543693359, 'Сформирован'),
(25, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543693783, 'Отправлен'),
(26, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543694058, 'Отправлен'),
(27, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543694785, 'Отправлен'),
(28, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543695106, 'Отправлен'),
(29, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543697583, 'Сформирован'),
(30, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543697672, 'Сформирован'),
(31, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543697994, 'Сформирован'),
(32, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543698075, 'Сформирован'),
(33, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543698245, 'Сформирован'),
(34, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543698377, 'Отправлен'),
(35, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543704956, 'Отправлен'),
(36, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543708854, 'Отправлен'),
(37, 1, '[{\"cost\": \"2500\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0442u043eu044fu043au0430 u0432u043eu0434u043eu0441u043du0430u0431u0436u0435u043du0438u044f ( u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043au0432u0430u0440u0442u0438u0440u044b)\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Pipes\"}, {\"cost\": \"3000\", \"name\": \"u041fu0440u043eu043au043bu0430u0434u043au0430 u0442u0440u0443u0431 u043au0430u043du0430u043bu0438u0437u0430u0446u0438u0438 u041fu0412u0425 (u043au043eu043cu043fu043bu0435u043au0442 u2013 u0432u0430u043du043du0430, u0440u0430u043au043eu0432u0438u043du0430, u0443u043du0438u0442u0430u0437, u0441u0442u0438u0440u0430u043bu044cu043du0430u044f u043cu0430u0448u0438u043du0430)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Pipes\"}]', 1543709215, 'Отправлен'),
(38, 1, '[{\"cost\": \"600\", \"name\": \"u041fu0440u043eu0445u043eu0434 u0441u0442u043eu044fu043au0430 u0432u043eu0434u043eu0441u043du0430u0431u0436u0435u043du0438u044f u0447u0435u0440u0435u0437 u043eu0434u043du043e u043fu0435u0440u0435u043au0440u044bu0442u0438u0435\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Pipes\"}, {\"cost\": \"1200\", \"name\": \"u041cu043eu043du0442u0430u0436 u0442u0440u0443u0431u044b u0444u0430u043du043eu0432u043eu0433u043e u0442u0440u043eu0439u043du0438u043au0430\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Pipes\"}, {\"cost\": \"4500\", \"name\": \"u0417u0430u043cu0435u043du0430 u0441u0442u043eu044fu043au0430 u043au0430u043du0430u043bu0438u0437u0430u0446u0438u0438 (u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043au0432u0430u0440u0442u0438u0440u044b)\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Pipes\"}]', 1543709312, 'Отправлен'),
(39, 1, '[{\"cost\": \"1200\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0434u0443u043au0442u043eu0440u043eu0432 u0434u0430u0432u043bu0435u043du0438u044f\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}, {\"cost\": \"1200\", \"name\": \"u0421u0442u0430u043du0434u0430u0440u0442u043du0430u044f u0441u0445u0435u043cu0430 u043fu043eu0434u043au043bu044eu0447u0435u043du0438u044f u0441u0447u0435u0442u0447u0438u043au0430: u0443u0441u0442u0430u043du043eu0432u043au0430 u0444u0438u043bu044cu0442u0440u0430, u0448u0430u0440u043eu0432u043eu0433u043e u0432u0435u043du0442u0438u043bu044f, u0441u0447u0435u0442u0447u0438u043au0430\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}, {\"cost\": \"1200\", \"name\": \"u0421u0442u0430u043du0434u0430u0440u0442u043du0430u044f u0441u0445u0435u043cu0430 u043fu043eu0434u043au043bu044eu0447u0435u043du0438u044f u0441u0447u0435u0442u0447u0438u043au0430: u0443u0441u0442u0430u043du043eu0432u043au0430 u0444u0438u043bu044cu0442u0440u0430, u0448u0430u0440u043eu0432u043eu0433u043e u0432u0435u043du0442u0438u043bu044f, u0441u0447u0435u0442u0447u0438u043au0430\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}, {\"cost\": \"5500\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0441u0442u0435u043cu044b u0437u0430u0449u0438u0442u044b u043eu0442 u043fu0440u043eu0442u0435u0447u0435u043a u0432u043eu0434u044b (2 u043au0440u0430u043du0430 + u0431u043bu043eu043a + 2 u0434u0430u0442u0447u0438u043au0430)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}, {\"cost\": \"5500\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0441u0442u0435u043cu044b u0437u0430u0449u0438u0442u044b u043eu0442 u043fu0440u043eu0442u0435u0447u0435u043a u0432u043eu0434u044b (2 u043au0440u0430u043du0430 + u0431u043bu043eu043a + 2 u0434u0430u0442u0447u0438u043au0430)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}, {\"cost\": \"250\", \"name\": \"u0414u0435u043cu043eu043du0442u0430u0436 u0440u0430u0437u0434u0432u0438u0436u043du043eu0439 u0448u0442u043eu0440u044b u043du0430 u0432u0430u043du043du0443 (u043fu043bu0430u0441u0442u0438u043au043eu0432u0430u044f)\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Dismantling\"}, {\"cost\": \"2500\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0430u0434u0438u0430u0442u043eu0440u0430 u0447u0443u0433u0443u043du043du043eu0433u043e (u0431u0435u0437 u0443u0441u0442u0430u043du043eu0432u043au0438 u0432u0435u043du0442u0438u043bu0435u0439 u0438 u0437u0430u043cu0435u043du044b u0442u0440u0443u0431.)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Radiator\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u043au0440u043eu043du0448u0442u0435u0439u043du043eu0432 u0434u043bu044f u0440u0430u0434u0438u0430u0442u043eu0440u043eu0432 u043eu0442u043eu043fu043bu0435u043du0438u044f\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Radiator\"}, {\"cost\": \"1200\", \"name\": \"u0421u0442u0430u043du0434u0430u0440u0442u043du0430u044f u0441u0445u0435u043cu0430 u043fu043eu0434u043au043bu044eu0447u0435u043du0438u044f u0441u0447u0435u0442u0447u0438u043au0430: u0443u0441u0442u0430u043du043eu0432u043au0430 u0444u0438u043bu044cu0442u0440u0430, u0448u0430u0440u043eu0432u043eu0433u043e u0432u0435u043du0442u0438u043bu044f, u0441u0447u0435u0442u0447u0438u043au0430\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}, {\"cost\": \"5500\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0441u0442u0435u043cu044b u0437u0430u0449u0438u0442u044b u043eu0442 u043fu0440u043eu0442u0435u0447u0435u043a u0432u043eu0434u044b (2 u043au0440u0430u043du0430 + u0431u043bu043eu043a + 2 u0434u0430u0442u0447u0438u043au0430)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}]', 1543752053, 'Отправлен'),
(40, 1, '[{\"cost\": \"3000\", \"name\": \"u041cu043eu043du0442u0430u0436 u0432u0430u043du043du044b u043du0435u0441u0442u0430u043du0434u0430u0440u0442u043du044bu0445 u0440u0430u0437u043cu0435u0440u043eu0432 (u0431u0435u0437 u0433u0438u0434u0440u043eu043cu0430u0441u0441u0430u0436u0430)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Bath\"}, {\"cost\": \"4500\", \"name\": \"u041cu043eu043du0442u0430u0436 u0432u0430u043du043du044b u043du0435u0441u0442u0430u043du0434u0430u0440u0442u043du044bu0445 u0440u0430u0437u043cu0435u0440u043eu0432 (u0441 u0433u0438u0434u0440u043eu043cu0430u0441u0441u0430u0436u0435u043c)\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Bath\"}, {\"cost\": \"600\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 u043fu043eu0434 u0432u0430u043du043du0443 u0441 u043eu0431u0432u044fu0437u043au043eu0439 u043fu043bu0430u0441u0442u0438u043a\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Bath\"}, {\"cost\": \"300\", \"name\": \"u0413u0438u0434u0440u043eu0438u0437u043eu043bu044fu0446u0438u044f u0448u0432u043eu0432 u0432u0430u043du043du043eu0439\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u043c.u043f.\", \"table_name\": \"Pricelist_Bath\"}]', 1543752159, 'Отправлен'),
(41, 1, '[{\"cost\": \"600\", \"name\": \"u041fu0440u043eu0445u043eu0434 u0441u0442u043eu044fu043au0430 u0432u043eu0434u043eu0441u043du0430u0431u0436u0435u043du0438u044f u0447u0435u0440u0435u0437 u043eu0434u043du043e u043fu0435u0440u0435u043au0440u044bu0442u0438u0435\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Pipes\"}, {\"cost\": \"3000\", \"name\": \"u041fu0440u043eu043au043bu0430u0434u043au0430 u0442u0440u0443u0431 u043au0430u043du0430u043bu0438u0437u0430u0446u0438u0438 u041fu0412u0425 (u043au043eu043cu043fu043bu0435u043au0442 u2013 u0432u0430u043du043du0430, u0440u0430u043au043eu0432u0438u043du0430, u0443u043du0438u0442u0430u0437, u0441u0442u0438u0440u0430u043bu044cu043du0430u044f u043cu0430u0448u0438u043du0430)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Pipes\"}, {\"cost\": \"1200\", \"name\": \"u041cu043eu043du0442u0430u0436 u0442u0440u0443u0431u044b u0444u0430u043du043eu0432u043eu0433u043e u0442u0440u043eu0439u043du0438u043au0430\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Pipes\"}]', 1543752255, 'Отправлен'),
(42, 1, '[{\"cost\": \"1000\", \"name\": \"u041fu043eu0434u043au043bu044eu0447u0435u043du0438u0435 u043a u0432u043eu0434u043eu043fu0440u043eu0432u043eu0434u0443 u043fu043eu0441u0443u0434u043eu043cu043eu0435u0447u043du043eu0439 u043cu0430u0448u0438u043du044b (u043fu0440u0438 u043du0430u043bu0438u0447u0438u0438 u043fu0430u0441u043fu043eu0440u0442u0430 u0438 u0438u043du0441u0442u0440u0443u043au0446u0438u0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Connecting_home_appliances\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543762575, 'Сформирован'),
(43, 1, '[{\"cost\": \"1000\", \"name\": \"u041fu043eu0434u043au043bu044eu0447u0435u043du0438u0435 u043a u0432u043eu0434u043eu043fu0440u043eu0432u043eu0434u0443 u043fu043eu0441u0443u0434u043eu043cu043eu0435u0447u043du043eu0439 u043cu0430u0448u0438u043du044b (u043fu0440u0438 u043du0430u043bu0438u0447u0438u0438 u043fu0430u0441u043fu043eu0440u0442u0430 u0438 u0438u043du0441u0442u0440u0443u043au0446u0438u0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Connecting_home_appliances\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543762628, 'Сформирован'),
(44, 1, '[{\"cost\": \"1000\", \"name\": \"u041fu043eu0434u043au043bu044eu0447u0435u043du0438u0435 u043a u0432u043eu0434u043eu043fu0440u043eu0432u043eu0434u0443 u043fu043eu0441u0443u0434u043eu043cu043eu0435u0447u043du043eu0439 u043cu0430u0448u0438u043du044b (u043fu0440u0438 u043du0430u043bu0438u0447u0438u0438 u043fu0430u0441u043fu043eu0440u0442u0430 u0438 u0438u043du0441u0442u0440u0443u043au0446u0438u0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Connecting_home_appliances\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543762669, 'Сформирован'),
(45, 1, '[{\"cost\": \"1000\", \"name\": \"u041fu043eu0434u043au043bu044eu0447u0435u043du0438u0435 u043a u0432u043eu0434u043eu043fu0440u043eu0432u043eu0434u0443 u043fu043eu0441u0443u0434u043eu043cu043eu0435u0447u043du043eu0439 u043cu0430u0448u0438u043du044b (u043fu0440u0438 u043du0430u043bu0438u0447u0438u0438 u043fu0430u0441u043fu043eu0440u0442u0430 u0438 u0438u043du0441u0442u0440u0443u043au0446u0438u0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Connecting_home_appliances\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543762672, 'Сформирован'),
(46, 1, '[{\"cost\": \"1000\", \"name\": \"u041fu043eu0434u043au043bu044eu0447u0435u043du0438u0435 u043a u0432u043eu0434u043eu043fu0440u043eu0432u043eu0434u0443 u043fu043eu0441u0443u0434u043eu043cu043eu0435u0447u043du043eu0439 u043cu0430u0448u0438u043du044b (u043fu0440u0438 u043du0430u043bu0438u0447u0438u0438 u043fu0430u0441u043fu043eu0440u0442u0430 u0438 u0438u043du0441u0442u0440u0443u043au0446u0438u0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Connecting_home_appliances\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543762864, 'Сформирован'),
(47, 1, '[{\"cost\": \"1000\", \"name\": \"u041fu043eu0434u043au043bu044eu0447u0435u043du0438u0435 u043a u0432u043eu0434u043eu043fu0440u043eu0432u043eu0434u0443 u043fu043eu0441u0443u0434u043eu043cu043eu0435u0447u043du043eu0439 u043cu0430u0448u0438u043du044b (u043fu0440u0438 u043du0430u043bu0438u0447u0438u0438 u043fu0430u0441u043fu043eu0440u0442u0430 u0438 u0438u043du0441u0442u0440u0443u043au0446u0438u0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Connecting_home_appliances\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543762948, 'Отправлен'),
(48, 1, '[{\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u043au0440u043eu043du0448u0442u0435u0439u043du043eu0432 u0434u043bu044f u0440u0430u0434u0438u0430u0442u043eu0440u043eu0432 u043eu0442u043eu043fu043bu0435u043du0438u044f\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Radiator\"}, {\"cost\": \"1500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 40 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543763183, 'Отправлен'),
(49, 1, '[{\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u043au0440u043eu043du0448u0442u0435u0439u043du043eu0432 u0434u043bu044f u0440u0430u0434u0438u0430u0442u043eu0440u043eu0432 u043eu0442u043eu043fu043bu0435u043du0438u044f\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Radiator\"}, {\"cost\": \"1500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 40 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543763400, 'Отправлен'),
(50, 1, '[{\"cost\": \"1500\", \"name\": \"u041cu043eu043du0442u0430u0436 u0432u043eu0434u043eu043du0430u0433u0440u0435u0432u0430u0442u0435u043bu044f u043fu0440u043eu0442u043eu0447u043du043eu0433u043e\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Connecting_home_appliances\"}, {\"cost\": \"3000\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 100 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543763477, 'Отправлен'),
(51, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543765710, 'Сформирован'),
(52, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543766014, 'Сформирован');
INSERT INTO `Service_Order` (`id`, `user`, `item`, `date`, `status`) VALUES
(53, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543766046, 'Сформирован'),
(54, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543766090, 'Сформирован'),
(55, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543766161, 'Сформирован'),
(56, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543766263, 'Сформирован'),
(57, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543766680, 'Сформирован'),
(58, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543766904, 'Сформирован'),
(59, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543766959, 'Сформирован'),
(60, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543767000, 'Сформирован'),
(61, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543767599, 'Сформирован'),
(62, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543767642, 'Сформирован'),
(63, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543767948, 'Сформирован'),
(64, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"3\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"3\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0423u0441u0442u0440u0430u043du0435u043du0438u0435 u0437u0430u0441u043eu0440u0430 u0442u0440u0443u0431\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0444u043eu043du0430 (u043fu043bu0430u0441u0442u0438u043a)\", \"quant\": \"1\", \"number\": \"6\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"90\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u0437u0438u043du043eu0432u044bu0445 u043cu0430u043du0436u0435u0442\", \"quant\": \"1\", \"number\": \"9\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"150\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"8\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"450\", \"name\": \"u041cu043eu043du0442u0430u0436 u0433u043eu0444u0440u044b\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"200\", \"name\": \"u0417u0430u043cu0435u043du0430 u0433u0438u0431u043au043eu0439 u043fu043eu0434u0432u043eu0434u043au0438\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1200\", \"name\": \"u0420u0435u043cu043eu043du0442 u0441u043cu0435u0441u0438u0442u0435u043bu044f (u0437u0430u043cu0435u043du0430 u043au0440u0430u043du0431u0443u043au0441u044b, u043fu0440u043eu043au043bu0430u0434u043au0438)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"300\", \"name\": \"u041cu043eu043du0442u0430u0436 u043cu0430u043du0436u0435u0442u0430 u0440u0435u0437u0438u043du043eu0432u043eu0433u043e (u043au043eu043bu044cu0446u043e u0443u043fu043bu043eu0442u043du0438u0442u0435u043bu044cu043du043eu0435)\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543768375, 'Отправлен'),
(65, 1, '[{\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u043au0440u043eu043du0448u0442u0435u0439u043du043eu0432 u0434u043bu044f u0440u0430u0434u0438u0430u0442u043eu0440u043eu0432 u043eu0442u043eu043fu043bu0435u043du0438u044f\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Radiator\"}, {\"cost\": \"2000\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0430u0434u0438u0430u0442u043eu0440u0430 u0430u043bu044eu043cu0438u043du0438u0435u0432u043eu0433u043e (u0431u0435u0437 u0443u0441u0442u0430u043du043eu0432u043au0438 u0432u0435u043du0442u0438u043bu0435u0439 u0438 u0437u0430u043cu0435u043du044b u0442u0440u0443u0431.)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Radiator\"}, {\"cost\": \"3000\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 100 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543876185, 'Сформирован');
INSERT INTO `Service_Order` (`id`, `user`, `item`, `date`, `status`) VALUES
(66, 1, '[{\"cost\": \"350\", \"name\": \"u041cu043eu043du0442u0430u0436 u043au0440u043eu043du0448u0442u0435u0439u043du043eu0432 u0434u043bu044f u0440u0430u0434u0438u0430u0442u043eu0440u043eu0432 u043eu0442u043eu043fu043bu0435u043du0438u044f\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Radiator\"}, {\"cost\": \"2000\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0430u0434u0438u0430u0442u043eu0440u0430 u0430u043bu044eu043cu0438u043du0438u0435u0432u043eu0433u043e (u0431u0435u0437 u0443u0441u0442u0430u043du043eu0432u043au0438 u0432u0435u043du0442u0438u043bu0435u0439 u0438 u0437u0430u043cu0435u043du044b u0442u0440u0443u0431.)\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Radiator\"}, {\"cost\": \"3000\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 100 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"7\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543876200, 'Отправлен'),
(67, 1, '[{\"cost\": \"2000\", \"name\": \"u041cu043eu043du0442u0430u0436 u0432u0430u043du043du044b u0441u0442u0430u043bu044cu043du043eu0439 (u0430u043au0440u0438u043bu043eu0432u043eu0439)\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Bath\"}, {\"cost\": \"1200\", \"name\": \"u041cu043eu043du0442u0430u0436 u0442u0440u0443u0431u044b u0444u0430u043du043eu0432u043eu0433u043e u0442u0440u043eu0439u043du0438u043au0430\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Pipes\"}, {\"cost\": \"2.5\", \"name\": \"u041au043eu044du0444u0444u0438u0446u0438u0435u043du0442 u043du0430 u0440u0430u0431u043eu0442u044b u0441 u0434u043eu0440u043eu0433u043eu0441u0442u043eu044fu0449u0438u043cu0438 u043cu0430u0442u0435u0440u0438u0430u043bu0430u043cu0438 u0438 u043eu0431u043eu0440u0443u0434u043eu0432u0430u043du0438u0435u043c\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u043au043eu044du0444.\", \"table_name\": \"Pricelist_Additional_expenses\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543876243, 'Отправлен'),
(68, 1, '[{\"cost\": \"1000\", \"name\": \"u0421u0431u043eu0440u043au0430 u0438 u043cu043eu043du0442u0430u0436 u0431u0430u0439u043fu0430u0441u0430 u0434u043bu044f u043fu043eu043bu043eu0442u0435u043du0446u0435u0441u0443u0448u0438u0442u0435u043bu044f\", \"quant\": 2, \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Polote_dryer\"}, {\"cost\": \"2500\", \"name\": \"u0423u0441u0442u0430u043du043eu0432u043au0430 u043du0435u0441u0442u0430u043du0434u0430u0440u0442u043du043eu0433u043e u0443u043du0438u0442u0430u0437u0430 (u0443u0433u043bu043eu0432u043eu0439 u0438 u0442.u043f.)\", \"quant\": 1, \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Toilet\"}, {\"cost\": \"1450\", \"name\": \"u0423u0441u0442u0430u043du043eu0432u043au0430 u0443u043du0438u0442u0430u0437u0430 u043du0430u043fu043eu043bu044cu043du043eu0433u043e, u0431u0438u0434u0435 (u0432 u0441u0431u043eu0440u0435) u0441 u043fu043eu0434u043au043bu044eu0447u0435u043du0438u0435u043c\", \"quant\": 2, \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Toilet\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543960224, 'Сформирован'),
(69, 1, '[{\"cost\": \"1000\", \"name\": \"u0421u0431u043eu0440u043au0430 u0438 u043cu043eu043du0442u0430u0436 u0431u0430u0439u043fu0430u0441u0430 u0434u043bu044f u043fu043eu043bu043eu0442u0435u043du0446u0435u0441u0443u0448u0438u0442u0435u043bu044f\", \"quant\": 2, \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Polote_dryer\"}, {\"cost\": \"2500\", \"name\": \"u0423u0441u0442u0430u043du043eu0432u043au0430 u043du0435u0441u0442u0430u043du0434u0430u0440u0442u043du043eu0433u043e u0443u043du0438u0442u0430u0437u0430 (u0443u0433u043bu043eu0432u043eu0439 u0438 u0442.u043f.)\", \"quant\": 1, \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Toilet\"}, {\"cost\": \"1450\", \"name\": \"u0423u0441u0442u0430u043du043eu0432u043au0430 u0443u043du0438u0442u0430u0437u0430 u043du0430u043fu043eu043bu044cu043du043eu0433u043e, u0431u0438u0434u0435 (u0432 u0441u0431u043eu0440u0435) u0441 u043fu043eu0434u043au043bu044eu0447u0435u043du0438u0435u043c\", \"quant\": 2, \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Toilet\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543960493, 'Сформирован'),
(70, 1, '[{\"cost\": \"1000\", \"name\": \"u0421u0431u043eu0440u043au0430 u0438 u043cu043eu043du0442u0430u0436 u0431u0430u0439u043fu0430u0441u0430 u0434u043bu044f u043fu043eu043bu043eu0442u0435u043du0446u0435u0441u0443u0448u0438u0442u0435u043bu044f\", \"quant\": 2, \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Polote_dryer\"}, {\"cost\": \"2500\", \"name\": \"u0423u0441u0442u0430u043du043eu0432u043au0430 u043du0435u0441u0442u0430u043du0434u0430u0440u0442u043du043eu0433u043e u0443u043du0438u0442u0430u0437u0430 (u0443u0433u043bu043eu0432u043eu0439 u0438 u0442.u043f.)\", \"quant\": 1, \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Toilet\"}, {\"cost\": \"1450\", \"name\": \"u0423u0441u0442u0430u043du043eu0432u043au0430 u0443u043du0438u0442u0430u0437u0430 u043du0430u043fu043eu043bu044cu043du043eu0433u043e, u0431u0438u0434u0435 (u0432 u0441u0431u043eu0440u0435) u0441 u043fu043eu0434u043au043bu044eu0447u0435u043du0438u0435u043c\", \"quant\": 2, \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Toilet\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543960613, 'Сформирован'),
(71, 1, '[{\"cost\": \"1000\", \"name\": \"u0421u0431u043eu0440u043au0430 u0438 u043cu043eu043du0442u0430u0436 u0431u0430u0439u043fu0430u0441u0430 u0434u043bu044f u043fu043eu043bu043eu0442u0435u043du0446u0435u0441u0443u0448u0438u0442u0435u043bu044f\", \"quant\": 2, \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Polote_dryer\"}, {\"cost\": \"2500\", \"name\": \"u0423u0441u0442u0430u043du043eu0432u043au0430 u043du0435u0441u0442u0430u043du0434u0430u0440u0442u043du043eu0433u043e u0443u043du0438u0442u0430u0437u0430 (u0443u0433u043bu043eu0432u043eu0439 u0438 u0442.u043f.)\", \"quant\": 1, \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Toilet\"}, {\"cost\": \"1450\", \"name\": \"u0423u0441u0442u0430u043du043eu0432u043au0430 u0443u043du0438u0442u0430u0437u0430 u043du0430u043fu043eu043bu044cu043du043eu0433u043e, u0431u0438u0434u0435 (u0432 u0441u0431u043eu0440u0435) u0441 u043fu043eu0434u043au043bu044eu0447u0435u043du0438u0435u043c\", \"quant\": 2, \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Toilet\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543960758, 'Сформирован'),
(72, 1, '[{\"cost\": \"1000\", \"name\": \"u0421u0431u043eu0440u043au0430 u0438 u043cu043eu043du0442u0430u0436 u0431u0430u0439u043fu0430u0441u0430 u0434u043bu044f u043fu043eu043bu043eu0442u0435u043du0446u0435u0441u0443u0448u0438u0442u0435u043bu044f\", \"quant\": 2, \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Polote_dryer\"}, {\"cost\": \"2500\", \"name\": \"u0423u0441u0442u0430u043du043eu0432u043au0430 u043du0435u0441u0442u0430u043du0434u0430u0440u0442u043du043eu0433u043e u0443u043du0438u0442u0430u0437u0430 (u0443u0433u043bu043eu0432u043eu0439 u0438 u0442.u043f.)\", \"quant\": 1, \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Toilet\"}, {\"cost\": \"1450\", \"name\": \"u0423u0441u0442u0430u043du043eu0432u043au0430 u0443u043du0438u0442u0430u0437u0430 u043du0430u043fu043eu043bu044cu043du043eu0433u043e, u0431u0438u0434u0435 (u0432 u0441u0431u043eu0440u0435) u0441 u043fu043eu0434u043au043bu044eu0447u0435u043du0438u0435u043c\", \"quant\": 2, \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Toilet\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543961627, 'Отправлен'),
(73, 1, '[{\"cost\": \"1500\", \"name\": \"u041cu043eu043du0442u0430u0436 u043fu043eu043bu043eu0442u0435u043du0446u0435u0441u0443u0448u0438u0442u0435u043bu044f\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Polote_dryer\"}, {\"cost\": \"1000\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 20 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543961869, 'Отправлен'),
(74, 1, '[{\"cost\": \"5500\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0441u0442u0435u043cu044b u0437u0430u0449u0438u0442u044b u043eu0442 u043fu0440u043eu0442u0435u0447u0435u043a u0432u043eu0434u044b (2 u043au0440u0430u043du0430 + u0431u043bu043eu043a + 2 u0434u0430u0442u0447u0438u043au0430)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543962059, 'Отправлен'),
(75, 1, '[{\"cost\": \"700\", \"name\": \"u0414u0435u043cu043eu043du0442u0430u0436 u0432u0430u043du043du044b u0441 u043eu0431u0432u044fu0437u043au043eu0439 (u0431u0435u0437 u0432u044bu043du043eu0441u0430)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Dismantling\"}, {\"cost\": \"1000\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 20 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543962505, 'Отправлен'),
(76, 1, '[{\"cost\": \"800\", \"name\": \"u041cu043eu043du0442u0430u0436 u043au0443u0445u043eu043du043du043eu0439 u043cu043eu0439u043au0438 u0432u0440u0435u0437u043du043eu0439 u0438 u043du0430u043au043bu0430u0434u043du043eu0439\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Sink\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543962598, 'Отправлен'),
(77, 1, '[{\"cost\": \"1200\", \"name\": \"u0421u0442u0430u043du0434u0430u0440u0442u043du0430u044f u0441u0445u0435u043cu0430 u043fu043eu0434u043au043bu044eu0447u0435u043du0438u044f u0441u0447u0435u0442u0447u0438u043au0430: u0443u0441u0442u0430u043du043eu0432u043au0430 u0444u0438u043bu044cu0442u0440u0430, u0448u0430u0440u043eu0432u043eu0433u043e u0432u0435u043du0442u0438u043bu044f, u0441u0447u0435u0442u0447u0438u043au0430\", \"quant\": \"2\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543964340, 'Отправлен'),
(78, 1, '[{\"cost\": \"1000\", \"name\": \"u0421u0431u043eu0440u043au0430 u0438 u043cu043eu043du0442u0430u0436 u0431u0430u0439u043fu0430u0441u0430 u0434u043bu044f u043fu043eu043bu043eu0442u0435u043du0446u0435u0441u0443u0448u0438u0442u0435u043bu044f\", \"quant\": \"3\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Polote_dryer\"}, {\"cost\": \"1500\", \"name\": \"u041cu043eu043du0442u0430u0436 u043fu043eu043bu043eu0442u0435u043du0446u0435u0441u0443u0448u0438u0442u0435u043bu044f\", \"quant\": \"3\", \"number\": \"1\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Polote_dryer\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543964447, 'Отправлен'),
(79, 1, '[{\"cost\": \"1200\", \"name\": \"u0421u0442u0430u043du0434u0430u0440u0442u043du0430u044f u0441u0445u0435u043cu0430 u043fu043eu0434u043au043bu044eu0447u0435u043du0438u044f u0441u0447u0435u0442u0447u0438u043au0430: u0443u0441u0442u0430u043du043eu0432u043au0430 u0444u0438u043bu044cu0442u0440u0430, u0448u0430u0440u043eu0432u043eu0433u043e u0432u0435u043du0442u0438u043bu044f, u0441u0447u0435u0442u0447u0438u043au0430\", \"quant\": \"2\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543964608, 'Отправлен'),
(80, 1, '[{\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543964734, 'Сформирован'),
(81, 1, '[{\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543964795, 'Отправлен'),
(82, 1, '[{\"cost\": \"2300\", \"name\": \"u041cu043eu043du0442u0430u0436 u0440u0435u043bu0435 u0434u0430u0432u043bu0435u043du0438u044f\", \"quant\": 1, \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}, {\"cost\": \"750\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 10 u043au043c u043eu0442 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543965147, 'Отправлен'),
(83, 1, '[{\"cost\": \"600\", \"name\": \"u041cu043eu043du0442u0430u0436 u0442u0440u0443u0431u044b u0444u0430u043du043eu0432u043eu0433u043e u043bu0435u0436u0430u043au0430\", \"quant\": \"1\", \"number\": \"4\", \"metrics\": \"u043c.u043f.\", \"table_name\": \"Pricelist_Pipes\"}, {\"cost\": \"1200\", \"name\": \"u041cu043eu043du0442u0430u0436 u0442u0440u0443u0431u044b u0444u0430u043du043eu0432u043eu0433u043e u0442u0440u043eu0439u043du0438u043au0430\", \"quant\": \"3\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Pipes\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543967471, 'Отправлен'),
(84, 1, '[{\"cost\": \"3000\", \"name\": \"u041fu0440u043eu043au043bu0430u0434u043au0430 u0442u0440u0443u0431 u043au0430u043du0430u043bu0438u0437u0430u0446u0438u0438 u041fu0412u0425 (u043au043eu043cu043fu043bu0435u043au0442 u2013 u0432u0430u043du043du0430, u0440u0430u043au043eu0432u0438u043du0430, u0443u043du0438u0442u0430u0437, u0441u0442u0438u0440u0430u043bu044cu043du0430u044f u043cu0430u0448u0438u043du0430)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Pipes\"}, {\"cost\": \"1200\", \"name\": \"u041cu043eu043du0442u0430u0436 u0442u0440u0443u0431u044b u0444u0430u043du043eu0432u043eu0433u043e u0442u0440u043eu0439u043du0438u043au0430\", \"quant\": \"1\", \"number\": \"5\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Pipes\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543968902, 'Отправлен'),
(85, 1, '[{\"cost\": \"1000\", \"name\": \"u0417u0430u043cu0435u043du0430 u0430u0440u043cu0430u0442u0443u0440u044b u0432 u0431u0430u0447u043au0435 (u0431u0435u0437 u0433u0430u0440u0430u043du0442u0438u0438)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u043au043eu043cu043fu043b.\", \"table_name\": \"Pricelist_Plumbing_repair\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543969321, 'Отправлен'),
(86, 1, '[{\"cost\": \"1000\", \"name\": \"u0421u0431u043eu0440u043au0430 u0438 u043cu043eu043du0442u0430u0436 u0431u0430u0439u043fu0430u0441u0430 u0434u043bu044f u043fu043eu043bu043eu0442u0435u043du0446u0435u0441u0443u0448u0438u0442u0435u043bu044f\", \"quant\": \"1\", \"number\": \"2\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Polote_dryer\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1543970182, 'Отправлен'),
(87, 1, '[{\"cost\": \"5500\", \"name\": \"u041cu043eu043du0442u0430u0436 u0441u0438u0441u0442u0435u043cu044b u0437u0430u0449u0438u0442u044b u043eu0442 u043fu0440u043eu0442u0435u0447u0435u043a u0432u043eu0434u044b (2 u043au0440u0430u043du0430 + u0431u043bu043eu043a + 2 u0434u0430u0442u0447u0438u043au0430)\", \"quant\": \"1\", \"number\": \"3\", \"metrics\": \"u0448u0442.\", \"table_name\": \"Pricelist_Water_meter\"}, {\"cost\": \"500\", \"name\": \"u0412u044bu0435u0437u0434 u0441u043fu0435u0446u0438u0430u043bu0438u0441u0442u0430 u0432 u043fu0440u0435u0434u0435u043bu0430u0445 u043eu043au0440u0443u0436u043du043eu0439\", \"quant\": \"1\", \"number\": \"1\", \"metrics\": null, \"table_name\": \"Pricelist_Expert_departure\"}]', 1544011303, 'Отправлен');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Pricelist_Additional_expenses`
--
ALTER TABLE `Pricelist_Additional_expenses`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Bath`
--
ALTER TABLE `Pricelist_Bath`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Boiler`
--
ALTER TABLE `Pricelist_Boiler`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Connecting_home_appliances`
--
ALTER TABLE `Pricelist_Connecting_home_appliances`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Dismantling`
--
ALTER TABLE `Pricelist_Dismantling`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Expert_departure`
--
ALTER TABLE `Pricelist_Expert_departure`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Filters`
--
ALTER TABLE `Pricelist_Filters`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Heating_system`
--
ALTER TABLE `Pricelist_Heating_system`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Mixer`
--
ALTER TABLE `Pricelist_Mixer`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Pipes`
--
ALTER TABLE `Pricelist_Pipes`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Pipes_strobe`
--
ALTER TABLE `Pricelist_Pipes_strobe`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Pipes_thread`
--
ALTER TABLE `Pricelist_Pipes_thread`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Plumbing_repair`
--
ALTER TABLE `Pricelist_Plumbing_repair`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Polote_dryer`
--
ALTER TABLE `Pricelist_Polote_dryer`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Radiator`
--
ALTER TABLE `Pricelist_Radiator`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Shower_cabin`
--
ALTER TABLE `Pricelist_Shower_cabin`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Sink`
--
ALTER TABLE `Pricelist_Sink`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Toilet`
--
ALTER TABLE `Pricelist_Toilet`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Pricelist_Water_meter`
--
ALTER TABLE `Pricelist_Water_meter`
  ADD PRIMARY KEY (`number`);

--
-- Индексы таблицы `Registration_User`
--
ALTER TABLE `Registration_User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `Service_Order`
--
ALTER TABLE `Service_Order`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user` (`user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Registration_User`
--
ALTER TABLE `Registration_User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Service_Order`
--
ALTER TABLE `Service_Order`
  ADD CONSTRAINT `Service_Order_ibfk_1` FOREIGN KEY (`user`) REFERENCES `Registration_User` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
