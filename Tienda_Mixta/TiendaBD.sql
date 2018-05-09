-- Universidad del Valle
-- Diseño de interfaz de usuario
-- Esquema SQL Proyecto

-- Integrantes:
-- Juan David Tello - 1628950 - 2711
-- Leidy Johanna Rivera Pazmiño - 1628002 - 2711
-- Kevin Eduardo Franco Lopez - 1629869 - 2711 

-------------------- TABLA PROVEEDOR-------------------------------

DROP SEQUENCE if exists id_proveedor;
CREATE SEQUENCE id_proveedor
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

DROP TABLE IF EXISTS proveedor cascade;
CREATE TABLE proveedor(
	id INTEGER DEFAULT nextval('id_proveedor'::regclass) NOT NULL,
	nombre VARCHAR (30) NOT NULL,
	contacto VARCHAR(50) NOT NULL,
	CONSTRAINT proveedor PRIMARY KEY (id)
);

-------------------- TABLA VISITAS-------------------------------

DROP TABLE IF EXISTS visita cascade;

CREATE TABLE visitas(
	nombre VARCHAR (30) NOT NULL,
	dia VARCHAR(50) NOT NULL,
	CONSTRAINT visitas PRIMARY KEY (nombre,dia),
	COSNTRAINT visitas_proveedor_fk foreign key(nombre) references proveedor(nombre)
);

-------------------- TABLA DEUDOR-------------------------------

DROP SEQUENCE if exists id_deudor;

CREATE SEQUENCE id_deudor
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

DROP TABLE IF EXISTS deudor cascade;

CREATE TABLE deudor(
	id integer DEFAULT nextval('id_deudor'::regclass) NOT NULL,
	nombre VARCHAR (30) NOT NULL,
	valor VARCHAR(50) NOT NULL,
	limite VARCHAR(50) NOT NULL,
	CONSTRAINT deudor PRIMARY KEY (id)
);

-------------------- TABLA HISTORIAL DEL DEUDOR-------------------------------

DROP TABLE IF EXISTS historialdeudor cascade;

CREATE TABLE historialdeudor(
	nombre VARCHAR (30) NOT NULL,
	valor VARCHAR(50) NOT NULL,
	tipo VARCHAR(50) NOT NULL,
	fecha DATE NOT NULL,
	COSNTRAINT historialdeudor_deudor_fk foreign key(nombre) references deudor(nombre)
);

-------------------- TABLA PRODUCTO-------------------------------

DROP SEQUENCE if exists id_producto;

CREATE SEQUENCE id_producto
	INCREMENT BY 1
	NO MAXVALUE
	NO MINVALUE
	CACHE 1;

DROP TABLE IF EXISTS producto cascade;

CREATE TABLE producto(
	id integer DEFAULT nextval('id_producto'::regclass) NOT NULL,
	nombre VARCHAR (30) NOT NULL,
	valor VARCHAR(50) NOT NULL,
	proveedor VARCHAR(50) NOT NULL,
	categoria VARCHAR(50) NOT NULL,
	CONSTRAINT area_pk PRIMARY KEY (nombre,proveedor),
	COSNTRAINT producto_proveedor_fk foreign key(proveedor) references proveedor(nombre)
	
);

-------------------- TABLA PEDIDO-------------------------------

DROP TABLE IF EXISTS pedido cascade;

CREATE TABLE pedido(
	fecha DATE NOT NULL,
	nombre VARCHAR (30) NOT NULL,
	valor VARCHAR(50) NOT NULL,
	proveedor VARCHAR(50) NOT NULL,
	cantidad VARCHAR(50) NOT NULL,
	valor VARCHAR(50) NOT NULL,
	total VARCHAR(50) NOT NULL,	
	CONSTRAINT area_pk PRIMARY KEY (proveedor,fecha),
	COSNTRAINT pedido_proveedor_fk foreign key(proveedor) references proveedor(nombre),
);

-------------------- TABLA HISTORIAL DEL PEDIDO-------------------------------

DROP TABLE IF EXISTS historialpedido cascade;

CREATE TABLE historialpedido(
	fecha DATE NOT NULL,
	proveedor VARCHAR(50) NOT NULL,
	total VARCHAR(50) NOT NULL,	
	CONSTRAINT area_pk PRIMARY KEY (proveedor,fecha),
	COSNTRAINT historialpedido_proveedor_fk foreign key(proveedor) references proveedor(nombre),
	COSNTRAINT historialpedido_pedido_fk foreign key(fecha) references pedido(fecha)
	
);


