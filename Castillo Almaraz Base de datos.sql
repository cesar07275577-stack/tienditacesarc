-- PROYECTO FINAL: SISTEMA DE GESTION DE TIENDA ONLINE
-- ALUMNO: CASTILLO ALMARAZ CESAR ULISES
-- MATRICULA: 2243030160

-- FASE 1: CREACION DE LA BASE DE DATOS Y TABLAS
drop database if exists tienda_online;
create database tienda_online;
use tienda_online;

create table Categorias (
 id_categoria int auto_increment primary key,
 nombre varchar(50) not null unique,
 descripcion text
);

create table Productos (
 id_producto int auto_increment primary key,
 nombre varchar(100) not null,
 descripcion text,
 precio decimal(10,2) not null,
 stock int not null,
 id_categoria int,
 foreign key (id_categoria) references Categorias(id_categoria) on delete set null
);

create table Clientes (
 id_cliente int auto_increment primary key,
 nombre varchar(100) not null,
 correo varchar(100) not null unique,
 telefono varchar(20),
 direccion text
);

create table Pedidos (
 id_pedido int auto_increment primary key,
 id_cliente int not null,
 fecha_pedido datetime not null,
 estado enum('pendiente', 'enviado', 'entregado') not null default 'pendiente',
 foreign key (id_cliente) references Clientes(id_cliente) on delete cascade
);

create table Detalles_Pedido (
 id_detalle int auto_increment primary key,
 id_pedido int not null,
 id_producto int not null,
 cantidad int not null,
 precio_unitario decimal(10,2) not null,
 foreign key (id_pedido) references Pedidos(id_pedido) on delete cascade,
 foreign key (id_producto) references Productos(id_producto)
);

create table Resenas (
 id_reseña int auto_increment primary key,
 id_producto int not null,
 id_cliente int not null,
 calificacion int not null,
 comentario text,
 fecha datetime not null,
 foreign key (id_producto) references Productos(id_producto) on delete cascade,
 foreign key (id_cliente) references Clientes(id_cliente) on delete cascade
);

-- FASE 2: INSERCION DE LOS DATOS DE PRUEBA
insert into Categorias (nombre, descripcion) values
('Celulares', 'celulares de última generación y accesorios'),
('Laptops', 'Laptops para todo tipo'),
('Audio', 'Audífonos inalámbricos, bocinas y sistemas de sonido'),
('Monitores', 'Pantallas de alta resolución para computadoras'),
('Accesorios', 'Teclados, ratones, cables');

insert into Clientes (nombre, correo, telefono, direccion) values
('Cesar Castillo', 'cesar.qq@mail.com', '5551234533', 'navidad, CDMX'),
('ulises Castillo', 'ulises.cast@mail.com', '555762321', 'noche buena, cdmx'),
('santiago Almaraz', 'santi.za@mail.com', '5518901234', 'gaspar, Monterrey'),
('Laura Rodriguez', 'laura.rod@mail.com', '5523456789', 'Av. Juarez 101, cdmx'),
('maria hernandez', 'mari.hdez@mail.com', '5590123456', 'melchor, cdmx'),
('Juan Perez', 'juan.perez@mail.com', '5511223344', 'Colonia Centro, CDMX'),
('Pedro Miguel', 'pedro.mi@mail.com', '5599887766', 'Av. Hidalgo, Guadalajara'),
('Luis Miguel', 'luismi.sol@mail.com', '8122334455', 'San Pedro, Monterrey'),
('Diana Salazar', 'diana.sal@mail.com', '2221112223', 'Tepalcates, CDMX'),
('Carlos Quintana', 'carlos.q@mail.com', '9991112233', 'Romario, Merida'),
('Ana Gabriela', 'ana.gaby@mail.com', '5544332211', 'Del Valle, CDMX'),
('Roberta Gomez', 'roberta.o@mail.com', '5566778899', 'Insurgentes Sur, CDMX'),
('Carmen Guzman', 'carmelita@mail.com', '5577112233', 'Polanco, CDMX'),
('Vicente Perez', 'chente@mail.com', '3311223344', 'Huentitan, CDMX'),
('Alejandra Guzman', 'ale.guzman@mail.com', '5588990011', 'Coyoacan, CDMX');

