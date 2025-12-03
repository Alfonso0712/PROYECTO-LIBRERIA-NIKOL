/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     26/11/2025 11:42:10                          */
/*==============================================================*/


drop table if exists Categorias;

drop table if exists Clientes;

drop table if exists Compras;

drop table if exists Comprobantes;

drop table if exists Cotizaciones;

drop table if exists Detalle_Compras;

drop table if exists Detalle_Cotizacion;

drop table if exists Detalle_Servicio;

drop table if exists Detalle_Venta;

drop table if exists Inventario;

drop table if exists Productos;

drop table if exists Proveedores;

drop table if exists Servicios;

drop table if exists Tipo_Servicio;

drop table if exists UnidadesDeMedida;

drop table if exists Usuarios;

drop table if exists Ventas;

/*==============================================================*/
/* Table: Categorias                                            */
/*==============================================================*/
create table Categorias
(
   ID_Categoria         int not null,
   Nombre_Cat           varchar(50) not null,
   Descripciom_Cat      varchar(50),
   primary key (ID_Categoria)
);

/*==============================================================*/
/* Table: Clientes                                              */
/*==============================================================*/
create table Clientes
(
   ID_Cliente           int not null,
   Tipo_Doc_Clie        varchar(30) not null,
   Num_Doc_Clie         varchar(11) not null,
   Nombre_Clie          varchar(50) not null,
   Apellido_Clie        varchar(50) not null,
   Telefono_Clie        char(11),
   Direccion_Clie       varchar(50),
   primary key (ID_Cliente)
);

/*==============================================================*/
/* Table: Compras                                               */
/*==============================================================*/
create table Compras
(
   ID_Compra            int not null,
   ID_Proveedor         int not null,
   Fecha_Compra         datetime not null,
   Total_Compra         decimal(5,2) not null,
   Estado_Compra        varchar(30) not null,
   Observ_Compra        varchar(50),
   primary key (ID_Compra)
);

/*==============================================================*/
/* Table: Comprobantes                                          */
/*==============================================================*/
create table Comprobantes
(
   ID_Comprobante       int not null,
   ID_Cliente           int not null,
   ID_Venta             int,
   ID_Servicio          int,
   ID_Compra            int,
   Tipo_Operacion       varchar(30) not null,
   Tipo_Comp            char(2) not null,
   Numero_serie         int not null,
   Numero_Comp          int not null,
   Fecha_Emision        datetime not null,
   Monto_Total_CDP      decimal(5,2) not null,
   Estado               bool not null,
   Observ_Comp          varchar(50),
   primary key (ID_Comprobante)
);

/*==============================================================*/
/* Table: Cotizaciones                                          */
/*==============================================================*/
create table Cotizaciones
(
   ID_Cotizacion        int not null,
   ID_Cliente           int not null,
   Fecha_Cot            datetime not null,
   Total_Cot            decimal(5,2) not null,
   Estado_Cot           bool not null,
   Observacion_Cot      varchar(50) not null,
   primary key (ID_Cotizacion)
);

/*==============================================================*/
/* Table: Detalle_Compras                                       */
/*==============================================================*/
create table Detalle_Compras
(
   ID_DetalleCom        int not null,
   ID_Compra            int not null,
   ID_Producto          int not null,
   Cant_Com             int not null,
   Subtotal_Com         decimal(5,2) not null,
   primary key (ID_DetalleCom)
);

/*==============================================================*/
/* Table: Detalle_Cotizacion                                    */
/*==============================================================*/
create table Detalle_Cotizacion
(
   ID_DetalleCot        int not null,
   ID_Producto          int not null,
   ID_Cotizacion        int not null,
   Cant_Cot             int not null,
   Subtotal_Cot         decimal(5,2) not null,
   primary key (ID_DetalleCot)
);

/*==============================================================*/
/* Table: Detalle_Servicio                                      */
/*==============================================================*/
create table Detalle_Servicio
(
   ID_Detalle_Ser       int not null,
   ID_Servicio          int not null,
   ID_TipoServicio      int not null,
   Cant_Serv            int not null,
   Subtotal_Serv        decimal(5,2) not null,
   primary key (ID_Detalle_Ser)
);

/*==============================================================*/
/* Table: Detalle_Venta                                         */
/*==============================================================*/
create table Detalle_Venta
(
   ID_DetallVen         int not null,
   ID_Venta             int not null,
   ID_Producto          int not null,
   Cant_Ven             int not null,
   Subtotal_Ven         decimal(5,2) not null,
   primary key (ID_DetallVen)
);

/*==============================================================*/
/* Table: Inventario                                            */
/*==============================================================*/
create table Inventario
(
   ID_Inventario        int not null,
   ID_Producto          int not null,
   ID_Compra            int not null,
   Fecha_Inv            datetime not null,
   Tipo_Movimiento      varchar(30) not null,
   Cantidad_Inv         int not null,
   Motivo_Movimiento    varchar(50) not null,
   primary key (ID_Inventario)
);

/*==============================================================*/
/* Table: Productos                                             */
/*==============================================================*/
create table Productos
(
   ID_Producto          int not null,
   ID_Categoria         int not null,
   ID_UnidadM           int not null,
   Nombre_Prod          varchar(50) not null,
   Descripcion_Prod     varchar(50),
   PrecioUnitario       decimal(5,2) not null,
   PrecioCompra         decimal(5,2),
   Stock                int not null,
   primary key (ID_Producto)
);

/*==============================================================*/
/* Table: Proveedores                                           */
/*==============================================================*/
create table Proveedores
(
   ID_Proveedor         int not null,
   Tipo_Doc_Prov        varchar(30) not null,
   Num_Doc_Prov         varchar(11) not null,
   Nombre_Prov          varchar(50) not null,
   Apellido_Prov        varchar(50) not null,
   Telefono_Prov        char(11),
   Direccion_Prov       varchar(50),
   primary key (ID_Proveedor)
);

