-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2024 a las 15:40:06
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `negocio`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar`(
    in estado char(1)
)
select * from trabajador where esttra=estado$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `codcat` int(11) NOT NULL AUTO_INCREMENT,
  `descat` varchar(30) NOT NULL,
  PRIMARY KEY (`codcat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`codcat`, `descat`) VALUES
(1, 'MONITOR'),
(2, 'IMPRESORA'),
(3, 'MEMORIA'),
(4, 'DISCO DURO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `codpro` int(11) NOT NULL AUTO_INCREMENT,
  `codcat` int(11) NOT NULL,
  `despro` varchar(60) NOT NULL,
  `unipro` varchar(30) NOT NULL,
  `pcopro` decimal(10,2) NOT NULL,
  `pvepro` decimal(10,2) NOT NULL,
  `stopro` decimal(10,2) NOT NULL,
  `frepro` date NOT NULL,
  PRIMARY KEY (`codpro`),
  KEY `codcat` (`codcat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codpro`, `codcat`, `despro`, `unipro`, `pcopro`, `pvepro`, `stopro`, `frepro`) VALUES
(1, 2, 'IMPRESORA CANON 280MP', 'UND', '80.00', '120.00', '10.00', '2024-05-28'),
(2, 1, 'MONITOR HP 14 PULG', 'UND', '400.00', '500.00', '5.00', '2024-05-28'),
(3, 1, 'MONITOR ACER 24 PULG', 'UND', '650.50', '750.00', '10.00', '2024-06-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE IF NOT EXISTS `trabajador` (
  `codtra` int(11) NOT NULL AUTO_INCREMENT,
  `apetra` varchar(25) NOT NULL,
  `nomtra` varchar(25) NOT NULL,
  `dirtra` varchar(60) NOT NULL,
  `doctra` char(8) NOT NULL,
  `teltra` varchar(20) DEFAULT NULL,
  `esttra` char(1) NOT NULL,
  `cortra` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codtra`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`codtra`, `apetra`, `nomtra`, `dirtra`, `doctra`, `teltra`, `esttra`, `cortra`) VALUES
(1, 'JARAMILLO ORTIZ', 'LUIS', 'LIMA NORTE', '02851253', '948430291', 'S', 'jaor2321@hotmail.com'),
(2, 'NAVARRO', 'RUIZ', 'LIMA NORTE', '02851257', NULL, 'C', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`codcat`) REFERENCES `categoria` (`codcat`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
