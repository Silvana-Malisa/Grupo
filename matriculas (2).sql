-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-01-2023 a las 16:54:20
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `matriculas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asig` int(11) NOT NULL,
  `nombre_asig` varchar(500) DEFAULT NULL,
  `creditos_asig` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id_asig`, `nombre_asig`, `creditos_asig`) VALUES
(1, 'Desarrollo y Aplicaciones Web', 3),
(2, 'Sistemas de Información Geográfica - Gerencial', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_est` int(11) NOT NULL,
  `cedula_est` varchar(13) DEFAULT NULL,
  `apellido_est` varchar(100) DEFAULT NULL,
  `nombre_est` varchar(100) DEFAULT NULL,
  `telefono_est` varchar(25) DEFAULT NULL,
  `direccion_est` varchar(250) DEFAULT NULL,
  `fecha_nacimiento_est` date DEFAULT NULL,
  `foto_est` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_est`, `cedula_est`, `apellido_est`, `nombre_est`, `telefono_est`, `direccion_est`, `fecha_nacimiento_est`, `foto_est`) VALUES
(3, '1721895181', 'Quisaguano', 'René', '0998820095', 'Machachi', '1992-02-07', 'foto_1670513166_44618.jpg'),
(4, '0503440152', 'Ordoñez', 'Maria', '0998852365', 'Latacunga', '1992-02-07', 'foto_1670517249_40807.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `id_mat` int(11) NOT NULL,
  `fk_id_est` int(11) DEFAULT NULL,
  `fk_id_asig` int(11) DEFAULT NULL,
  `fecha_mat` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`id_mat`, `fk_id_est`, `fk_id_asig`, `fecha_mat`) VALUES
(1, 4, 1, '2023-01-04 00:00:00'),
(2, 3, 2, '2023-01-04 00:00:00'),
(3, 3, 1, '2023-01-04 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_pro` int(11) NOT NULL,
  `cedula_pro` varchar(15) DEFAULT NULL,
  `apellidos_pro` varchar(100) DEFAULT NULL,
  `nombres_pro` varchar(100) DEFAULT NULL,
  `titulo_pro` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id_pro`, `cedula_pro`, `apellidos_pro`, `nombres_pro`, `titulo_pro`) VALUES
(1, '1721895181', 'Quisaguano', 'Luis René', 'Ingeniero, Magister'),
(3, '1721', 'Quis', 'Rene', 'Ing'),
(4, '0503', 'Ocho', 'Juan', 'Lic'),
(5, '90', 'uuu', '', ''),
(6, '90', 'uuu', '', ''),
(7, '90', 'uuu', '', ''),
(8, '90', 'uuu', '', ''),
(9, '4444', 'aaaa', 'nnn', 'ttt'),
(10, '4444', 'aaaa', 'nnn', 'ttt'),
(11, '0503440112', 'Diaz', 'Cristian', 'Ing.'),
(12, '5678', 'tyui', 'fghjk', 'fghjkl'),
(13, '888', 'iii', 'iii', 'ii'),
(14, '888', 'iii', 'iii', 'ii'),
(15, '888', 'iii', 'iii', 'ii'),
(16, '0503440019', 'LARA', 'JUAN CARLOS', 'PHD'),
(17, '666', 'aaaaa', 'nnnn', 'tttttt');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usu` int(11) NOT NULL,
  `email_usu` varchar(300) DEFAULT NULL,
  `password_usu` varchar(500) DEFAULT NULL,
  `apellido_usu` varchar(250) DEFAULT NULL,
  `nombre_usu` varchar(250) DEFAULT NULL,
  `perfil_usu` varchar(50) DEFAULT NULL,
  `creacion_usu` datetime DEFAULT current_timestamp(),
  `actualizacion_usu` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usu`, `email_usu`, `password_usu`, `apellido_usu`, `nombre_usu`, `perfil_usu`, `creacion_usu`, `actualizacion_usu`) VALUES
(1, 'rene@gmail.com', 'rene123', 'Quisaguano', 'René', 'ADMINISTRADOR', '2023-01-05 10:55:07', '2023-01-05 10:55:07'),
(2, 'edith@gmail.com', 'edith123', 'Cumbajin', 'Edith', 'SECRETARIA', '2023-01-05 10:56:35', '2023-01-05 10:56:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asig`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_est`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`id_mat`),
  ADD KEY `fk_id_est` (`fk_id_est`),
  ADD KEY `fk_id_asig` (`fk_id_asig`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_pro`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usu`),
  ADD UNIQUE KEY `email_usu` (`email_usu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id_asig` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_est` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `id_mat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id_pro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`fk_id_est`) REFERENCES `estudiante` (`id_est`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`fk_id_asig`) REFERENCES `asignatura` (`id_asig`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