/*==============================================================*/
/* Table: Servicios                                             */
/*==============================================================*/
create table Servicios
(
   ID_Servicio          int not null,
   ID_Cliente           int not null,
   Fecha_Servicio       datetime not null,
   Total_Servicio       decimal(5,2) not null,
   Cliente_Anonimo      bool not null,
   Estado_Servicio      varchar(30) not null,
   Observaciones        varchar(50),
   primary key (ID_Servicio)
);

/*==============================================================*/
/* Table: Tipo_Servicio                                         */
/*==============================================================*/
create table Tipo_Servicio
(
   ID_TipoServicio      int not null,
   Descripcion          varchar(50) not null,
   Precio_unidad        decimal(5,2) not null,
   primary key (ID_TipoServicio)
);

/*==============================================================*/
/* Table: UnidadesDeMedida                                      */
/*==============================================================*/
create table UnidadesDeMedida
(
   ID_UnidadM           int not null,
   Nombre_Uni           varchar(50) not null,
   Descripcion_Uni      varchar(50),
   primary key (ID_UnidadM)
);

/*==============================================================*/
/* Table: Usuarios                                              */
/*==============================================================*/
create table Usuarios
(
   ID_Usuario           int not null,
   Nombre_Usua          varchar(50) not null,
   Contraseña_Usua      varchar(30) not null,
   Rol_Usua             varchar(30) not null,
   Estado_Usua          bool not null,
   primary key (ID_Usuario)
);

/*==============================================================*/
/* Table: Ventas                                                */
/*==============================================================*/
create table Ventas
(
   ID_Venta             int not null,
   ID_Cliente           int not null,
   ID_Cotizacion        int,
   Fecha_Venta          datetime not null,
   Total_Venta          decimal(5,2) not null,
   Estado_Venta         varchar(30) not null,
   Observ_Venta         varchar(50),
   primary key (ID_Venta)
);

alter table Compras add constraint FK_Compra_Proveedor foreign key (ID_Proveedor)
      references Proveedores (ID_Proveedor) on delete restrict on update restrict;

alter table Comprobantes add constraint FK_Cliente_Comprobante foreign key (ID_Cliente)
      references Clientes (ID_Cliente) on delete restrict on update restrict;

alter table Comprobantes add constraint FK_Comprobante_Compra foreign key (ID_Compra)
      references Compras (ID_Compra) on delete restrict on update restrict;

alter table Comprobantes add constraint FK_Servicio_Comprobante foreign key (ID_Servicio)
      references Servicios (ID_Servicio) on delete restrict on update restrict;

alter table Comprobantes add constraint FK_Venta_Comprobante foreign key (ID_Venta)
      references Ventas (ID_Venta) on delete restrict on update restrict;

alter table Cotizaciones add constraint FK_Cotizacion_Cliente foreign key (ID_Cliente)
      references Clientes (ID_Cliente) on delete restrict on update restrict;

alter table Detalle_Compras add constraint FK_Detalle_Compras foreign key (ID_Compra)
      references Compras (ID_Compra) on delete restrict on update restrict;

alter table Detalle_Compras add constraint FK_Detalle_Compras2 foreign key (ID_Producto)
      references Productos (ID_Producto) on delete restrict on update restrict;

alter table Detalle_Cotizacion add constraint FK_Detalle_Cotizacion foreign key (ID_Producto)
      references Productos (ID_Producto) on delete restrict on update restrict;

alter table Detalle_Cotizacion add constraint FK_Detalle_Cotizacion2 foreign key (ID_Cotizacion)
      references Cotizaciones (ID_Cotizacion) on delete restrict on update restrict;

alter table Detalle_Servicio add constraint FK_Detalle_Servicio foreign key (ID_Servicio)
      references Servicios (ID_Servicio) on delete restrict on update restrict;

alter table Detalle_Servicio add constraint FK_Detalle_Servicio2 foreign key (ID_TipoServicio)
      references Tipo_Servicio (ID_TipoServicio) on delete restrict on update restrict;

alter table Detalle_Venta add constraint FK_Detalle_Venta foreign key (ID_Venta)
      references Ventas (ID_Venta) on delete restrict on update restrict;

alter table Detalle_Venta add constraint FK_Detalle_Venta2 foreign key (ID_Producto)
      references Productos (ID_Producto) on delete restrict on update restrict;

alter table Inventario add constraint FK_Compra_Inventario foreign key (ID_Compra)
      references Compras (ID_Compra) on delete restrict on update restrict;

alter table Inventario add constraint FK_Producto_Inventario foreign key (ID_Producto)
      references Productos (ID_Producto) on delete restrict on update restrict;

alter table Productos add constraint FK_Producto_Categoria foreign key (ID_Categoria)
      references Categorias (ID_Categoria) on delete restrict on update restrict;

alter table Productos add constraint FK_Producto_Unidad foreign key (ID_UnidadM)
      references UnidadesDeMedida (ID_UnidadM) on delete restrict on update restrict;

alter table Servicios add constraint FK_Cliente_Servicio foreign key (ID_Cliente)
      references Clientes (ID_Cliente) on delete restrict on update restrict;

alter table Ventas add constraint FK_Cliente_Venta foreign key (ID_Cliente)
      references Clientes (ID_Cliente) on delete restrict on update restrict;

alter table Ventas add constraint FK_Cotizacion_Venta foreign key (ID_Cotizacion)
      references Cotizaciones (ID_Cotizacion) on delete restrict on update restrict;

