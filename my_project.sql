-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-02-2025 a las 20:11:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_project`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `Module_id` int(11) NOT NULL AUTO_INCREMENT,
  `Module_name` varchar(20) NOT NULL,
  `Module_route` varchar(30) NOT NULL,
  `Module_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Module_id`),
  UNIQUE KEY `Module_name` (`Module_name`),
  UNIQUE KEY `Module_route` (`Module_route`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `module`
--

TRUNCATE TABLE `module`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module_role`
--

CREATE TABLE IF NOT EXISTS `module_role` (
  `Module_role_id` int(11) NOT NULL,
  `Module_FK` int(11) NOT NULL,
  `Role_FK` int(11) NOT NULL,
  PRIMARY KEY (`Module_role_id`),
  KEY `Module_FK` (`Module_FK`),
  KEY `Role_FK` (`Role_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `module_role`
--

TRUNCATE TABLE `module_role`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permitions`
--

CREATE TABLE IF NOT EXISTS `permitions` (
  `Permitions_id` int(11) NOT NULL AUTO_INCREMENT,
  `Permitions_name` varchar(20) NOT NULL,
  `Permitions_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Permitions_id`),
  UNIQUE KEY `Permitions_name` (`Permitions_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `permitions`
--

TRUNCATE TABLE `permitions`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permitions_module_role`
--

CREATE TABLE IF NOT EXISTS `permitions_module_role` (
  `Permitions_module_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `Module_role_FK` int(11) NOT NULL,
  `Permitions_FK` int(11) NOT NULL,
  PRIMARY KEY (`Permitions_module_role_id`),
  KEY `Module_role_FK` (`Module_role_FK`),
  KEY `Permitions_FK` (`Permitions_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `permitions_module_role`
--

TRUNCATE TABLE `permitions_module_role`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `Profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `Profile_name` varchar(20) NOT NULL,
  `Profile_phone` varchar(10) NOT NULL,
  `Profile_addres` varchar(30) NOT NULL,
  `Profile_email` varchar(30) NOT NULL,
  `Profile_photo` varchar(256) NOT NULL,
  `User_FK` int(11) NOT NULL,
  PRIMARY KEY (`Profile_id`),
  KEY `User_FK` (`User_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `profile`
--

TRUNCATE TABLE `profile`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `Role_id` int(11) NOT NULL AUTO_INCREMENT,
  `Role_name` varchar(20) NOT NULL,
  `Role_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Role_id`),
  UNIQUE KEY `Role_name` (`Role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `role`
--

TRUNCATE TABLE `role`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_user` varchar(30) NOT NULL,
  `User_password` varchar(256) NOT NULL,
  `User_status_FK` int(11) NOT NULL,
  `Role_FK` int(11) NOT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `User_user` (`User_user`),
  KEY `User_status_FK` (`User_status_FK`),
  KEY `Role_FK` (`Role_FK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `users`
--

TRUNCATE TABLE `users`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_status`
--

CREATE TABLE IF NOT EXISTS `user_status` (
  `User_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_status_name` varchar(20) NOT NULL,
  `User_status_description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`User_status_id`),
  UNIQUE KEY `User_status_name` (`User_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `user_status`
--

TRUNCATE TABLE `user_status`;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `module_role`
--
ALTER TABLE `module_role`
  ADD CONSTRAINT `module_role_ibfk_1` FOREIGN KEY (`Module_FK`) REFERENCES `module` (`Module_id`),
  ADD CONSTRAINT `module_role_ibfk_2` FOREIGN KEY (`Role_FK`) REFERENCES `role` (`Role_id`);

--
-- Filtros para la tabla `permitions_module_role`
--
ALTER TABLE `permitions_module_role`
  ADD CONSTRAINT `permitions_module_role_ibfk_1` FOREIGN KEY (`Module_role_FK`) REFERENCES `module_role` (`Module_role_id`),
  ADD CONSTRAINT `permitions_module_role_ibfk_2` FOREIGN KEY (`Permitions_FK`) REFERENCES `permitions` (`Permitions_id`);

--
-- Filtros para la tabla `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`User_FK`) REFERENCES `users` (`User_id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`User_status_FK`) REFERENCES `user_status` (`User_status_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`Role_FK`) REFERENCES `role` (`Role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
