-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2024 a las 23:41:34
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `idHistorial` int(20) NOT NULL,
  `movimiento` varchar(25) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  `idUsuario` int(6) NOT NULL,
  `idProducto` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`idHistorial`, `movimiento`, `cantidad`, `timestamp`, `idUsuario`, `idProducto`) VALUES
(1, 'ENTRADA', 155, '2024-10-23 13:20:09', 1, 1),
(2, 'ENTRADA', 25, '2024-10-23 13:20:32', 1, 2),
(3, 'SALIDA', 10, '2024-10-23 13:20:42', 2, 1),
(4, 'ENTRADA', 12, '2024-10-23 13:20:53', 1, 4),
(5, 'SALIDA', 5, '2024-10-23 13:20:58', 2, 2),
(6, 'ENTRADA', 9, '2024-10-23 13:23:45', 1, 4),
(7, 'SALIDA', 40, '2024-10-23 13:24:37', 3, 1),
(8, 'SALIDA', 20, '2024-10-23 13:25:13', 3, 2),
(9, 'ENTRADA', 15, '2024-10-23 13:34:10', 1, 1),
(10, 'ENTRADA', 15, '2024-10-23 13:34:20', 1, 2),
(11, 'ENTRADA', 20, '2024-10-23 13:36:06', 1, 5),
(12, 'SALIDA', 15, '2024-10-23 13:36:16', 2, 5),
(13, 'SALIDA', 21, '2024-10-23 13:36:39', 2, 4),
(14, 'ENTRADA', 10, '2024-10-23 13:46:23', 1, 2),
(15, 'SALIDA', 20, '2024-10-23 13:47:58', 3, 1),
(16, 'SALIDA', 5, '2024-10-23 13:48:59', 3, 1),
(17, 'SALIDA', 5, '2024-10-23 13:49:05', 3, 5),
(18, 'ENTRADA', 2, '2024-10-23 13:53:10', 1, 8),
(19, 'ENTRADA', 32, '2024-10-23 13:57:24', 1, 4),
(20, 'ENTRADA', 3, '2024-10-23 13:57:32', 1, 6),
(21, 'ENTRADA', 15, '2024-10-23 13:59:43', 1, 5),
(22, 'SALIDA', 8, '2024-10-23 14:00:03', 3, 1),
(23, 'SALIDA', 2, '2024-10-23 14:00:42', 3, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(6) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cantidad` int(10) NOT NULL DEFAULT 0,
  `estatus` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `cantidad`, `estatus`) VALUES
(1, 'Teclado', 87, 1),
(2, 'Mando Xbox', 25, 1),
(3, 'Mando PS4', 0, 0),
(4, 'Mesa', 32, 1),
(5, 'Silla', 15, 1),
(6, 'Mouse', 48, 1),
(7, 'Intel i7', 0, 1),
(8, 'Laptop ACER', 0, 1),
(9, 'Laptop HP', 0, 1),
(10, 'Laptop Lenovo', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(20) NOT NULL,
  `valor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `valor`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'ALMACENISTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(6) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(25) NOT NULL,
  `idRol` int(2) NOT NULL,
  `estatus` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre`, `correo`, `contraseña`, `idRol`, `estatus`) VALUES
(1, 'Rogelio Hernández Villa', 'roger@gmail.com', '123456', 1, 1),
(2, 'Ernesto Luna Ruiz', 'enrie@outlook.com', '123456', 2, 1),
(3, 'Laura Méndez Diaz', 'laura@gmail.com', '123456', 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `historial_ibfk_2` (`idUsuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRol` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `idHistorial` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