insert into Productos (nombre, descripcion, precio, stock, id_categoria) values
('iPhone 17 Pro', 'Naranja brilloso, 128GB', 1234.00, 34, 1),
('Samsung Galaxy S24', 'Pantalla Dynamic AMOLED', 54321.00, 25, 1),
('MacBook Air', 'Liquid Retina 13 pulgadas', 3399.00, 13, 2),
('Lenovo Legion Slim', 'Ryzen 7, RTX 4060', 32399.00, 8, 2),
('Sony WH-1000XM5', 'Cancelacion de ruido', 6499.00, 25, 3),
('Bocina Kardon', 'Bluetooth contra agua', 2199.00, 40, 3),
('Monitor Samsung 45"', 'Resolucion 4K, IPS', 5899.00, 12, 4),
('Mouse Logitech', 'Mouse gamer programable', 5559.00, 50, 5),
('Teclado pionner', 'Teclado inalámbrico', 32454.00, 18, 5),
('iPhone 11', 'Negro, 128GB basico', 15000.00, 10, 1),
('Xiaomi Redmi Note 13', 'Gris, 256GB económico', 4500.00, 30, 1),
('Moto G84', 'Azul, buena camara', 5200.00, 15, 1),
('Huawei P60', 'Blanco, excelente zoom', 18000.00, 5, 1),
('Pixel 8 Pro', 'Celular de Google puro', 16500.00, 7, 1),
('Dell Inspiron 15', 'Para tareas escolares Core i3', 8500.00, 14, 2),
('HP Pavilion Gaming', 'Intel i5, GTX 1650', 14200.00, 6, 2),
('Asus ZenBook', 'Pantalla OLED delgada', 21000.00, 4, 2),
('Acer Aspire 3', 'Laptop muy basica economica', 6000.00, 20, 2),
('MacBook Pro', 'Para edicion de video profesional', 38000.00, 3, 2),
('Audifonos AirPods 3', 'Originales de Apple blancos', 3800.00, 18, 3),
('Audifonos JBL', 'Inalambricos economicos', 1200.00, 35, 3),
('Bocina Alexa Echo Dot', 'Asistente de voz inteligente', 1100.00, 50, 3),
('Barra de Sonido JBL', 'Para conectar a la television', 4500.00, 8, 3),
('Monitor Asus ROG"', 'Gaming de 144Hz para juego', 7500.00, 10, 4),
('Monitor Asus 3"', 'Basico para oficina o escuela', 2800.00, 22, 4),
('Monitor Dell 32"', 'Curvo para ver mas espacio', 9200.00, 5, 4),
('Mouse Inalambrico HP', 'Mouse de oficina sencillo', 350.00, 60, 5),
('Teclado Mecanico Razer', 'Luces RGB para juegos', 2400.00, 12, 5),
('Tapete para Mouse grande', 'Cubre todo el escritorio', 400.00, 45, 5),
('Cable HDMI 4K', 'Cable reforzado de 2 metros', 250.00, 100, 5);

