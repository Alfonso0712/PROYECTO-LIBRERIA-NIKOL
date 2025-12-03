-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2025 a las 02:51:59
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
-- Base de datos: `sw_libreria_ventas_analitica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_cliente`
--

CREATE TABLE `dim_cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `Tipo_Doc` varchar(30) DEFAULT NULL,
  `Num_Doc` varchar(11) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Telefono` varchar(11) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dim_cliente`
--

INSERT INTO `dim_cliente` (`ID_Cliente`, `Tipo_Doc`, `Num_Doc`, `Nombre`, `Apellido`, `Telefono`, `Direccion`) VALUES
(1, 'DNI', '12345678', 'Carlos', 'Perez', '987654321', 'Av. Lima 123'),
(2, 'DNI', '87654321', 'María', 'Lozano', '912345678', 'Jr. Amazonas 456'),
(3, 'DNI', '45678912', 'Lucía', 'Torres', '987111222', 'Psje. Grau 221'),
(4, 'DNI', '78912345', 'Jorge', 'Sánchez', '921222333', 'Av. El Sol 999'),
(5, 'DNI', '11223344', 'Ana', 'Castro', '955444333', 'Jr. Libertad 200');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_comprobante`
--

CREATE TABLE `dim_comprobante` (
  `ID_Comprobante` int(11) NOT NULL,
  `Tipo_Operacion` varchar(30) DEFAULT NULL,
  `Tipo_Comp` char(2) DEFAULT NULL,
  `Numero_serie` int(11) DEFAULT NULL,
  `Numero_Comp` int(11) DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dim_comprobante`
--

INSERT INTO `dim_comprobante` (`ID_Comprobante`, `Tipo_Operacion`, `Tipo_Comp`, `Numero_serie`, `Numero_Comp`, `Estado`) VALUES
(100, 'Venta', 'BV', 1, 2001, 1),
(101, 'Venta', 'BV', 1, 2002, 1),
(102, 'Venta', 'BV', 1, 2003, 1),
(103, 'Venta', 'BV', 1, 2004, 1),
(104, 'Venta', 'BV', 1, 2005, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_fecha`
--

CREATE TABLE `dim_fecha` (
  `Fecha` date NOT NULL,
  `Anio` int(11) DEFAULT NULL,
  `Mes` int(11) DEFAULT NULL,
  `Nombre_Mes` varchar(20) DEFAULT NULL,
  `Dia` int(11) DEFAULT NULL,
  `DiaSemana` varchar(20) DEFAULT NULL,
  `Trimestre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dim_fecha`
--

INSERT INTO `dim_fecha` (`Fecha`, `Anio`, `Mes`, `Nombre_Mes`, `Dia`, `DiaSemana`, `Trimestre`) VALUES
('2025-02-01', 2025, 2, 'Febrero', 1, 'Sábado', 1),
('2025-02-02', 2025, 2, 'Febrero', 2, 'Domingo', 1),
('2025-02-03', 2025, 2, 'Febrero', 3, 'Lunes', 1),
('2025-02-04', 2025, 2, 'Febrero', 4, 'Martes', 1),
('2025-02-05', 2025, 2, 'Febrero', 5, 'Miércoles', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_producto`
--

CREATE TABLE `dim_producto` (
  `ID_Producto` int(11) NOT NULL,
  `Nombre_Prod` varchar(50) DEFAULT NULL,
  `Descripcion_Prod` varchar(100) DEFAULT NULL,
  `ID_Categoria` int(11) DEFAULT NULL,
  `Categoria` varchar(50) DEFAULT NULL,
  `ID_UnidadM` int(11) DEFAULT NULL,
  `Unidad` varchar(50) DEFAULT NULL,
  `PrecioUnitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dim_producto`
--

INSERT INTO `dim_producto` (`ID_Producto`, `Nombre_Prod`, `Descripcion_Prod`, `ID_Categoria`, `Categoria`, `ID_UnidadM`, `Unidad`, `PrecioUnitario`) VALUES
(1, 'Cuaderno A4', 'Cuaderno A4 cuadriculado', 1, 'Cuadernos', 1, 'Unidad', 5.00),
(2, 'Lapicero Azul', 'Lapicero azul Faber Castell', 2, 'Útiles de Escritura', 1, 'Unidad', 1.50),
(3, 'Papel Bond A4', 'Resma de papel Bond A4', 3, 'Papeles', 3, 'Paquete', 18.00),
(4, 'Tijeras Escolares', 'Tijeras punta roma', 4, 'Herramientas', 1, 'Unidad', 4.50),
(5, 'Folder Manila', 'Folder tamaño A4 color manila', 5, 'Organización', 2, 'Paquete', 2.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fact_ventas`
--

CREATE TABLE `fact_ventas` (
  `ID_FactVenta` int(11) NOT NULL,
  `ID_Venta` int(11) DEFAULT NULL,
  `ID_Comprobante` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Subtotal` decimal(10,2) DEFAULT NULL,
  `TotalVenta` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fact_ventas`
--

INSERT INTO `fact_ventas` (`ID_FactVenta`, `ID_Venta`, `ID_Comprobante`, `Fecha`, `ID_Cliente`, `ID_Producto`, `Cantidad`, `Subtotal`, `TotalVenta`) VALUES
(1, 20, 100, '2025-02-01', 1, 1, 1, 5.00, 5.00),
(2, 21, 101, '2025-02-01', 2, 1, 2, 10.00, 10.00),
(3, 22, 102, '2025-02-01', 3, 3, 1, 18.00, 18.00),
(4, 23, 103, '2025-02-03', 4, 2, 3, 4.50, 4.50),
(5, 24, 104, '2025-02-05', 5, 4, 1, 4.50, 4.50);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dim_cliente`
--
ALTER TABLE `dim_cliente`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `dim_comprobante`
--
ALTER TABLE `dim_comprobante`
  ADD PRIMARY KEY (`ID_Comprobante`);

--
-- Indices de la tabla `dim_fecha`
--
ALTER TABLE `dim_fecha`
  ADD PRIMARY KEY (`Fecha`);

--
-- Indices de la tabla `dim_producto`
--
ALTER TABLE `dim_producto`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `fact_ventas`
--
ALTER TABLE `fact_ventas`
  ADD PRIMARY KEY (`ID_FactVenta`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `Fecha` (`Fecha`),
  ADD KEY `ID_Comprobante` (`ID_Comprobante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `fact_ventas`
--
ALTER TABLE `fact_ventas`
  MODIFY `ID_FactVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fact_ventas`
--
ALTER TABLE `fact_ventas`
  ADD CONSTRAINT `fact_ventas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `dim_cliente` (`ID_Cliente`),
  ADD CONSTRAINT `fact_ventas_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `dim_producto` (`ID_Producto`),
  ADD CONSTRAINT `fact_ventas_ibfk_3` FOREIGN KEY (`Fecha`) REFERENCES `dim_fecha` (`Fecha`),
  ADD CONSTRAINT `fact_ventas_ibfk_4` FOREIGN KEY (`ID_Comprobante`) REFERENCES `dim_comprobante` (`ID_Comprobante`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
