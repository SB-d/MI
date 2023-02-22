-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2023 a las 17:18:06
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `ARE_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `ARE_NOMBRE` varchar(200) NOT NULL COMMENT 'Nombre de las areas existentes en la infraestructura de las instalaciones de contacta',
  `ARE_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Contiene una descripcion detallada del area',
  `ARE_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada area, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`ARE_ID`, `ARE_NOMBRE`, `ARE_DESCRIPCION`, `ARE_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 'SALUD', 'AREA DE SALUD', 1, '2023-01-19 15:54:10', NULL),
(2, 'COBRANZAS', 'AREA DE COBRANZAS', 1, '2023-01-19 15:54:10', NULL),
(3, 'TELEMERCADEO', 'AREA DE TELEMERCADEO', 1, '2023-01-19 15:54:10', NULL),
(4, 'SEDE VILLAS DE SAN PABLO', 'SEDE ALTERNA DE CONTACTA EN VILLAS DE SAN PABLO', 1, '2023-01-19 15:54:10', NULL),
(5, 'DESARROLLO', 'AREA DE DESARROLLO', 1, '2023-01-19 20:36:02', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campanas`
--

CREATE TABLE `campanas` (
  `CAM_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `ARE_ID` int(11) DEFAULT NULL COMMENT 'Area en la que esta la campana',
  `CAM_CODE` int(11) NOT NULL COMMENT 'Codigo de la campaña suministrada por la plataforma SIGO',
  `CAM_NOMBRE` varchar(45) NOT NULL COMMENT 'Nombre de las campañas existentes Ejemplo: SuperEfectivo, Jamar Ventas, Crediminutos.',
  `CAM_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado de cada una de las campañas, Ejemplo:1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `USER_ID` int(11) NOT NULL COMMENT 'ID del usuario que creo el registro',
  `CAM_FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Contiene la fecha en que fue creado el registro que tiene asignado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `CAR_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `CAR_NOMBRE` varchar(45) NOT NULL COMMENT 'Nombre de cada cargo en la empresa Ejemplo: Supervisor, Cordinador',
  `CAR_CODE` int(11) NOT NULL COMMENT 'Codigo del cargo que se maneja por SIGO',
  `CAR_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `USER_ID` int(11) NOT NULL COMMENT 'ID del usuario que creo el registro',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Contiene la fecha en que fue creado el registro que tiene asignado',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`CAR_ID`, `CAR_NOMBRE`, `CAR_CODE`, `CAR_ESTADO`, `USER_ID`, `created_at`, `updated_at`) VALUES
(1, 'Agente', 1, 1, 1, '2022-08-12 16:01:14', NULL),
(2, 'Supervisor', 2, 1, 1, '2022-08-12 16:01:14', NULL),
(5, 'Administrativo', 3, 1, 1, '2023-01-27 14:47:33', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `CLI_ID` int(11) NOT NULL COMMENT 'Lave primaria',
  `CLI_CODE` int(11) NOT NULL COMMENT 'Codigo de cada una de los clientes suministrada por la plataforma SIGO (Centro de costo)',
  `CLI_NOMBRE` varchar(45) NOT NULL COMMENT 'Nombre de cada unos de los clientes pertenecientes a la empresa',
  `CLI_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado de cada una de los clientes, Ejemplo: 1 = ACTIVO, 2= INACTIVO,              3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `USER_ID` int(11) NOT NULL DEFAULT 1 COMMENT 'ID del usuario que creo el registro',
  `CLI_FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Contiene la fecha en que fue creado el registro que tiene asignado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `SER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`CLI_ID`, `CLI_CODE`, `CLI_NOMBRE`, `CLI_ESTADO`, `USER_ID`, `CLI_FECHA_CREACION`, `created_at`, `updated_at`, `SER_ID`) VALUES
(1, 1, 'Adelantos', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(2, 2, 'Credititulos', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(3, 3, 'Crediminutos', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(4, 4, 'Super Efectivo', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(5, 5, 'Jozz', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(6, 6, 'VODAFONE', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(7, 7, 'CFC', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(8, 8, 'GOBERNACION', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(9, 9, 'LOS OLIVOS', 1, 1, '2023-01-20 15:35:01', NULL, '2022-09-24 08:04:06', NULL),
(10, 10, 'JAMAR', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(11, 11, 'AMAVITA', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(12, 12, 'PERFECT CARE', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(13, 13, 'CARDINAL', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(14, 14, 'IRC', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(15, 15, 'CGN', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL),
(49, 202301, 'Universidad del Norte', 1, 1, '2023-01-20 15:35:01', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cli_consumos`
--

CREATE TABLE `cli_consumos` (
  `CLC_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `PRC_ID` int(20) NOT NULL COMMENT 'id del contrato del proveedor que brindo el servicio',
  `CLI_ID` int(11) NOT NULL COMMENT 'Llave segundaria, relacion con la tabla clientes',
  `CLC_CONSUMO` int(11) NOT NULL COMMENT 'Consumo general del cliente',
  `CLC_MES` int(20) DEFAULT NULL COMMENT 'numero del mes que se consumio el servicio',
  `CLC_ESTADO` int(20) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `USER_ID` int(20) NOT NULL COMMENT 'usuario que creo el registro',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `CON_ID` int(20) NOT NULL COMMENT 'Llave primaria',
  `UNI_ID` int(20) NOT NULL COMMENT 'codigo de la unidad de negocio',
  `CLI_ID` int(20) NOT NULL COMMENT 'Guarda el codigo ID de cada uno de los clientes',
  `CAM_ID` int(20) NOT NULL COMMENT 'Guarda el codigo ID de cada uno de las campañas',
  `CON_ESTADO` int(5) NOT NULL DEFAULT 1 COMMENT 'Estado de cada una de los clientes, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `USER_ID` int(20) NOT NULL DEFAULT 1 COMMENT 'ID del usuario que creo el registro',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cortes`
--

CREATE TABLE `cortes` (
  `COR_ID` int(20) NOT NULL,
  `COR_CANTIDAD` int(20) NOT NULL,
  `COR_DESCRIPCION` varchar(200) NOT NULL,
  `COR_TOTAL` double NOT NULL,
  `COR_ESTADO` int(5) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `EMP_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `USER_ID` int(11) NOT NULL COMMENT 'ID del usuario con el que el empleado entra al aplicativo',
  `CAR_ID` int(11) NOT NULL COMMENT 'Id del cargo del empleado',
  `EMP_CODE` varchar(50) NOT NULL COMMENT 'Codigo del empleado suministrado y manejado por SIGO',
  `EMP_CEDULA` int(11) NOT NULL COMMENT 'Se guarda las cedulas de cada empleado la cual no debe repetirse.',
  `EMP_NOMBRES` varchar(45) NOT NULL COMMENT 'Nombre completo del empleado, se maneja asi porque SIGO lo maneja todo junto',
  `EMP_DIRECCION` varchar(45) DEFAULT NULL COMMENT 'Guarda las direcciones de cada empleado',
  `EMP_TELEFONO` varchar(25) DEFAULT NULL COMMENT 'Telefonos de contacto del empleado el cual es suministrado por SIGO',
  `EMP_SEXO` varchar(10) DEFAULT NULL COMMENT 'Es el genero del empleado, M = Masculino y F = Femenino',
  `EMP_FECHA_NACIMIENTO` text DEFAULT NULL COMMENT 'Fecha de nacimiento de cada empleado',
  `EMP_FECHA_INGRESO` text DEFAULT NULL COMMENT 'Fecha de ingreso a la empresa de cada empleado',
  `EMP_FECHA_RETIRO` text DEFAULT NULL COMMENT 'Fecha de retiro de la empresa de cada empleado',
  `EMP_SUELDO` double DEFAULT 1000000 COMMENT 'Sueldo base de cada empleado',
  `EMP_TIPO_CONTRATO` varchar(45) DEFAULT NULL COMMENT 'Tipo de contrato de cada empleado Ejemplo: Aprendiz, Contrato de Prestacion de servicio, Contrato fijo',
  `CAM_ID` int(11) NOT NULL COMMENT 'id de la campaña en la que trabajara',
  `CLI_ID` int(11) DEFAULT NULL COMMENT 'Codigo de cada una de los clientes suministrada por la plataforma SIGO (Centro de costo)',
  `EMP_PAIS` varchar(45) DEFAULT NULL COMMENT 'Nacionalidad de cada uno de los empleados, Ejemplo: Colombia, Venezuela, España, Estados Unidos',
  `EMP_CIUDAD` varchar(45) DEFAULT NULL COMMENT 'Ciudad o municipio la que reside cada empleado, Ejmeplo: Barranquilla, Puerto Colombia, Soledad',
  `EMP_EMAIL` varchar(45) NOT NULL COMMENT 'Direccion de Correo electronico de contacto de cada empleado',
  `EMP_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`EMP_ID`, `USER_ID`, `CAR_ID`, `EMP_CODE`, `EMP_CEDULA`, `EMP_NOMBRES`, `EMP_DIRECCION`, `EMP_TELEFONO`, `EMP_SEXO`, `EMP_FECHA_NACIMIENTO`, `EMP_FECHA_INGRESO`, `EMP_FECHA_RETIRO`, `EMP_SUELDO`, `EMP_TIPO_CONTRATO`, `CAM_ID`, `CLI_ID`, `EMP_PAIS`, `EMP_CIUDAD`, `EMP_EMAIL`, `EMP_ESTADO`, `created_at`, `updated_at`) VALUES
(91, 122, 1, 'A1', 1002093901, 'Ariel De Jesus Figueroa Jimenez', ' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'asesor33@contacta.com.co', 1, '2022-09-23 16:21:57', '2022-09-23 16:21:57'),
(92, 123, 1, 'A2', 1001918824, 'Rony De Jesus Miranda Zambrano', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'asesor58@contacta.com.co', 1, '2022-09-23 16:21:57', '2022-09-23 16:21:57'),
(93, 124, 1, 'A3', 1140872598, 'Carlos Andres Ramirez Rodriguez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'asesor69@contacta.com.co', 1, '2022-09-23 16:21:57', '2022-09-23 16:21:57'),
(94, 125, 1, 'A4', 1046697894, 'Julieth Paola Peralta Martinez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'asesor01@contacta.com.co', 1, '2022-09-23 16:21:57', '2022-09-23 16:21:57'),
(95, 126, 1, 'A5', 32754655, 'Sandra López Lopez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'slopez@contacta.com.co', 1, '2022-09-23 16:21:57', '2022-09-23 16:21:57'),
(96, 127, 1, 'A6', 1046817910, 'Mauro Gonzalez Beltran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'asesor75@contacta.com.co', 1, '2022-09-23 16:21:57', '2022-09-23 16:21:57'),
(97, 128, 1, 'A7', 1129515709, 'Liliana Patricia Tellez Vargas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'ltellez@contacta.com.co', 1, '2022-09-23 16:21:57', '2022-09-23 16:21:57'),
(98, 129, 1, 'A8', 1001917129, 'William Alexander De la Puente Rondón ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'asesor66@contacta.com.co', 1, '2022-09-23 16:21:58', '2022-09-23 16:21:58'),
(99, 130, 1, 'A9', 1045707234, 'Lilibet Gaspar Jimenez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'asesor29@contacta.com.co', 1, '2022-09-23 16:21:58', '2022-09-23 16:21:58'),
(100, 131, 1, 'A10', 1001819375, 'Valentina Isabel Arrieta Castillo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'varrieta@contacta.com.co', 1, '2022-09-23 16:21:58', '2022-09-23 16:21:58'),
(101, 132, 1, 'A11', 1002029913, 'Helen Elena Ospino Llanes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'asesor53@contacta.com.co', 1, '2022-09-23 16:21:58', '2022-09-24 03:59:29'),
(102, 133, 1, 'A12', 1143144616, 'Cristian Rodriguez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 'asesor41@contacta.com.co', 1, '2022-09-23 16:21:58', '2022-09-23 16:21:58'),
(103, 134, 1, 'A13', 1045740995, 'Karla Andrea Zapata Moreno', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 'asesor31@contacta.com.co', 1, '2022-09-23 16:21:58', '2022-09-23 16:21:58'),
(104, 135, 1, 'A14', 1045727694, 'Lila Maria Marmol Mendoza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 'asesor67@contacta.com.co', 1, '2022-09-23 16:21:58', '2022-09-23 16:21:58'),
(105, 136, 1, 'A15', 1143263829, 'Maria Alejandra Hernandez Lara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 'asesor43@contacta.com.co', 1, '2022-09-23 16:21:58', '2022-09-23 16:21:58'),
(106, 137, 1, 'A16', 1002157371, 'Pamela Andrea Romero Velilla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'asesor38@contacta.com.co', 1, '2022-09-23 16:21:59', '2022-12-29 04:34:37'),
(107, 138, 1, 'A17', 1046699418, 'Juan Camilo Aduen Tovar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, 'asesor80@contacta.com.co', 1, '2022-09-23 16:21:59', '2022-09-23 16:21:59'),
(108, 139, 1, 'A18', 1045170489, 'Yeimer Rafael Vizcaino Carrillo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, 'asesor81@contacta.com.co', 1, '2022-09-23 16:21:59', '2022-09-23 16:21:59'),
(109, 140, 1, 'A19', 1598065, 'Oriana Fabiola Gonzalez Guerra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, 'Agentecfc01@contacta.com.co', 1, '2022-09-23 16:21:59', '2022-09-23 16:21:59'),
(110, 141, 1, 'A20', 1151473898, 'Hefziba Yaneth Rojas Ruiz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'asesor40@contacta.com.co', 1, '2022-09-23 16:21:59', '2022-12-29 04:34:18'),
(111, 142, 1, 'A21', 72009298, 'Carlos Alberto Herazo Torres', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL, NULL, 'carlos@mimalla.com.co', 1, '2022-09-23 16:21:59', '2022-09-24 13:07:08'),
(112, 143, 1, 'A22', 1042436680, 'Yinna Marcela Hernández Osorio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL, NULL, 'asesor68@contacta.com.co', 1, '2022-09-23 16:21:59', '2022-09-24 13:08:38'),
(113, 144, 1, 'A23', 1046697734, 'Maylen Patricia Peralta Martinez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL, NULL, 'asesor78@contacta.com.co', 1, '2022-09-23 16:21:59', '2022-09-24 13:07:47'),
(114, 145, 1, 'A24', 22477458, 'Sara Johana Peñaranda Arvelaez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'asesor70@contacta.com.co', 1, '2022-09-23 16:22:00', '2022-12-29 04:35:02'),
(115, 146, 1, 'A25', 22477178, 'Merlys Patricia Mejia Baltar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'mmejia@contacta.com.co', 1, '2022-09-23 16:22:00', '2022-09-23 16:22:00'),
(116, 147, 1, 'A26', 1140850621, 'Alexandra Patricia Escalante De La Hoz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'asesor79@contacta.com.co', 1, '2022-09-23 16:22:00', '2022-09-23 16:22:00'),
(117, 148, 1, 'A27', 1143238963, 'Denis Del Carmen Ensuncho Tovar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'asesor77@contacta.com.co', 1, '2022-09-23 16:22:00', '2022-09-23 16:22:00'),
(118, 149, 1, 'A28', 1126604825, 'DARIO JIMENEZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, 'agenteamavita1@contacta.com.co', 1, '2022-09-23 16:22:00', '2022-09-23 16:22:00'),
(119, 150, 1, 'A29', 1143466987, 'KALEB OLMOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, 'agenteamavita2@contacta.com.co', 1, '2022-09-23 16:22:00', '2022-09-23 16:22:00'),
(120, 151, 1, 'A30', 1045762082, 'CHRISTOPHER MUÑOZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, 'agenteamavita3@contacta.com.co', 1, '2022-09-23 16:22:00', '2022-09-23 16:22:00'),
(121, 152, 1, 'A31', 1042241907, 'MARIANELLA SABBAGH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, 'agenteamavita6@contacta.com.co', 1, '2022-09-23 16:22:00', '2022-09-23 16:22:00'),
(122, 153, 1, 'A32', 1007173639, 'ALEJANDRO HERNANDEZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, 'agenteamavita4@contacta.com.co', 1, '2022-09-23 16:22:01', '2022-09-23 16:22:01'),
(123, 154, 1, 'A33', 1001913003, 'DANIEL ESCOBAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, 'agenteamavita5@contacta.com.co', 1, '2022-09-23 16:22:01', '2022-09-23 16:22:01'),
(124, 155, 1, 'A34', 1080670279, 'CARLOS GUZMAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, 'agenteperfectcare02@contacta.com.co', 1, '2022-09-23 16:22:01', '2022-09-23 16:22:01'),
(125, 156, 1, 'A35', 1001993948, 'KENIA RUA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, 'agenteperfectcare03@contacta.com.co', 1, '2022-09-23 16:22:01', '2022-09-23 16:22:01'),
(126, 157, 1, 'A36', 1193516917, 'SEBASTIAN VARGAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, 'agenteperfectcare04@contacta.com.co', 1, '2022-09-23 16:22:01', '2022-09-23 16:22:01'),
(127, 158, 1, 'A37', 1143155496, 'CRISTIAN CAMACHO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, 'agenteperfectcare01@contacta.com.co', 1, '2022-09-23 16:22:01', '2022-09-23 16:22:01'),
(128, 159, 1, 'A38', 1001887868, 'MAIRON SARABIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, 'agenteirc05@contacta.com.co', 1, '2022-09-23 16:22:01', '2022-09-23 16:22:01'),
(129, 160, 1, 'A39', 1129522769, 'CINDY MORENO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, 'agenteirc01@contacta.com co ', 1, '2022-09-23 16:22:01', '2022-09-23 16:22:01'),
(130, 161, 1, 'A40', 1064802269, 'WENDY QUIROZ ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, 'agenteirc02@contacta.com.co', 1, '2022-09-23 16:22:02', '2022-09-23 16:22:02'),
(131, 162, 1, 'A41', 1143255084, 'LORAINE ARRIETA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, 'agenteirc03@contacta.com.co', 1, '2022-09-23 16:22:02', '2022-09-23 16:22:02'),
(132, 163, 1, 'A42', 1043116083, 'ERIKA ELIAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, 'agenteirc04@contacta.com.co', 1, '2022-09-23 16:22:02', '2022-09-23 16:22:02'),
(133, 164, 1, 'A43', 1042454652, 'SHANET GUERRERO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, 'agenteirc10@contacta.com.co', 1, '2022-09-23 16:22:02', '2022-09-23 16:22:02'),
(134, 165, 1, 'A44', 1129530659, 'MAIRA BENITEZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, 'agenteirc08@contacta.com.co', 1, '2022-09-23 16:22:02', '2022-09-23 16:22:02'),
(135, 166, 1, 'A45', 1143130275, 'STEFANY SUAREZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, 'agenteirc06@contacta.com.co', 1, '2022-09-23 16:22:02', '2022-09-23 16:22:02'),
(136, 167, 1, 'A46', 1192763388, 'ANDREA DE LA HOZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, 'agenteirc09@contacta.com.co', 1, '2022-09-23 16:22:02', '2022-09-23 16:22:02'),
(137, 168, 1, 'A47', 1045689634, 'YORCELIS MEJIA ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, 'agenteirc07@contacta.com.co', 1, '2022-09-23 16:22:02', '2022-09-23 16:22:02'),
(138, 169, 1, 'A48', 1045723065, 'FERRER GARRIDO ANDREA CAROLINA ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 'andreaferrer@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:03', '2022-09-23 16:22:03'),
(139, 170, 1, 'A49', 1020761744, 'ACUÑA SILVERA LIZ KATERINE ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'lizacuna@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:03', '2022-09-23 16:22:03'),
(140, 171, 1, 'A50', 22519237, 'ARRIETA CAMARGO KELAIA ROSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'kelaiaarrieta@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:03', '2022-09-23 16:22:03'),
(141, 172, 1, 'A51', 22460882, 'BORJA OJEDA JENNIFER MILAGROS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'jenniferborja@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:03', '2022-09-23 16:22:03'),
(142, 173, 1, 'A52', 1010095444, 'CABARCAS GUTIERREZ LUCELYS DANIELA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'lucelyscabarcas@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:03', '2022-09-23 16:22:03'),
(143, 174, 1, 'A53', 1143152589, 'CARDENAS POSADA VALERY DEL CARMEN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'valerycardenas@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:03', '2022-09-23 16:22:03'),
(144, 175, 1, 'A54', 72009867, 'CASTRO ALVAREZ  ALEXANDER DE JESUS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'alexandercastro@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:03', '2022-09-23 16:22:03'),
(145, 176, 1, 'A55', 1143440475, 'CHAVARRO GAVALO YULIANIS PAOLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'yulianischavarro@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:03', '2022-09-23 16:22:03'),
(146, 177, 1, 'A56', 1143266564, 'CORREA SEPULVEDA JAIRO ANDRES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'jairocorrea@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:04', '2022-09-23 16:22:04'),
(147, 178, 1, 'A57', 1001825460, 'COVELLI ALVAREZ GIANELLA VANESSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'gianellacoveli@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:04', '2022-12-29 04:34:49'),
(148, 179, 1, 'A58', 1143164279, 'DIAZ PERALTA LAURA ALEXANDRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'lauradiaz@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:04', '2022-09-23 16:22:04'),
(149, 180, 1, 'A59', 1143470243, 'FLORIAN MARTINEZ WENDY  JOHANA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'wendyflorian@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:04', '2022-09-23 16:22:04'),
(150, 181, 1, 'A60', 1140872836, 'MARQUEZ PEÑA KATHERIN ROXANA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'apoyo8@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:04', '2022-09-23 16:22:04'),
(151, 182, 1, 'A61', 1129576240, 'MEDINA MEDINA LICETH MARINA ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'lisethmmedina@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:04', '2022-09-23 16:22:04'),
(152, 183, 1, 'A62', 1045675575, 'MONTOYA OCAMPO YULY CRISTINA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'yulymontoya@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:04', '2022-09-23 16:22:04'),
(153, 184, 1, 'A63', 1143240565, 'MORALES GOMEZ ANYULIS JULIETH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'anyulismorales@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:05', '2022-09-23 16:22:05'),
(154, 185, 1, 'A64', 1192910860, 'NUÑEZ GUZMAN SINDY PAOLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'apoyo11@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:05', '2022-09-23 16:22:05'),
(155, 186, 1, 'A65', 1001823014, 'OCAMPO CARMONA BETSY LILIANA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'betsyocampo@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:05', '2022-09-23 16:22:05'),
(156, 187, 1, 'A66', 1045735615, 'PEREZ NAVARRO LINNEKER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, 'linnekerperez@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:05', '2022-10-11 07:12:34'),
(157, 188, 1, 'A67', 1007128979, 'RAMOS MONTES YANINE YULIETH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'yanineramos@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:05', '2022-09-23 16:22:05'),
(158, 189, 1, 'A68', 1001880390, 'RIQUETT FONTALVO MARIA BELEN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'apoyo10@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:05', '2022-09-23 16:22:05'),
(159, 190, 1, 'A69', 1334440, 'SANTOS DE FREITAS JOAQUIN ALEJANDRO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'joaquinsantos@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:05', '2022-09-23 16:22:05'),
(160, 191, 1, 'A70', 1010144846, 'SOTO SANJUAN SARA ESTHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, 'sarasoto@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:05', '2022-09-23 16:22:05'),
(161, 192, 1, 'A71', 1048273933, 'MENDOZA LOPEZ KARLET DAYANA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, 'dayanamendoza@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:06', '2022-09-23 16:22:06'),
(162, 193, 1, 'A72', 1118825070, 'PORRAS CASTILLO GRISELDA PATRICIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'griseldaporras@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:06', '2022-10-11 09:16:06'),
(163, 194, 1, 'A73', 1129578216, 'SALOM ESCOBAR LUDDY DEL CARMEN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, 'luddysalom@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:06', '2022-09-23 16:22:06'),
(164, 195, 1, 'A74', 1140866835, 'ACOSTA CONSUEGRA JAIR RAFAEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'jairacosta@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:06', '2022-09-23 16:22:06'),
(165, 196, 1, 'A75', 1043119123, 'AYALA MEZA JHEIRANN JOSEPH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'jheirannayala@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:06', '2022-09-23 16:22:06'),
(166, 197, 1, 'A76', 22581388, 'CONDE ZULUAGA CLAUDIA PATRICIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'claudiaconde@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:06', '2022-09-23 16:22:06'),
(167, 198, 1, 'A77', 1002092242, 'GARCIA BOLIVAR MIRIANIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'mirianisgarcia@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:06', '2022-09-23 16:22:06'),
(168, 199, 1, 'A78', 5397858, 'HERNANDEZ PEÑA ALANIS ANAIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'apoyo6@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:06', '2022-09-23 16:22:06'),
(169, 200, 1, 'A79', 1010076960, 'MOLINA DIN SHARON DANIELA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'sharonmolina@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:07', '2022-09-23 16:22:07'),
(170, 201, 1, 'A80', 52312270, 'NAVARRO OSPINO NASLY INES', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'naslynavarro@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:07', '2022-09-23 16:22:07'),
(171, 202, 1, 'A81', 1129503483, 'PALENCIA BARRIENTOS YINA PAOLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'yinapalencia@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:07', '2022-09-23 16:22:07'),
(172, 203, 1, 'A82', 22646669, 'RAMIREZ PAJARO GINA PAOLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'ginaramirez@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:07', '2022-09-23 16:22:07'),
(173, 204, 1, 'A83', 1192766934, 'ROMERO CANTILLO JANE MICHEL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'janeromero@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:07', '2022-09-23 16:22:07'),
(174, 205, 1, 'A84', 1044420385, 'VELEZ GRISALES VIANEY EGLET', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, 'vianeyvelez@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:07', '2022-09-23 16:22:07'),
(175, 206, 1, 'A85', 22704128, 'ALGARIN CATAÑO LUZ ELENA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'luzalgarin@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:07', '2022-09-23 16:22:07'),
(176, 207, 1, 'A86', 1127624459, 'BARRIOS PEREZ GERMAN ALESKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'germanbarrios@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:07', '2022-09-23 16:22:07'),
(177, 208, 1, 'A87', 1002161157, 'BELEÑO VERTEL SARAI VANESSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'saraibeleno@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:08', '2022-09-23 16:22:08'),
(178, 209, 1, 'A88', 72253952, 'CARDENAS ARANGO JHON JAIVER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'jhoncardenas@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:08', '2022-09-23 16:22:08'),
(179, 210, 1, 'A89', 1042429097, 'CASTRO MUÑOZ KELLYS JHOJANA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'KellyCastro@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:08', '2022-09-23 16:22:08'),
(180, 211, 1, 'A90', 1042241092, 'GARCES VILLA DARCY MELISSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'darcygarces@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:08', '2022-09-23 16:22:08'),
(181, 212, 1, 'A91', 1001818425, 'HERRERA PEREZ YUCELIS ESTHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'yucelisherrera@clinicageneraldelnorte.co', 1, '2022-09-23 16:22:08', '2022-09-23 16:22:08'),
(182, 213, 1, 'A92', 1048212364, 'LARA HEREDIA LOREDIANA LORENA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'loredianalara@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:08', '2022-09-23 16:22:08'),
(183, 214, 1, 'A93', 1143436836, 'MERCADO SCHMALBACH KAREN MARGARITA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'karenmercado@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:08', '2022-09-23 16:22:08'),
(184, 215, 1, 'A94', 1001876935, 'NORIEGA MONTENEGRO MADELEINE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'madeleinenoriega@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:08', '2022-09-23 16:22:08'),
(185, 216, 1, 'A95', 1045686738, 'OROZCO DIAZ KEIDY YOJANA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'keidydias@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:09', '2022-09-23 16:22:09'),
(186, 217, 1, 'A96', 55238317, 'OROZCO PADILLA KELLY JOHANA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'kellyorozco@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:09', '2022-09-23 16:22:09'),
(187, 218, 1, 'A97', 1047240368, 'PADILLA BUSTOS JOSTEIN ESTEBAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'josteinpadilla@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:09', '2022-09-23 16:22:09'),
(188, 219, 1, 'A98', 1045717212, 'PADILLA PEREZ ANGIE PAOLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'angiepadilla@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:09', '2022-09-23 16:22:09'),
(189, 220, 1, 'A99', 1001994239, 'TORRENEGRA MARTINEZ MALLERLI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'apoyo7@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:09', '2022-09-23 16:22:09'),
(190, 221, 1, 'A100', 1002235460, 'TORRES ESCORCIA SHEILA PAOLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, 'sheilatorres@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:09', '2022-09-23 16:22:09'),
(191, 222, 1, 'A101', 1193565673, 'NEGRETE BARROSO NAYOVIS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 'nayovisnegrete@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:09', '2022-09-23 16:22:09'),
(192, 223, 1, 'A102', 4888849, 'PARRA RODRIGUEZ KIMBERLIN CHIQUINQUIRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 'kimberlyparra@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:10', '2022-09-23 16:22:10'),
(193, 224, 1, 'A103', 1143151192, 'SALCEDO SANDOVAL LINA MARIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, 'linasalcedo@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:10', '2022-09-23 16:22:10'),
(194, 225, 1, 'A104', 1140849284, 'RODRIGUEZ DE LA CRUZ KAREN LORENA ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, 'karenrodriguez@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:10', '2022-09-23 16:22:10'),
(195, 226, 1, 'A105', 32710214, 'SOLIS DE ZAPATA YANETH DEL SOCORRO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, 'yanethsolis@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:10', '2022-09-23 16:22:10'),
(196, 227, 1, 'A106', 1143455824, 'VIDES SIERRA JESUS SALVADOR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, 'jesusvides@clinicageneraldelnorte.com', 1, '2022-09-23 16:22:10', '2022-09-23 16:22:10'),
(198, 229, 1, 'A107', 1143266455, 'Ronaldo Luis Ibarra Hernández', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, 'agenteamavita7@contacta.com.co', 1, '2022-10-12 04:19:35', '2022-10-12 04:19:35'),
(199, 230, 1, 'B1', 1047230578, 'Yeinys Paola Otero Ojeda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'yeinispaolaotero0810@gmail.com', 1, '2022-12-28 03:59:23', '2022-12-28 03:59:23'),
(200, 231, 1, 'B2', 1047359869, 'Ketty Maria Truyol Bossio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'kettyztruyol01@gmail.com', 1, '2022-12-28 03:59:23', '2022-12-28 03:59:23'),
(201, 232, 1, 'B3', 72268103, 'Jhon Jairo Lara Tejada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'jhonjairolaratejada29@gmial.com', 1, '2022-12-28 03:59:23', '2022-12-28 03:59:23'),
(202, 233, 1, 'B4', 1000949372, 'Valentina Ramirez Garzon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'valentinaraminezgarzon0@gmail.com', 1, '2022-12-28 03:59:23', '2022-12-28 03:59:23'),
(203, 234, 1, 'B5', 1010129527, 'Brando Alexander Niño Palma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'brandonino1001@gmial.com', 1, '2022-12-28 03:59:23', '2022-12-28 03:59:23'),
(204, 235, 1, 'B6', 55247719, 'kelly Johanna Landinez Quintero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'kellilandinez@gmail.com', 1, '2022-12-28 03:59:23', '2022-12-28 03:59:23'),
(205, 236, 1, 'B7', 1045703358, 'Marcela Ortega Herrera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'marcelaortega1990@gmail.com', 1, '2022-12-28 03:59:24', '2022-12-28 03:59:24'),
(206, 237, 1, 'B8', 72173738, 'Carlos Nepper Monsalve Cervantes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'carlosnepper@gmail.com', 1, '2022-12-28 03:59:24', '2022-12-28 03:59:24'),
(207, 238, 1, 'B9', 72243351, 'Alexander Barrios torres ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'xanderbarrios1205@gmail.com', 1, '2022-12-29 04:38:29', '2022-12-29 04:38:29'),
(208, 239, 1, 'B10', 1002231434, 'Yassir Antonio Bobadilla Camargo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, 'bobadillayassir@gmail.com', 1, '2022-12-29 04:38:29', '2022-12-29 04:38:29'),
(209, 240, 1, 'B11', 1001779537, 'Juliana Suarez Rodríguez ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, ' agenteamavita8@contacta.com.co', 1, '2023-01-11 10:52:12', '2023-01-11 10:52:12'),
(210, 241, 1, 'C1', 1045672129, 'LISETH CAROLINA MEDINA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 'lisethmedinac@contacta.com.co', 1, '2023-01-20 12:05:27', '2023-01-20 12:05:27'),
(211, 242, 1, 'C2', 1001173639, 'ALEJANDRO HERNANDEZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, 'alejandrohernandez@contacta.com.co', 1, '2023-01-20 12:05:27', '2023-01-20 12:05:27'),
(212, 243, 1, 'C3', 12560881, 'ECCE TIRADO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 'eccetirado@contacta.com.co', 1, '2023-01-20 12:05:27', '2023-01-20 12:05:27'),
(213, 244, 1, 'C4', 123456, 'MARIA RIQUETT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 'mariariquett@contacta.com.co', 1, '2023-01-20 12:05:27', '2023-01-20 12:05:27'),
(214, 245, 1, 'C5', 23231223, 'CLAUDIA CONDE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 'claudiaconde@contacta.com.co', 1, '2023-01-20 12:05:27', '2023-01-20 12:05:27'),
(215, 246, 1, 'C6', 17236362, 'RONALDO IBARRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, 'ronaldoibarra@contacta.com.co', 1, '2023-01-20 12:05:27', '2023-01-20 12:05:27'),
(216, 247, 1, 'C7', 1002034049, 'NIYIRETH YULIANA CASTRO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 'niyirethyulianacastro@contacta.com.co', 1, '2023-01-20 12:05:27', '2023-01-20 12:05:27'),
(217, 248, 1, 'C8', 1002231983, 'YARITHZA LINETH MARTINEZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 'yarithzalinethmartinez@contacta.com.co', 1, '2023-01-20 12:05:27', '2023-01-20 12:05:27'),
(218, 249, 1, 'C9', 1140826937, 'YULI PEREZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 'yuliperez@contacta.com.co', 1, '2023-01-20 12:05:28', '2023-01-20 12:05:28'),
(219, 250, 1, 'C10', 1044427328, 'Maria Chamorro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 'mariachamorro@contacta.com.co', 1, '2023-01-20 12:05:28', '2023-01-20 12:05:28'),
(220, 251, 1, 'C11', 1052949362, 'Eniyer Dizzett', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 'eniyerdizzett@contacta.com.co', 1, '2023-01-20 12:05:28', '2023-01-20 12:05:28'),
(221, 252, 1, 'C12', 875887997, 'JULIANA SUAREZ RODRIGUEZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, 'julianasuarezrodriguez@contacta.com.co', 1, '2023-01-20 12:05:28', '2023-01-20 12:05:28'),
(222, 253, 1, 'C13', 1045693974, 'ERIALETH BARRAZA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, 'erialethbarraza@contacta.com.co', 1, '2023-01-20 12:05:28', '2023-01-20 12:05:28'),
(223, 254, 1, 'C14', 1124051631, 'CORAIMA TORRES NARANJO', '', NULL, NULL, NULL, NULL, NULL, 1000000, NULL, 15, NULL, NULL, NULL, 'coraimatorres@contacta.com.co', 1, '2023-01-20 20:57:38', NULL),
(224, 255, 1, 'C15', 1047336434, 'DAYANA AGUAS CHARRIS', NULL, NULL, NULL, NULL, NULL, NULL, 1000000, NULL, 15, NULL, NULL, NULL, 'dayanaaguas@contacta.com.co', 1, '2023-01-20 20:57:38', NULL),
(225, 256, 1, 'C16', 1140892291, 'YARLIN ANDRADE PEREZ', NULL, NULL, NULL, NULL, NULL, NULL, 1000000, NULL, 15, NULL, NULL, NULL, 'yarlinandrare@contacta.com.co', 1, '2023-01-20 21:00:33', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `EQU_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `ARE_ID` int(11) NOT NULL COMMENT 'Id del area',
  `EQU_SERIAL` varchar(200) NOT NULL COMMENT 'Serial de los equipos de computo que funciona como identificacion de la maquina',
  `EQU_NOMBRE` varchar(200) NOT NULL COMMENT 'Nombre del equipo esipulada bajo la estipulada en el estandar de la seguridad de la informacion',
  `EQU_PRECIO` double NOT NULL DEFAULT 0,
  `EQU_TIPO` enum('Propio','Alquilado') NOT NULL COMMENT 'El tipo determina el propietario del equipo',
  `EQU_OBSERVACIONES` varchar(200) DEFAULT NULL COMMENT 'Observaciones para tener en cuenta al momento de realizar alguna opcion en el equipo',
  `PRO_ID` int(20) DEFAULT NULL COMMENT 'Id del proveedor del equipo (puede ser nulo)',
  `EQU_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`EQU_ID`, `ARE_ID`, `EQU_SERIAL`, `EQU_NOMBRE`, `EQU_PRECIO`, `EQU_TIPO`, `EQU_OBSERVACIONES`, `PRO_ID`, `EQU_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 0, 'MXL32811PL', 'EQ-BAD-106', 0, 'Propio', NULL, NULL, 0, '2023-01-19 16:16:40', '2023-02-17 20:39:27'),
(2, 0, '8CC9210R81', 'EQ-BOP-16', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(3, 0, 'MXL640298L', 'EQ-BOP-001 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(4, 0, 'MXL1281KWL', 'HP COMPAQ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(5, 0, 'MJ0523GV', 'EQ-BOP-55', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(6, 0, 'MJ04KK57', 'EQ-BOP-02', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(7, 0, '8CC9214P4R', 'EQ-CONT-T01', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(8, 0, 'MXL32811PL', 'EQ-BAD-106', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(9, 0, '2UA6322TQD', 'AMAVITA01', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(10, 0, '2UA6241Z5X', 'AMAVITA02', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(11, 0, 'MXL5201B41', 'AMAVITA03', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(12, 0, 'MXL5291S5G', 'AMAVITA04', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(13, 0, 'MXL61619F1', 'AMAVITA05', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(14, 0, 'MXL6241DRH', 'AMAVITA06', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(15, 0, 'MXL5242CS0', 'DESARROLLLO1 ', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(16, 0, 'MXL5291S66', 'DESARROLLO2', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(17, 0, 'MXL5300GS8', 'DESARROLLO3 ', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(18, 0, 'MXL543194S', 'DESARROLLO4', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(19, 0, 'MXL6051B0V', 'DESARROLLO5 ', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(20, 0, '2UA6191VG1', 'IRC01', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(21, 0, '2UA6191VJY', 'IRC02', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(22, 0, 'MXL61619CF', 'IRC03', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(23, 0, 'MXL61619HV', 'IRC04', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(24, 0, 'MXL6200XK2', 'IRC06', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(25, 0, 'MXL6170P5M ', 'IRC05 ', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(26, 0, 'MXL6241505', 'IRC07', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(27, 0, 'MXL6241DZ2', 'IRC08', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(28, 0, 'MXL6292MY4', 'IRC09', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(29, 0, 'MXL6311H92', 'IRC10', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(30, 0, 'MXL64234C6', 'IRC11', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(31, 0, 'MXL64029GD', 'EQ-BOP-28', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(32, 0, '8CC9210R1W', 'EQ-BOP-08', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(33, 0, '2UA6191ZFR', 'PERFECT01 ', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(34, 0, 'MXL62414FS', 'PERFECT03 ', 100000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(35, 0, 'MXL624157T', 'PERFECT04', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(36, 0, 'MXL6271MZ2', 'PERFECT05', 90000, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(37, 0, 'MJ04KKHR', 'EQ-BOP-37', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(38, 0, 'MJ04KK99', 'EQ-BOP-66', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(39, 0, 'MJ0523FN', 'EQ-BOP-36', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(40, 0, 'MJ06HEYX', 'EQ-BOP-32', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(41, 0, 'MJ04Y0EJ', 'EQ-BOP-34', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(42, 0, 'MJ0523H5', 'EQ-BOP-35', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(43, 0, 'MXL3500SJJ', 'EQ-BOP-18', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(44, 0, 'MXL34117KH', 'EQ-BOP-10', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(45, 0, 'MJ0523H3', 'EQ-BOP-33', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(46, 0, 'MXL3281FGV', 'EQ-BOP-89', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(47, 0, '8CC91924VV', 'DESKTOP-J0IOODS', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(48, 0, 'MXL3371F8N', 'EQ-BTI-05', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(49, 0, '8CC9214P4Q', 'EQ-BTI-06', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(50, 0, 'MXL61619GF', 'DATA01', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(51, 0, 'MJ0523GS', 'EQ-BOP-03', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(52, 0, 'MJ04KKC5', 'EQ-BOP-121', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(53, 0, 'MXL3281663', 'EQ-BOP-11', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(54, 0, 'MXL6402CKK', 'EQ-BOP-23', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(55, 0, 'MXL6383YLF', 'EQ-BOP-25', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(56, 0, 'MXL6441MGT', 'EQ-BOP-26', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(57, 0, 'MXL64234VM', 'EQ-BOP-27', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(58, 0, 'MJ0523FC', 'EQ-BOP-30', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(59, 0, 'MXL640292Q', 'EQ-BOP-44', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(60, 0, 'MXL640293Y', 'EQ-BOP-45', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(61, 0, 'MJ04KKDX', 'CGN01', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(62, 0, 'MXL640295S', 'EQ-BOP-47', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(63, 0, 'MXL640293G', 'EQ-BOP-48', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(64, 0, 'MJ0523GY', 'EQ-BOP-49', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(65, 0, 'MJ04KKFQ', 'EQ-BOP-50', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(66, 0, 'MJ03V5X5', 'EQ-BOP-51', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(67, 0, 'MJ03V5X2', 'EQ-BOP-52 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(68, 0, 'MJ0523F1', 'EQ-BOP-53 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(69, 0, 'MJ04KK8P', 'EQ-BOP-54', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(70, 0, 'MJ04Y0F3', 'EQ-BOP-56 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(71, 0, 'MXL64029WX', 'EQ-BOP-57', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(72, 0, 'MJ0523FD', 'EQ-BOP-58', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(73, 0, 'MXL64029XY', 'EQ-BOP-59', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(74, 0, 'MXL640290L', 'EQ-BOP-61', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(75, 0, 'MXL64028YX', 'EQ-BOP-62', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(76, 0, 'MXL64234M4', 'EQ-BOP-63', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(77, 0, 'MJ0523F9', 'EQ-BOP-64 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(78, 0, 'MJ0523FE', 'EQ-BOP-65', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(79, 0, 'MJ0523GW', 'EQ-BOP-67', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(80, 0, 'MJ04Y0DM', 'EQ-BOP-82 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(81, 0, 'MJ04KK6U', 'EQ-BOP-163', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(82, 0, 'MXL64234KP', 'EQ-BOP-91', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(83, 0, 'MJ04Y0G0', 'CGN02', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(84, 0, 'MXL6402952', 'EQ-BOP-93', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(85, 0, 'MXL64028Z7', 'EQ-BOP-40', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(86, 0, 'MJ04YOG8', 'CGN03', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(87, 0, 'MJ03V5XB', 'CGN04', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(88, 0, 'MJ0523F3', 'CGN05', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(89, 0, 'MXL6391M8R', 'CGN06', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(90, 0, 'XML64234T3', 'CGN07 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(91, 0, 'MJ04Y0F1', 'CGN08', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(92, 0, 'MJ04KKDB', 'CGN09', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(93, 0, 'MXL64029VH', 'CGN10', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(94, 0, 'MJ0523F4', 'EQ-BOP-38', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(95, 0, 'MJ04Y0GB', 'CGN11', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(96, 0, 'MXL642334JM', 'CGN12', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(97, 0, 'MXL64234PH', 'EQ-BOP-60 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(98, 0, '8CC91924W8', 'CGN13 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(99, 0, 'MXL64234JM', 'EQ-BOP-22', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(100, 0, '8CC9210R48', 'EQ-BOP-12', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(101, 0, 'MJ0523GZ', 'EQ-BOP-71', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(102, 0, 'MJ04KK6C', 'CGN14', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(103, 0, 'MJ0523G7', 'EQ-BOP-81', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(104, 0, '8CC9210R7W', 'DESKTOP-R3AFOH6', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:40', NULL),
(105, 0, '8CC91924Z7', 'EQ-BOP-39 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(106, 0, '8CC9210RX', 'CGN16', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(107, 0, '8CC919250W', 'DESKTOP-Q4MBB4V ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(108, 0, '8CC9214P44', 'EQ-CONT-B5 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(109, 0, '5CG7246B2Q', 'EQ-BAD-200 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(110, 0, 'CND1190BP3', 'OPE01 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(111, 0, '8CC9214P4P', 'EQ-BOP-0030', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(112, 0, '8CC9214P50', 'EQ-BOP-210', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(113, 0, '8CC9214P4W', 'CONT01', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(114, 0, '8CC9210R7B', 'EQ-BOP-31', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(115, 0, 'MXL6123BL3', 'PERFECT06 ', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(116, 0, 'MXL3411J11', 'EQ-BTI-10', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(117, 0, '8CC9214PL2', 'DESKTOP-Q7K2IAG', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(118, 0, 'CND9225KZM', 'EQ-BOP-201', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(119, 0, 'CND1190C2C', 'COMER01 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(120, 0, '8CC84205JW', 'TURISMO01', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(121, 0, 'MXL640290N', 'CGN01 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(122, 0, '8CC9104W02', 'EQ-BOP-07', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(123, 0, 'G7540HMP1018N76', 'DISEÃ‘O01 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(124, 0, 'MXL3281FH4', 'EQ-BTI-04 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(125, 0, 'MXL3151PB6', 'EQ-BAD-110', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(126, 0, 'MJ04KKLP', 'EQ-BOP-83', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(127, 0, '8CC9210R9H', 'EQ-BOP-06 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(128, 0, '8CC9210R3P', 'EQ-BOP-78 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(129, 0, '5CG11813DX', 'EQ-BOP-123', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(130, 0, 'YJ00ZDY7', 'LENOVO01 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(131, 0, 'YJ00ZDL8', 'LENOVO02  ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(132, 0, 'YJ00ZDDX', 'LENOVO03  ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(133, 0, 'YJ00S6ZX', 'LENOVO04 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(134, 0, 'MXL5291S5Q', 'FS1', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(135, 0, '2UA5122JRH', 'FS2', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(136, 0, 'MXL5300GRZ', 'FS3', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(137, 0, 'MXL5291S5B', 'FS4', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(138, 0, 'MXL5300GS0', 'FS5', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(139, 0, 'MXL5300GRY', 'FS6', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(140, 0, '2UA6080XB5', 'FS7', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(141, 0, 'MXL543193T', 'FS87', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(142, 0, 'MXL5431945', 'FS9', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(143, 0, 'MXL5300GS2', 'FS10', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(144, 0, 'MXL4261VCJ', 'FS11', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(145, 0, '2UA5151XJM', 'FS12', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(146, 0, 'YJ00ZDBV', 'LENOVO05 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(147, 0, '8CC9104VSV', 'EQ-BOP-15 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(149, 0, 'MJ0523G6', 'EQ-BOP-139', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(150, 0, '8CC91924DT', 'REGALHOME', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(151, 0, 'CND1190C3D', 'COMER02', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(152, 0, 'YJ00ZDD2', 'LENOVO06 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(153, 0, '8CC9210R55', 'COMER03  ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(154, 0, 'YJ00ZEWT', 'JUNTAS01 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(155, 0, 'YJ00ZDBV', 'LENOVO05 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(156, 0, 'MXL6170NRJ', 'AMAVITA07', 0, 'Alquilado', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(157, 0, 'YJ00ZDQR', 'LENOVO07 ', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(158, 0, 'MJ0523F0', 'EQ-BOP-46', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(159, 0, '8CC9104W5Z', 'TELEVISOR', 0, 'Propio', NULL, NULL, 1, '2023-01-19 16:16:41', NULL),
(160, 0, '8CG92070KJ', 'DESARROLLO6', 0, 'Propio', 'EQUIPO DEL COORDINADOR DE DESARROLLO', NULL, 1, '2023-01-19 18:56:05', NULL),
(166, 1, 'AWDASA2343', 'EQU_PRUEBA', 1000000, 'Propio', NULL, NULL, 1, '2023-02-07 14:15:52', '2023-02-13 19:16:30'),
(167, 1, '02', '02', 2, 'Alquilado', '02', NULL, 1, '2023-02-07 18:44:20', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equ_asignados`
--

CREATE TABLE `equ_asignados` (
  `EAS_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `EQU_ID` int(11) NOT NULL COMMENT 'Llave segundaria, relacion con la tabla equipos',
  `EMP_ID` int(11) NOT NULL COMMENT 'Llave segundaria, relacion con la tabla empleados',
  `EAS_FECHA_ENTREGA` date DEFAULT NULL COMMENT 'Fecha en la que se realizara la entrega de asignacion del equipo',
  `EAS_EVIDENCIA` varchar(200) DEFAULT NULL COMMENT 'Direccion de documento que soporta la accion de asignacion de el equipo',
  `EAS_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `equ_asignados`
--

INSERT INTO `equ_asignados` (`EAS_ID`, `EQU_ID`, `EMP_ID`, `EAS_FECHA_ENTREGA`, `EAS_EVIDENCIA`, `EAS_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 1, 105, NULL, NULL, 1, '2023-01-20 18:49:27', NULL),
(2, 2, 110, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(3, 4, 147, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(4, 5, 109, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(5, 6, 114, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(6, 9, 119, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(7, 10, 211, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(8, 11, 121, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(9, 12, 123, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(10, 13, 118, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(11, 14, 120, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(12, 19, 218, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(13, 20, 137, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(14, 21, 133, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(15, 22, 132, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(16, 23, 135, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(17, 24, 130, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(18, 25, 128, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(19, 26, 129, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(20, 27, 136, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(21, 29, 131, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(22, 30, 134, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(23, 31, 111, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(24, 33, 220, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(25, 35, 126, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(26, 37, 103, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(27, 38, 101, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(28, 39, 91, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(29, 40, 99, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(30, 41, 98, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(31, 42, 102, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(32, 43, 106, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(33, 45, 92, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(34, 46, 104, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(35, 47, 180, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(36, 52, 144, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(37, 53, 156, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(38, 54, 167, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(39, 55, 186, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(40, 56, 182, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(41, 58, 189, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(42, 59, 169, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(43, 60, 138, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(44, 61, 196, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(45, 62, 171, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(46, 64, 185, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(47, 65, 193, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(48, 66, 153, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(49, 68, 139, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(50, 69, 181, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(51, 70, 155, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(52, 71, 145, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(53, 72, 149, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(54, 73, 183, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(55, 74, 168, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(56, 75, 173, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(57, 76, 174, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(58, 77, 178, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(59, 78, 210, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(60, 79, 194, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(61, 80, 160, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(62, 81, 176, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(63, 82, 161, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(64, 83, 188, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(65, 84, 162, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(66, 85, 177, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(67, 86, 140, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(68, 88, 195, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(69, 89, 175, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(70, 91, 191, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(71, 92, 143, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(72, 93, 152, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(73, 94, 148, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(74, 95, 157, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(75, 96, 184, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(76, 97, 172, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(77, 99, 165, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(78, 100, 179, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(79, 101, 170, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(80, 102, 190, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(81, 103, 142, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(82, 104, 187, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(83, 105, 216, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(84, 106, 141, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(85, 115, 221, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(86, 121, 212, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(87, 122, 213, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(88, 130, 207, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(89, 132, 208, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(90, 133, 201, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(91, 134, 115, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(92, 135, 95, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(93, 136, 100, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(94, 137, 171, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(95, 138, 113, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(96, 139, 94, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(97, 140, 96, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(98, 141, 97, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(99, 142, 116, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(100, 143, 93, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(101, 144, 117, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(102, 147, 217, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(103, 149, 214, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(104, 156, 215, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(105, 157, 124, NULL, NULL, 1, '2023-01-20 18:49:28', NULL),
(106, 34, 22, NULL, NULL, 1, '2023-01-20 21:15:59', NULL),
(107, 35, 223, NULL, NULL, 1, '2023-01-20 21:18:13', NULL),
(108, 33, 220, NULL, NULL, 1, '2023-01-20 21:19:32', NULL),
(109, 19, 218, NULL, NULL, 1, '2023-01-20 21:21:23', NULL),
(110, 3, 219, NULL, NULL, 1, '2023-01-20 21:26:26', NULL),
(111, 17, 255, NULL, NULL, 1, '2023-01-20 21:35:02', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `GRU_ID` int(11) NOT NULL,
  `CAM_ID` int(11) NOT NULL,
  `EMP_ID` int(11) NOT NULL,
  `GRU_ESTADO` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `USER_ID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`GRU_ID`, `CAM_ID`, `EMP_ID`, `GRU_ESTADO`, `created_at`, `updated_at`, `USER_ID`) VALUES
(5, 4, 5, 1, '2022-08-29 19:40:10', '2022-08-30 01:24:55', 1),
(7, 3, 2, 1, '2022-08-29 20:50:40', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hardwares`
--

CREATE TABLE `hardwares` (
  `HAR_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `HAR_TIPO` enum('Pieza','Dispositivo') NOT NULL COMMENT 'El tipo determina si es uana Pieza o un Dispositivo del equipo',
  `HAR_DESCRIPCION` varchar(200) DEFAULT NULL COMMENT 'Detalles adicionales del hardware',
  `MAR_ID` int(11) NOT NULL DEFAULT 1 COMMENT 'Llave segundaria, relacion con la tabla marcas',
  `HAR_MODELO` varchar(100) NOT NULL COMMENT 'Un modelo es un bosquejo que representa un conjunto real con cierto grado de precisión y en la forma más completa posible',
  `HAR_SERIAL` varchar(100) NOT NULL COMMENT 'SN o número de serie es un número exclusivo que registra información como la fecha de producción y el estado de garantía del producto',
  `HAR_OBSERVACION` varchar(200) DEFAULT NULL COMMENT 'La descripcion que detalla y explica lo sucedido con el objeto',
  `HAR_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `hardwares`
--

INSERT INTO `hardwares` (`HAR_ID`, `HAR_TIPO`, `HAR_DESCRIPCION`, `MAR_ID`, `HAR_MODELO`, `HAR_SERIAL`, `HAR_OBSERVACION`, `HAR_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 'Pieza', 'RAM23', 1, 'DDR4', 'N/A', '4GB', 4, '2023-01-19 16:07:26', NULL),
(2, 'Pieza', 'DISCO DURO', 1, 'N/A', 'N/A', '256 GB', 1, '2023-01-19 16:07:26', NULL),
(3, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(4, 'Pieza', 'PROCESADOR AMD A6-9225', 1, 'A6-9225', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(5, 'Pieza', 'DISCO DURO 476 6GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(6, 'Pieza', 'DISCO DURO 476GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(7, 'Dispositivo', 'TECLADO', 1, 'HP', 'BGBYV0ALAC495V', NULL, 1, '2023-01-19 16:07:26', '2023-02-11 01:14:59'),
(8, 'Dispositivo', 'MOUSE', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(9, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(10, 'Pieza', 'PROCESADOR', 1, 'CORE I3', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(11, 'Pieza', 'DISCO DURO 930GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(12, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(13, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(14, 'Pieza', 'DISCO DURO 930GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(15, 'Pieza', 'PROCESADOR INTEL CORE DUO', 1, 'CORE DUO', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(16, 'Pieza', 'PROCESADOR INTEL CORE I3', 1, 'CORE I3', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(17, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(18, 'Pieza', 'DISCO DURO 952GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(19, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(20, 'Dispositivo', 'MOUSE HP', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(21, 'Dispositivo', 'DIADEMAS LOGITECH', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(22, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(23, 'Pieza', 'DISCO DURO 953GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(24, 'Pieza', 'PROCESADOR INTEL CORE I3', 1, 'CORE I3', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(25, 'Dispositivo', 'TECLADO HP', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(26, 'Dispositivo', 'MOUSE GENERICO', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(27, 'Dispositivo', 'DIADEMAS LOGITECH', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(28, 'Pieza', 'PROCESADOR AMD RYZEN 5', 1, 'RYZEN 5', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(29, 'Pieza', 'DISCO DURO 1TB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(30, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(31, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BGBYV0ALAC52XU', '', 1, '2023-01-19 16:07:26', NULL),
(32, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'FCYRV0AHDC738P', '', 1, '2023-01-19 16:07:26', NULL),
(33, 'Pieza', 'MONITOR', 1, 'LG', 'LM215WF9-SSA2', '', 1, '2023-01-19 16:07:26', NULL),
(34, 'Pieza', 'MONITOR', 1, 'HP ALL IN ONE', '705NTWG2U681', '', 1, '2023-01-19 16:07:26', NULL),
(35, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(36, 'Pieza', 'DISCO DURO 476 6GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(37, 'Pieza', 'PROCESADOR INTEL I5', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(38, 'Pieza', 'MONITOR HP', 1, 'HP LV1911', 'N/A', 'H5J5G0AAAYAS', 1, '2023-01-19 16:07:26', NULL),
(39, 'Dispositivo', 'MONITOR HP', 1, 'LV1911', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(40, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BGBYV0ALABU1SR', '', 1, '2023-01-19 16:07:26', NULL),
(41, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'FCYRV0AHDC738F', '', 1, '2023-01-19 16:07:26', NULL),
(42, 'Dispositivo', 'DIADEMAS LOGITECH', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(43, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(44, 'Pieza', 'DISCO DURO 248GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(45, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(46, 'Dispositivo', 'TECLADO', 1, 'LOGITECH', '820004520', '', 1, '2023-01-19 16:07:26', NULL),
(47, 'Dispositivo', 'MOUSE', 1, 'LENOVO', '1811066635627', '', 1, '2023-01-19 16:07:26', NULL),
(48, 'Dispositivo', 'MONITOR', 1, 'LENOVO', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(49, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(50, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(51, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(52, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(53, 'Dispositivo', 'TECLADO', 1, 'DELL', '0DJ454', '', 1, '2023-01-19 16:07:26', NULL),
(54, 'Dispositivo', 'MOUSE', 1, 'HP', '1529HS01RFW8', '', 1, '2023-01-19 16:07:26', NULL),
(55, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(56, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(57, 'Pieza', 'DISCO DURO 238 6GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(58, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(59, 'Dispositivo', 'TECLADO', 1, 'DELL', '06WMNO', '', 1, '2023-01-19 16:07:26', NULL),
(60, 'Dispositivo', 'MOUSE', 1, 'LOGITECH', '1510HS02WHK8', '', 1, '2023-01-19 16:07:26', NULL),
(61, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(62, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(63, 'Pieza', 'DISCO DURO 120 GB', 1, 'NAN', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(64, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(65, 'Pieza', 'TECLADO', 1, 'DELL', '0F2JV2', '', 1, '2023-01-19 16:07:26', NULL),
(66, 'Pieza', 'MOUSE', 1, 'LENOVO', '8ssm50l24505avlc9c903w3', '', 1, '2023-01-19 16:07:26', NULL),
(67, 'Pieza', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(68, 'Pieza', 'RAM 8GB', 1, 'NAN', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(69, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(70, 'Pieza', 'DISCO DURO ', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(71, 'Pieza', 'TECLADO', 1, 'HP', 'FCMHH0AKZEG6YD', '', 1, '2023-01-19 16:07:26', NULL),
(72, 'Pieza', 'MOUSE', 1, 'DELL', '05P02F', '', 1, '2023-01-19 16:07:26', NULL),
(73, 'Pieza', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(74, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(75, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(76, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(77, 'Pieza', 'TECLADO', 1, 'LENOVO', '705N3179', '', 1, '2023-01-19 16:07:26', NULL),
(78, 'Dispositivo', 'MOUSE', 1, 'HP', '8SSM50L245606MT000H7X810', '', 1, '2023-01-19 16:07:26', NULL),
(79, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(80, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(81, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(82, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(83, 'Dispositivo', 'TECLADO', 1, '705N7166', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(84, 'Dispositivo', 'MOUSE', 1, 'DELL', '04G481', '', 1, '2023-01-19 16:07:26', NULL),
(85, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:26', NULL),
(86, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 4, '2023-01-19 16:07:26', NULL),
(87, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(88, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(89, 'Dispositivo', 'TECLADO', 1, 'DELL', '04G481', '', 1, '2023-01-19 16:07:27', NULL),
(90, 'Pieza', 'TECLADO', 1, 'LENOVO', 'KT100CDM', '', 1, '2023-01-19 16:07:27', NULL),
(91, 'Dispositivo', 'MOUSE', 1, 'LENOVO', 'KT100CDM', '', 1, '2023-01-19 16:07:27', NULL),
(92, 'Dispositivo', 'MONITOR', 1, 'PL1910W', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(93, 'Pieza', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(94, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(95, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(96, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(97, 'Pieza', 'TECLADO', 1, 'DELL', '04G481', '', 1, '2023-01-19 16:07:27', NULL),
(98, 'Pieza', 'MOUSE', 1, 'HP', 'FCMHH0C92C44L2', '', 1, '2023-01-19 16:07:27', NULL),
(99, 'Dispositivo', 'MONITOR', 1, 'DELL', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(100, 'Pieza', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(101, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(102, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(103, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(104, 'Dispositivo', 'TECLADO', 1, 'LENOVO', '07V2396', '', 1, '2023-01-19 16:07:27', NULL),
(105, 'Pieza', 'MOUSE', 1, 'DELL', '0RKRON', '', 1, '2023-01-19 16:07:27', NULL),
(106, 'Dispositivo', 'MONITOR', 1, 'DELL', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(107, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(108, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(109, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(110, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(111, 'Dispositivo', 'TECLADO', 1, 'HP', 'BDMHE0CHH7F2P6', '', 1, '2023-01-19 16:07:27', NULL),
(112, 'Dispositivo', 'MOUSE', 1, 'HP', 'FCMHH0AKZ28MJQ', '', 1, '2023-01-19 16:07:27', NULL),
(113, 'Pieza', 'MONITOR', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(114, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(115, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(116, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(117, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(118, 'Dispositivo', 'TECLADO', 1, 'HP', 'BEXJL0B5YCF0TVW', '', 1, '2023-01-19 16:07:27', NULL),
(119, 'Dispositivo', 'MOUSE', 1, 'DELL', 'CN-09RRC7-48729-35Q-1079', '', 1, '2023-01-19 16:07:27', NULL),
(120, 'Dispositivo', 'MONITOR', 1, 'DELL', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(121, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(122, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(123, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(124, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(125, 'Dispositivo', 'TECLADO', 1, 'DELL', '06WMMN0', '', 1, '2023-01-19 16:07:27', NULL),
(126, 'Dispositivo', 'MOUSE', 1, 'DELL', 'CN-09RRC7-48729-380-1615', '', 1, '2023-01-19 16:07:27', NULL),
(127, 'Dispositivo', 'MONITOR', 1, 'ACER', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(128, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(129, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(130, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(131, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(132, 'Pieza', 'TECLADO', 1, 'DELL', '64463', '', 1, '2023-01-19 16:07:27', NULL),
(133, 'Dispositivo', 'MOUSE', 1, 'LENOVO', '44GG558', '', 1, '2023-01-19 16:07:27', NULL),
(134, 'Pieza', 'MONITOR', 1, 'ACER', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(135, 'Pieza', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(136, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(137, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(138, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(139, 'Dispositivo', 'TECLADO', 1, 'BGBYV0AL7EI6NG', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(140, 'Dispositivo', 'MOUSE', 1, 'RAZER', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(141, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(142, 'Pieza', 'MONITOR', 1, 'ACER', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(143, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(144, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(145, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(146, 'Dispositivo', 'TECLADO', 1, 'HP', 'BGBYV0AL7EJ2C0', '', 1, '2023-01-19 16:07:27', NULL),
(147, 'Dispositivo', 'MOUSE', 1, 'DELL', '049PRO-CH400-94R-OKDM', '', 1, '2023-01-19 16:07:27', NULL),
(148, 'Dispositivo', 'MONITOR', 1, 'ACER', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(149, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(150, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(151, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(152, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(153, 'Dispositivo', 'TECLADO', 1, 'HP', 'BGBYV0AL7EJ2E3', '', 1, '2023-01-19 16:07:27', NULL),
(154, 'Dispositivo', 'MOUSE', 1, 'LENOVO', '44KC623', '', 1, '2023-01-19 16:07:27', NULL),
(155, 'Dispositivo', 'MONITOR', 1, 'ACER', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(156, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(157, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(158, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(159, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(160, 'Dispositivo', 'TECLADO', 1, 'DELL', '0644G3', '', 1, '2023-01-19 16:07:27', NULL),
(161, 'Dispositivo', 'MOUSE', 1, 'LOGITECH', 'L2822AL1NY1', '', 1, '2023-01-19 16:07:27', NULL),
(162, 'Dispositivo', 'MONITOR', 1, 'ACER', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(163, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(164, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(165, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(166, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(167, 'Pieza', 'TECLADO', 1, 'DELL', '0DJ456', '', 1, '2023-01-19 16:07:27', NULL),
(168, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(169, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(170, 'Dispositivo', 'MONITOR', 1, 'ACER', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(171, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(172, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(173, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(174, 'Dispositivo', 'TECLADO', 1, 'DELL', '0W6R86', '', 1, '2023-01-19 16:07:27', NULL),
(175, 'Dispositivo', 'MOUSE', 1, 'DELL', '0K2WYH-71616', '', 1, '2023-01-19 16:07:27', NULL),
(176, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(177, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(178, 'Pieza', 'PROCESADOR', 1, 'CORE I3', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(179, 'Pieza', 'DISCO DURO 476 6GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(180, 'Dispositivo', 'TECLADO', 1, 'LENOVO', '08S040F', '', 1, '2023-01-19 16:07:27', NULL),
(181, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(182, 'Dispositivo', 'MONITOR', 1, 'ACER', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(183, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(184, 'Pieza', 'TECLADO', 1, 'HP', 'BGBYV0ALABU3E0', '', 1, '2023-01-19 16:07:27', NULL),
(185, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(186, 'Dispositivo', 'TECLADO', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(187, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(188, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(189, 'Pieza', 'DISCO DURO 475GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(190, 'Pieza', 'PROCESADOR', 1, 'CORE I3', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(191, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(192, 'Dispositivo', 'TECLADO', 1, 'HP', '7CH9272TKN', '', 1, '2023-01-19 16:07:27', NULL),
(193, 'Dispositivo', 'MOUSE', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(194, 'Dispositivo', 'MONITOR', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(195, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(196, 'Pieza', 'PROCESADOR', 1, 'A6-9225', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(197, 'Pieza', 'DISCO DURO 476 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(198, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(199, 'Dispositivo', 'TECLADO', 1, 'HP', 'BEXJL0BCP79OH2', '', 1, '2023-01-19 16:07:27', NULL),
(200, 'Dispositivo', 'MOUSE', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(201, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(202, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(203, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(204, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(205, 'Dispositivo', 'TECLADO', 1, 'DELL', '0C639N', '', 1, '2023-01-19 16:07:27', NULL),
(206, 'Dispositivo', 'MOUSE', 1, 'DELL', '09RRC7-48729-37K-0B3R', '', 1, '2023-01-19 16:07:27', NULL),
(207, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(208, 'Pieza', 'RAM 8GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(209, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', 'DISCO ESTADO SOLIDO', 1, '2023-01-19 16:07:27', NULL),
(210, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(211, 'Dispositivo', 'TECLADO', 1, 'LENOVO', '705N7104', '', 1, '2023-01-19 16:07:27', NULL),
(212, 'Dispositivo', 'MOUSE', 1, 'LENOVO', 'KT1100CDM', '', 1, '2023-01-19 16:07:27', NULL),
(213, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(214, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(215, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(216, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(217, 'Dispositivo', 'TECLADO', 1, 'DELL', 'O4G481', '', 1, '2023-01-19 16:07:27', NULL),
(218, 'Dispositivo', 'MOUSE', 1, 'DELL', '065K57-L0300-03G-0GYF', '', 1, '2023-01-19 16:07:27', NULL),
(219, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(220, 'Dispositivo', 'MONITOR', 1, 'DELL', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(221, 'Pieza', 'DISCO DURO 120 GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(222, 'Pieza', 'RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(223, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(224, 'Dispositivo', 'TECLADO', 1, 'DELL', 'CN-04G481-71616-48J-0NCM-A00', '', 1, '2023-01-19 16:07:27', NULL),
(225, 'Dispositivo', 'MOUSE', 1, 'HP', 'FCMHH0AHDBHB31', '', 1, '2023-01-19 16:07:27', NULL),
(226, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(227, 'Dispositivo', 'MONITOR', 1, 'DELL', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(228, 'Pieza', 'DISCO DURO 952GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(229, 'Pieza', 'MEMORIA RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(230, 'Pieza', 'PROCESADOR', 1, 'CORE I3', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(231, 'Dispositivo', 'TECLADO', 1, 'HP', 'BDMHE0CCP9DDXU', '', 1, '2023-01-19 16:07:27', NULL),
(232, 'Dispositivo', 'MOUSE', 1, 'GENIUS', 'FCYRV0AHDC73751', '', 1, '2023-01-19 16:07:27', NULL),
(233, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(234, 'Dispositivo', 'MONITOR', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(235, 'Pieza', 'DISCO DURO 952GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(236, 'Pieza', 'MEMORIA RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(237, 'Pieza', 'PROCESADOR', 1, 'CORE I3', 'N/A', '', 4, '2023-01-19 16:07:27', NULL),
(238, 'Dispositivo', 'TECLADO', 1, 'LENOVO', 'BDMHE0CCP7L40V', '', 1, '2023-01-19 16:07:27', NULL),
(239, 'Dispositivo', 'MOUSE', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(240, 'Dispositivo', 'MONITOR', 1, 'HP', '3CQ915112C', '', 1, '2023-01-19 16:07:27', NULL),
(241, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(242, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(243, 'Pieza', 'DISCO DURO 952GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(244, 'Pieza', 'MEMORIA RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(245, 'Pieza', 'PROCESADOR', 1, 'CORE I3', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(246, 'Dispositivo', 'TECLADO', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(247, 'Dispositivo', 'MOUSE', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(248, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(249, 'Dispositivo', 'MONITOR', 1, 'HP', '3CQ9150Z66', '', 1, '2023-01-19 16:07:27', NULL),
(250, 'Pieza', 'DISCO DURO 952GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(251, 'Pieza', 'MEMORIA RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(252, 'Pieza', 'PROCESADOR', 1, 'CORE I3', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(253, 'Dispositivo', 'TECLADO', 1, 'HP', 'BDMHE0C5Y7X43U', '', 1, '2023-01-19 16:07:27', NULL),
(254, 'Dispositivo', 'MOUSE', 1, 'HP', 'CN-011D3V-73826-45H-0TAX', '', 1, '2023-01-19 16:07:27', NULL),
(255, 'Dispositivo', 'MONITOR', 1, 'HP', 'CNC915QRTN', '', 1, '2023-01-19 16:07:27', NULL),
(256, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(257, 'Pieza', 'DISCO DURO 952GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(258, 'Pieza', 'MEMORIA RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(259, 'Pieza', 'PROCESADOR', 1, 'CORE I3', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(260, 'Dispositivo', 'TECLADO', 1, 'HP', 'BDMHE0CHH7L1O6', '', 1, '2023-01-19 16:07:27', NULL),
(261, 'Dispositivo', 'MOUSE', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(262, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(263, 'Dispositivo', 'MONITOR', 1, 'HP', '3CQ9181SW2', '', 1, '2023-01-19 16:07:27', NULL),
(264, 'Pieza', 'DISCO DURO 952GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(265, 'Pieza', 'MEMORIA RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:27', NULL),
(266, 'Pieza', 'PROCESADOR', 1, 'CORE I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(267, 'Dispositivo', 'TECLADO', 1, 'HP', 'BDMHE0C5Y7X6NS', '', 1, '2023-01-19 16:07:28', NULL),
(268, 'Dispositivo', 'MOUSE', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(269, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(270, 'Dispositivo', 'MONITOR', 1, 'HP', 'CNC915QRXX', '', 1, '2023-01-19 16:07:28', NULL),
(271, 'Pieza', 'DISCO DURO 312GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(272, 'Pieza', 'MEMORIA RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(273, 'Pieza', 'PROCESADOR', 1, 'CORE I5', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(274, 'Dispositivo', 'TECLADO', 1, 'DELL', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(275, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(276, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(277, 'Pieza', 'DISCO DURO 476 6GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(278, 'Pieza', 'MEMORIA RAM 4GB', 1, 'NA', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(279, 'Pieza', 'PROCESADOR', 1, 'A6-9225', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(280, 'Pieza', 'MEMORIA RAM 8GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(281, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(282, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(283, 'Pieza', 'TELCADO HP', 1, 'HP', 'BDMHE0C5Y7X3YT', '', 1, '2023-01-19 16:07:28', NULL),
(284, 'Pieza', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(285, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(286, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(287, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(288, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(289, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'BDMHE0CCP7L40V', '', 1, '2023-01-19 16:07:28', NULL),
(290, 'Dispositivo', 'MOUSE GENIUS', 1, 'GENIUS', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(291, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(292, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(293, 'Pieza', 'DISCO DURO 464 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(294, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(295, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(296, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'BAUHR0IVB0JDXW', '', 1, '2023-01-19 16:07:28', NULL),
(297, 'Dispositivo', 'MOUSE GENIUS', 1, 'GENIUS', 'X8194881708188', '', 1, '2023-01-19 16:07:28', NULL),
(298, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(299, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(300, 'Pieza', 'DISCO DURO 464 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(301, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(302, 'Pieza', 'MEMORIA RAM 8GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(303, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(304, 'Pieza', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(305, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(306, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(307, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(308, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(309, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(310, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'BDMHE0CHH7F2P6', '', 1, '2023-01-19 16:07:28', NULL),
(311, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(312, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(313, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(314, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(315, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(316, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(317, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(318, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(319, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(320, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(321, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(322, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(323, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(324, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'BDMHE0C5Y7X3FH', '', 1, '2023-01-19 16:07:28', NULL),
(325, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(326, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(327, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(328, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(329, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(330, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(331, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'BDMHE0C57X1JI', '', 1, '2023-01-19 16:07:28', NULL),
(332, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(333, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(334, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'CNC911P244', '', 1, '2023-01-19 16:07:28', NULL),
(335, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(336, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(337, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(338, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(339, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(340, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(341, 'Dispositivo', 'MONITOR HP', 1, 'HP', '3CQ9181RK3', '', 1, '2023-01-19 16:07:28', NULL),
(342, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(343, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(344, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(345, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'BDMHE0C5Y7X5VY', '', 1, '2023-01-19 16:07:28', NULL),
(346, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(347, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(348, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(349, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(350, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(351, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(352, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0CHH7L667', '', 1, '2023-01-19 16:07:28', NULL),
(353, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(354, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(355, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(356, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(357, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(358, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(359, 'Dispositivo', 'TECLADO LENOVO', 1, 'LENOVO', '896914', '', 1, '2023-01-19 16:07:28', NULL),
(360, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(361, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(362, 'Dispositivo', 'MONITOR HP', 1, 'HP', '3CQ918RY9', '', 1, '2023-01-19 16:07:28', NULL),
(363, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(364, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(365, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(366, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'BDMHE0CVB8H5TQ', '', 1, '2023-01-19 16:07:28', NULL),
(367, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(368, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(369, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'CNC911P214', '', 1, '2023-01-19 16:07:28', NULL),
(370, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(371, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(372, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(373, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(374, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(375, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(376, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(377, 'Pieza', 'DISCO DURO 464 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(378, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(379, 'Pieza', 'MEMORIA RAM 8GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(380, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(381, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0C5Y7U0E0', '', 1, '2023-01-19 16:07:28', NULL),
(382, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(383, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(384, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(385, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(386, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(387, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(388, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'BDMHE0D5Y9J4XA', '', 1, '2023-01-19 16:07:28', NULL),
(389, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(390, 'Dispositivo', 'MONITOR HP', 1, 'HP', '6CM20740NR5', '', 1, '2023-01-19 16:07:28', NULL),
(391, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(392, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(393, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(394, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(395, 'Dispositivo', 'MONITOR HP', 1, 'HP', '3CQ915101G', '', 1, '2023-01-19 16:07:28', NULL),
(396, 'Dispositivo', 'TELCADO HP', 1, 'HP', 'BDMHE0C5Y7X43S', '', 1, '2023-01-19 16:07:28', NULL),
(397, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(398, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(399, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(400, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(401, 'Dispositivo', 'TECLADO LENOVO', 1, 'LENOVO', '3349898', '', 1, '2023-01-19 16:07:28', NULL),
(402, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(403, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(404, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'CNC911P1W4', '', 1, '2023-01-19 16:07:28', NULL),
(405, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(406, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(407, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(408, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(409, 'Dispositivo', 'TECLADO LENOVO', 1, 'LENOVO', '525276', '', 1, '2023-01-19 16:07:28', NULL),
(410, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(411, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(412, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(413, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(414, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BEXJL0BCP79OAW', '', 1, '2023-01-19 16:07:28', NULL),
(415, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(416, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(417, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(418, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(419, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(420, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(421, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0CCP7LMK1', '', 1, '2023-01-19 16:07:28', NULL),
(422, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(423, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'CN911P1SD', '', 1, '2023-01-19 16:07:28', NULL),
(424, 'Pieza', 'DISCO DURO 464 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(425, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(426, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(427, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(428, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BEXJL0BGA38264', '', 1, '2023-01-19 16:07:28', NULL),
(429, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(430, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(431, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(432, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(433, 'Pieza', 'DISCO DURO 464 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(434, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(435, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(436, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BEXJL0BGA38264', '', 1, '2023-01-19 16:07:28', NULL),
(437, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(438, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(439, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(440, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(441, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(442, 'Dispositivo', 'MONITOR HP', 1, 'HP', '3CQ9181RGF', '', 1, '2023-01-19 16:07:28', NULL),
(443, 'Dispositivo', 'MOUSE GENIUS', 1, 'GENIUS', 'X8194881708165', '', 1, '2023-01-19 16:07:28', NULL),
(444, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0CCP7N3YK', '', 1, '2023-01-19 16:07:28', NULL),
(445, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(446, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(447, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(448, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(449, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'CNC910Q8RL', '', 1, '2023-01-19 16:07:28', NULL),
(450, 'Dispositivo', 'TECLADO LENOVO', 1, 'LENOVO', '369122', '', 1, '2023-01-19 16:07:28', NULL),
(451, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(452, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(453, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(454, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(455, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(456, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(457, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(458, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(459, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(460, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(461, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(462, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(463, 'Dispositivo', 'MONITOR HP', 1, 'HP', '3CQ9181RB0', '', 1, '2023-01-19 16:07:28', NULL),
(464, 'Dispositivo', 'TECLADO LENOVO', 1, 'LENOVO', '369122', '', 1, '2023-01-19 16:07:28', NULL),
(465, 'Dispositivo', 'MOUSE GENERICO', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(466, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(467, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(468, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(469, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(470, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(471, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0C5Y7X483', '', 1, '2023-01-19 16:07:28', NULL),
(472, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(473, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(474, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(475, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(476, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(477, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'CNC912RDJR', '', 1, '2023-01-19 16:07:28', NULL),
(478, 'Dispositivo', 'TECLADO HP', 1, 'BDBSK0DGA9U14T', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(479, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(480, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(481, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(482, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(483, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:28', NULL),
(484, 'Dispositivo', 'MONITOR HP', 1, 'HP', '3CQ9181RK3', '', 1, '2023-01-19 16:07:29', NULL),
(485, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(486, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0C5Y7X7CO', '', 1, '2023-01-19 16:07:29', NULL),
(487, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(488, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(489, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(490, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(491, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0CHH7L42Z', '', 1, '2023-01-19 16:07:29', NULL),
(492, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(493, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'CNC911P1J2', '', 1, '2023-01-19 16:07:29', NULL),
(494, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(495, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(496, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 4, '2023-01-19 16:07:29', NULL),
(497, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(498, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(499, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0CHH7O0ET', '', 1, '2023-01-19 16:07:29', NULL),
(500, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0CHH7O0ET', '', 1, '2023-01-19 16:07:29', NULL),
(501, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(502, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(503, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(504, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(505, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'CNC911P0XR', '', 1, '2023-01-19 16:07:29', NULL),
(506, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(507, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BFMHE0CCP7N44G', '', 1, '2023-01-19 16:07:29', NULL),
(508, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(509, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(510, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(511, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(512, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(513, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(514, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'CNC911P0XL', '', 1, '2023-01-19 16:07:29', NULL),
(515, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(516, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(517, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(518, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(519, 'Dispositivo', 'TECLADO LENOVO', 1, 'LENOVO', '5441560', '', 1, '2023-01-19 16:07:29', NULL),
(520, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(521, 'Dispositivo', 'MONITOR HP', 1, 'HP', '3CQ9181T3Z', '', 1, '2023-01-19 16:07:29', NULL),
(522, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(523, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(524, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(525, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(526, 'Dispositivo', 'MONITOR HP', 1, 'HP', '3CQ9181T1C', '', 1, '2023-01-19 16:07:29', NULL),
(527, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0CCP7V1PN', '', 1, '2023-01-19 16:07:29', NULL),
(528, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'FCMHH0CJP7PLV6', '', 1, '2023-01-19 16:07:29', NULL),
(529, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(530, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(531, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(532, 'Dispositivo', 'TECLADO HP', 1, 'HP', '7CH9272TKN', '', 1, '2023-01-19 16:07:29', NULL),
(533, 'Dispositivo', 'MOUSE LENOVO', 1, 'LENOVO', '25011476', '', 1, '2023-01-19 16:07:29', NULL),
(534, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(535, 'Dispositivo', 'MONITOR HP', 1, 'HP', '6CM2070M8H', '', 1, '2023-01-19 16:07:29', NULL),
(536, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(537, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(538, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 4, '2023-01-19 16:07:29', NULL),
(539, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0CHH7L64B', '', 1, '2023-01-19 16:07:29', NULL),
(540, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(541, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(542, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'HP', '', 1, '2023-01-19 16:07:29', NULL),
(543, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'HP', '', 1, '2023-01-19 16:07:29', NULL),
(544, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(545, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(546, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(547, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(548, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'HDMHE0C5Y', '', 1, '2023-01-19 16:07:29', NULL),
(549, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(550, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(551, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(552, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(553, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(554, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(555, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(556, 'Dispositivo', 'TECLADO', 1, 'LENOVO', '498250', '', 1, '2023-01-19 16:07:29', NULL),
(557, 'Dispositivo', 'MOUSE GENIUS', 1, 'GENIUS', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(558, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(559, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL);
INSERT INTO `hardwares` (`HAR_ID`, `HAR_TIPO`, `HAR_DESCRIPCION`, `MAR_ID`, `HAR_MODELO`, `HAR_SERIAL`, `HAR_OBSERVACION`, `HAR_ESTADO`, `created_at`, `updated_at`) VALUES
(560, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(561, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(562, 'Dispositivo', 'MONITOR HP', 1, 'HP', '3CQ9181QP2', '', 1, '2023-01-19 16:07:29', NULL),
(563, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0CCP7LD9T', '', 1, '2023-01-19 16:07:29', NULL),
(564, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(565, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(566, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(567, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(568, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(569, 'Dispositivo', 'TECLADO LENOVO', 1, 'LENOVO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(570, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(571, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(572, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(573, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(574, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(575, 'Dispositivo', 'TECLADO LENOVO', 1, 'LENOVO', '1905582', '', 1, '2023-01-19 16:07:29', NULL),
(576, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(577, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'FCYRV0AHDC5516', '', 1, '2023-01-19 16:07:29', NULL),
(578, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(579, 'Pieza', 'DISCO DURO 464 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(580, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(581, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(582, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(583, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'FCYRV0AHDC552Z', '', 1, '2023-01-19 16:07:29', NULL),
(584, 'Dispositivo', 'MOUSE LENOVO', 1, 'LENOVO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(585, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(586, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(587, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(588, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(589, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(590, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(591, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(592, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(593, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(594, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(595, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(596, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(597, 'Dispositivo', 'MONITOR HP', 1, 'HP', '3CQ9181S9L', '', 1, '2023-01-19 16:07:29', NULL),
(598, 'Dispositivo', 'TECLADO LENOVO', 1, 'LENOVO', '3649085', '', 1, '2023-01-19 16:07:29', NULL),
(599, 'Dispositivo', 'MOUSE LENOVO', 1, 'LENOVO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(600, 'Pieza', 'PROCESADOR AMD', 1, 'AMD A6-9225', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(601, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(602, 'Pieza', 'DISCO DURO 464 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(603, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(604, 'Dispositivo', 'TECLADO HP', 1, 'BGBYV0ALAC492R', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(605, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'X8194881708163', '', 1, '2023-01-19 16:07:29', NULL),
(606, 'Dispositivo', 'MONITOR HP', 1, 'HP ALL IN ONE', 'M215HAN01.1', '', 1, '2023-01-19 16:07:29', NULL),
(607, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(608, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(609, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(610, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(611, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(612, 'Dispositivo', 'TECLADO GENIUS', 1, 'GENIUS', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(613, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(614, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(615, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(616, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(617, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(618, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'BDMHE0C5Y7U12D', '', 1, '2023-01-19 16:07:29', NULL),
(619, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'FCYRV0AHDC7380', '', 1, '2023-01-19 16:07:29', NULL),
(620, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(621, 'Dispositivo', 'TECLADO LENOVO', 1, 'LENOVO', '54Y9424', '', 1, '2023-01-19 16:07:29', NULL),
(622, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(623, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(624, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(625, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(626, 'Pieza', 'MEMORIA RAM 8GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(627, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(628, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(629, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDMHE0CCP8NL9Y', '', 1, '2023-01-19 16:07:29', NULL),
(630, 'Dispositivo', 'MOUSE HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(631, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(632, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(633, 'Pieza', 'DISCO DURO 953 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(634, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(635, 'Dispositivo', 'TECLADO HP', 1, 'HP', 'BDBRN0EGA43C62', '', 1, '2023-01-19 16:07:29', NULL),
(636, 'Dispositivo', 'MOUSE', 1, 'GENERICO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(637, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(638, 'Pieza', 'PROCESADOR INTEL I3', 1, 'INTEL I3', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(639, 'Pieza', 'MEMORIA RAM 8GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(640, 'Pieza', 'DISCO DURO 464 GB', 1, 'DISCO DURO', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(641, 'Dispositivo', 'DIADEMAS', 1, 'H390', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(642, 'Dispositivo', 'TECLADO HP', 1, 'HP', '19053582', '', 1, '2023-01-19 16:07:29', NULL),
(643, 'Dispositivo', 'MOUSE GENIUS', 1, 'GENIUS', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(644, 'Dispositivo', 'MONITOR HP', 1, 'HP', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(645, 'Pieza', 'PROCESADOR INTEL', 1, 'INTEL CELERON', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(646, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(647, 'Pieza', 'DISCO SDD 128GB', 1, 'DISCO DURO', 'DISCO DURO', '', 1, '2023-01-19 16:07:29', NULL),
(648, 'Pieza', 'PROCESADOR INTEL', 1, 'INTEL CELERON', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(649, 'Dispositivo', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(650, 'Pieza', 'DISCO SDD 128GB', 1, 'DISCO SDD', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(651, 'Pieza', 'PROCESADOR INTEL', 1, 'INTEL CELERON', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(652, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(653, 'Pieza', 'DISCO SDD 128GB', 1, 'DISCO SDD', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(654, 'Pieza', 'DISCO SDD 128GB', 1, 'DISCO SDD', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(655, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(656, 'Pieza', 'PROCESADOR INTEL', 1, 'INTEL CELERON', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(657, 'Pieza', 'DISCO SDD 128GB', 1, 'DISCO SDD', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(658, 'Pieza', 'PROCESADOR INTEL', 1, 'INTEL CELERON', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(659, 'Pieza', 'MEMORIA RAM 4GB', 1, 'MEMORIA RAM', 'N/A', '', 1, '2023-01-19 16:07:29', NULL),
(660, 'Dispositivo', '01', 1, 'l', 'l', 'l', 0, '2023-02-10 20:17:01', '2023-02-11 01:17:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `har_asignados`
--

CREATE TABLE `har_asignados` (
  `HAS_ID` int(11) NOT NULL COMMENT 'Llave primaria	',
  `HAR_ID` int(11) NOT NULL COMMENT 'Llave segundaria, relacion con la tabla hardware',
  `EQU_ID` int(11) NOT NULL COMMENT 'Llave segundaria, relacion con la tabla equipos',
  `HAS_COMENTARIO` varchar(200) DEFAULT NULL COMMENT 'Detalles del cambio',
  `HAS_STATUS` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ASIGNADO, 2= CAMBIO, 0=ANULADO',
  `HAS_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `har_asignados`
--

INSERT INTO `har_asignados` (`HAS_ID`, `HAR_ID`, `EQU_ID`, `HAS_COMENTARIO`, `HAS_STATUS`, `HAS_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(2, 2, 1, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(3, 3, 2, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(4, 4, 2, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(5, 5, 2, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(6, 6, 2, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(7, 7, 2, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(8, 8, 2, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(9, 9, 2, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(10, 10, 3, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(11, 11, 3, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(12, 12, 3, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(13, 13, 4, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(14, 14, 4, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(15, 15, 4, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(16, 16, 5, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(17, 17, 5, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(18, 18, 5, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(19, 19, 5, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(20, 20, 5, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(21, 21, 5, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(22, 22, 6, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(23, 23, 6, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(24, 24, 6, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(25, 25, 6, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(26, 26, 6, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(27, 27, 6, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(28, 28, 7, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(29, 29, 7, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(30, 30, 7, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(31, 31, 7, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(32, 32, 7, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(33, 33, 7, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(34, 34, 7, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(35, 35, 1, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(36, 36, 1, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(37, 37, 1, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(38, 38, 1, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(39, 39, 1, NULL, 1, 1, '2023-01-19 19:59:14', NULL),
(40, 40, 1, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(41, 41, 1, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(42, 42, 1, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(43, 43, 15, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(44, 44, 15, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(45, 45, 15, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(46, 46, 15, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(47, 47, 15, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(48, 48, 15, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(49, 49, 15, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(50, 50, 16, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(51, 51, 16, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(52, 52, 16, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(53, 53, 16, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(54, 54, 16, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(55, 55, 16, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(56, 56, 17, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(57, 57, 17, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(58, 58, 17, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(59, 59, 17, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(60, 60, 17, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(61, 61, 17, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(62, 62, 18, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(63, 63, 18, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(64, 64, 18, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(65, 65, 18, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(66, 66, 18, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(67, 67, 18, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(68, 68, 9, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(69, 69, 9, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(70, 70, 9, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(71, 71, 9, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(72, 72, 9, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(73, 73, 9, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(74, 74, 10, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(75, 75, 10, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(76, 76, 10, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(77, 77, 10, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(78, 78, 10, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(79, 79, 10, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(80, 80, 11, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(81, 81, 11, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(82, 82, 11, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(83, 83, 11, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(84, 84, 11, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(85, 85, 11, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(86, 86, 12, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(87, 87, 12, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(88, 88, 12, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(89, 89, 12, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(90, 90, 12, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(91, 91, 12, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(92, 92, 12, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(93, 93, 12, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(94, 94, 13, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(95, 95, 13, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(96, 96, 13, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(97, 97, 13, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(98, 98, 13, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(99, 99, 13, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(100, 100, 13, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(101, 101, 14, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(102, 102, 14, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(103, 103, 14, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(104, 104, 14, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(105, 105, 14, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(106, 106, 14, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(107, 107, 14, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(108, 108, 20, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(109, 109, 20, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(110, 110, 20, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(111, 111, 20, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(112, 112, 20, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(113, 113, 20, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(114, 114, 20, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(115, 115, 21, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(116, 116, 21, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(117, 117, 21, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(118, 118, 21, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(119, 119, 21, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(120, 120, 21, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(121, 121, 21, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(122, 122, 22, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(123, 123, 22, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(124, 124, 22, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(125, 125, 22, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(126, 126, 22, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(127, 127, 22, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(128, 128, 22, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(129, 129, 23, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(130, 130, 23, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(131, 131, 23, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(132, 132, 23, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(133, 133, 23, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(134, 134, 23, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(135, 135, 23, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(136, 136, 25, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(137, 137, 25, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(138, 138, 25, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(139, 139, 25, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(140, 140, 25, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(141, 141, 25, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(142, 142, 25, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(143, 143, 24, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(144, 144, 24, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(145, 145, 24, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(146, 146, 24, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(147, 147, 24, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(148, 148, 24, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(149, 149, 24, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(150, 150, 26, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(151, 151, 26, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(152, 152, 26, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(153, 153, 26, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(154, 154, 26, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(155, 155, 26, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(156, 156, 26, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(157, 157, 27, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(158, 158, 27, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(159, 159, 27, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(160, 160, 27, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(161, 161, 27, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(162, 162, 27, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(163, 163, 27, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(164, 164, 28, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(165, 165, 28, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(166, 166, 28, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(167, 167, 28, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(168, 168, 28, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(169, 169, 28, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(170, 170, 28, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(171, 171, 29, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(172, 172, 29, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(173, 173, 29, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(174, 174, 29, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(175, 175, 29, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(176, 176, 29, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(177, 177, 30, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(178, 178, 30, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(179, 179, 30, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(180, 180, 30, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(181, 181, 30, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(182, 182, 30, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(183, 183, 30, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(184, 184, 3, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(185, 185, 3, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(186, 186, 4, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(187, 187, 4, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(188, 188, 4, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(189, 189, 31, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(190, 190, 31, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(191, 191, 31, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(192, 192, 31, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(193, 193, 31, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(194, 194, 31, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(195, 195, 31, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(196, 196, 32, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(197, 197, 32, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(198, 198, 32, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(199, 199, 32, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(200, 200, 32, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(201, 201, 32, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(202, 202, 33, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(203, 203, 33, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(204, 204, 33, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(205, 205, 33, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(206, 206, 33, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(207, 207, 33, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(208, 208, 34, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(209, 209, 34, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(210, 210, 34, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(211, 211, 34, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(212, 212, 34, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(213, 213, 34, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(214, 214, 35, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(215, 215, 35, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(216, 216, 35, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(217, 217, 35, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(218, 218, 35, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(219, 219, 35, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(220, 220, 35, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(221, 221, 36, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(222, 222, 36, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(223, 223, 36, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(224, 224, 36, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(225, 225, 36, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(226, 226, 36, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(227, 227, 36, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(228, 228, 37, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(229, 229, 37, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(230, 230, 37, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(231, 231, 37, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(232, 232, 37, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(233, 233, 37, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(234, 234, 37, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(235, 235, 38, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(236, 236, 38, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(237, 237, 38, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(238, 238, 38, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(239, 239, 38, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(240, 240, 38, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(241, 241, 38, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(242, 242, 38, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(243, 243, 39, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(244, 244, 39, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(245, 245, 39, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(246, 246, 39, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(247, 247, 39, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(248, 248, 39, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(249, 249, 39, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(250, 250, 40, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(251, 251, 40, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(252, 252, 40, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(253, 253, 40, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(254, 254, 40, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(255, 255, 40, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(256, 256, 40, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(257, 257, 41, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(258, 258, 41, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(259, 259, 41, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(260, 260, 41, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(261, 261, 41, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(262, 262, 41, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(263, 263, 41, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(264, 264, 42, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(265, 265, 42, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(266, 266, 42, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(267, 267, 42, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(268, 268, 42, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(269, 269, 42, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(270, 270, 42, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(271, 271, 43, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(272, 272, 43, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(273, 273, 43, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(274, 274, 43, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(275, 275, 43, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(276, 276, 43, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(277, 277, 122, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(278, 278, 122, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(279, 279, 122, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(280, 280, 76, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(281, 281, 76, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(282, 282, 76, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(283, 283, 76, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(284, 284, 76, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(285, 285, 76, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(286, 286, 61, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(287, 287, 61, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(288, 288, 61, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(289, 289, 61, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(290, 290, 61, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(291, 291, 61, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(292, 292, 61, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(293, 293, 53, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(294, 294, 53, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(295, 295, 53, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(296, 296, 53, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(297, 297, 53, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(298, 298, 53, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(299, 299, 53, NULL, 1, 1, '2023-01-19 19:59:15', NULL),
(300, 300, 82, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(301, 301, 82, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(302, 302, 82, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(303, 303, 82, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(304, 304, 82, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(305, 305, 82, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(306, 306, 82, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(307, 307, 84, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(308, 308, 84, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(309, 309, 84, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(310, 310, 84, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(311, 311, 84, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(312, 312, 84, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(313, 313, 84, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(314, 314, 93, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(315, 315, 93, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(316, 316, 93, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(317, 317, 93, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(318, 318, 93, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(319, 319, 93, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(320, 320, 93, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(321, 321, 79, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(322, 322, 79, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(323, 323, 79, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(324, 324, 79, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(325, 325, 79, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(326, 326, 79, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(327, 327, 79, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(328, 328, 71, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(329, 329, 71, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(330, 330, 71, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(331, 331, 71, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(332, 332, 71, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(333, 333, 71, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(334, 334, 71, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(335, 335, 88, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(336, 336, 88, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(337, 337, 88, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(338, 338, 88, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(339, 339, 88, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(340, 340, 88, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(341, 341, 88, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(342, 342, 62, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(343, 343, 62, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(344, 344, 62, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(345, 345, 62, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(346, 346, 62, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(347, 347, 62, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(348, 348, 62, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(349, 349, 59, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(350, 350, 59, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(351, 351, 59, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(352, 352, 59, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(353, 353, 59, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(354, 354, 59, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(355, 355, 59, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(356, 356, 74, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(357, 357, 74, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(358, 358, 74, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(359, 359, 74, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(360, 360, 74, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(361, 361, 74, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(362, 362, 74, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(363, 363, 52, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(364, 364, 52, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(365, 365, 52, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(366, 366, 52, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(367, 367, 52, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(368, 368, 52, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(369, 369, 52, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(370, 370, 92, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(371, 371, 92, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(372, 372, 92, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(373, 373, 92, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(374, 374, 92, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(375, 375, 92, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(376, 376, 92, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(377, 377, 57, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(378, 378, 57, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(379, 379, 57, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(380, 380, 57, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(381, 381, 57, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(382, 382, 57, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(383, 383, 57, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(384, 384, 96, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(385, 385, 96, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(386, 386, 96, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(387, 387, 96, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(388, 388, 96, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(389, 389, 96, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(390, 390, 96, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(391, 391, 58, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(392, 392, 58, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(393, 393, 58, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(394, 394, 58, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(395, 395, 58, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(396, 396, 58, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(397, 397, 58, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(398, 398, 65, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(399, 399, 65, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(400, 400, 65, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(401, 401, 65, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(402, 402, 65, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(403, 403, 65, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(404, 404, 65, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(405, 405, 87, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(406, 406, 87, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(407, 407, 87, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(408, 408, 87, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(409, 409, 87, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(410, 410, 54, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(411, 411, 54, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(412, 412, 54, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(413, 413, 54, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(414, 414, 54, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(415, 415, 54, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(416, 416, 54, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(417, 417, 51, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(418, 418, 51, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(419, 419, 51, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(420, 420, 51, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(421, 421, 51, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(422, 422, 51, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(423, 423, 51, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(424, 424, 55, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(425, 425, 55, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(426, 426, 55, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(427, 427, 55, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(428, 428, 55, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(429, 429, 55, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(430, 430, 55, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(431, 431, 56, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(432, 432, 56, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(433, 433, 56, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(434, 434, 56, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(435, 435, 56, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(436, 436, 56, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(437, 437, 56, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(438, 438, 60, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(439, 439, 60, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(440, 440, 60, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(441, 441, 60, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(442, 442, 60, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(443, 443, 60, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(444, 444, 60, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(445, 445, 63, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(446, 446, 63, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(447, 447, 63, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(448, 448, 63, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(449, 449, 63, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(450, 450, 63, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(451, 451, 63, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(452, 452, 95, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(453, 453, 95, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(454, 454, 95, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(455, 455, 95, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(456, 456, 95, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(457, 457, 95, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(458, 458, 95, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(459, 459, 64, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(460, 460, 64, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(461, 461, 64, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(462, 462, 64, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(463, 463, 64, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(464, 464, 64, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(465, 465, 64, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(466, 466, 66, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(467, 467, 66, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(468, 468, 66, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(469, 469, 66, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(470, 470, 66, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(471, 471, 66, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(472, 472, 66, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(473, 473, 68, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(474, 474, 68, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(475, 475, 68, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(476, 476, 68, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(477, 477, 68, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(478, 478, 68, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(479, 479, 68, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(480, 480, 69, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(481, 481, 69, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(482, 482, 69, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(483, 483, 69, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(484, 484, 69, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(485, 485, 69, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(486, 486, 69, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(487, 487, 72, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(488, 488, 72, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(489, 489, 72, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(490, 490, 72, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(491, 491, 72, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(492, 492, 72, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(493, 493, 72, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(494, 494, 73, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(495, 495, 73, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(496, 496, 73, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(497, 497, 73, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(498, 498, 73, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(499, 499, 73, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(500, 500, 73, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(501, 501, 75, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(502, 502, 75, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(503, 503, 75, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(504, 504, 75, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(505, 505, 75, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(506, 506, 75, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(507, 507, 75, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(508, 508, 78, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(509, 509, 78, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(510, 510, 78, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(511, 511, 78, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(512, 512, 78, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(513, 513, 78, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(514, 514, 78, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(515, 515, 80, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(516, 516, 80, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(517, 517, 80, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(518, 518, 80, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(519, 519, 80, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(520, 520, 80, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(521, 521, 80, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(522, 522, 81, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(523, 523, 81, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(524, 524, 81, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(525, 525, 81, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(526, 526, 81, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(527, 527, 81, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(528, 528, 81, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(529, 529, 83, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(530, 530, 83, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(531, 531, 83, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(532, 532, 83, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(533, 533, 83, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(534, 534, 83, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(535, 535, 83, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(536, 536, 85, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(537, 537, 85, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(538, 538, 85, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(539, 539, 85, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(540, 540, 85, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(541, 541, 85, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(542, 542, 85, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(543, 543, 85, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(544, 544, 86, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(545, 545, 86, NULL, 1, 1, '2023-01-19 19:59:16', NULL),
(546, 546, 86, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(547, 547, 86, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(548, 548, 86, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(549, 549, 86, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(550, 550, 86, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(551, 551, 91, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(552, 552, 91, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(553, 553, 91, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(554, 554, 91, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(555, 555, 91, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(556, 556, 91, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(557, 557, 91, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(558, 558, 89, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(559, 559, 89, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(560, 560, 89, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(561, 561, 89, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(562, 562, 89, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(563, 563, 89, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(564, 564, 89, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(565, 565, 94, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(566, 566, 94, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(567, 567, 94, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(568, 568, 94, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(569, 569, 94, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(570, 570, 94, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(571, 571, 94, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(572, 572, 102, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(573, 573, 102, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(574, 574, 102, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(575, 575, 102, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(576, 576, 102, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(577, 577, 102, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(578, 578, 102, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(579, 579, 100, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(580, 580, 100, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(581, 581, 100, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(582, 582, 100, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(583, 583, 100, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(584, 584, 100, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(585, 585, 100, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(586, 586, 101, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(587, 587, 101, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(588, 588, 101, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(589, 589, 101, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(590, 590, 101, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(591, 591, 101, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(592, 592, 101, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(593, 593, 103, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(594, 594, 103, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(595, 595, 103, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(596, 596, 103, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(597, 597, 103, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(598, 598, 103, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(599, 599, 103, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(600, 600, 104, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(601, 601, 104, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(602, 602, 104, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(603, 603, 104, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(604, 604, 104, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(605, 605, 104, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(606, 606, 104, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(607, 607, 121, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(608, 608, 121, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(609, 609, 121, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(610, 610, 121, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(611, 611, 121, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(612, 612, 121, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(613, 613, 121, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(614, 614, 126, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(615, 615, 126, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(616, 616, 126, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(617, 617, 126, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(618, 618, 126, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(619, 619, 126, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(620, 620, 126, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(621, 621, 122, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(622, 622, 122, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(623, 623, 122, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(624, 624, 122, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(625, 625, 44, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(626, 626, 44, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(627, 627, 44, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(628, 628, 44, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(629, 629, 44, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(630, 630, 44, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(631, 631, 45, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(632, 632, 45, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(633, 633, 45, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(634, 634, 45, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(635, 635, 45, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(636, 636, 45, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(637, 637, 45, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(638, 638, 46, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(639, 639, 46, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(640, 640, 46, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(641, 641, 46, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(642, 642, 46, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(643, 643, 46, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(644, 644, 46, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(645, 645, 152, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(646, 646, 152, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(647, 647, 152, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(648, 648, 154, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(649, 649, 154, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(650, 650, 154, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(651, 651, 130, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(652, 652, 130, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(653, 653, 130, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(654, 654, 133, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(655, 655, 133, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(656, 656, 133, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(657, 657, 157, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(658, 658, 157, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(659, 659, 157, NULL, 1, 1, '2023-01-19 19:59:17', NULL),
(660, 2, 166, 'porque aja', 2, 1, '2023-02-10 16:14:45', NULL),
(661, 3, 167, NULL, 1, 1, '2023-02-14 19:46:57', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horas`
--

CREATE TABLE `horas` (
  `HOR_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `HOR_INICIO` varchar(10) NOT NULL COMMENT 'Este es el campo donde se almacenara la hora inicial de trabajo : 00:00:00',
  `HOR_FINAL` varchar(10) NOT NULL COMMENT 'Este es el campo donde se almacenara la hora final del trabajo : 23:59:59',
  `HOR_TOTAL` int(11) NOT NULL DEFAULT 1 COMMENT 'Este es el campo donde se almacenara el total dehoras trabajadas',
  `HOR_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO,   4 = RETIRADO, 0=ANULADO',
  `USER_ID` int(11) DEFAULT 1 COMMENT 'ID del usuario que creo el registro',
  `HOR_FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Contiene la fecha en que fue creado el registro que tiene asignado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `horas`
--

INSERT INTO `horas` (`HOR_ID`, `HOR_INICIO`, `HOR_FINAL`, `HOR_TOTAL`, `HOR_ESTADO`, `USER_ID`, `HOR_FECHA_CREACION`) VALUES
(1, '00:00:00', '00:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(2, '01:00:00', '01:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(3, '02:00:00', '02:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(4, '03:00:00', '03:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(5, '04:00:00', '04:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(6, '06:00:00', '06:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(7, '07:00:00', '07:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(8, '08:00:00', '08:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(9, '09:00:00', '09:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(10, '10:00:00', '10:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(11, '11:00:00', '11:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(12, '12:00:00', '12:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(13, '13:00:00', '13:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(14, '14:00:00', '14:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(15, '15:00:00', '15:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(16, '16:00:00', '16:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(17, '17:00:00', '17:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(18, '18:00:00', '18:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(19, '19:00:00', '19:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(20, '20:00:00', '20:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(21, '21:00:00', '21:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(22, '22:00:00', '22:59:00', 1, 1, 1, '2023-01-20 15:35:02'),
(23, '23:00:00', '23:59:00', 1, 1, 1, '2023-01-20 15:35:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE `jornadas` (
  `JOR_ID` int(11) NOT NULL,
  `JOR_NOMBRE` mediumtext DEFAULT NULL,
  `JOR_INICIO` int(11) NOT NULL,
  `JOR_FINAL` int(11) NOT NULL,
  `JOR_CANT_HORAS` int(11) NOT NULL DEFAULT 0,
  `JOR_ESTADO` int(11) NOT NULL DEFAULT 1,
  `USER_ID` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `jornadas`
--

INSERT INTO `jornadas` (`JOR_ID`, `JOR_NOMBRE`, `JOR_INICIO`, `JOR_FINAL`, `JOR_CANT_HORAS`, `JOR_ESTADO`, `USER_ID`, `created_at`, `updated_at`) VALUES
(1, '7:00am - 12:00pm', 7, 11, 5, 1, 1, '2023-01-20 15:35:02', NULL),
(2, '7:00am - 1:00pm', 7, 12, 6, 1, 1, '2023-01-20 15:35:02', NULL),
(3, '8:00am - 12:00pm', 8, 11, 4, 1, 1, '2023-01-20 15:35:02', NULL),
(4, '8:00am - 1:00pm', 8, 12, 5, 1, 1, '2023-01-20 15:35:02', NULL),
(5, '6:00am - 12:00pm', 6, 11, 6, 1, 1, '2023-01-20 15:35:02', NULL),
(6, '1:00am - 4:00pm', 13, 15, 4, 1, 1, '2023-01-20 15:35:02', NULL),
(7, '2:00am - 4:00pm', 14, 15, 2, 1, 1, '2023-01-20 15:35:02', NULL),
(8, '1:00am - 5:00pm', 13, 16, 4, 1, 1, '2023-01-20 15:35:02', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias`
--

CREATE TABLE `licencias` (
  `LIC_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `LIC_NOMBRE` varchar(200) NOT NULL COMMENT 'Nombre de donde procede la licencia',
  `LIC_PRECIO` double NOT NULL COMMENT 'Valor neto de la licencia',
  `LIC_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `licencias`
--

INSERT INTO `licencias` (`LIC_ID`, `LIC_NOMBRE`, `LIC_PRECIO`, `LIC_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 'Sagicc agente', 150000, 1, '2023-01-20 14:16:59', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lic_asignados`
--

CREATE TABLE `lic_asignados` (
  `LAS_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `LIC_ID` int(11) NOT NULL COMMENT 'Llave segundaria, relacion con la tabla licencias',
  `EMP_ID` int(11) NOT NULL COMMENT 'Llave segundaria, relacion con la tabla empleados',
  `LAS_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `lic_asignados`
--

INSERT INTO `lic_asignados` (`LAS_ID`, `LIC_ID`, `EMP_ID`, `LAS_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 1, 164, 1, '2023-01-20 14:20:41', NULL),
(2, 1, 139, 1, '2023-01-20 14:20:41', NULL),
(3, 1, 175, 1, '2023-01-20 14:20:41', NULL),
(4, 1, 140, 1, '2023-01-20 14:20:41', NULL),
(5, 1, 165, 1, '2023-01-20 14:20:41', NULL),
(6, 1, 176, 1, '2023-01-20 14:20:41', NULL),
(7, 1, 177, 1, '2023-01-20 14:20:41', NULL),
(8, 1, 141, 1, '2023-01-20 14:20:41', NULL),
(9, 1, 142, 1, '2023-01-20 14:20:41', NULL),
(10, 1, 178, 1, '2023-01-20 14:20:41', NULL),
(11, 1, 143, 1, '2023-01-20 14:20:41', NULL),
(12, 1, 144, 1, '2023-01-20 14:20:41', NULL),
(13, 1, 179, 1, '2023-01-20 14:20:41', NULL),
(14, 1, 145, 1, '2023-01-20 14:20:41', NULL),
(15, 1, 166, 1, '2023-01-20 14:20:41', NULL),
(16, 1, 147, 1, '2023-01-20 14:20:41', NULL),
(17, 1, 148, 1, '2023-01-20 14:20:41', NULL),
(18, 1, 138, 1, '2023-01-20 14:20:41', NULL),
(19, 1, 149, 1, '2023-01-20 14:20:41', NULL),
(20, 1, 180, 1, '2023-01-20 14:20:41', NULL),
(21, 1, 167, 1, '2023-01-20 14:20:41', NULL),
(22, 1, 181, 1, '2023-01-20 14:20:41', NULL),
(23, 1, 182, 1, '2023-01-20 14:20:41', NULL),
(24, 1, 150, 1, '2023-01-20 14:20:41', NULL),
(25, 1, 210, 1, '2023-01-20 14:20:41', NULL),
(26, 1, 151, 1, '2023-01-20 14:20:41', NULL),
(27, 1, 161, 1, '2023-01-20 14:20:41', NULL),
(28, 1, 183, 1, '2023-01-20 14:20:41', NULL),
(29, 1, 169, 1, '2023-01-20 14:20:41', NULL),
(30, 1, 152, 1, '2023-01-20 14:20:41', NULL),
(31, 1, 153, 1, '2023-01-20 14:20:41', NULL),
(32, 1, 170, 1, '2023-01-20 14:20:41', NULL),
(33, 1, 191, 1, '2023-01-20 14:20:41', NULL),
(34, 1, 184, 1, '2023-01-20 14:20:41', NULL),
(35, 1, 154, 1, '2023-01-20 14:20:41', NULL),
(36, 1, 185, 1, '2023-01-20 14:20:41', NULL),
(37, 1, 186, 1, '2023-01-20 14:20:41', NULL),
(38, 1, 187, 1, '2023-01-20 14:20:41', NULL),
(39, 1, 188, 1, '2023-01-20 14:20:41', NULL),
(40, 1, 171, 1, '2023-01-20 14:20:41', NULL),
(41, 1, 156, 1, '2023-01-20 14:20:41', NULL),
(42, 1, 162, 1, '2023-01-20 14:20:41', NULL),
(43, 1, 157, 1, '2023-01-20 14:20:41', NULL),
(44, 1, 158, 1, '2023-01-20 14:20:41', NULL),
(45, 1, 194, 1, '2023-01-20 14:20:41', NULL),
(46, 1, 173, 1, '2023-01-20 14:20:41', NULL),
(47, 1, 193, 1, '2023-01-20 14:20:41', NULL),
(48, 1, 163, 1, '2023-01-20 14:20:41', NULL),
(49, 1, 195, 1, '2023-01-20 14:20:41', NULL),
(50, 1, 160, 1, '2023-01-20 14:20:41', NULL),
(51, 1, 212, 1, '2023-01-20 14:20:41', NULL),
(52, 1, 190, 1, '2023-01-20 14:20:41', NULL),
(53, 1, 174, 1, '2023-01-20 14:20:41', NULL),
(54, 1, 196, 1, '2023-01-20 14:20:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mallas`
--

CREATE TABLE `mallas` (
  `MAL_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `CAM_ID` int(11) DEFAULT NULL COMMENT 'Este es el campo donde se almacenara la ID del contrato',
  `EMP_ID` int(11) NOT NULL COMMENT 'Guardara El ID del empleado que tiene asignada la malla',
  `MAL_DIA` varchar(30) NOT NULL,
  `MAL_INICIO` datetime NOT NULL,
  `MAL_FINAL` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL COMMENT 'ID del usuario que creo el registro',
  `MAL_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado de cada una de los clientes, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimientos`
--

CREATE TABLE `mantenimientos` (
  `MAN_ID` int(11) NOT NULL COMMENT 'Llave primaria.',
  `EQU_ID` int(11) NOT NULL COMMENT 'Equipo asignado al mantenimiento.',
  `MAN_PROVEEDOR` varchar(200) NOT NULL COMMENT 'Corresponde al proveedor que ejecutara el mantenimiento dentro o fuera de las instalaciones de CONTACTA',
  `MAN_FECHA` date NOT NULL COMMENT 'Corresponde a la fecha asignada para llevar a cabo el mantenimiento programado.',
  `MAN_STATUS` int(11) NOT NULL DEFAULT 1 COMMENT 'Estatus en el cual se encuentra el mantenimiento, Ejemplo: 1 = ACTIVO, 2= REALIZADO, 0=ANULADO',
  `MAN_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado de cada una de los clientes, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 5 = REALIZADO, 0=ANULADO',
  `MAN_TECNICO` int(11) NOT NULL COMMENT 'Técnico asignado al mantenimiento.',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mantenimientos`
--

INSERT INTO `mantenimientos` (`MAN_ID`, `EQU_ID`, `MAN_PROVEEDOR`, `MAN_FECHA`, `MAN_STATUS`, `MAN_ESTADO`, `MAN_TECNICO`, `created_at`, `updated_at`) VALUES
(1, 166, 'CONTACTA', '2023-02-16', 2, 1, 91, '2023-02-16 01:12:06', '2023-02-16 01:12:06'),
(2, 166, 'CONTACTA', '2023-08-16', 1, 1, 91, '2023-02-15 20:12:28', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `man_asignados`
--

CREATE TABLE `man_asignados` (
  `MAS_ID` int(11) NOT NULL,
  `MAN_ID` int(11) NOT NULL,
  `MAS_TIPO` enum('Preventivo','Correctivo','Proveedor') NOT NULL,
  `MAS_ACTIVIDAD` text NOT NULL,
  `MAS_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado de cada una de los clientes, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `man_asignados`
--

INSERT INTO `man_asignados` (`MAS_ID`, `MAN_ID`, `MAS_TIPO`, `MAS_ACTIVIDAD`, `MAS_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 1, 'Preventivo', 'AABC', 1, '2023-02-16 01:12:28', '2023-02-16 01:12:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `MAR_ID` int(11) NOT NULL,
  `MAR_NOMBRE` varchar(200) NOT NULL,
  `MAR_DESCRIPCION` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`MAR_ID`, `MAR_NOMBRE`, `MAR_DESCRIPCION`, `created_at`, `updated_at`) VALUES
(1, 'GENERICO', NULL, '2023-01-19 15:13:50', NULL),
(2, 'HP', NULL, '2023-01-19 15:13:50', NULL),
(3, 'LENOVO', NULL, '2023-01-19 15:13:50', NULL),
(4, 'DELL', NULL, '2023-01-19 15:13:50', NULL),
(5, 'LOGITECH', NULL, '2023-01-19 15:13:50', NULL),
(6, 'GENIUS', NULL, '2023-01-19 15:13:50', NULL),
(7, 'ACER', NULL, '2023-01-19 15:13:50', NULL),
(8, 'EPSON', NULL, '2023-01-19 15:13:50', NULL),
(9, 'AMD', NULL, '2023-01-19 15:13:50', NULL),
(10, 'INTEL', NULL, '2023-01-19 15:13:50', NULL),
(11, 'LG', NULL, '2023-01-19 15:13:50', NULL),
(12, 'PLANAR', NULL, '2023-01-19 15:13:50', NULL),
(13, 'RAZER', NULL, '2023-01-19 15:13:50', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_07_04_192252_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 52),
(4, 'App\\Models\\User', 53),
(4, 'App\\Models\\User', 54),
(4, 'App\\Models\\User', 55),
(4, 'App\\Models\\User', 56);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `NOV_ID` int(11) NOT NULL COMMENT 'llave primaria',
  `MAL_ID` int(11) NOT NULL COMMENT 'id de la malla que tiene la novedad',
  `TIN_ID` int(11) NOT NULL COMMENT 'id de la novedad asignada',
  `EMP_ID` int(11) NOT NULL COMMENT 'id de empleado que se le asigna la novedad',
  `NOV_FECHA` varchar(25) NOT NULL COMMENT 'fecha de la novedad',
  `NOV_ESTADO` int(11) NOT NULL DEFAULT 1,
  `USER_ID` int(11) NOT NULL COMMENT 'id del usuario que creo el registro',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'sidebar_supervisor', 'web', '2022-08-10 03:46:10', '2022-08-10 03:46:10'),
(2, 'sidebar_finanzas', 'web', '2022-08-10 03:46:10', '2022-08-10 03:46:10'),
(3, 'sidebar_agente', 'web', '2022-08-10 03:46:10', '2022-08-10 03:46:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `PRO_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `PRO_NOMBRE` varchar(255) NOT NULL COMMENT 'Nombre de los proveedores de minuteria',
  `PRO_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`PRO_ID`, `PRO_NOMBRE`, `PRO_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 'Minuteria Tigo Movil', 1, '2023-01-20 14:26:42', NULL),
(2, 'Minuteria Sim Card Tigo', 1, '2023-01-20 14:26:42', NULL),
(3, 'Minuteria Celvoz Colombia', 1, '2023-01-20 14:26:42', NULL),
(4, 'Minuteria Celvoz España', 1, '2023-01-20 14:26:42', NULL),
(5, 'Minuteria Celvoz EE.UU', 1, '2023-01-20 14:26:42', NULL),
(6, 'Minueria Hello Hello EE.UU', 1, '2023-01-20 14:26:42', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_contratos`
--

CREATE TABLE `pro_contratos` (
  `PRC_ID` int(20) NOT NULL COMMENT 'llave primaria unica',
  `PRS_ID` int(20) NOT NULL COMMENT 'id del provedor con el servicio que presta',
  `PRC_PRECIO_FIJO` float DEFAULT NULL COMMENT 'precio base de un contrato, puede ser nulo',
  `PRC_CANTIDAD` int(11) DEFAULT NULL COMMENT 'cantidad de servicio prestado: 100 minutos, 20 correos, 500 mensajes',
  `PRC_FECHA_INICIO` datetime DEFAULT NULL COMMENT 'fecha de inicio del contrato',
  `PRC_FECHA_FIN` datetime DEFAULT NULL COMMENT 'fecha de fin del contrato',
  `PRC_TIPO` enum('Fijo','Recarga') NOT NULL COMMENT 'que tipo de contrato es: recarga o fijo',
  `PRC_PAGADO` enum('SI','NO') NOT NULL DEFAULT 'NO' COMMENT 'Estado del pago del contrato',
  `PRC_ESTADO` int(5) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_servicios`
--

CREATE TABLE `pro_servicios` (
  `PRS_ID` int(20) NOT NULL COMMENT 'llave primaria unica',
  `TPS_ID` int(20) NOT NULL COMMENT 'id del servicio que presta el proveedor',
  `PRO_ID` int(11) NOT NULL COMMENT 'id del proveedor',
  `PRS_PRECIO_U` double NOT NULL COMMENT 'precio unitario del servicio: 0.55 por minuto',
  `PRS_ESTADO` int(5) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puertos`
--

CREATE TABLE `puertos` (
  `PUE_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `PUE_NOMBRE` varchar(200) NOT NULL COMMENT 'Nombre del puerto',
  `ARE_ID` int(11) DEFAULT NULL COMMENT 'Llave segundaria, relacion con la tabla areas',
  `EQU_ID` int(11) DEFAULT NULL COMMENT 'Llave segundaria, relacion con la tabla equipos',
  `PUE_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = OCUPADO, 2= LIBRE, 3 = DISPONIBLE, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `puertos`
--

INSERT INTO `puertos` (`PUE_ID`, `PUE_NOMBRE`, `ARE_ID`, `EQU_ID`, `PUE_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 'PPH-H1', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(2, 'PPD-D10', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(3, 'PPD-D8', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(4, 'PPD-D7', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(5, 'PPD-D6', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(6, 'PPD-D5', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(7, 'PDD-D4', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(8, 'PDD-D3', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(9, 'PPD-D2', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(10, 'PPD-D1', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(11, 'PPC-D24', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(12, 'PPC-D23', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(13, 'PPC-D22', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(14, 'PPC-D21', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(15, 'PPK-D01', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(16, 'PPK-D02', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(17, 'PPK-D03', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(18, 'PPK-D04', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(19, 'PPK-D05', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(20, 'PPJ-D16', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(21, 'PPJ-D14', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(22, 'PPJ-D12', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(23, 'PPI-D24', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(24, 'PPI-D22', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(25, 'PPI-D20', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(26, 'PPI-D18', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(27, 'PPI-D16', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(28, 'PPI-D14', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(29, 'PPI-D12', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(30, 'PPJ-D17', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(31, 'PPJ-D15', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(32, 'PPJ-D13', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(33, 'PPJ-D11', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(34, 'PPI-D23', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(35, 'PPI-D21', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(36, 'PPI-D19', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(37, 'PPI-D19', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(38, 'PPI-D17', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(39, 'PPI-D15', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(40, 'PPI-D13', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(41, 'PPH-D3', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(42, 'PPH-D4', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(43, 'PPH-D5', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(44, 'PPH-D6', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(45, 'PPH-D7', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(46, 'PPH-D8', 1, NULL, 2, '2023-01-20 14:59:41', NULL),
(47, 'PPH-D9', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(48, 'PPH-D10', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(49, 'PPH-D11', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(50, 'PPH-D12', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(51, 'PPH-D13', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(52, 'PPH-D14', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(53, 'PPB-D5', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(54, 'PPB-D4', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(55, 'PPB-D3', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(56, 'PPB-D2', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(57, 'PPB-D1', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(58, 'PPA-D24', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(59, 'PPA-D23', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(60, 'PPA-D22', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(61, 'PPA-D21', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(62, 'PPA-D20', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(63, 'PPA-D19', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(64, 'PPA-D18', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(65, 'PPA-D17', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(66, 'PPA-D16', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(67, 'PPA-D15', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(68, 'PPA-D14', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(69, 'PPA-D13', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(70, 'PPA-D12', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(71, 'PPA-D11', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(72, 'PPA-D10', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(73, 'PPA-D9', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(74, 'PPA-D8', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(75, 'PPA-D7', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(76, 'PPA-D6', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(77, 'PPC-D17', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(78, 'PPC-D16', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(79, 'PPC-D15', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(80, 'PPC-D14', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(81, 'PPC-D13', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(82, 'PPC-D12', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(83, 'PPC-D11', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(84, 'PPC-D10', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(85, 'PPC-D9', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(86, 'PPC-D8', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(87, 'PPC-D7', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(88, 'PPC-D5', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(89, 'PPC-D4', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(90, 'PPC-D3', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(91, 'PPI-D5', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(92, 'PPI-D2', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(93, 'PPI-D1', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(94, 'PPH-D24', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(95, 'PPH-D23', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(96, 'PPH-D22', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(97, 'PPH-D21', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(98, 'PPH-D20', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(99, 'PPH-D19', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(100, 'PHH-D18', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(101, 'PPH-D17', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(102, 'PPH-D16', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(103, 'PPC-D18', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(104, 'PPC-D19', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(105, 'PPC-D20', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(106, 'PPH-D18', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(107, 'PPD-D9', 1, NULL, 1, '2023-01-20 14:59:41', NULL),
(108, 'PPE-D24', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(109, 'PPE-D23', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(110, 'PPE-D22', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(111, 'PPE-D21', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(112, 'PPJ-D19', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(113, 'PPJ-D20', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(114, 'PPJ-D21', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(115, 'PPJ-D24', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(116, 'PPJ-D23', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(117, 'PPJ-D22', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(118, 'PPE-D15', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(119, 'PPE-D16', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(120, 'PPE-D20', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(121, 'PPE-D19', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(122, 'PPE-D17', 5, NULL, 1, '2023-01-20 14:59:41', NULL),
(123, 'PPE-D18', 5, NULL, 1, '2023-01-20 14:59:41', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reds`
--

CREATE TABLE `reds` (
  `RED_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `EQU_ID` int(11) NOT NULL COMMENT 'Llave segundaria, relacion con la tabla equipos',
  `RED_NOMBRE_IP` varchar(200) NOT NULL COMMENT 'Nombre de ip',
  `RED_NOMBRE` varchar(200) NOT NULL COMMENT 'Nombre del red. Ejemplo 0.0.0.0',
  `RED_TIPO_IP` enum('Dinamic','Estatic') NOT NULL COMMENT 'Tipo de ip',
  `RED_TIPO` enum('Grupo de trabajo','Dominio') NOT NULL COMMENT 'Tipo de red',
  `RED_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'web', '2022-08-10 03:46:10', '2022-08-10 03:46:10'),
(2, 'Supervisor', 'web', '2022-08-10 03:46:10', '2022-08-10 03:46:10'),
(3, 'Contadores', 'web', '2022-08-10 03:46:10', '2022-08-10 03:46:10'),
(4, 'Agente', 'web', '2022-08-10 03:46:10', '2022-08-10 03:46:10'),
(5, 'abc', 'web', '2023-02-14 02:42:56', '2023-02-14 02:42:56'),
(6, 'abc_3', 'web', '2023-02-14 02:44:54', '2023-02-14 02:46:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 5),
(1, 6),
(2, 3),
(2, 5),
(2, 6),
(3, 4),
(3, 5),
(3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `softwares`
--

CREATE TABLE `softwares` (
  `SOF_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `SOF_NOMBRE` varchar(200) NOT NULL COMMENT 'Nombre del software',
  `SOF_VERSION` varchar(200) NOT NULL COMMENT 'Version del software',
  `SOF_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `softwares`
--

INSERT INTO `softwares` (`SOF_ID`, `SOF_NOMBRE`, `SOF_VERSION`, `SOF_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 'Windows\r\n', '10 Pro', 1, '2023-01-19 15:13:50', NULL),
(2, 'Microsip', '3.21.3', 1, '2023-01-19 15:13:50', '2023-02-10 23:57:40'),
(3, 'Office 365', '2019', 1, '2023-01-19 15:16:22', NULL),
(4, 'Google chrome', '', 1, '2023-01-19 15:16:22', NULL),
(5, 'Putty', '', 1, '2023-01-19 15:17:22', NULL),
(6, 'WinCSP', '', 1, '2023-01-19 15:17:22', NULL),
(7, 'Xampp', '', 1, '2023-01-19 15:17:55', NULL),
(8, 'Visual Studio Code', '', 1, '2023-01-19 15:17:55', NULL),
(9, 'Hosvital', '', 1, '2023-01-19 15:18:14', NULL),
(11, 'Neurocountry', '', 1, '2023-01-19 15:18:50', NULL),
(12, 'Iplan', '', 1, '2023-01-19 15:18:50', NULL),
(13, 'Office', '2016', 1, '2023-01-19 15:19:09', NULL),
(14, 'Prueba', '1', 0, '2023-02-10 18:39:29', '2023-02-10 23:56:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sof_asignados`
--

CREATE TABLE `sof_asignados` (
  `SAS_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `SOF_ID` int(11) NOT NULL COMMENT 'Llave segundaria, relacion con la tabla de software',
  `EQU_ID` int(11) NOT NULL COMMENT 'Llave segundaria, relacion con la tabla equipos',
  `SAS_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `sof_asignados`
--

INSERT INTO `sof_asignados` (`SAS_ID`, `SOF_ID`, `EQU_ID`, `SAS_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, '2023-01-19 20:09:28', NULL),
(2, 1, 2, 1, '2023-01-19 20:09:28', NULL),
(3, 2, 2, 1, '2023-01-19 20:09:28', NULL),
(4, 13, 2, 1, '2023-01-19 20:09:28', NULL),
(5, 1, 3, 1, '2023-01-19 20:09:28', NULL),
(6, 2, 3, 1, '2023-01-19 20:09:28', NULL),
(7, 13, 3, 1, '2023-01-19 20:09:28', NULL),
(8, 1, 4, 1, '2023-01-19 20:09:28', NULL),
(9, 2, 4, 1, '2023-01-19 20:09:28', NULL),
(10, 13, 4, 1, '2023-01-19 20:09:28', NULL),
(11, 1, 5, 1, '2023-01-19 20:09:28', NULL),
(12, 2, 5, 1, '2023-01-19 20:09:28', NULL),
(13, 13, 5, 1, '2023-01-19 20:09:28', NULL),
(14, 1, 6, 1, '2023-01-19 20:09:28', NULL),
(15, 2, 6, 1, '2023-01-19 20:09:28', NULL),
(16, 13, 6, 1, '2023-01-19 20:09:28', NULL),
(17, 1, 7, 1, '2023-01-19 20:09:28', NULL),
(18, 3, 7, 1, '2023-01-19 20:09:28', NULL),
(19, 4, 7, 1, '2023-01-19 20:09:28', NULL),
(20, 5, 7, 1, '2023-01-19 20:09:28', NULL),
(21, 6, 7, 1, '2023-01-19 20:09:28', NULL),
(22, 1, 1, 1, '2023-01-19 20:09:28', NULL),
(23, 3, 1, 1, '2023-01-19 20:09:28', NULL),
(24, 4, 1, 1, '2023-01-19 20:09:28', NULL),
(25, 1, 15, 1, '2023-01-19 20:09:28', NULL),
(26, 13, 15, 1, '2023-01-19 20:09:28', NULL),
(27, 4, 15, 1, '2023-01-19 20:09:28', NULL),
(28, 7, 15, 1, '2023-01-19 20:09:28', NULL),
(29, 8, 15, 1, '2023-01-19 20:09:28', NULL),
(30, 1, 16, 1, '2023-01-19 20:09:28', NULL),
(31, 13, 16, 1, '2023-01-19 20:09:28', NULL),
(32, 8, 16, 1, '2023-01-19 20:09:28', NULL),
(33, 7, 16, 1, '2023-01-19 20:09:28', NULL),
(34, 1, 17, 1, '2023-01-19 20:09:28', NULL),
(35, 13, 17, 1, '2023-01-19 20:09:28', NULL),
(36, 8, 17, 1, '2023-01-19 20:09:28', NULL),
(37, 7, 17, 1, '2023-01-19 20:09:28', NULL),
(38, 1, 18, 1, '2023-01-19 20:09:28', NULL),
(39, 13, 18, 1, '2023-01-19 20:09:28', NULL),
(40, 8, 18, 1, '2023-01-19 20:09:28', NULL),
(41, 7, 18, 1, '2023-01-19 20:09:28', NULL),
(42, 1, 9, 1, '2023-01-19 20:09:28', NULL),
(43, 2, 9, 1, '2023-01-19 20:09:28', NULL),
(44, 13, 9, 1, '2023-01-19 20:09:28', NULL),
(45, 1, 10, 1, '2023-01-19 20:09:28', NULL),
(46, 2, 10, 1, '2023-01-19 20:09:28', NULL),
(47, 13, 10, 1, '2023-01-19 20:09:28', NULL),
(48, 1, 11, 1, '2023-01-19 20:09:28', NULL),
(49, 2, 11, 1, '2023-01-19 20:09:28', NULL),
(50, 13, 11, 1, '2023-01-19 20:09:28', NULL),
(51, 1, 12, 1, '2023-01-19 20:09:28', NULL),
(52, 13, 12, 1, '2023-01-19 20:09:28', NULL),
(53, 2, 12, 1, '2023-01-19 20:09:28', NULL),
(54, 1, 13, 1, '2023-01-19 20:09:28', NULL),
(55, 13, 13, 1, '2023-01-19 20:09:28', NULL),
(56, 2, 13, 1, '2023-01-19 20:09:28', NULL),
(57, 1, 14, 1, '2023-01-19 20:09:28', NULL),
(58, 13, 14, 1, '2023-01-19 20:09:28', NULL),
(59, 2, 14, 1, '2023-01-19 20:09:28', NULL),
(60, 1, 20, 1, '2023-01-19 20:09:28', NULL),
(61, 13, 20, 1, '2023-01-19 20:09:28', NULL),
(62, 2, 20, 1, '2023-01-19 20:09:28', NULL),
(63, 1, 21, 1, '2023-01-19 20:09:28', NULL),
(64, 13, 21, 1, '2023-01-19 20:09:28', NULL),
(65, 2, 21, 1, '2023-01-19 20:09:28', NULL),
(66, 1, 22, 1, '2023-01-19 20:09:28', NULL),
(67, 13, 22, 1, '2023-01-19 20:09:28', NULL),
(68, 2, 22, 1, '2023-01-19 20:09:28', NULL),
(69, 1, 23, 1, '2023-01-19 20:09:28', NULL),
(70, 13, 23, 1, '2023-01-19 20:09:28', NULL),
(71, 2, 23, 1, '2023-01-19 20:09:28', NULL),
(72, 1, 25, 1, '2023-01-19 20:09:28', NULL),
(73, 13, 25, 1, '2023-01-19 20:09:28', NULL),
(74, 2, 25, 1, '2023-01-19 20:09:28', NULL),
(75, 1, 24, 1, '2023-01-19 20:09:28', NULL),
(76, 13, 24, 1, '2023-01-19 20:09:28', NULL),
(77, 2, 24, 1, '2023-01-19 20:09:28', NULL),
(78, 1, 26, 1, '2023-01-19 20:09:28', NULL),
(79, 2, 26, 1, '2023-01-19 20:09:28', NULL),
(80, 13, 26, 1, '2023-01-19 20:09:28', NULL),
(81, 13, 27, 1, '2023-01-19 20:09:28', NULL),
(82, 1, 27, 1, '2023-01-19 20:09:28', NULL),
(83, 2, 27, 1, '2023-01-19 20:09:28', NULL),
(84, 1, 28, 1, '2023-01-19 20:09:28', NULL),
(85, 13, 28, 1, '2023-01-19 20:09:28', NULL),
(86, 2, 28, 1, '2023-01-19 20:09:28', NULL),
(87, 1, 30, 1, '2023-01-19 20:09:28', NULL),
(88, 2, 30, 1, '2023-01-19 20:09:28', NULL),
(89, 13, 30, 1, '2023-01-19 20:09:28', NULL),
(90, 1, 31, 1, '2023-01-19 20:09:28', NULL),
(91, 13, 31, 1, '2023-01-19 20:09:28', NULL),
(92, 2, 31, 1, '2023-01-19 20:09:28', NULL),
(93, 1, 32, 1, '2023-01-19 20:09:28', NULL),
(94, 3, 32, 1, '2023-01-19 20:09:28', NULL),
(95, 1, 33, 1, '2023-01-19 20:09:28', NULL),
(96, 13, 33, 1, '2023-01-19 20:09:28', NULL),
(97, 1, 34, 1, '2023-01-19 20:09:28', NULL),
(98, 13, 34, 1, '2023-01-19 20:09:28', NULL),
(99, 2, 34, 1, '2023-01-19 20:09:29', NULL),
(100, 1, 35, 1, '2023-01-19 20:09:29', NULL),
(101, 13, 35, 1, '2023-01-19 20:09:29', NULL),
(102, 2, 35, 1, '2023-01-19 20:09:29', NULL),
(103, 1, 37, 1, '2023-01-19 20:09:29', NULL),
(104, 2, 37, 1, '2023-01-19 20:09:29', NULL),
(105, 2, 37, 1, '2023-01-19 20:09:29', NULL),
(106, 13, 37, 1, '2023-01-19 20:09:29', NULL),
(107, 1, 38, 1, '2023-01-19 20:09:29', NULL),
(108, 2, 38, 1, '2023-01-19 20:09:29', NULL),
(109, 13, 38, 1, '2023-01-19 20:09:29', NULL),
(110, 1, 39, 1, '2023-01-19 20:09:29', NULL),
(111, 2, 39, 1, '2023-01-19 20:09:29', NULL),
(112, 13, 39, 1, '2023-01-19 20:09:29', NULL),
(113, 1, 40, 1, '2023-01-19 20:09:29', NULL),
(114, 2, 40, 1, '2023-01-19 20:09:29', NULL),
(115, 13, 40, 1, '2023-01-19 20:09:29', NULL),
(116, 1, 41, 1, '2023-01-19 20:09:29', NULL),
(117, 13, 41, 1, '2023-01-19 20:09:29', NULL),
(118, 2, 41, 1, '2023-01-19 20:09:29', NULL),
(119, 1, 42, 1, '2023-01-19 20:09:29', NULL),
(120, 2, 42, 1, '2023-01-19 20:09:29', NULL),
(121, 13, 42, 1, '2023-01-19 20:09:29', NULL),
(122, 9, 76, 1, '2023-01-19 20:09:29', NULL),
(123, 2, 76, 1, '2023-01-19 20:09:29', NULL),
(124, 3, 76, 1, '2023-01-19 20:09:29', NULL),
(125, 9, 4, 1, '2023-01-19 20:09:29', NULL),
(126, 12, 4, 1, '2023-01-19 20:09:29', NULL),
(127, 9, 47, 1, '2023-01-19 20:09:29', NULL),
(128, 3, 47, 1, '2023-01-19 20:09:29', NULL),
(129, 2, 47, 1, '2023-01-19 20:09:29', NULL),
(130, 12, 47, 1, '2023-01-19 20:09:29', NULL),
(131, 9, 149, 1, '2023-01-19 20:09:29', NULL),
(132, 2, 149, 1, '2023-01-19 20:09:29', NULL),
(133, 12, 149, 1, '2023-01-19 20:09:29', NULL),
(134, 3, 149, 1, '2023-01-19 20:09:29', NULL),
(135, 2, 126, 1, '2023-01-19 20:09:29', NULL),
(136, 9, 126, 1, '2023-01-19 20:09:29', NULL),
(137, 3, 126, 1, '2023-01-19 20:09:29', NULL),
(138, 12, 126, 1, '2023-01-19 20:09:29', NULL),
(139, 9, 122, 1, '2023-01-19 20:09:29', NULL),
(140, 12, 122, 1, '2023-01-19 20:09:29', NULL),
(141, 2, 122, 1, '2023-01-19 20:09:29', NULL),
(142, 3, 122, 1, '2023-01-19 20:09:29', NULL),
(143, 9, 121, 1, '2023-01-19 20:09:29', NULL),
(144, 2, 121, 1, '2023-01-19 20:09:29', NULL),
(145, 12, 121, 1, '2023-01-19 20:09:29', NULL),
(146, 3, 121, 1, '2023-01-19 20:09:29', NULL),
(147, 2, 106, 1, '2023-01-19 20:09:29', NULL),
(148, 9, 106, 1, '2023-01-19 20:09:29', NULL),
(149, 3, 106, 1, '2023-01-19 20:09:29', NULL),
(150, 12, 106, 1, '2023-01-19 20:09:29', NULL),
(151, 12, 105, 1, '2023-01-19 20:09:29', NULL),
(152, 9, 105, 1, '2023-01-19 20:09:29', NULL),
(153, 2, 105, 1, '2023-01-19 20:09:29', NULL),
(154, 3, 105, 1, '2023-01-19 20:09:29', NULL),
(155, 2, 104, 1, '2023-01-19 20:09:29', NULL),
(156, 3, 104, 1, '2023-01-19 20:09:29', NULL),
(157, 12, 104, 1, '2023-01-19 20:09:29', NULL),
(158, 9, 104, 1, '2023-01-19 20:09:29', NULL),
(159, 2, 103, 1, '2023-01-19 20:09:29', NULL),
(160, 12, 103, 1, '2023-01-19 20:09:29', NULL),
(161, 3, 103, 1, '2023-01-19 20:09:29', NULL),
(162, 9, 103, 1, '2023-01-19 20:09:29', NULL),
(163, 2, 102, 1, '2023-01-19 20:09:29', NULL),
(164, 9, 102, 1, '2023-01-19 20:09:29', NULL),
(165, 12, 102, 1, '2023-01-19 20:09:29', NULL),
(166, 3, 102, 1, '2023-01-19 20:09:29', NULL),
(167, 2, 101, 1, '2023-01-19 20:09:29', NULL),
(168, 9, 101, 1, '2023-01-19 20:09:29', NULL),
(169, 12, 101, 1, '2023-01-19 20:09:29', NULL),
(170, 3, 101, 1, '2023-01-19 20:09:29', NULL),
(171, 9, 100, 1, '2023-01-19 20:09:29', NULL),
(172, 2, 100, 1, '2023-01-19 20:09:29', NULL),
(173, 3, 100, 1, '2023-01-19 20:09:29', NULL),
(174, 12, 100, 1, '2023-01-19 20:09:29', NULL),
(175, 2, 99, 1, '2023-01-19 20:09:29', NULL),
(176, 12, 99, 1, '2023-01-19 20:09:29', NULL),
(177, 9, 99, 1, '2023-01-19 20:09:29', NULL),
(178, 3, 99, 1, '2023-01-19 20:09:29', NULL),
(179, 12, 97, 1, '2023-01-19 20:09:29', NULL),
(180, 2, 97, 1, '2023-01-19 20:09:29', NULL),
(181, 3, 97, 1, '2023-01-19 20:09:29', NULL),
(182, 9, 97, 1, '2023-01-19 20:09:29', NULL),
(183, 2, 96, 1, '2023-01-19 20:09:29', NULL),
(184, 12, 96, 1, '2023-01-19 20:09:29', NULL),
(185, 9, 96, 1, '2023-01-19 20:09:29', NULL),
(186, 3, 96, 1, '2023-01-19 20:09:29', NULL),
(187, 2, 95, 1, '2023-01-19 20:09:29', NULL),
(188, 9, 95, 1, '2023-01-19 20:09:29', NULL),
(189, 3, 95, 1, '2023-01-19 20:09:29', NULL),
(190, 12, 95, 1, '2023-01-19 20:09:29', NULL),
(191, 9, 94, 1, '2023-01-19 20:09:29', NULL),
(192, 12, 94, 1, '2023-01-19 20:09:29', NULL),
(193, 2, 94, 1, '2023-01-19 20:09:29', NULL),
(194, 3, 94, 1, '2023-01-19 20:09:29', NULL),
(195, 2, 93, 1, '2023-01-19 20:09:29', NULL),
(196, 9, 93, 1, '2023-01-19 20:09:29', NULL),
(197, 3, 93, 1, '2023-01-19 20:09:29', NULL),
(198, 12, 93, 1, '2023-01-19 20:09:29', NULL),
(199, 2, 92, 1, '2023-01-19 20:09:29', NULL),
(200, 12, 92, 1, '2023-01-19 20:09:29', NULL),
(201, 3, 92, 1, '2023-01-19 20:09:29', NULL),
(202, 9, 92, 1, '2023-01-19 20:09:29', NULL),
(203, 2, 91, 1, '2023-01-19 20:09:29', NULL),
(204, 12, 91, 1, '2023-01-19 20:09:29', NULL),
(205, 9, 91, 1, '2023-01-19 20:09:29', NULL),
(206, 3, 91, 1, '2023-01-19 20:09:29', NULL),
(207, 2, 90, 1, '2023-01-19 20:09:29', NULL),
(208, 12, 90, 1, '2023-01-19 20:09:29', NULL),
(209, 9, 90, 1, '2023-01-19 20:09:29', NULL),
(210, 3, 90, 1, '2023-01-19 20:09:29', NULL),
(211, 2, 89, 1, '2023-01-19 20:09:29', NULL),
(212, 9, 89, 1, '2023-01-19 20:09:29', NULL),
(213, 12, 89, 1, '2023-01-19 20:09:29', NULL),
(214, 3, 89, 1, '2023-01-19 20:09:29', NULL),
(215, 2, 88, 1, '2023-01-19 20:09:29', NULL),
(216, 12, 88, 1, '2023-01-19 20:09:29', NULL),
(217, 9, 88, 1, '2023-01-19 20:09:29', NULL),
(218, 3, 88, 1, '2023-01-19 20:09:29', NULL),
(219, 2, 87, 1, '2023-01-19 20:09:29', NULL),
(220, 12, 87, 1, '2023-01-19 20:09:29', NULL),
(221, 9, 87, 1, '2023-01-19 20:09:29', NULL),
(222, 3, 87, 1, '2023-01-19 20:09:29', NULL),
(223, 2, 86, 1, '2023-01-19 20:09:29', NULL),
(224, 12, 86, 1, '2023-01-19 20:09:29', NULL),
(225, 9, 86, 1, '2023-01-19 20:09:29', NULL),
(226, 3, 86, 1, '2023-01-19 20:09:29', NULL),
(227, 2, 85, 1, '2023-01-19 20:09:29', NULL),
(228, 12, 85, 1, '2023-01-19 20:09:29', NULL),
(229, 9, 85, 1, '2023-01-19 20:09:29', NULL),
(230, 3, 85, 1, '2023-01-19 20:09:29', NULL),
(231, 2, 84, 1, '2023-01-19 20:09:29', NULL),
(232, 12, 84, 1, '2023-01-19 20:09:29', NULL),
(233, 9, 84, 1, '2023-01-19 20:09:29', NULL),
(234, 3, 84, 1, '2023-01-19 20:09:29', NULL),
(235, 2, 83, 1, '2023-01-19 20:09:29', NULL),
(236, 12, 83, 1, '2023-01-19 20:09:29', NULL),
(237, 9, 83, 1, '2023-01-19 20:09:29', NULL),
(238, 3, 83, 1, '2023-01-19 20:09:29', NULL),
(239, 2, 82, 1, '2023-01-19 20:09:29', NULL),
(240, 9, 82, 1, '2023-01-19 20:09:29', NULL),
(241, 12, 82, 1, '2023-01-19 20:09:29', NULL),
(242, 3, 82, 1, '2023-01-19 20:09:29', NULL),
(243, 2, 81, 1, '2023-01-19 20:09:29', NULL),
(244, 12, 81, 1, '2023-01-19 20:09:29', NULL),
(245, 9, 81, 1, '2023-01-19 20:09:29', NULL),
(246, 3, 81, 1, '2023-01-19 20:09:29', NULL),
(247, 2, 80, 1, '2023-01-19 20:09:29', NULL),
(248, 12, 80, 1, '2023-01-19 20:09:29', NULL),
(249, 9, 80, 1, '2023-01-19 20:09:29', NULL),
(250, 3, 80, 1, '2023-01-19 20:09:29', NULL),
(251, 2, 79, 1, '2023-01-19 20:09:29', NULL),
(252, 12, 79, 1, '2023-01-19 20:09:29', NULL),
(253, 9, 79, 1, '2023-01-19 20:09:29', NULL),
(254, 3, 79, 1, '2023-01-19 20:09:29', NULL),
(255, 2, 78, 1, '2023-01-19 20:09:29', NULL),
(256, 12, 78, 1, '2023-01-19 20:09:29', NULL),
(257, 9, 78, 1, '2023-01-19 20:09:29', NULL),
(258, 3, 78, 1, '2023-01-19 20:09:29', NULL),
(259, 12, 77, 1, '2023-01-19 20:09:29', NULL),
(260, 2, 77, 1, '2023-01-19 20:09:29', NULL),
(261, 9, 77, 1, '2023-01-19 20:09:29', NULL),
(262, 3, 77, 1, '2023-01-19 20:09:29', NULL),
(263, 12, 76, 1, '2023-01-19 20:09:29', NULL),
(264, 12, 75, 1, '2023-01-19 20:09:29', NULL),
(265, 2, 75, 1, '2023-01-19 20:09:29', NULL),
(266, 9, 75, 1, '2023-01-19 20:09:29', NULL),
(267, 3, 75, 1, '2023-01-19 20:09:29', NULL),
(268, 2, 74, 1, '2023-01-19 20:09:29', NULL),
(269, 12, 74, 1, '2023-01-19 20:09:29', NULL),
(270, 9, 74, 1, '2023-01-19 20:09:29', NULL),
(271, 3, 74, 1, '2023-01-19 20:09:29', NULL),
(272, 12, 73, 1, '2023-01-19 20:09:29', NULL),
(273, 2, 73, 1, '2023-01-19 20:09:29', NULL),
(274, 9, 73, 1, '2023-01-19 20:09:29', NULL),
(275, 3, 73, 1, '2023-01-19 20:09:29', NULL),
(276, 12, 72, 1, '2023-01-19 20:09:29', NULL),
(277, 2, 72, 1, '2023-01-19 20:09:29', NULL),
(278, 9, 72, 1, '2023-01-19 20:09:29', NULL),
(279, 3, 72, 1, '2023-01-19 20:09:29', NULL),
(280, 12, 71, 1, '2023-01-19 20:09:29', NULL),
(281, 2, 71, 1, '2023-01-19 20:09:29', NULL),
(282, 9, 71, 1, '2023-01-19 20:09:29', NULL),
(283, 3, 71, 1, '2023-01-19 20:09:29', NULL),
(284, 12, 70, 1, '2023-01-19 20:09:29', NULL),
(285, 2, 70, 1, '2023-01-19 20:09:29', NULL),
(286, 9, 70, 1, '2023-01-19 20:09:29', NULL),
(287, 3, 70, 1, '2023-01-19 20:09:29', NULL),
(288, 2, 69, 1, '2023-01-19 20:09:29', NULL),
(289, 12, 69, 1, '2023-01-19 20:09:29', NULL),
(290, 9, 69, 1, '2023-01-19 20:09:29', NULL),
(291, 3, 69, 1, '2023-01-19 20:09:29', NULL),
(292, 2, 68, 1, '2023-01-19 20:09:29', NULL),
(293, 12, 68, 1, '2023-01-19 20:09:29', NULL),
(294, 9, 68, 1, '2023-01-19 20:09:29', NULL),
(295, 3, 68, 1, '2023-01-19 20:09:29', NULL),
(296, 2, 66, 1, '2023-01-19 20:09:29', NULL),
(297, 12, 66, 1, '2023-01-19 20:09:29', NULL),
(298, 9, 66, 1, '2023-01-19 20:09:29', NULL),
(299, 3, 66, 1, '2023-01-19 20:09:29', NULL),
(300, 12, 65, 1, '2023-01-19 20:09:29', NULL),
(301, 2, 65, 1, '2023-01-19 20:09:29', NULL),
(302, 9, 65, 1, '2023-01-19 20:09:29', NULL),
(303, 3, 65, 1, '2023-01-19 20:09:29', NULL),
(304, 12, 64, 1, '2023-01-19 20:09:29', NULL),
(305, 2, 64, 1, '2023-01-19 20:09:29', NULL),
(306, 9, 64, 1, '2023-01-19 20:09:29', NULL),
(307, 3, 64, 1, '2023-01-19 20:09:29', NULL),
(308, 12, 63, 1, '2023-01-19 20:09:29', NULL),
(309, 2, 63, 1, '2023-01-19 20:09:29', NULL),
(310, 9, 63, 1, '2023-01-19 20:09:29', NULL),
(311, 3, 63, 1, '2023-01-19 20:09:29', NULL),
(312, 12, 62, 1, '2023-01-19 20:09:29', NULL),
(313, 2, 62, 1, '2023-01-19 20:09:29', NULL),
(314, 9, 62, 1, '2023-01-19 20:09:29', NULL),
(315, 3, 62, 1, '2023-01-19 20:09:29', NULL),
(316, 12, 61, 1, '2023-01-19 20:09:29', NULL),
(317, 2, 61, 1, '2023-01-19 20:09:29', NULL),
(318, 9, 61, 1, '2023-01-19 20:09:29', NULL),
(319, 3, 61, 1, '2023-01-19 20:09:29', NULL),
(320, 12, 60, 1, '2023-01-19 20:09:29', NULL),
(321, 2, 60, 1, '2023-01-19 20:09:29', NULL),
(322, 9, 60, 1, '2023-01-19 20:09:29', NULL),
(323, 3, 60, 1, '2023-01-19 20:09:29', NULL),
(324, 12, 59, 1, '2023-01-19 20:09:29', NULL),
(325, 2, 59, 1, '2023-01-19 20:09:29', NULL),
(326, 9, 59, 1, '2023-01-19 20:09:29', NULL),
(327, 3, 59, 1, '2023-01-19 20:09:29', NULL),
(328, 2, 58, 1, '2023-01-19 20:09:29', NULL),
(329, 12, 58, 1, '2023-01-19 20:09:29', NULL),
(330, 9, 58, 1, '2023-01-19 20:09:29', NULL),
(331, 3, 58, 1, '2023-01-19 20:09:29', NULL),
(332, 2, 57, 1, '2023-01-19 20:09:29', NULL),
(333, 12, 57, 1, '2023-01-19 20:09:29', NULL),
(334, 9, 57, 1, '2023-01-19 20:09:29', NULL),
(335, 3, 57, 1, '2023-01-19 20:09:29', NULL),
(336, 12, 56, 1, '2023-01-19 20:09:29', NULL),
(337, 2, 56, 1, '2023-01-19 20:09:29', NULL),
(338, 9, 56, 1, '2023-01-19 20:09:29', NULL),
(339, 3, 56, 1, '2023-01-19 20:09:29', NULL),
(340, 12, 55, 1, '2023-01-19 20:09:29', NULL),
(341, 9, 55, 1, '2023-01-19 20:09:29', NULL),
(342, 2, 55, 1, '2023-01-19 20:09:29', NULL),
(343, 3, 55, 1, '2023-01-19 20:09:29', NULL),
(344, 12, 54, 1, '2023-01-19 20:09:29', NULL),
(345, 9, 54, 1, '2023-01-19 20:09:29', NULL),
(346, 2, 54, 1, '2023-01-19 20:09:29', NULL),
(347, 3, 54, 1, '2023-01-19 20:09:29', NULL),
(348, 12, 53, 1, '2023-01-19 20:09:29', NULL),
(349, 9, 53, 1, '2023-01-19 20:09:29', NULL),
(350, 2, 53, 1, '2023-01-19 20:09:29', NULL),
(351, 3, 53, 1, '2023-01-19 20:09:29', NULL),
(352, 9, 52, 1, '2023-01-19 20:09:30', NULL),
(353, 12, 52, 1, '2023-01-19 20:09:30', NULL),
(354, 2, 52, 1, '2023-01-19 20:09:30', NULL),
(355, 3, 52, 1, '2023-01-19 20:09:30', NULL),
(356, 12, 51, 1, '2023-01-19 20:09:30', NULL),
(357, 9, 51, 1, '2023-01-19 20:09:30', NULL),
(358, 2, 51, 1, '2023-01-19 20:09:30', NULL),
(359, 3, 51, 1, '2023-01-19 20:09:30', NULL),
(360, 1, 166, 1, '2023-02-09 22:11:53', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicos`
--

CREATE TABLE `tecnicos` (
  `TEC_ID` int(11) NOT NULL,
  `EMP_ID` int(11) NOT NULL,
  `TEC_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT '	Estado en el cual se encuentra cada empleado, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tecnicos`
--

INSERT INTO `tecnicos` (`TEC_ID`, `EMP_ID`, `TEC_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 91, 1, '2023-02-15 19:55:27', '2023-02-17 20:39:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_novedades`
--

CREATE TABLE `tipos_novedades` (
  `TIN_ID` int(11) NOT NULL COMMENT 'llave primaria',
  `TIN_NOMBRE` varchar(25) NOT NULL COMMENT 'nombre de la novedad',
  `TIN_TIPO` int(11) NOT NULL COMMENT 'tipo de novedad 0 resta horas, 1 sumador de horas',
  `TIN_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'estado 0 inactivo, 1 activo',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `tipos_novedades`
--

INSERT INTO `tipos_novedades` (`TIN_ID`, `TIN_NOMBRE`, `TIN_TIPO`, `TIN_ESTADO`, `created_at`, `updated_at`) VALUES
(3, 'Descontar horas', 0, 1, '2022-10-06 15:40:30', NULL),
(4, 'Entrenamiento', 0, 1, '2022-10-06 15:40:30', NULL),
(5, 'Incapacidad', 0, 1, '2022-10-06 15:40:30', NULL),
(6, 'Licencia no remunerada', 0, 1, '2022-10-06 15:40:30', NULL),
(7, 'Licencia remunerada', 0, 1, '2022-10-06 15:40:30', NULL),
(8, 'No laboro', 0, 1, '2022-10-06 15:40:30', NULL),
(9, 'Falla eléctrica', 0, 1, '2022-10-06 15:40:30', NULL),
(10, 'Falla en el sistema', 0, 1, '2022-10-06 15:40:30', NULL),
(11, 'Hora extra', 1, 1, '2022-10-06 15:40:30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_servicios`
--

CREATE TABLE `tipos_servicios` (
  `tps_id` int(20) NOT NULL,
  `tps_nombre` varchar(200) NOT NULL,
  `tps_estado` int(5) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `tipos_servicios`
--

INSERT INTO `tipos_servicios` (`tps_id`, `tps_nombre`, `tps_estado`, `created_at`, `updated_at`) VALUES
(1, 'MINUTERIA', 1, '2023-01-27 13:43:12', NULL),
(2, 'MENSAJES DE TEXTO', 1, '2023-01-27 13:43:12', NULL),
(3, 'LINEAS DE TELEFONO', 1, '2023-01-27 13:43:12', NULL),
(4, 'CORREOS CORPORATIVO', 1, '2023-01-27 13:43:12', NULL),
(5, 'WHATSAPP', 1, '2023-01-27 13:43:12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_mantenimientos`
--

CREATE TABLE `tipo_mantenimientos` (
  `TIP_ID` int(11) NOT NULL,
  `TIP_TIPO` enum('Logico','Fisico') NOT NULL,
  `TIP_NOMBRE` varchar(200) NOT NULL,
  `TIP_DESCRIPCION` text DEFAULT NULL,
  `TIP_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado de cada una de los clientes, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_mantenimientos`
--

INSERT INTO `tipo_mantenimientos` (`TIP_ID`, `TIP_TIPO`, `TIP_NOMBRE`, `TIP_DESCRIPCION`, `TIP_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 'Logico', 'Limpiar cookies', 'Limpiar cookiess', 1, '2023-02-08 17:24:15', '2023-02-09 21:26:30'),
(2, 'Fisico', 'Limpiar cascara', 'Limpiar cascara', 1, '2023-02-08 17:24:15', NULL),
(3, 'Fisico', 'Limpiar monitor', 'Limpiar monitor', 1, '2023-02-09 15:18:46', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tip_asignados`
--

CREATE TABLE `tip_asignados` (
  `TAS_ID` int(11) NOT NULL,
  `MAN_ID` int(11) NOT NULL,
  `TIP_ID` int(11) NOT NULL,
  `TAS_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado de cada una de los clientes, Ejemplo: 1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tip_asignados`
--

INSERT INTO `tip_asignados` (`TAS_ID`, `MAN_ID`, `TIP_ID`, `TAS_ESTADO`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2023-02-09 03:06:39', '2023-02-09 03:06:39'),
(2, 1, 1, 1, '2023-02-09 03:06:39', '2023-02-09 03:06:39'),
(36, 2, 2, 1, '2023-02-15 02:57:44', '2023-02-15 02:57:44'),
(37, 2, 3, 1, '2023-02-15 02:57:44', '2023-02-15 02:57:44'),
(38, 2, 1, 1, '2023-02-15 02:57:44', '2023-02-15 02:57:44'),
(152, 3, 2, 1, '2023-02-15 21:20:22', '2023-02-15 21:20:22'),
(153, 3, 1, 1, '2023-02-15 21:20:22', '2023-02-15 21:20:22'),
(154, 1, 2, 1, '2023-02-16 01:12:28', '2023-02-16 01:12:28'),
(155, 1, 3, 1, '2023-02-16 01:12:28', '2023-02-16 01:12:28'),
(156, 1, 1, 1, '2023-02-16 01:12:28', '2023-02-16 01:12:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_negocios`
--

CREATE TABLE `unidad_negocios` (
  `UNI_ID` int(11) NOT NULL COMMENT 'Llave primaria',
  `UNI_NOMBRE` varchar(50) NOT NULL COMMENT 'Nombre de cada una de las unidades de negocio Ejemplo: Cobranzas, Saud, TI ETC..',
  `UNI_ESTADO` int(11) NOT NULL DEFAULT 1 COMMENT 'Estado de cada una de las unidades de neogicios, Ejemplo:1 = ACTIVO, 2= INACTIVO, 3 = SUSPENDIDO, 4 = RETIRADO, 0=ANULADO',
  `UNI_CODE` int(11) NOT NULL COMMENT 'Codigo de cada una de las campañas suministrada por la plataforma SIGO',
  `USER_ID` int(11) NOT NULL COMMENT 'ID del usuario que creo el registro',
  `UNI_FECHA_CREACION` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Contiene la fecha en que fue creado el registro que tiene asignado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `estado`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'JAISON NEIRA', 'Admin@gmail.com', '$2y$10$vBzunnZ8jH7/lBK3pzMlUOEzLxB9nTCvd93TvHU.tBdyCSQ2vZp5y', 0, NULL, NULL, '2022-08-10 08:44:12', '2022-12-27 22:58:17'),
(75, 'RIOS OSPINO JESUS DAVID', 'jrios@contacta.co', '$2y$10$P4d3ijxvGbNx3GO26hPByeTJitV5Pl8P8eoglx9cJmWCNRFAFl9Te', 1, NULL, NULL, '2022-09-20 02:39:26', '2022-09-20 02:39:26'),
(76, 'DIAZ MONTES SILVANA PAOLA', 'sdiaz@contacta.co', '$2y$10$Qx/LEfqydcTVRMTV6WJgdOqJ/6/KOh7it/f7IAH763uCcfhWP514m', 1, NULL, NULL, '2022-09-20 02:39:52', '2022-09-20 02:39:52'),
(77, 'GARCIA BARRIOS MARIA JOSE', 'mgarcia@contacta.co', '$2y$10$4TSTrwFHTdkjpLMnXCVFfOhr7m.4Y6FFYgKo.huZTl6dpMQ64Kgg6', 1, NULL, NULL, '2022-09-20 02:40:18', '2022-09-20 02:40:18'),
(78, 'CARLIBER MERO CHARRIS', 'cmero@contacta.co', '$2y$10$YdQxNCq51MBMgG/Dnx8lXuBAmaidQMYoX3.6Gfffo8iuxWh2lbkhS', 1, NULL, NULL, '2022-09-20 02:40:49', '2022-10-13 02:33:53'),
(79, 'DALIA MARIA PRENTH ROMERO', 'dprenth@contacta.co', '$2y$10$smXbdZborBW9nTD1O6td.eaxzP/JmxbQK1sfsNwatAcHfxYJfDKVW', 1, NULL, NULL, '2022-09-20 02:41:19', '2022-09-20 02:41:19'),
(80, 'GIAN CARLOS PEREZ QUINTERO', 'gperez@contacta.co', '$2y$10$4KB1625EJxy1GAJ.FrBFx.KQSTHSgNTNVNk.ZQHL6ZsBhfkg37olW', 1, NULL, NULL, '2022-09-20 02:41:49', '2022-09-20 02:41:49'),
(81, 'ANDREA CAROLINA BARRIOS CARBÓ', 'abarrios@contacta.co', '$2y$10$N4BcwspVEpHdK581GuxfDOzBFba.omtdWN5fWwZt872giOodPm9ki', 1, NULL, NULL, '2022-09-20 02:42:17', '2022-09-20 02:42:17'),
(82, 'Juan Pablo Borge Alban', 'cobranzas@contacta.co', '$2y$10$3CEWpJxmR6XVlcRsCzf2juVNmoa3YlMb0AqDMCbdQYLJoi6unxJXy', 1, NULL, NULL, '2022-09-20 02:42:57', '2022-09-20 02:42:57'),
(83, 'Jesus', 'Excel1@gmail.com', '$2y$10$/yRnDwt9j9seoocsauZGl.K9zPkB2vqYvTrkU8QVHufA4khCkpksq', 1, NULL, NULL, '2022-09-20 05:43:30', '2022-09-20 05:43:30'),
(84, 'Maria', 'Excel2@gmail.com', '$2y$10$r/BoIcO2DHLWWkcxp78zP.PzAy2okU7kaeOBOSKmDzIwnYrq0hT52', 1, NULL, NULL, '2022-09-20 05:43:30', '2022-09-20 05:43:30'),
(85, 'Andres', 'Excel3@gmail.com', '$2y$10$FW3nmMJ8Mnt4Wq1y4RNsguK9EgkUXO2g3tAcs8kVmo202BknFACi2', 1, NULL, NULL, '2022-09-20 05:43:30', '2022-09-20 05:43:30'),
(122, 'Ariel De Jesus Figueroa Jimenez', 'asesor33@contacta.com.co', '$2y$10$HEeHggW942M7ygfPBB3pCuQp0TcF7iSxAtf8ZOwHx4XMWF0hcz65.', 1, NULL, NULL, '2022-09-23 11:21:57', '2022-09-23 11:21:57'),
(123, 'Rony De Jesus Miranda Zambrano', 'asesor58@contacta.com.co', '$2y$10$KCVd2wDnufI4.BmFK7TlD.uD3J6JpWDKtk7nTh2l7KoxHjuFk3ksS', 1, NULL, NULL, '2022-09-23 11:21:57', '2022-09-23 11:21:57'),
(124, 'Carlos Andres Ramirez Rodriguez', 'asesor69@contacta.com.co', '$2y$10$BpvA8SOFisRcm5ZwZg9g2ezDp2ZRDZ7l9g6o5pB.iStJMd1cQnRia', 1, NULL, NULL, '2022-09-23 11:21:57', '2022-09-23 11:21:57'),
(125, 'Julieth Paola Peralta Martinez', 'asesor01@contacta.com.co', '$2y$10$MFayKFnW2xs5qqGrzMgYku.zPiK9Nw02h4CQ0azzDZ3gl4pKftlVS', 1, NULL, NULL, '2022-09-23 11:21:57', '2022-09-29 06:10:16'),
(126, 'Sandra López Lopez', 'slopez@contacta.com.co', '$2y$10$t1Z1jM4Y.e4jg6Saia.xvOkkjxf17HNsU3hW0xxy38jxBoW1hcSmW', 1, NULL, NULL, '2022-09-23 11:21:57', '2022-09-23 11:21:57'),
(127, 'Mauro Gonzalez Beltran', 'asesor75@contacta.com.co', '$2y$10$CPYYTuVUULkyIoenSSmiV.KHQtDY9wjXmbytFLdFIwdrLIt2z4jra', 1, NULL, NULL, '2022-09-23 11:21:57', '2022-09-29 06:14:12'),
(128, 'Liliana Patricia Tellez Vargas', 'ltellez@contacta.com.co', '$2y$10$BXijgcUDt.rjs0byPYFLXON8777tHp8sI60FT99yTbxBf3858PF9i', 1, NULL, NULL, '2022-09-23 11:21:57', '2022-09-23 11:21:57'),
(129, 'William Alexander De la Puente Rondón ', 'asesor66@contacta.com.co', '$2y$10$CParN9HEksUxvKl82OrTnuvh5rExVSMPgLYnp/85B3bCsW8ff1LxK', 1, NULL, NULL, '2022-09-23 11:21:58', '2022-09-23 11:21:58'),
(130, 'Lilibet Gaspar Jimenez', 'asesor29@contacta.com.co', '$2y$10$4P2gAZr7bxQ30cebsx47VemJoVAZ4SseJB8HzUNK6ZJIHuoPTeZLS', 1, NULL, NULL, '2022-09-23 11:21:58', '2022-09-23 11:21:58'),
(131, 'Valentina Isabel Arrieta Castillo', 'varrieta@contacta.com.co', '$2y$10$nbor9rW3r0klh5jtjTRpCeTjqagWmdc8x9Sj1gSWjHo1xBBuG2VLO', 1, NULL, NULL, '2022-09-23 11:21:58', '2022-09-23 11:21:58'),
(132, 'Helen Elena Ospino Llanes', 'asesor53@contacta.com.co', '$2y$10$xRpFwFR7iAB5c2v6os7m1ui1U.pu4AFMHx7wmoDMGJoT6WBHY7wQO', 1, NULL, NULL, '2022-09-23 11:21:58', '2022-09-24 06:55:06'),
(133, 'Cristian Rodriguez', 'asesor41@contacta.com.co', '$2y$10$90SJCrdgjioPE2UlaczbruFYrzT51mMjRBaFzum3rbDnkOdk832p.', 1, NULL, NULL, '2022-09-23 11:21:58', '2022-09-23 11:21:58'),
(134, 'Karla Andrea Zapata Moreno', 'asesor31@contacta.com.co', '$2y$10$3twI09rGMF7txjTzwTj/Zu73Xi4Je6ExCh5Fa8fZ0uZ16OEzCRwIq', 1, NULL, NULL, '2022-09-23 11:21:58', '2022-09-23 11:21:58'),
(135, 'Lila Maria Marmol Mendoza', 'asesor67@contacta.com.co', '$2y$10$G0jTFJ1dZCjnkoaXXGLOGesdTkNIG46naf59ieNATUMnNLdIyDuKi', 1, NULL, NULL, '2022-09-23 11:21:58', '2022-09-23 11:21:58'),
(136, 'Maria Alejandra Hernandez Lara', 'asesor43@contacta.com.co', '$2y$10$EwYtGHGPAOT8OQPTI1UDWOxwYHAh6Bd0cDb75cNPFEHaZ3S88YDOC', 1, NULL, NULL, '2022-09-23 11:21:58', '2022-09-23 11:21:58'),
(137, 'Pamela Andrea Romero Velilla', 'asesor38@contacta.com.co', '$2y$10$BVtbDV.h9OE7meObEW1tdOYMtqG6xHOptotTIOkrzgzEaH5fLdRf6', 1, NULL, NULL, '2022-09-23 11:21:59', '2022-12-01 23:03:22'),
(138, 'Juan Camilo Aduen Tovar', 'asesor80@contacta.com.co', '$2y$10$fQ7z/Ou9.8DlpgJshvTsbutEGFb45z0677Kwt/avkHvWzNxEp3Lqe', 1, NULL, NULL, '2022-09-23 11:21:59', '2022-09-23 11:21:59'),
(139, 'Yeimer Rafael Vizcaino Carrillo', 'asesor81@contacta.com.co', '$2y$10$d5rci4rfTdx802qX6ddQV.g01Uc3DkNjI.hXgX59xU5j2BSRy/zk6', 1, NULL, NULL, '2022-09-23 11:21:59', '2022-09-23 11:21:59'),
(140, 'Oriana Fabiola Gonzalez Guerra', 'Agentecfc01@contacta.com.co', '$2y$10$qHEOH74fOGWLaZE7bp9TUOMv2X9l0IF9tknERPjKEi.OrEAtQWrWa', 1, NULL, NULL, '2022-09-23 11:21:59', '2022-09-23 11:21:59'),
(141, 'Hefziba Yaneth Rojas Ruiz', 'asesor40@contacta.com.co', '$2y$10$WtrhNuhyBhgT1Q0mjfe6Buaotfi/BR6OUU3WxhvyFzv9tsc2OFeaK', 1, NULL, NULL, '2022-09-23 11:21:59', '2022-09-23 11:21:59'),
(142, 'Carlos Alberto Herazo Torres', 'carlos@mimalla.com.co', '$2y$10$dOvTjYZtSJ0LMcBTGMdUUez0xLxuaOQ.0WDVDtX7IfzRUa/0D84SW', 1, NULL, NULL, '2022-09-23 11:21:59', '2022-09-23 11:21:59'),
(143, 'Yinna Marcela Hernández Osorio ', 'asesor68@contacta.com.co', '$2y$10$kQPwdXTc1Kq7WVsxbmQ0XulNiQ/mFMDhxxJHyGFrBXQIA04PchwB.', 1, NULL, NULL, '2022-09-23 11:21:59', '2022-09-23 11:21:59'),
(144, 'Maylen Patricia Peralta Martinez', 'asesor78@contacta.com.co', '$2y$10$ND1LMf7sXK/3/zGQrG4tk.dFug4x4fNhgsL9lzzEdLJAoBCfw7/Wq', 1, NULL, NULL, '2022-09-23 11:21:59', '2022-09-23 11:21:59'),
(145, 'Sara Johana Peñaranda Arvelaez', 'asesor70@contacta.com.co', '$2y$10$ikCqzEkTdlsglFwJ46gce./XQ.l8QvjfsBeOSBh5o9bEJZ471w2Yu', 1, NULL, NULL, '2022-09-23 11:22:00', '2022-09-23 11:22:00'),
(146, 'Merlys Patricia Mejia Baltar', 'mmejia@contacta.com.co', '$2y$10$rIyLRVfwGzQziwWufDuTsuf0iGPlq06Y8ssaUdb5MIfiCZB2TcU6G', 1, NULL, NULL, '2022-09-23 11:22:00', '2022-09-23 11:22:00'),
(147, 'Alexandra Patricia Escalante De La Hoz', 'asesor79@contacta.com.co', '$2y$10$47dEooh3ZVbWMTxWfyuX5.ecdIts38T.TGyB0O42gpF8LYrQcipwC', 1, NULL, NULL, '2022-09-23 11:22:00', '2022-09-23 11:22:00'),
(148, 'Denis Del Carmen Ensuncho Tovar', 'asesor77@contacta.com.co', '$2y$10$0HoOoxfAOLXwrrewteP1lOo9KEmZ6qevwXUydr7m47tEjkc4vRt6m', 1, NULL, NULL, '2022-09-23 11:22:00', '2022-09-23 11:22:00'),
(149, 'DARIO JIMENEZ', 'agenteamavita1@contacta.com.co', '$2y$10$Ui.SBhLduQNTj2NP3CkUYujS5Chh3gd/zR2bTKgxB2IwPHBmoYmB.', 1, NULL, NULL, '2022-09-23 11:22:00', '2022-09-23 11:22:00'),
(150, 'KALEB OLMOS', 'agenteamavita2@contacta.com.co', '$2y$10$CfwSRWwGg7RBhV/VVjD85eEAvzGmfmap9WslUlItg9jZRkCIswnkq', 1, NULL, NULL, '2022-09-23 11:22:00', '2022-09-23 11:22:00'),
(151, 'CHRISTOPHER MUÑOZ', 'agenteamavita3@contacta.com.co', '$2y$10$b2iB1Q.6dSsEkPOl.uNO7e1tnJ/2rjBGSLY1LOi/1GU7KivNHCwiG', 1, NULL, NULL, '2022-09-23 11:22:00', '2022-09-23 11:22:00'),
(152, 'MARIANELLA SABBAGH', 'agenteamavita6@contacta.com.co', '$2y$10$Cp089x/TdE6S9wU7xJx/OeLyDHlDplCYTb5isaQLP31Jgc4QWBGZO', 1, NULL, NULL, '2022-09-23 11:22:00', '2022-09-23 11:22:00'),
(153, 'ALEJANDRO HERNANDEZ', 'agenteamavita4@contacta.com.co', '$2y$10$EmvpkG1jYAR.UaWpQZpToOpBC.BGS5VTI99yH3c9wFRQg9lT63XgW', 1, NULL, NULL, '2022-09-23 11:22:01', '2022-09-23 11:22:01'),
(154, 'DANIEL ESCOBAR', 'agenteamavita5@contacta.com.co', '$2y$10$z0bFLb3UzO6OpBL3IMquyOqjKKL6qqB8uKlqt7d/ltBQQvFxFm48a', 1, NULL, NULL, '2022-09-23 11:22:01', '2022-09-23 11:22:01'),
(155, 'CARLOS GUZMAN', 'agenteperfectcare02@contacta.com.co', '$2y$10$WKBWfxayMqcWpMIMEQ45POxrARvAYgPH6f3r0vIdYmlQIJrPH9Z8K', 1, NULL, NULL, '2022-09-23 11:22:01', '2022-09-23 11:22:01'),
(156, 'KENIA RUA', 'agenteperfectcare03@contacta.com.co', '$2y$10$z6OOoMAfVLJCKJHufsFzbOc3DSEM9AQihuBf4YJmk4fAg6xxinzuu', 1, NULL, NULL, '2022-09-23 11:22:01', '2022-09-23 11:22:01'),
(157, 'SEBASTIAN VARGAS', 'agenteperfectcare04@contacta.com.co', '$2y$10$9/rBiE7QcxcsQJJ9zckTr.NHlnzeUK4Hef7OV/RaYxWfOIe7CcLqe', 1, NULL, NULL, '2022-09-23 11:22:01', '2022-09-23 11:22:01'),
(158, 'CRISTIAN CAMACHO', 'agenteperfectcare01@contacta.com.co', '$2y$10$Na5Vgiu9vaTezlGx0XMviesU5iFRNLHTekwrb.5zA6oEJWDjyIfmC', 1, NULL, NULL, '2022-09-23 11:22:01', '2022-09-23 11:22:01'),
(159, 'MAIRON SARABIA', 'agenteirc05@contacta.com.co', '$2y$10$INACvk6A9fLp2mzGae8Kl.VmD3qYK2NhL9wsRII2yHIA9X0a/itOW', 1, NULL, NULL, '2022-09-23 11:22:01', '2022-09-23 11:22:01'),
(160, 'CINDY MORENO', 'agenteirc01@contacta.com co ', '$2y$10$lX4uoW6jpqmU1nM80igMAOpa7D/krEAxX7LPsjUH2TymVj4HzKzWO', 1, NULL, NULL, '2022-09-23 11:22:01', '2022-09-23 11:22:01'),
(161, 'WENDY QUIROZ ', 'agenteirc02@contacta.com.co', '$2y$10$Vkm/28t2YTqs0BReELoDiO1xsWC6RRNDtNjPESEl3PFGEppQUvmYy', 1, NULL, NULL, '2022-09-23 11:22:02', '2022-09-23 11:22:02'),
(162, 'LORAINE ARRIETA', 'agenteirc03@contacta.com.co', '$2y$10$RbsNhhICWrEZvqvBJ3RDUuAxtCxnUpCkiVWaWIXfCeD/BIXqeCm5S', 1, NULL, NULL, '2022-09-23 11:22:02', '2022-09-23 11:22:02'),
(163, 'ERIKA ELIAS', 'agenteirc04@contacta.com.co', '$2y$10$.7yglZewy1J3e7k8T/FAWeDjjcel48wXFrnzxtduvRCZZG25VKLGa', 1, NULL, NULL, '2022-09-23 11:22:02', '2022-09-23 11:22:02'),
(164, 'SHANET GUERRERO', 'agenteirc10@contacta.com.co', '$2y$10$yt6Z7bEzlv03vn8SfU6tEOTPJX2pbGv/z45fiWcbhnqkBCdPcVfSO', 1, NULL, NULL, '2022-09-23 11:22:02', '2022-09-23 11:22:02'),
(165, 'MAIRA BENITEZ', 'agenteirc08@contacta.com.co', '$2y$10$alUFkuJQJTe2Gs3rPsLOMeVj72mysOWmpQqWZBbIh4FTQVdJop8AO', 1, NULL, NULL, '2022-09-23 11:22:02', '2022-09-23 11:22:02'),
(166, 'STEFANY SUAREZ', 'agenteirc06@contacta.com.co', '$2y$10$H5/W4yG00ysRTW.ZYv6LZu/NfoUKiLpL56lMow11CLCdtn5G.UGuK', 1, NULL, NULL, '2022-09-23 11:22:02', '2022-09-23 11:22:02'),
(167, 'ANDREA DE LA HOZ', 'agenteirc09@contacta.com.co', '$2y$10$HrYCi3hze2VLstGnqk/IRemaFvyo/C3unjQFwWv9oBZCzhQr2YRB2', 1, NULL, NULL, '2022-09-23 11:22:02', '2022-09-23 11:22:02'),
(168, 'YORCELIS MEJIA ', 'agenteirc07@contacta.com.co', '$2y$10$StSWV6eqaFYahYFKz5R1KOCNXqDyc6DppSyz43m06eDh3A43BId/q', 1, NULL, NULL, '2022-09-23 11:22:02', '2022-09-23 11:22:02'),
(169, 'FERRER GARRIDO ANDREA CAROLINA ', 'andreaferrer@clinicageneraldelnorte.com', '$2y$10$BAWLGL3TmFFar5J52dLf.eCxvEizky5wzfZyqpffNhiKVBm8MZzh.', 1, NULL, NULL, '2022-09-23 11:22:03', '2022-09-23 11:22:03'),
(170, 'ACUÑA SILVERA LIZ KATERINE ', 'lizacuna@clinicageneraldelnorte.com', '$2y$10$hy2/qA2miEX5rvwszK5vieRtJ.rwHIZr474gKZMPF1DJl4to3KNVC', 1, NULL, NULL, '2022-09-23 11:22:03', '2022-09-23 11:22:03'),
(171, 'ARRIETA CAMARGO KELAIA ROSA', 'kelaiaarrieta@clinicageneraldelnorte.com', '$2y$10$fpeS3CRkQPPD7Ihi850yteurrAY1ngYXD6STnjUV59n4BZtxvFOJi', 1, NULL, NULL, '2022-09-23 11:22:03', '2022-09-23 11:22:03'),
(172, 'BORJA OJEDA JENNIFER MILAGROS', 'jenniferborja@clinicageneraldelnorte.com', '$2y$10$8Pq8GjClA/9Yex/akHMx5u65JjzKG/PeUzvio485.TPyp278gn67u', 1, NULL, NULL, '2022-09-23 11:22:03', '2022-09-23 11:22:03'),
(173, 'CABARCAS GUTIERREZ LUCELYS DANIELA', 'lucelyscabarcas@clinicageneraldelnorte.com', '$2y$10$CTF5fdE6M797SWKOOdUpouQFfgfxYeu7pNWyl9JZa5keT40O3Af0a', 1, NULL, NULL, '2022-09-23 11:22:03', '2022-09-23 11:22:03'),
(174, 'CARDENAS POSADA VALERY DEL CARMEN', 'valerycardenas@clinicageneraldelnorte.com', '$2y$10$UAJdW.dD4i.jp0SjiSsKk.N6T.NCMMcWsgDscqQOLXsKJwZ2guOcy', 1, NULL, NULL, '2022-09-23 11:22:03', '2022-09-23 11:22:03'),
(175, 'CASTRO ALVAREZ  ALEXANDER DE JESUS', 'alexandercastro@clinicageneraldelnorte.com', '$2y$10$f5PXYMRxxBykGEwaiKlIcuY4Fw7.FueBdxPoHsyCTR4sbjoJkg1Gu', 1, NULL, NULL, '2022-09-23 11:22:03', '2022-09-23 11:22:03'),
(176, 'CHAVARRO GAVALO YULIANIS PAOLA', 'yulianischavarro@clinicageneraldelnorte.com', '$2y$10$Q6s8Van/yFZrSRx4TfWvCO/SdmaYj.e6ZbCZinQzSqYDCeXAl1vPK', 1, NULL, NULL, '2022-09-23 11:22:03', '2022-09-23 11:22:03'),
(177, 'CORREA SEPULVEDA JAIRO ANDRES', 'jairocorrea@clinicageneraldelnorte.com', '$2y$10$zp.rFBfgoV90TFBv4w8ajO8Iami0myLu5S04EIWglha8xoR0jmg/W', 1, NULL, NULL, '2022-09-23 11:22:04', '2022-09-23 11:22:04'),
(178, 'COVELLI ALVAREZ GIANELLA VANESSA', 'gianellacoveli@clinicageneraldelnorte.com', '$2y$10$UAp.EHuTHLVW26pApCqITesZMkvW1N/1whI4XHxIl3d6G8q9OGaOS', 1, NULL, NULL, '2022-09-23 11:22:04', '2022-09-23 11:22:04'),
(179, 'DIAZ PERALTA LAURA ALEXANDRA', 'lauradiaz@clinicageneraldelnorte.com', '$2y$10$zN8fPEG8YG/jV8Z9EdmJxerRLLRwKj1bagAexb.BFYWZFqiiacWB2', 1, NULL, NULL, '2022-09-23 11:22:04', '2022-09-23 11:22:04'),
(180, 'FLORIAN MARTINEZ WENDY  JOHANA', 'wendyflorian@clinicageneraldelnorte.com', '$2y$10$fSRV7NjoYsCk8RfAVKieDuNYF5iiHWHWgic0Ml7ZyIoEueWAeqM8m', 1, NULL, NULL, '2022-09-23 11:22:04', '2022-09-23 11:22:04'),
(181, 'MARQUEZ PEÑA KATHERIN ROXANA', 'apoyo8@clinicageneraldelnorte.com', '$2y$10$TE76z2pA9Bk1L5pY2JA1RezAWMnJNZZwh1yYLDG3adzP3INHIkb0.', 1, NULL, NULL, '2022-09-23 11:22:04', '2022-09-23 11:22:04'),
(182, 'MEDINA MEDINA LICETH MARINA ', 'lisethmmedina@clinicageneraldelnorte.com', '$2y$10$TEEHUi6ZM5OAi3/wLaB8SOrf0DCc2sPBxmBIOullGWHZ9aF9KIEA2', 1, NULL, NULL, '2022-09-23 11:22:04', '2022-09-23 11:22:04'),
(183, 'MONTOYA OCAMPO YULY CRISTINA', 'yulymontoya@clinicageneraldelnorte.com', '$2y$10$Z8TLGs55C.G/NaS7175Q7uvfKdhsyz07.BROa7tXQuSLKiHLGU8g6', 1, NULL, NULL, '2022-09-23 11:22:04', '2022-09-23 11:22:04'),
(184, 'MORALES GOMEZ ANYULIS JULIETH', 'anyulismorales@clinicageneraldelnorte.com', '$2y$10$s73T2JMh5owTWQrI48iQxuoq3l4PVP6YL3v/tGyKiWm4jqJ2oahUu', 1, NULL, NULL, '2022-09-23 11:22:05', '2022-09-23 11:22:05'),
(185, 'NUÑEZ GUZMAN SINDY PAOLA', 'apoyo11@clinicageneraldelnorte.com', '$2y$10$7Ghx/pFkS6JinX0z65EL1e19ztPk2z.nQ53SwUjniRjimw2UGrPue', 1, NULL, NULL, '2022-09-23 11:22:05', '2022-09-23 11:22:05'),
(186, 'OCAMPO CARMONA BETSY LILIANA', 'betsyocampo@clinicageneraldelnorte.com', '$2y$10$qo6fQhRp1XUg7xI4CXBab.XEgULpRq6eBYXZhC.R325Ub7QDdLJHS', 1, NULL, NULL, '2022-09-23 11:22:05', '2022-09-23 11:22:05'),
(187, 'PEREZ NAVARRO LINNEKER', 'linnekerperez@clinicageneraldelnorte.com', '$2y$10$NLuJyauY2vDY.cV2B3tZkuOhPYa/3bnQi2fBDzZJjzBsOaqZQ/bgy', 1, NULL, NULL, '2022-09-23 11:22:05', '2022-09-23 11:22:05'),
(188, 'RAMOS MONTES YANINE YULIETH', 'yanineramos@clinicageneraldelnorte.com', '$2y$10$Pdia5gL1RllwDWS4ECHEGecQLw8GZ9oYxuTrUPdk3fMPKXnhp1pNC', 1, NULL, NULL, '2022-09-23 11:22:05', '2022-09-23 11:22:05'),
(189, 'RIQUETT FONTALVO MARIA BELEN', 'apoyo10@clinicageneraldelnorte.com', '$2y$10$wlJ3M1s3DBOLy7Vmtrxj0e.mvWEDU5WNG32tIuxgFFj9hGXO4dJVG', 1, NULL, NULL, '2022-09-23 11:22:05', '2022-09-23 11:22:05'),
(190, 'SANTOS DE FREITAS JOAQUIN ALEJANDRO', 'joaquinsantos@clinicageneraldelnorte.com', '$2y$10$A1HQNFbMvDZtqTmcIsOXK.TqYPdCiXbm/LGRQ7aHPCn2Wvb5ohHbq', 1, NULL, NULL, '2022-09-23 11:22:05', '2022-09-23 11:22:05'),
(191, 'SOTO SANJUAN SARA ESTHER', 'sarasoto@clinicageneraldelnorte.com', '$2y$10$hUzyIczBGpiGHo4ENMUsFOt8fUJPDSg2.b3yqdBpyME6iXbBkN59K', 1, NULL, NULL, '2022-09-23 11:22:05', '2022-09-23 11:22:05'),
(192, 'MENDOZA LOPEZ KARLET DAYANA', 'dayanamendoza@clinicageneraldelnorte.com', '$2y$10$ohLmivQiV18p7HVbGxdBheGtWNfyg47yXxuxA/W5/jCEvuPy8FYMO', 1, NULL, NULL, '2022-09-23 11:22:06', '2022-09-23 11:22:06'),
(193, 'PORRAS CASTILLO GRISELDA PATRICIA', 'griseldaporras@clinicageneraldelnorte.com', '$2y$10$1UqsXmPPQXqeeGPIJ7F3mu/UOEotMzXViwjUGLAF057g.nfFWLt0i', 1, NULL, NULL, '2022-09-23 11:22:06', '2022-09-23 11:22:06'),
(194, 'SALOM ESCOBAR LUDDY DEL CARMEN', 'luddysalom@clinicageneraldelnorte.com', '$2y$10$Hzb1vSMpF/c6n/SzN42krunqRPYRD6fhV41FLOEn3TD3ubdwHg50W', 1, NULL, NULL, '2022-09-23 11:22:06', '2022-09-23 11:22:06'),
(195, 'ACOSTA CONSUEGRA JAIR RAFAEL', 'jairacosta@clinicageneraldelnorte.com', '$2y$10$bzUJP0yv4tayRBLmj8Bupech2CLkUAdiDL7wj1MnIxdfIiwHk.bNy', 1, NULL, NULL, '2022-09-23 11:22:06', '2022-09-23 11:22:06'),
(196, 'AYALA MEZA JHEIRANN JOSEPH', 'jheirannayala@clinicageneraldelnorte.com', '$2y$10$azBF3C9WgtKOe9lC1bDN9.7k0HsnVUCt8FSreRYGy6kwfYZpjDXdW', 1, NULL, NULL, '2022-09-23 11:22:06', '2022-09-23 11:22:06'),
(197, 'CONDE ZULUAGA CLAUDIA PATRICIA', 'claudiaconde@clinicageneraldelnorte.com', '$2y$10$WrLBnb5wvRy8Fr4KxQ/YKuPpghzu3nGgce5JS5h8ldqiG6A4whSNO', 1, NULL, NULL, '2022-09-23 11:22:06', '2022-09-23 11:22:06'),
(198, 'GARCIA BOLIVAR MIRIANIS', 'mirianisgarcia@clinicageneraldelnorte.com', '$2y$10$8yICQ5RZ5AzG/XekVrPk8.2tP/LGxqRvrq5cEAXILZM1f499OMjmG', 1, NULL, NULL, '2022-09-23 11:22:06', '2022-09-23 11:22:06'),
(199, 'HERNANDEZ PEÑA ALANIS ANAIS', 'apoyo6@clinicageneraldelnorte.com', '$2y$10$RSAGLaQR8j3fm2nZPxMGTuNr00r8.XpcuBpGG19XxTKzhHwvA4UmG', 1, NULL, NULL, '2022-09-23 11:22:06', '2022-09-23 11:22:06'),
(200, 'MOLINA DIN SHARON DANIELA', 'sharonmolina@clinicageneraldelnorte.com', '$2y$10$9KRZYsrH74rq/IAsbEaqZemc0B5qO7OawlGya6jIfHI22/jqojT/y', 1, NULL, NULL, '2022-09-23 11:22:07', '2022-09-23 11:22:07'),
(201, 'NAVARRO OSPINO NASLY INES', 'naslynavarro@clinicageneraldelnorte.com', '$2y$10$GqyhXLlIXEqaKqhW7i3DA.a21QfnlpbA15g5n1XCL55xBVIWUnsnC', 1, NULL, NULL, '2022-09-23 11:22:07', '2022-09-23 11:22:07'),
(202, 'PALENCIA BARRIENTOS YINA PAOLA', 'yinapalencia@clinicageneraldelnorte.com', '$2y$10$RBuV5qekSt4ATaqJmZpSUucnah/g9kw3u/GUJ2tHBKLcKCahttH4W', 1, NULL, NULL, '2022-09-23 11:22:07', '2022-09-23 11:22:07'),
(203, 'RAMIREZ PAJARO GINA PAOLA', 'ginaramirez@clinicageneraldelnorte.com', '$2y$10$uXU5cmzoUk2KtPQuKfuRBuDAkrZL5kMpxjYHZVrx4YuyniQ./JXre', 1, NULL, NULL, '2022-09-23 11:22:07', '2022-09-23 11:22:07'),
(204, 'ROMERO CANTILLO JANE MICHEL', 'janeromero@clinicageneraldelnorte.com', '$2y$10$tnHJeMPZ3TN6H5TJWeS7s.wTFRgeEAcXER2qt4OxcR75/GzTTCGbi', 1, NULL, NULL, '2022-09-23 11:22:07', '2022-09-23 11:22:07'),
(205, 'VELEZ GRISALES VIANEY EGLET', 'vianeyvelez@clinicageneraldelnorte.com', '$2y$10$5qHVhFGAgoSHSCSLeMkecu5Vg01VbGHAoR1eDu76D4nOc.GrghAaO', 1, NULL, NULL, '2022-09-23 11:22:07', '2022-09-23 11:22:07'),
(206, 'ALGARIN CATAÑO LUZ ELENA', 'luzalgarin@clinicageneraldelnorte.com', '$2y$10$YFNQf/e6UmUVrG.tLKIQQ.YrqaIoUAM3jwt3hvn6AXsh9F.1z9JmS', 1, NULL, NULL, '2022-09-23 11:22:07', '2022-09-23 11:22:07'),
(207, 'BARRIOS PEREZ GERMAN ALESKI', 'germanbarrios@clinicageneraldelnorte.com', '$2y$10$7fkKmhzuWO5c.SdWf/GtQeiRbYU.0mBxT8Vn5N5bXJ9Wd0Nc9utqe', 1, NULL, NULL, '2022-09-23 11:22:07', '2022-09-23 11:22:07'),
(208, 'BELEÑO VERTEL SARAI VANESSA', 'saraibeleno@clinicageneraldelnorte.com', '$2y$10$7CFvwKf44Bc.amkpi5I/tOG8cFIKQduBjTAGQ7h647RvCejTmt3su', 1, NULL, NULL, '2022-09-23 11:22:08', '2022-09-23 11:22:08'),
(209, 'CARDENAS ARANGO JHON JAIVER', 'jhoncardenas@clinicageneraldelnorte.com', '$2y$10$Y9.Zd0jNkK8qWYxkGawU8eCsnAJQbGfgVBL.NHhY73UTmXcSYgNq.', 1, NULL, NULL, '2022-09-23 11:22:08', '2022-09-23 11:22:08'),
(210, 'CASTRO MUÑOZ KELLYS JHOJANA', 'KellyCastro@clinicageneraldelnorte.com', '$2y$10$TLzjpjK7jdfysN9L60LULOPuiBSFuNu75z.ENn3HY6/788ip9Inuq', 1, NULL, NULL, '2022-09-23 11:22:08', '2022-09-23 11:22:08'),
(211, 'GARCES VILLA DARCY MELISSA', 'darcygarces@clinicageneraldelnorte.com', '$2y$10$VQu/7Wr8ysXg2Jw1GAXaEOaGIWBMbGRKP2zStqgw8GRXrcog0yrMe', 1, NULL, NULL, '2022-09-23 11:22:08', '2022-09-23 11:22:08'),
(212, 'HERRERA PEREZ YUCELIS ESTHER', 'yucelisherrera@clinicageneraldelnorte.co', '$2y$10$wHQ1YPg8ghkYPZRfyt4rYeL.hEeW2akiMrtbJYcffYGzJ/8h0k3NW', 1, NULL, NULL, '2022-09-23 11:22:08', '2022-09-23 11:22:08'),
(213, 'LARA HEREDIA LOREDIANA LORENA', 'loredianalara@clinicageneraldelnorte.com', '$2y$10$u4eD.eoCqTBGygfsXK8Zoe3lckeatXE5BM7qnnEn/uS6CsGdGo0iO', 1, NULL, NULL, '2022-09-23 11:22:08', '2022-09-23 11:22:08'),
(214, 'MERCADO SCHMALBACH KAREN MARGARITA', 'karenmercado@clinicageneraldelnorte.com', '$2y$10$M5rVZHX7D1Ym74LC6OLinOCaaxU196Dd5rwNVhYW330WkcsjSmHYK', 1, NULL, NULL, '2022-09-23 11:22:08', '2022-09-23 11:22:08'),
(215, 'NORIEGA MONTENEGRO MADELEINE', 'madeleinenoriega@clinicageneraldelnorte.com', '$2y$10$xOFoh.MVYhyi7nU5i6F6QOR4LB3YhtG5dURvER2qh9BtI4K7etM6.', 1, NULL, NULL, '2022-09-23 11:22:08', '2022-09-23 11:22:08'),
(216, 'OROZCO DIAZ KEIDY YOJANA', 'keidydias@clinicageneraldelnorte.com', '$2y$10$9GW2coC8BXJUw2HTW/DrjOtMgLNMKyNjol9jaSdYaMxhILpr3Jjye', 1, NULL, NULL, '2022-09-23 11:22:09', '2022-09-23 11:22:09'),
(217, 'OROZCO PADILLA KELLY JOHANA', 'kellyorozco@clinicageneraldelnorte.com', '$2y$10$Y8S3Kupz9yrSwpHlKsMA7OoBb/UGEaI3HQc9fkpx4Tmf2sMF2jqOC', 1, NULL, NULL, '2022-09-23 11:22:09', '2022-09-23 11:22:09'),
(218, 'PADILLA BUSTOS JOSTEIN ESTEBAN', 'josteinpadilla@clinicageneraldelnorte.com', '$2y$10$PdW2h3Bi5Ywt2tvffVHy/OVzpvNw0NfJ4vLoRbL1iN0gu7i0Pdd46', 1, NULL, NULL, '2022-09-23 11:22:09', '2022-09-23 11:22:09'),
(219, 'PADILLA PEREZ ANGIE PAOLA', 'angiepadilla@clinicageneraldelnorte.com', '$2y$10$VUQkyviOGreSm1arWsEdfeu.5whU.ua/Ei4I2GcKSta0qJ6ysIboq', 1, NULL, NULL, '2022-09-23 11:22:09', '2022-09-23 11:22:09'),
(220, 'TORRENEGRA MARTINEZ MALLERLI', 'apoyo7@clinicageneraldelnorte.com', '$2y$10$dNEHmWVsFGYzMJzAQNTwne.Ejk2RsIixLVsw1iy7xDSDbu9kTGbeW', 1, NULL, NULL, '2022-09-23 11:22:09', '2022-09-23 11:22:09'),
(221, 'TORRES ESCORCIA SHEILA PAOLA', 'sheilatorres@clinicageneraldelnorte.com', '$2y$10$j.7Ep6geL2Dd5FMcGmD/v.mvdlf823.QGx0GJ1vS1xcZGD3obRwru', 1, NULL, NULL, '2022-09-23 11:22:09', '2022-09-23 11:22:09'),
(222, 'NEGRETE BARROSO NAYOVIS', 'nayovisnegrete@clinicageneraldelnorte.com', '$2y$10$uPNI6Xi9f0dLRVtAek1ta.bpqXuDsN.oj/Vrlipnzy.VmQ9UAgZFK', 1, NULL, NULL, '2022-09-23 11:22:09', '2022-09-23 11:22:09'),
(223, 'PARRA RODRIGUEZ KIMBERLIN CHIQUINQUIRA', 'kimberlyparra@clinicageneraldelnorte.com', '$2y$10$lkvb8fHifzVWipYoFliFgexhM7Kr75UCGSJDoy4aLe/SQQ3hVqR4i', 1, NULL, NULL, '2022-09-23 11:22:09', '2022-09-23 11:22:09'),
(224, 'SALCEDO SANDOVAL LINA MARIA', 'linasalcedo@clinicageneraldelnorte.com', '$2y$10$LsSNhuSToh2NYnWaFGvkDeb2r5.jFfpHfrxhErf5TMzzxTYTBFphy', 1, NULL, NULL, '2022-09-23 11:22:10', '2022-09-23 11:22:10'),
(225, 'RODRIGUEZ DE LA CRUZ KAREN LORENA ', 'karenrodriguez@clinicageneraldelnorte.com', '$2y$10$3yDpbpN.uwINVPxdYjWXJebQiHB307Ao6NzDV7L66T23dSoArJ.3G', 1, NULL, NULL, '2022-09-23 11:22:10', '2022-09-23 11:22:10'),
(226, 'SOLIS DE ZAPATA YANETH DEL SOCORRO', 'yanethsolis@clinicageneraldelnorte.com', '$2y$10$ypNE5EFpskTypxKpm6ogaOUyt8ho9En5s0EAtHqqgYDB.Qk0puKIW', 1, NULL, NULL, '2022-09-23 11:22:10', '2022-09-23 11:22:10'),
(227, 'VIDES SIERRA JESUS SALVADOR', 'jesusvides@clinicageneraldelnorte.com', '$2y$10$morBYPjuT4kJw/Z3iE2tKOckDXeqBsh8KtKHwbRV13ydlrDuHCY4S', 1, NULL, NULL, '2022-09-23 11:22:10', '2022-09-23 11:22:10'),
(228, 'Occaecat r', 'lepazafovu@mailinator.com', '$2y$10$6m2.3NhmW77qpxDWnDpkceFdAKQqtph834Y51S.WQbSbKnFt1lJ3y', 0, NULL, NULL, '2022-09-23 22:59:54', '2022-09-23 23:00:00'),
(229, 'Ronaldo Luis Ibarra Hernández', 'agenteamavita7@contacta.com.co', '$2y$10$LoK4beVHOHLg4WMq65Et6eLd8nrCsbzszc7KuRUM0DOS48BjA58x6', 1, NULL, NULL, '2022-10-11 23:19:35', '2022-10-11 23:19:35'),
(230, 'Yeinys Paola Otero Ojeda', 'yeinispaolaotero0810@gmail.com', '$2y$10$0Fa4xr52uaVgBZVAQA.cuOeuywcnsofJaoE58OOtc4SiMjaMhaaaa', 1, NULL, NULL, '2022-12-27 22:59:23', '2022-12-27 22:59:23'),
(231, 'Ketty Maria Truyol Bossio', 'kettyztruyol01@gmail.com', '$2y$10$VU2r5us2ovrK7DpfVRBmgu9KBKhoDs1AUV5BoOVQsIsNzyrxvE8O2', 1, NULL, NULL, '2022-12-27 22:59:23', '2022-12-27 22:59:23'),
(232, 'Jhon Jairo Lara Tejada', 'jhonjairolaratejada29@gmial.com', '$2y$10$oTgNS9BmZyawgwWLjYd6E.fZg5IMbDnHJ4xks/2LfBr8UVK5ZTfF2', 1, NULL, NULL, '2022-12-27 22:59:23', '2022-12-27 22:59:23'),
(233, 'Valentina Ramirez Garzon', 'valentinaraminezgarzon0@gmail.com', '$2y$10$bq4erV81mQAWgWoy998LnewCgXlr7MXQk2JjM9ZuLh6njcKWJrT4O', 1, NULL, NULL, '2022-12-27 22:59:23', '2022-12-27 22:59:23'),
(234, 'Brando Alexander Niño Palma', 'brandonino1001@gmial.com', '$2y$10$wBGure9KbvnwQXr92sfiQOlQR4xdoWniXUroP3jptHTF9RX0wXVaG', 1, NULL, NULL, '2022-12-27 22:59:23', '2022-12-27 22:59:23'),
(235, 'kelly Johanna Landinez Quintero', 'kellilandinez@gmail.com', '$2y$10$neV3tktcz7A30WEGnwm/wO50e42AStSVfqTkUFRs5glt5tojKFTuO', 1, NULL, NULL, '2022-12-27 22:59:23', '2022-12-27 22:59:23'),
(236, 'Marcela Ortega Herrera', 'marcelaortega1990@gmail.com', '$2y$10$yNR4K0Yn8lhE8dc50WGiI.YXWOorEvSNMvqC9zwCx86sezx39P5la', 1, NULL, NULL, '2022-12-27 22:59:23', '2022-12-27 22:59:23'),
(237, 'Carlos Nepper Monsalve Cervantes', 'carlosnepper@gmail.com', '$2y$10$/dNqymz2V3s2HiwtyF8e5Opm.kj8NC3cgkGB19O7Ibk7JtwH3gno.', 1, NULL, NULL, '2022-12-27 22:59:24', '2022-12-27 22:59:24'),
(238, 'Alexander Barrios torres ', 'xanderbarrios1205@gmail.com', '$2y$10$udiZIMgDSG21sjZOJkTdguCad1mz4P1TxfLo6D/naBA3x4UeLQrAq', 1, NULL, NULL, '2022-12-28 23:38:28', '2022-12-28 23:38:28'),
(239, 'Yassir Antonio Bobadilla Camargo', 'bobadillayassir@gmail.com', '$2y$10$6piPKsnd/ZuXkWhBpmyQbOnCTjQyT0PmlR/R6ADe0III8hmKEF2wK', 1, NULL, NULL, '2022-12-28 23:38:29', '2022-12-28 23:38:29'),
(240, 'Juliana Suarez Rodríguez ', ' agenteamavita8@contacta.com.co', '$2y$10$sjoUkUdiTeRJbwvLLGw.ieTP9xo53zi6nvHKUQCmy4Tksv05wfz5a', 1, NULL, NULL, '2023-01-11 05:52:12', '2023-01-11 05:52:12'),
(241, 'LISETH CAROLINA MEDINA', 'lisethmedinac@contacta.com.co', '$2y$10$W9gMbjLZpqU5wPyX9Jeaxew9Yp4LjIYsLW7wTlpjmQ8eD3HbO1RQK', 1, NULL, NULL, '2023-01-20 07:05:27', '2023-01-20 07:05:27'),
(242, 'ALEJANDRO HERNANDEZ', 'alejandrohernandez@contacta.com.co', '$2y$10$c.p6wkwqioNF.Ium7bPMcud8kCbM9xytUtgkVDYPKGuYLKjmCPO7C', 1, NULL, NULL, '2023-01-20 07:05:27', '2023-01-20 07:05:27'),
(243, 'ECCE TIRADO', 'eccetirado@contacta.com.co', '$2y$10$EknmfftKTR78u/ejxJPqKO/iK6TZ5Vy1Tv3stUjWFwDe6eApiii1O', 1, NULL, NULL, '2023-01-20 07:05:27', '2023-01-20 07:05:27'),
(244, 'MARIA RIQUETT', 'mariariquett@contacta.com.co', '$2y$10$N6QW67wUSnJw8sOAthyPku35ud1hhBKGEtSH9YFnjnS/y0ukWA7CG', 1, NULL, NULL, '2023-01-20 07:05:27', '2023-01-20 07:05:27'),
(245, 'CLAUDIA CONDE', 'claudiaconde@contacta.com.co', '$2y$10$Q0YAURzw9CywK.FT/DVaIew01Uh96mL8EMymp7OI5QXv4jJrsgONa', 1, NULL, NULL, '2023-01-20 07:05:27', '2023-01-20 07:05:27'),
(246, 'RONALDO IBARRA', 'ronaldoibarra@contacta.com.co', '$2y$10$rsaD/Fmx7QBJrdECj4oFkeheuelSmPRDBURZNWVINIAkRfJbT8c.q', 1, NULL, NULL, '2023-01-20 07:05:27', '2023-01-20 07:05:27'),
(247, 'NIYIRETH YULIANA CASTRO', 'niyirethyulianacastro@contacta.com.co', '$2y$10$9VVKghv5o4et.WlpDewtC.Hxf8Ouw2FtWhjjziIOEnclZXh3oUST6', 1, NULL, NULL, '2023-01-20 07:05:27', '2023-01-20 07:05:27'),
(248, 'YARITHZA LINETH MARTINEZ', 'yarithzalinethmartinez@contacta.com.co', '$2y$10$gc/Al1rueaU6JVTjxF.Rruqbp1tJjGLTnpi8Lt4SDIyrt1Nd0gmcm', 1, NULL, NULL, '2023-01-20 07:05:27', '2023-01-20 07:05:27'),
(249, 'YULI PEREZ', 'yuliperez@contacta.com.co', '$2y$10$nyaGuFVia8ucpybOoFoJu.mfxdltL72Af8Go72cVPCL.ezvmw.H/6', 1, NULL, NULL, '2023-01-20 07:05:28', '2023-01-20 07:05:28'),
(250, 'Maria Chamorro', 'mariachamorro@contacta.com.co', '$2y$10$uJ7GVl3KzdpB0wudsSlVE.aeXcaQy0fHhEqZeBSO2MUHmWPSzvboS', 1, NULL, NULL, '2023-01-20 07:05:28', '2023-01-20 07:05:28'),
(251, 'Eniyer Dizzett', 'eniyerdizzett@contacta.com.co', '$2y$10$RcldjqBrae8aHj3PQvBy0OvZZ1TFG/urECADxjec5S6wVRO4hY6SG', 1, NULL, NULL, '2023-01-20 07:05:28', '2023-01-20 07:05:28'),
(252, 'JULIANA SUAREZ RODRIGUEZ', 'julianasuarezrodriguez@contacta.com.co', '$2y$10$Sqp8dT70wdC13ez4Utnr9eqCEnDpGu8l9ZfFXxkl08QgNf8OrI9ji', 1, NULL, NULL, '2023-01-20 07:05:28', '2023-01-20 07:05:28'),
(253, 'ERIALETH BARRAZA', 'erialethbarraza@contacta.com.co', '$2y$10$mVyLLMkMplW.QXthuhuu9eOeQBMylx6kGba9fOyf/zYc6SM0J82UG', 1, NULL, NULL, '2023-01-20 07:05:28', '2023-01-20 07:05:28');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`ARE_ID`);

--
-- Indices de la tabla `campanas`
--
ALTER TABLE `campanas`
  ADD PRIMARY KEY (`CAM_ID`),
  ADD KEY `FK_USER_CAMPAÑA` (`USER_ID`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`CAR_ID`),
  ADD KEY `FK_USER_CARGOS` (`USER_ID`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CLI_ID`),
  ADD KEY `FK_USER_CLIENTES` (`USER_ID`),
  ADD KEY `FK_SER_CLI` (`SER_ID`);

--
-- Indices de la tabla `cli_consumos`
--
ALTER TABLE `cli_consumos`
  ADD PRIMARY KEY (`CLC_ID`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`CON_ID`) USING BTREE,
  ADD KEY `FK_CLIENTE_CONTRATO` (`CLI_ID`),
  ADD KEY `FK_CAMPAÑAS_CONTRATO` (`CAM_ID`),
  ADD KEY `FK_USER_CONTRATOS` (`USER_ID`),
  ADD KEY `FK_UNI_SER_CONTRATO` (`UNI_ID`);

--
-- Indices de la tabla `cortes`
--
ALTER TABLE `cortes`
  ADD PRIMARY KEY (`COR_ID`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`EMP_ID`),
  ADD KEY `FK_USER_EMPLEADOS` (`USER_ID`),
  ADD KEY `FK_CAR_EMP` (`CAR_ID`),
  ADD KEY `fk_cam_emp` (`CAM_ID`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`EQU_ID`);

--
-- Indices de la tabla `equ_asignados`
--
ALTER TABLE `equ_asignados`
  ADD PRIMARY KEY (`EAS_ID`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`GRU_ID`),
  ADD KEY `fk_gru_cam` (`CAM_ID`),
  ADD KEY `fk_gru_emp` (`EMP_ID`);

--
-- Indices de la tabla `hardwares`
--
ALTER TABLE `hardwares`
  ADD PRIMARY KEY (`HAR_ID`);

--
-- Indices de la tabla `har_asignados`
--
ALTER TABLE `har_asignados`
  ADD PRIMARY KEY (`HAS_ID`);

--
-- Indices de la tabla `horas`
--
ALTER TABLE `horas`
  ADD PRIMARY KEY (`HOR_ID`),
  ADD KEY `FK_USER_HORAS` (`USER_ID`);

--
-- Indices de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  ADD PRIMARY KEY (`JOR_ID`),
  ADD KEY `fk_jor_inicio_hor` (`JOR_INICIO`),
  ADD KEY `fk_jor_final_hor` (`JOR_FINAL`);

--
-- Indices de la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD PRIMARY KEY (`LIC_ID`);

--
-- Indices de la tabla `lic_asignados`
--
ALTER TABLE `lic_asignados`
  ADD PRIMARY KEY (`LAS_ID`);

--
-- Indices de la tabla `mallas`
--
ALTER TABLE `mallas`
  ADD PRIMARY KEY (`MAL_ID`),
  ADD KEY `FK_EMPLEADO_MALLA` (`EMP_ID`),
  ADD KEY `FK_CONTRATOS_MALLA` (`CAM_ID`),
  ADD KEY `FK_USER_MALLA` (`USER_ID`);

--
-- Indices de la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  ADD PRIMARY KEY (`MAN_ID`);

--
-- Indices de la tabla `man_asignados`
--
ALTER TABLE `man_asignados`
  ADD PRIMARY KEY (`MAS_ID`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`MAR_ID`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD PRIMARY KEY (`NOV_ID`),
  ADD KEY `nov_tin_fk` (`TIN_ID`),
  ADD KEY `nov_emp_fk` (`EMP_ID`),
  ADD KEY `nov_mal_fk` (`MAL_ID`),
  ADD KEY `nov_usu_id` (`USER_ID`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`PRO_ID`);

--
-- Indices de la tabla `pro_contratos`
--
ALTER TABLE `pro_contratos`
  ADD PRIMARY KEY (`PRC_ID`);

--
-- Indices de la tabla `puertos`
--
ALTER TABLE `puertos`
  ADD PRIMARY KEY (`PUE_ID`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `softwares`
--
ALTER TABLE `softwares`
  ADD PRIMARY KEY (`SOF_ID`);

--
-- Indices de la tabla `sof_asignados`
--
ALTER TABLE `sof_asignados`
  ADD PRIMARY KEY (`SAS_ID`);

--
-- Indices de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`TEC_ID`);

--
-- Indices de la tabla `tipos_novedades`
--
ALTER TABLE `tipos_novedades`
  ADD PRIMARY KEY (`TIN_ID`);

--
-- Indices de la tabla `tipos_servicios`
--
ALTER TABLE `tipos_servicios`
  ADD PRIMARY KEY (`tps_id`);

--
-- Indices de la tabla `tipo_mantenimientos`
--
ALTER TABLE `tipo_mantenimientos`
  ADD PRIMARY KEY (`TIP_ID`);

--
-- Indices de la tabla `tip_asignados`
--
ALTER TABLE `tip_asignados`
  ADD PRIMARY KEY (`TAS_ID`);

--
-- Indices de la tabla `unidad_negocios`
--
ALTER TABLE `unidad_negocios`
  ADD PRIMARY KEY (`UNI_ID`),
  ADD KEY `FK_USER_UNIDAD_NEGOCIOS` (`USER_ID`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `ARE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `campanas`
--
ALTER TABLE `campanas`
  MODIFY `CAM_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria';

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `CAR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `CLI_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Lave primaria', AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `cli_consumos`
--
ALTER TABLE `cli_consumos`
  MODIFY `CLC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `CON_ID` int(20) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `cortes`
--
ALTER TABLE `cortes`
  MODIFY `COR_ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `EMP_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `EQU_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT de la tabla `equ_asignados`
--
ALTER TABLE `equ_asignados`
  MODIFY `EAS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `GRU_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `hardwares`
--
ALTER TABLE `hardwares`
  MODIFY `HAR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=661;

--
-- AUTO_INCREMENT de la tabla `har_asignados`
--
ALTER TABLE `har_asignados`
  MODIFY `HAS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria	', AUTO_INCREMENT=662;

--
-- AUTO_INCREMENT de la tabla `horas`
--
ALTER TABLE `horas`
  MODIFY `HOR_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  MODIFY `JOR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `licencias`
--
ALTER TABLE `licencias`
  MODIFY `LIC_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `lic_asignados`
--
ALTER TABLE `lic_asignados`
  MODIFY `LAS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `mallas`
--
ALTER TABLE `mallas`
  MODIFY `MAL_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria';

--
-- AUTO_INCREMENT de la tabla `mantenimientos`
--
ALTER TABLE `mantenimientos`
  MODIFY `MAN_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria.', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `man_asignados`
--
ALTER TABLE `man_asignados`
  MODIFY `MAS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `MAR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `novedades`
--
ALTER TABLE `novedades`
  MODIFY `NOV_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria', AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `PRO_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pro_contratos`
--
ALTER TABLE `pro_contratos`
  MODIFY `PRC_ID` int(20) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria unica';

--
-- AUTO_INCREMENT de la tabla `puertos`
--
ALTER TABLE `puertos`
  MODIFY `PUE_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `softwares`
--
ALTER TABLE `softwares`
  MODIFY `SOF_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `sof_asignados`
--
ALTER TABLE `sof_asignados`
  MODIFY `SAS_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `TEC_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipos_novedades`
--
ALTER TABLE `tipos_novedades`
  MODIFY `TIN_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria', AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipos_servicios`
--
ALTER TABLE `tipos_servicios`
  MODIFY `tps_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_mantenimientos`
--
ALTER TABLE `tipo_mantenimientos`
  MODIFY `TIP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tip_asignados`
--
ALTER TABLE `tip_asignados`
  MODIFY `TAS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT de la tabla `unidad_negocios`
--
ALTER TABLE `unidad_negocios`
  MODIFY `UNI_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Llave primaria', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `campanas`
--
ALTER TABLE `campanas`
  ADD CONSTRAINT `FK_USER_CAMPAÑA` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD CONSTRAINT `FK_USER_CARGOS` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `FK_SER_CLI` FOREIGN KEY (`SER_ID`) REFERENCES `servicios` (`SER_ID`),
  ADD CONSTRAINT `FK_USER_CLIENTES` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `horas`
--
ALTER TABLE `horas`
  ADD CONSTRAINT `FK_USER_HORAS` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
