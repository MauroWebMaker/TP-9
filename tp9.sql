-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2025 a las 04:58:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tp9`
--
CREATE DATABASE IF NOT EXISTS `tp9` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE `tp9`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_Empleado` int(11) NOT NULL,
  `dni` bigint(20) NOT NULL,
  `apellido` varchar(58) NOT NULL,
  `nombre` varchar(58) NOT NULL,
  `acceso` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_Empleado`, `dni`, `apellido`, `nombre`, `acceso`, `estado`) VALUES
(100, 40500600, 'Ramirez', 'Juan', 1, 1),
(200, 41500700, 'Gonzalez', 'Pedro', 1, 1),
(300, 42500800, 'Perez', 'Leandro', 1, 0),
(400, 25789789, 'Marcio', 'Marcelo', 1, 1),
(500, 25789234, 'Mercio', 'Marcela', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

CREATE TABLE `herramienta` (
  `id_Herramienta` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `herramienta`
--

INSERT INTO `herramienta` (`id_Herramienta`, `nombre`, `descripcion`, `stock`, `estado`) VALUES
(1, 'fresadora', 'amarilla', 14, 1),
(2, 'amoladora', 'inalambrica', 6, 0),
(3, 'taladro', 'electrico', 1, 1),
(4, 'martillo', 'cabo madera', 0, 1),
(5, 'atornillador', 'metalico', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id_Movimiento` int(11) NOT NULL,
  `id_Empleado` int(11) NOT NULL,
  `id_Herramienta` int(11) NOT NULL,
  `fechaP` date NOT NULL,
  `fechaD` date NOT NULL,
  `cantidadRet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`id_Movimiento`, `id_Empleado`, `id_Herramienta`, `fechaP`, `fechaD`, `cantidadRet`) VALUES
(1, 100, 1, '2025-09-23', '2025-09-25', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_Empleado`);

--
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`id_Herramienta`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id_Movimiento`),
  ADD KEY `id_Movimiento` (`id_Movimiento`,`id_Empleado`),
  ADD KEY `id_Empleado` (`id_Empleado`),
  ADD KEY `id_Herramienta` (`id_Herramienta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`id_Empleado`) REFERENCES `empleado` (`id_Empleado`),
  ADD CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`id_Herramienta`) REFERENCES `herramienta` (`id_Herramienta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
