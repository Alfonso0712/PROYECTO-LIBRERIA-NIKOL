-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2025 a las 02:51:50
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
-- Base de datos: `sw_libreria_nikol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_Categoria` int(11) NOT NULL,
  `Nombre_Cat` varchar(50) NOT NULL,
  `Descripciom_Cat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_Categoria`, `Nombre_Cat`, `Descripciom_Cat`) VALUES
(1, 'Cuadernos A4', 'Cuadriculados'),
(2, 'Papeleria', 'Hojas bond, cartulinas, papel crepé, papel lustre.'),
(3, 'Adhesivos', 'Goma, silicona, cintas, foamy, escarcha.'),
(4, 'Archivadores', 'Folders, archivadores, sobres manila, separadores.'),
(5, 'Escritura', 'Lapiceros, lápices, borradores, tajadores, colores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Tipo_Doc_Clie` varchar(30) NOT NULL,
  `Num_Doc_Clie` varchar(11) NOT NULL,
  `Nombre_Clie` varchar(50) NOT NULL,
  `Apellido_Clie` varchar(50) NOT NULL,
  `Telefono_Clie` char(11) DEFAULT NULL,
  `Direccion_Clie` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Tipo_Doc_Clie`, `Num_Doc_Clie`, `Nombre_Clie`, `Apellido_Clie`, `Telefono_Clie`, `Direccion_Clie`) VALUES
(1, 'DNI', '71234561', 'María', 'Lozano', '987654321', 'Av. Los Jardines 123'),
(2, 'DNI', '74589632', 'Carlos', 'Ramírez', '956123478', 'Jr. Libertad 456'),
(3, 'DNI', '70856412', 'Andrea', 'Sánchez', '983214567', 'Psje. Las Flores 234'),
(4, 'DNI', '75648912', 'José', 'Salazar', '912345678', 'Av. Progreso 890'),
(5, 'DNI', '70123456', 'Lucía', 'Valverde', '987321654', 'Calle Comercio 101');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `ID_Compra` int(11) NOT NULL,
  `ID_Proveedor` int(11) NOT NULL,
  `Fecha_Compra` datetime NOT NULL,
  `Total_Compra` decimal(5,2) NOT NULL,
  `Estado_Compra` varchar(30) NOT NULL,
  `Observ_Compra` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`ID_Compra`, `ID_Proveedor`, `Fecha_Compra`, `Total_Compra`, `Estado_Compra`, `Observ_Compra`) VALUES
(30, 1, '2025-02-05 09:00:00', 180.00, 'Completado', 'Compra de cuadernos A4'),
(31, 2, '2025-02-06 10:20:00', 120.00, 'Completado', 'Compra de lapiceros azules'),
(32, 3, '2025-02-07 11:45:00', 240.00, 'Completado', 'Compra de papel bond'),
(33, 4, '2025-02-08 14:10:00', 72.00, 'Completado', 'Compra de goma líquida'),
(34, 5, '2025-02-09 16:00:00', 160.00, 'Completado', 'Compra de folders');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `ID_Comprobante` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Venta` int(11) DEFAULT NULL,
  `ID_Servicio` int(11) DEFAULT NULL,
  `ID_Compra` int(11) DEFAULT NULL,
  `Tipo_Operacion` varchar(30) NOT NULL,
  `Tipo_Comp` char(2) NOT NULL,
  `Numero_serie` int(11) NOT NULL,
  `Numero_Comp` int(11) NOT NULL,
  `Fecha_Emision` datetime NOT NULL,
  `Monto_Total_CDP` decimal(5,2) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  `Observ_Comp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprobantes`
--

INSERT INTO `comprobantes` (`ID_Comprobante`, `ID_Cliente`, `ID_Venta`, `ID_Servicio`, `ID_Compra`, `Tipo_Operacion`, `Tipo_Comp`, `Numero_serie`, `Numero_Comp`, `Fecha_Emision`, `Monto_Total_CDP`, `Estado`, `Observ_Comp`) VALUES
(30, 1, 21, NULL, NULL, 'Venta', 'B1', 1, 2001, '2025-02-01 10:05:00', 10.90, 1, 'Boleta emitida'),
(31, 2, 22, NULL, NULL, 'Venta', 'B1', 1, 2002, '2025-02-01 11:32:00', 3.20, 1, 'Boleta emitida'),
(32, 3, 23, NULL, NULL, 'Venta', 'B1', 1, 2003, '2025-02-01 14:03:00', 19.00, 1, 'Boleta emitida'),
(33, 4, 24, NULL, NULL, 'Venta', 'B1', 1, 2004, '2025-02-02 09:20:00', 3.60, 1, 'Boleta emitida'),
(34, 5, 25, NULL, NULL, 'Venta', 'B1', 1, 2005, '2025-02-02 16:04:00', 8.50, 1, 'Boleta emitida'),
(50, NULL, NULL, NULL, 30, 'Compra', 'F1', 1, 3001, '2025-02-05 09:10:00', 180.00, 1, 'Factura compra cuadernos'),
(51, NULL, NULL, NULL, 31, 'Compra', 'F1', 1, 3002, '2025-02-06 10:25:00', 120.00, 1, 'Factura compra lapiceros'),
(52, NULL, NULL, NULL, 32, 'Compra', 'F1', 1, 3003, '2025-02-07 11:50:00', 240.00, 1, 'Factura compra pape bond'),
(53, NULL, NULL, NULL, 33, 'Compra', 'F1', 1, 3004, '2025-02-08 14:20:00', 72.00, 1, 'Factura compra goma líquida'),
(54, NULL, NULL, NULL, 34, 'Compra', 'F1', 1, 3005, '2025-02-09 16:04:00', 160.00, 1, 'Factura compra folders'),
(70, 1, NULL, 50, NULL, 'Servicio', 'B1', 2, 5001, '2025-02-10 09:05:00', 5.00, 1, 'Boleta servicio fotocopias'),
(71, 2, NULL, 51, NULL, 'Servicio', 'B1', 2, 5002, '2025-02-10 10:50:00', 5.50, 1, 'Boleta servicio impresión'),
(72, 3, NULL, 52, NULL, 'Servicio', 'B1', 2, 5003, '2025-02-11 12:05:00', 4.00, 1, 'Boleta servicio anillado'),
(73, 4, NULL, 53, NULL, 'Servicio', 'B1', 2, 5004, '2025-02-11 14:35:00', 6.00, 1, 'Boleta servicio plastificado'),
(74, 5, NULL, 54, NULL, 'Servicio', 'B1', 2, 5005, '2025-02-11 17:20:00', 4.00, 1, 'Boleta servicio copias'),
(80, 2, 40, NULL, NULL, 'Venta', 'B1', 3, 6001, '2025-02-13 09:05:00', 12.00, 1, 'Boleta generada desde cotización 61'),
(81, 3, 41, NULL, NULL, 'Venta', 'B1', 3, 6002, '2025-02-13 10:35:00', 19.00, 1, 'Boleta generada desde cotización 62');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizaciones`
--

CREATE TABLE `cotizaciones` (
  `ID_Cotizacion` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `Fecha_Cot` datetime NOT NULL,
  `Total_Cot` decimal(5,2) NOT NULL,
  `Estado_Cot` tinyint(1) NOT NULL,
  `Observacion_Cot` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotizaciones`
--

INSERT INTO `cotizaciones` (`ID_Cotizacion`, `ID_Cliente`, `Fecha_Cot`, `Total_Cot`, `Estado_Cot`, `Observacion_Cot`) VALUES
(60, 1, '2025-02-12 09:00:00', 17.00, 1, 'Cotización cuadernos'),
(61, 2, '2025-02-12 10:30:00', 12.00, 1, 'Cotización lapiceros'),
(62, 3, '2025-02-12 14:00:00', 19.00, 1, 'Cotización papel bond'),
(63, 4, '2025-02-12 16:30:00', 12.80, 1, 'Cotización gomas'),
(64, 5, '2025-02-12 17:10:00', 4.80, 1, 'Cotización folders');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `ID_DetalleCom` int(11) NOT NULL,
  `ID_Compra` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `Cant_Com` int(11) NOT NULL,
  `Subtotal_Com` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`ID_DetalleCom`, `ID_Compra`, `ID_Producto`, `Cant_Com`, `Subtotal_Com`) VALUES