insert into Pedidos (id_cliente, fecha_pedido, estado) values
(1, '2026-07-01 16:15:30', 'entregado'),
(2, '2026-07-03 11:30:00', 'entregado'),
(3, '2026-07-05 09:50:00', 'enviado'),
(4, '2026-07-08 11:29:00', 'pendiente'),
(5, '2026-07-10 19:15:00', 'pendiente'),
(1, '2026-07-11 16:00:00', 'pendiente'),
(6, '2026-07-12 10:00:00', 'entregado'),
(7, '2026-07-12 11:00:00', 'pendiente'),
(8, '2026-07-12 12:00:00', 'enviado'),
(9, '2026-07-12 13:00:00', 'pendiente'),
(10, '2026-07-12 14:00:00', 'enviado'),
(11, '2026-07-12 15:00:00', 'pendiente'),
(12, '2026-07-12 16:00:00', 'entregado'),
(13, '2026-07-12 17:00:00', 'pendiente'),
(14, '2026-07-12 18:00:00', 'enviado'),
(15, '2026-07-12 19:00:00', 'pendiente'),
(2, '2026-07-12 20:00:00', 'pendiente'),
(3, '2026-07-12 21:00:00', 'enviado'),
(4, '2026-07-12 22:00:00', 'pendiente'),
(5, '2026-07-12 23:00:00', 'entregado');

insert into Detalles_Pedido (id_pedido, id_producto, cantidad, precio_unitario) values
(1, 1, 1, 1234.00), (1, 8, 1, 5559.00),
(2, 3, 1, 3399.00), (2, 5, 1, 6499.00),
(3, 4, 1, 32399.00), (4, 2, 1, 54321.00),
(4, 6, 2, 2199.00), (5, 7, 1, 5899.00),
(6, 9, 1, 32454.00), (7, 10, 1, 15000.00),
(8, 11, 1, 4500.00), (9, 12, 1, 5200.00),
(10, 15, 1, 8500.00), (11, 16, 1, 14200.00),
(12, 20, 2, 3800.00), (13, 22, 1, 1100.00),
(14, 24, 1, 7500.00), (15, 25, 1, 2800.00),
(16, 27, 2, 350.00), (17, 14, 1, 16500.00),
(18, 18, 1, 6000.00), (19, 21, 1, 1200.00),
(20, 29, 1, 400.00), (20, 30, 3, 250.00),
(5, 13, 1, 18000.00);

insert into Resenas (id_producto, id_cliente, calificacion, comentario, fecha) values
(1, 1, 5, 'Excelente telefono muy coqueto', '2026-07-05 12:00:00'),
(8, 1, 4, 'Comodo para jugar con mi grupo de amigos otakus', '2026-07-06 14:22:00'),
(3, 2, 5, 'Ligera e ideal para mis clases de base de datos', '2026-07-06 10:30:00'),
(5, 2, 5, 'La cancelacion de ruido aisla todo', '2026-07-07 09:15:00'),
(10, 6, 4, 'cumple bien', '2026-07-12 10:30:00'),
(15, 10, 5, 'Excelente amigos', '2026-07-12 15:00:00'),
(14, 2, 4, 'Me gusta bastante', '2026-07-12 21:00:00'),
(18, 3, 3, 'Se siente algo lenta de plastico', '2026-07-12 21:30:00'),
(21, 4, 5, 'Economicos para mi presupuesto', '2026-07-12 22:30:00'),
(29, 5, 4, 'Cubre bien mi mesa de trabajo', '2026-07-12 23:45:00');
-- FASE 3: CONSULTAS ANALÍTICAS REQUERIDAS
select p.nombre, p.precio, c.nombre as categoria, p.stock
from Productos p join Categorias c on p.id_categoria = c.id_categoria
where p.stock > 0 order by c.nombre, p.precio asc;

select c.nombre, count(case when p.estado = 'pendiente' then 1 end) as pedidos_pendientes,
coalesce(sum(dp.cantidad * dp.precio_unitario), 0) as total_gastado
from Clientes c left join Pedidos p on c.id_cliente = p.id_cliente
left join Detalles_Pedido dp on p.id_pedido = dp.id_pedido group by c.id_cliente, c.nombre;

select p.nombre, avg(r.calificacion) as promedio_calif
from Productos p join Resenas r on p.id_producto = r.id_producto
group by p.id_producto, p.nombre order by promedio_calif desc limit 5;