(100, 30, 1, 40, 180.00),
(101, 31, 2, 150, 120.00),
(102, 32, 3, 20, 240.00),
(103, 33, 4, 60, 72.00),
(104, 34, 5, 200, 160.00);

--
-- Disparadores `detalle_compras`
--
DELIMITER $$
CREATE TRIGGER `trg_ajustar_stock_compra` AFTER UPDATE ON `detalle_compras` FOR EACH ROW BEGIN
    UPDATE Productos
    SET Stock = Stock + (NEW.Cant_Com - OLD.Cant_Com)
    WHERE ID_Producto = NEW.ID_Producto;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_calc_total_compra_delete` AFTER DELETE ON `detalle_compras` FOR EACH ROW BEGIN
    UPDATE Compras
    SET Total_Compra = (
        SELECT IFNULL(SUM(Subtotal_Com),0)
        FROM Detalle_Compras
        WHERE ID_Compra = OLD.ID_Compra
    )
    WHERE ID_Compra = OLD.ID_Compra;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_calc_total_compra_insert` AFTER INSERT ON `detalle_compras` FOR EACH ROW BEGIN
    UPDATE Compras
    SET Total_Compra = (
        SELECT SUM(Subtotal_Com)
        FROM Detalle_Compras
        WHERE ID_Compra = NEW.ID_Compra
    )
    WHERE ID_Compra = NEW.ID_Compra;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_calc_total_compra_update` AFTER UPDATE ON `detalle_compras` FOR EACH ROW BEGIN
    UPDATE Compras
    SET Total_Compra = (
        SELECT SUM(Subtotal_Com)
        FROM Detalle_Compras
        WHERE ID_Compra = NEW.ID_Compra
    )
    WHERE ID_Compra = NEW.ID_Compra;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_restar_stock_compra` AFTER DELETE ON `detalle_compras` FOR EACH ROW BEGIN
    UPDATE Productos
    SET Stock = Stock - OLD.Cant_Com
    WHERE ID_Producto = OLD.ID_Producto;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_sumar_stock_compra` AFTER INSERT ON `detalle_compras` FOR EACH ROW BEGIN
    UPDATE Productos
    SET Stock = Stock + NEW.Cant_Com
    WHERE ID_Producto = NEW.ID_Producto;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cotizacion`
--

CREATE TABLE `detalle_cotizacion` (
  `ID_DetalleCot` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `ID_Cotizacion` int(11) NOT NULL,
  `Cant_Cot` int(11) NOT NULL,
  `Subtotal_Cot` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_cotizacion`
--

INSERT INTO `detalle_cotizacion` (`ID_DetalleCot`, `ID_Producto`, `ID_Cotizacion`, `Cant_Cot`, `Subtotal_Cot`) VALUES
(300, 1, 60, 2, 17.00),
(301, 2, 61, 10, 12.00),
(302, 3, 62, 1, 19.00),
(303, 4, 63, 4, 12.80),
(304, 5, 64, 6, 4.80);

--
-- Disparadores `detalle_cotizacion`
--
DELIMITER $$
CREATE TRIGGER `trg_calc_total_cot_delete` AFTER DELETE ON `detalle_cotizacion` FOR EACH ROW BEGIN
    UPDATE Cotizaciones
    SET Total_Cot = (
        SELECT IFNULL(SUM(Subtotal_Cot),0)
        FROM Detalle_Cotizacion
        WHERE ID_Cotizacion = OLD.ID_Cotizacion
    )
    WHERE ID_Cotizacion = OLD.ID_Cotizacion;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_calc_total_cot_insert` AFTER INSERT ON `detalle_cotizacion` FOR EACH ROW BEGIN
    UPDATE Cotizaciones
    SET Total_Cot = (
        SELECT SUM(Subtotal_Cot)
        FROM Detalle_Cotizacion
        WHERE ID_Cotizacion = NEW.ID_Cotizacion
    )
    WHERE ID_Cotizacion = NEW.ID_Cotizacion;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_calc_total_cot_update` AFTER UPDATE ON `detalle_cotizacion` FOR EACH ROW BEGIN
    UPDATE Cotizaciones
    SET Total_Cot = (
        SELECT SUM(Subtotal_Cot)
        FROM Detalle_Cotizacion
        WHERE ID_Cotizacion = NEW.ID_Cotizacion
    )
    WHERE ID_Cotizacion = NEW.ID_Cotizacion;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_servicio`
--

CREATE TABLE `detalle_servicio` (
  `ID_Detalle_Ser` int(11) NOT NULL,
  `ID_Servicio` int(11) NOT NULL,
  `ID_TipoServicio` int(11) NOT NULL,
  `Cant_Serv` int(11) NOT NULL,
  `Subtotal_Serv` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_servicio`
--

INSERT INTO `detalle_servicio` (`ID_Detalle_Ser`, `ID_Servicio`, `ID_TipoServicio`, `Cant_Serv`, `Subtotal_Serv`) VALUES
(200, 50, 1, 10, 5.00),
(201, 51, 2, 5, 2.50),
(202, 51, 3, 2, 3.00),
(203, 52, 4, 1, 4.00),
(204, 53, 5, 3, 6.00),
(205, 54, 1, 8, 4.00);

--
-- Disparadores `detalle_servicio`
--
DELIMITER $$
CREATE TRIGGER `trg_calc_total_serv_delete` AFTER DELETE ON `detalle_servicio` FOR EACH ROW BEGIN
    UPDATE Servicios
    SET Total_Servicio = (
        SELECT IFNULL(SUM(Subtotal_Serv),0)
        FROM Detalle_Servicio
        WHERE ID_Servicio = OLD.ID_Servicio
    )
    WHERE ID_Servicio = OLD.ID_Servicio;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_calc_total_serv_insert` AFTER INSERT ON `detalle_servicio` FOR EACH ROW BEGIN
    UPDATE Servicios
    SET Total_Servicio = (
        SELECT SUM(Subtotal_Serv)
        FROM Detalle_Servicio
        WHERE ID_Servicio = NEW.ID_Servicio
    )
    WHERE ID_Servicio = NEW.ID_Servicio;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_calc_total_serv_update` AFTER UPDATE ON `detalle_servicio` FOR EACH ROW BEGIN
    UPDATE Servicios
    SET Total_Servicio = (
        SELECT SUM(Subtotal_Serv)
        FROM Detalle_Servicio
        WHERE ID_Servicio = NEW.ID_Servicio
    )
    WHERE ID_Servicio = NEW.ID_Servicio;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `ID_DetallVen` int(11) NOT NULL,
  `ID_Venta` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `Cant_Ven` int(11) NOT NULL,
  `Subtotal_Ven` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`ID_DetallVen`, `ID_Venta`, `ID_Producto`, `Cant_Ven`, `Subtotal_Ven`) VALUES
(50, 21, 1, 1, 8.50),
(51, 21, 2, 2, 2.40),
(52, 22, 4, 1, 3.20),
(53, 23, 3, 1, 19.00),
(54, 24, 5, 3, 2.40),
(55, 24, 2, 1, 1.20),
(56, 25, 1, 1, 8.50),
(70, 40, 2, 10, 12.00),
(71, 41, 3, 1, 19.00);

--
-- Disparadores `detalle_venta`
--
DELIMITER $$
CREATE TRIGGER `trg_ajustar_stock_venta` AFTER UPDATE ON `detalle_venta` FOR EACH ROW BEGIN
    UPDATE Productos
    SET Stock = Stock + (OLD.Cant_Ven - NEW.Cant_Ven)
    WHERE ID_Producto = NEW.ID_Producto;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_calc_total_venta_delete` AFTER DELETE ON `detalle_venta` FOR EACH ROW BEGIN
    UPDATE Ventas
    SET Total_Venta = (
        SELECT IFNULL(SUM(Subtotal_Ven),0)
        FROM Detalle_Venta
        WHERE ID_Venta = OLD.ID_Venta
    )
    WHERE ID_Venta = OLD.ID_Venta;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_calc_total_venta_insert` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
    UPDATE Ventas
    SET Total_Venta = (
        SELECT SUM(Subtotal_Ven)
        FROM Detalle_Venta
        WHERE ID_Venta = NEW.ID_Venta
    )
    WHERE ID_Venta = NEW.ID_Venta;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_calc_total_venta_update` AFTER UPDATE ON `detalle_venta` FOR EACH ROW BEGIN
    UPDATE Ventas
    SET Total_Venta = (
        SELECT SUM(Subtotal_Ven)
        FROM Detalle_Venta
        WHERE ID_Venta = NEW.ID_Venta
    )
    WHERE ID_Venta = NEW.ID_Venta;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_devolver_stock_venta` AFTER DELETE ON `detalle_venta` FOR EACH ROW BEGIN
    UPDATE Productos
    SET Stock = Stock + OLD.Cant_Ven
    WHERE ID_Producto = OLD.ID_Producto;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_restar_stock_venta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
    UPDATE Productos
    SET Stock = Stock - NEW.Cant_Ven
    WHERE ID_Producto = NEW.ID_Producto;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `ID_Inventario` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `ID_Compra` int(11) NOT NULL,
  `Fecha_Inv` datetime NOT NULL,
  `Tipo_Movimiento` varchar(30) NOT NULL,
  `Cantidad_Inv` int(11) NOT NULL,
  `Motivo_Movimiento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`ID_Inventario`, `ID_Producto`, `ID_Compra`, `Fecha_Inv`, `Tipo_Movimiento`, `Cantidad_Inv`, `Motivo_Movimiento`) VALUES
(90, 1, 30, '2025-02-05 09:05:00', 'Entrada', 40, 'Ingreso por compra'),
(91, 2, 31, '2025-02-06 10:25:00', 'Entrada', 150, 'Ingreso por compra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Producto` int(11) NOT NULL,
  `ID_Categoria` int(11) NOT NULL,
  `ID_UnidadM` int(11) NOT NULL,
  `Nombre_Prod` varchar(50) NOT NULL,
  `Descripcion_Prod` varchar(50) DEFAULT NULL,
  `PrecioUnitario` decimal(5,2) NOT NULL,
  `PrecioCompra` decimal(5,2) DEFAULT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_Producto`, `ID_Categoria`, `ID_UnidadM`, `Nombre_Prod`, `Descripcion_Prod`, `PrecioUnitario`, `PrecioCompra`, `Stock`) VALUES
(1, 1, 1, 'Cuaderno A4 Universitario', '100 hojas rayado', 8.50, 5.00, 88),
(2, 2, 1, 'Lapicero Azul BIC', 'Lapicero punta fina', 1.20, 0.80, 237),
(3, 3, 2, 'Hojas Bond Carta 75g', 'Resma x 500 hojas', 19.00, 14.00, 38),
(4, 4, 1, 'Goma Líquida 120ml', 'Goma escolar', 2.00, 1.20, 99),
(5, 5, 1, 'Folder Manila Oficio', 'Folder tamaño oficio', 0.80, 0.50, 397);

--
-- Disparadores `productos`
--
DELIMITER $$
CREATE TRIGGER `trg_prevenir_stock_negativo` BEFORE UPDATE ON `productos` FOR EACH ROW BEGIN
    IF NEW.Stock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el stock no puede ser negativo.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_Proveedor` int(11) NOT NULL,
  `Tipo_Doc_Prov` varchar(30) NOT NULL,
  `Num_Doc_Prov` varchar(11) NOT NULL,
  `Nombre_Prov` varchar(50) NOT NULL,
  `Apellido_Prov` varchar(50) NOT NULL,
  `Telefono_Prov` char(11) DEFAULT NULL,
  `Direccion_Prov` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ID_Proveedor`, `Tipo_Doc_Prov`, `Num_Doc_Prov`, `Nombre_Prov`, `Apellido_Prov`, `Telefono_Prov`, `Direccion_Prov`) VALUES
(1, 'RUC', '20123456789', 'Juan', 'Gonzales', '987456321', 'Av. Industrial 120'),
(2, 'RUC', '20598712345', 'Rosa', 'Villanueva', '945612378', 'Jr. Comercio 450'),
(3, 'RUC', '20654123987', 'Luis', 'Paredes', '912345987', 'Av. Grau 980'),
(4, 'RUC', '20478965321', 'Elena', 'Torres', '986321547', 'Calle Central 210'),
(5, 'RUC', '20321456987', 'Marco', 'Sotomayor', '954789632', 'Av. Proveedores 330');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `ID_Servicio` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `Fecha_Servicio` datetime NOT NULL,
  `Total_Servicio` decimal(5,2) NOT NULL,
  `Cliente_Anonimo` tinyint(1) NOT NULL,
  `Estado_Servicio` varchar(30) NOT NULL,
  `Observaciones` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`ID_Servicio`, `ID_Cliente`, `Fecha_Servicio`, `Total_Servicio`, `Cliente_Anonimo`, `Estado_Servicio`, `Observaciones`) VALUES
(50, 1, '2025-02-10 09:00:00', 5.00, 0, 'Completado', 'Fotocopias simples'),
(51, 2, '2025-02-10 10:45:00', 5.50, 0, 'Completado', 'Impresiones varias'),
(52, 3, '2025-02-11 12:00:00', 4.00, 0, 'Completado', 'Anillado de trabajo'),
(53, 4, '2025-02-11 14:30:00', 6.00, 0, 'Completado', 'Plastificado de documentos'),
(54, 5, '2025-02-11 17:15:00', 4.00, 1, 'Completado', 'Copias varias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE `tipo_servicio` (
  `ID_TipoServicio` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Precio_unidad` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_servicio`
--

INSERT INTO `tipo_servicio` (`ID_TipoServicio`, `Descripcion`, `Precio_unidad`) VALUES
(1, 'Fotocopia Blanco y Negro', 0.20),
(2, 'Impresión Blanco y Negro', 0.30),
(3, 'Impresión a Color', 1.00),
(4, 'Anillado', 3.50),
(5, 'Plastificado', 2.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadesdemedida`
--

CREATE TABLE `unidadesdemedida` (
  `ID_UnidadM` int(11) NOT NULL,
  `Nombre_Uni` varchar(50) NOT NULL,
  `Descripcion_Uni` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidadesdemedida`
--

INSERT INTO `unidadesdemedida` (`ID_UnidadM`, `Nombre_Uni`, `Descripcion_Uni`) VALUES
(1, 'Unidad', 'Se usa para vender piezas individuales'),
(2, 'Paquete', 'Para productos que vienen en conjunto'),
(3, 'Caja', 'Para productos empacados en volumen');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombre_Usua` varchar(50) NOT NULL,
  `Contraseña_Usua` varchar(255) DEFAULT NULL,
  `Rol_Usua` varchar(30) NOT NULL,
  `Estado_Usua` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuario`, `Nombre_Usua`, `Contraseña_Usua`, `Rol_Usua`, `Estado_Usua`) VALUES
(1, 'Gabriel Vilcahuaman Lozano', '12345', 'Administrador', 1),
(2, 'Jhilmar Lobaton Abregu', '12345', 'Encargado de Compras', 1),
(3, 'Fabian Rojas Gutierrez', '12345', 'Vendedor', 1),
(4, 'Kody Santillan Trujillo', '12345', 'Encargado de Inventario', 1),
(5, 'admin', '240be518fabd2724ddb6f04eeb1da5', 'Administrador', 1),
(6, 'cajero', '1ed4353e845e2e537e017c0fac3a0d', 'Cajero', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_Venta` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `ID_Cotizacion` int(11) DEFAULT NULL,
  `Fecha_Venta` datetime NOT NULL,
  `Total_Venta` decimal(5,2) NOT NULL,
  `Estado_Venta` varchar(30) NOT NULL,
  `Observ_Venta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`ID_Venta`, `ID_Cliente`, `ID_Cotizacion`, `Fecha_Venta`, `Total_Venta`, `Estado_Venta`, `Observ_Venta`) VALUES
(21, 1, NULL, '2025-02-01 10:00:00', 10.90, 'Completado', 'Venta mostrador'),
(22, 2, NULL, '2025-02-01 11:30:00', 3.20, 'Completado', 'Venta rápida'),
(23, 3, NULL, '2025-02-01 14:00:00', 19.00, 'Completado', 'Cliente frecuente'),
(24, 4, NULL, '2025-02-02 09:15:00', 3.60, 'Completado', 'Venta regular'),
(25, 5, NULL, '2025-02-02 16:00:00', 8.50, 'Completado', 'Venta de tarde'),
(40, 2, 61, '2025-02-13 09:00:00', 12.00, 'Completado', 'Venta generada desde cotización 61'),
(41, 3, 62, '2025-02-13 10:30:00', 19.00, 'Completado', 'Venta generada desde cotización 62');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`ID_Compra`),
  ADD KEY `FK_Compra_Proveedor` (`ID_Proveedor`);

--
-- Indices de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`ID_Comprobante`),
  ADD KEY `FK_Cliente_Comprobante` (`ID_Cliente`),
  ADD KEY `FK_Comprobante_Compra` (`ID_Compra`),
  ADD KEY `FK_Servicio_Comprobante` (`ID_Servicio`),
  ADD KEY `FK_Venta_Comprobante` (`ID_Venta`);

--
-- Indices de la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD PRIMARY KEY (`ID_Cotizacion`),
  ADD KEY `FK_Cotizacion_Cliente` (`ID_Cliente`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`ID_DetalleCom`),
  ADD KEY `FK_Detalle_Compras` (`ID_Compra`),
  ADD KEY `FK_Detalle_Compras2` (`ID_Producto`);

--
-- Indices de la tabla `detalle_cotizacion`
--
ALTER TABLE `detalle_cotizacion`
  ADD PRIMARY KEY (`ID_DetalleCot`),
  ADD KEY `FK_Detalle_Cotizacion` (`ID_Producto`),
  ADD KEY `FK_Detalle_Cotizacion2` (`ID_Cotizacion`);

--
-- Indices de la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD PRIMARY KEY (`ID_Detalle_Ser`),
  ADD KEY `FK_Detalle_Servicio` (`ID_Servicio`),
  ADD KEY `FK_Detalle_Servicio2` (`ID_TipoServicio`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`ID_DetallVen`),
  ADD KEY `FK_Detalle_Venta` (`ID_Venta`),
  ADD KEY `FK_Detalle_Venta2` (`ID_Producto`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`ID_Inventario`),
  ADD KEY `FK_Compra_Inventario` (`ID_Compra`),
  ADD KEY `FK_Producto_Inventario` (`ID_Producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `FK_Producto_Categoria` (`ID_Categoria`),
  ADD KEY `FK_Producto_Unidad` (`ID_UnidadM`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`ID_Servicio`),
  ADD KEY `FK_Cliente_Servicio` (`ID_Cliente`);

--
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`ID_TipoServicio`);

--
-- Indices de la tabla `unidadesdemedida`
--
ALTER TABLE `unidadesdemedida`
  ADD PRIMARY KEY (`ID_UnidadM`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID_Venta`),
  ADD KEY `FK_Cliente_Venta` (`ID_Cliente`),
  ADD KEY `FK_Cotizacion_Venta` (`ID_Cotizacion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `FK_Compra_Proveedor` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`);

--
-- Filtros para la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD CONSTRAINT `FK_Cliente_Comprobante` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `FK_Comprobante_Compra` FOREIGN KEY (`ID_Compra`) REFERENCES `compras` (`ID_Compra`),
  ADD CONSTRAINT `FK_Servicio_Comprobante` FOREIGN KEY (`ID_Servicio`) REFERENCES `servicios` (`ID_Servicio`),
  ADD CONSTRAINT `FK_Venta_Comprobante` FOREIGN KEY (`ID_Venta`) REFERENCES `ventas` (`ID_Venta`);

--
-- Filtros para la tabla `cotizaciones`
--
ALTER TABLE `cotizaciones`
  ADD CONSTRAINT `FK_Cotizacion_Cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`);

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `FK_Detalle_Compras` FOREIGN KEY (`ID_Compra`) REFERENCES `compras` (`ID_Compra`),
  ADD CONSTRAINT `FK_Detalle_Compras2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `detalle_cotizacion`
--
ALTER TABLE `detalle_cotizacion`
  ADD CONSTRAINT `FK_Detalle_Cotizacion` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`),
  ADD CONSTRAINT `FK_Detalle_Cotizacion2` FOREIGN KEY (`ID_Cotizacion`) REFERENCES `cotizaciones` (`ID_Cotizacion`);

--
-- Filtros para la tabla `detalle_servicio`
--
ALTER TABLE `detalle_servicio`
  ADD CONSTRAINT `FK_Detalle_Servicio` FOREIGN KEY (`ID_Servicio`) REFERENCES `servicios` (`ID_Servicio`),
  ADD CONSTRAINT `FK_Detalle_Servicio2` FOREIGN KEY (`ID_TipoServicio`) REFERENCES `tipo_servicio` (`ID_TipoServicio`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `FK_Detalle_Venta` FOREIGN KEY (`ID_Venta`) REFERENCES `ventas` (`ID_Venta`),
  ADD CONSTRAINT `FK_Detalle_Venta2` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `FK_Compra_Inventario` FOREIGN KEY (`ID_Compra`) REFERENCES `compras` (`ID_Compra`),
  ADD CONSTRAINT `FK_Producto_Inventario` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_Producto_Categoria` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`),
  ADD CONSTRAINT `FK_Producto_Unidad` FOREIGN KEY (`ID_UnidadM`) REFERENCES `unidadesdemedida` (`ID_UnidadM`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `FK_Cliente_Servicio` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `FK_Cliente_Venta` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `FK_Cotizacion_Venta` FOREIGN KEY (`ID_Cotizacion`) REFERENCES `cotizaciones` (`ID_Cotizacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