-- FASE 4: PROCEDIMIENTOS ALMACENADOS CON VALIDACIÓN COMPLEJA
drop procedure if exists registrar_pedido_nuevo;
delimiter //
create procedure registrar_pedido_nuevo(in p_id_cli int, in p_id_prod int, in p_cant int)
begin
 declare v_pendientes int; declare v_stock int; declare v_precio decimal(10,2); declare v_id_ped int;
 select count(*) into v_pendientes from Pedidos where id_cliente = p_id_cli and estado = 'pendiente';
 select stock, precio into v_stock, v_precio from Productos where id_producto = p_id_prod;
 if v_pendientes >= 5 then
 signal sqlstate '45000' set message_text = 'el cliente ya tiene 5 pedidos pendientes';
 elseif v_stock < p_cant then
 signal sqlstate '45000' set message_text = 'no hay stock suficiente de este producto';
 else
 insert into Pedidos (id_cliente, fecha_pedido, estado) values (p_id_cli, now(), 'pendiente');
 set v_id_ped = last_insert_id();
 insert into Detalles_Pedido (id_pedido, id_producto, cantidad, precio_unitario) values (v_id_ped, p_id_prod, p_cant, v_precio);
 update Productos set stock = stock - p_cant where id_producto = p_id_prod;
 end if;
end //
delimiter ;

drop procedure if exists registrar_resena_verificada;
delimiter //
create procedure registrar_resena_verificada(in p_id_prod int, in p_id_cli int, in p_calif int, in p_comen text)
begin
 declare v_compro int;
 select count(*) into v_compro from Pedidos p join Detalles_Pedido dp on p.id_pedido = dp.id_pedido
 where p.id_cliente = p_id_cli and dp.id_producto = p_id_prod;
 if v_compro = 0 then
 signal sqlstate '45000' set message_text = 'no puedes dejar resena de un producto que no has comprado';
 else
 insert into Resenas (id_producto, id_cliente, calificacion, comentario, fecha) values (p_id_prod, p_id_cli, p_calif, p_comen, now());
 end if;
end //
delimiter ;

drop procedure if exists ajustar_stock_producto;
delimiter //
create procedure ajustar_stock_producto(in p_id_prod int, in p_nueva_cant int)
begin
 update Productos set stock = p_nueva_cant where id_producto = p_id_prod;
end //
delimiter ;

drop procedure if exists cambiar_estado_orden;
delimiter //
create procedure cambiar_estado_orden(in p_id_ped int, in p_estado enum('pendiente', 'enviado', 'entregado'))
begin
 update Pedidos set estado = p_estado where id_pedido = p_id_ped;
end //
delimiter ;

drop procedure if exists eliminar_resenas_producto;
delimiter //
create procedure eliminar_resenas_producto(in p_id_prod int)
begin
 delete from Resenas where id_producto = p_id_prod;
end //
delimiter ;

drop procedure if exists agregar_producto_seguro;
delimiter //
create procedure agregar_producto_seguro(in p_nom varchar(100), in p_desc text, in p_precio decimal(10,2), in p_stock int, in p_cat int)
begin
 declare v_existe int;
 select count(*) into v_existe from Productos where nombre = p_nom and id_categoria = p_cat;
 if v_existe > 0 then
 signal sqlstate '45000' set message_text = 'este producto ya existe in esta categoria';
 else
 insert into Productos (nombre, descripcion, precio, stock, id_categoria) values (p_nom, p_desc, p_precio, p_stock, p_cat);
 end if;
end //
delimiter ;

drop procedure if exists actualizar_datos_cliente;
delimiter //
create procedure actualizar_datos_cliente(in p_id_cli int, in p_tel varchar(20), in p_dir text)
begin
 update Clientes set telefono = p_tel, direccion = p_dir where id_cliente = p_id_cli;
end //
delimiter ;

drop procedure if exists reporte_inventario_bajo;
delimiter //
create procedure reporte_inventario_bajo()
begin
 select id_producto, nombre, stock from Productos where stock < 5;
end //
delimiter ;
