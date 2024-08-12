--En esta parte creamos la base de datos
create database SistemaReservasViajes;
go

--En esta parte usamos la base de datos
use SistemaReservasViajes;
go


--En esta sección vamos a hacer las creaciones de las tablas================================
--==========================================================================================


--En esta parte creamos la tabla Usuarios
create table Usuarios (
UsuarioID int identity (1,1) primary key,
Nombre varchar (100),
Correo varchar (100) unique,
Contraseña varchar (100),
Telefono varchar (50)
);
go

--En esta parte creamos la tabla Proveedores
create table Proveedores (
ProveedorID int identity (1,1) primary key,
Nombre varchar (100),
Tipo varchar (50),
Contacto varchar (100)
);
go

--En esta parte creamos la tabla Vuelos
create table Vuelos (
VueloID int identity (1,1) primary key,
ProveedorID int,
Origen varchar (100),
Destino varchar (100),
FechaHoraSalida datetime,
FechaHoraLlegada datetime,
Precio decimal (10,2),
foreign key (ProveedorID) references Proveedores (ProveedorID)
);
go

--En esta parte creamos la tabla Hoteles
create table Hoteles (
HotelID int identity (1,1) primary key,
ProveedorID int,
Nombre varchar (100),
Ubicacion varchar (100),
PrecioPorNoche decimal (10,2),
Disponibilidad int,
foreign key (ProveedorID) references Proveedores (ProveedorID)
);
go

--En esta parte creamos la tabla Automoviles
create table Automoviles (
AutosID int identity (1,1) primary key,
ProveedorID int,
Marca varchar (50),
Modelo varchar (50),
PrecioPorDia decimal (10,2),
Disponibilidad int,
foreign key (ProveedorID) references Proveedores (ProveedorID)
);
go

--En esta parte creamos la tabla PaquetesTurísticos
create table PaquetesTuristicos (
PaqueteID int identity (1,1) primary key,
ProveedorID int,
Descripcion varchar (255),
Precio decimal (10,2),
Disponibilidad int,
foreign key (ProveedorID) references Proveedores (ProveedorID)
);
go

--En esta parte creamos la tabla Reservas
create table Reservas (
ReservaID int identity (1,1) primary key,
UsuarioID int,
FechaReserva datetime,
Estado varchar (50),
foreign key (UsuarioID) references Usuarios (UsuarioID)
);
go

--En esta parte creamos la tabla Transacciones
create table Transacciones (
TransaccionID int identity (1,1) primary key,
ReservaID int,
Monto decimal (10,2),
FechaTransaccion datetime,
Tipo varchar (50),
foreign key (ReservaID) references Reservas (ReservaID)
);
go


--En esta sección vamos a hacer las insersiones de los datos en las tablas==================
--==========================================================================================


--En esta parte haremos las insersiones en la tabla Usuarios
insert into Usuarios (Nombre, Correo, Contraseña, Telefono) values 
('Josefina Montes','josefina@gmail.com','contraseña0','809-000-0000'),
('Juan Perez', 'juan@gmail.com','contraseña1','809-111-1111'),
('Maria Lopez','maria@gmail.com','contraseña2','809-222-2222'),
('Carlos Rivera','carlos@gmail.com','contraseña3','809-333-3333'),
('Ana Torres','ana@gmail.com','contraseña4','809-444-4444'),
('Pedro Martinez','pedro@gmail.com','contraseña5','809-555-5555'),
('Pablo Cabrera','pablo@gmail.com','contraseña6','809-666-6666'),
('Martina Gonzales','martina@gmail.com','contraseña7','809-777-7777'),
('Armando Matos','armando@gmail.com','contraseña8','809-888-8888'),
('Lucas Jimenez','lucas@gmail.com','contraseña9','809-999-9999');

--En esta parte haremos las insersiones en la tabla Proveedores
insert into Proveedores (Nombre, Tipo, Contacto) values
--Aerolínas
('Air Century','aerolinea','aircentury.com'),
('Sky High Aviation Services','aerolinea','skyhighdo.com'),
('American Airlines','aerolinea','aa.com'),
('Delta Air Lines','aerolinea','delta.com'),
('JetBlue Airways','aerolinea','jetblue.com'),
--Hoteles
('Casa de Campo Resort & Villas','hotel','casadecampo.com'),
('Excellence Punta Cana','hotel','excellenceresorts.com'),
('Hard Rock Hotel & Casino Punta Cana','hotel','hardrock.com'),
('Paradisus Palma Real Golf & Spa Resort','hotel','contacto@arolinea.com'),
('Santuary Cap Cana','hotel','melia.com'),
--RentaCars
('Avis Rent a Car','automovil','avis.com'),
('Budget Rent a Car','automovil','budget.com'),
('Hertz Rent a Car','automovil','hertz.com'),
('Europcar','automovil','europcar.com'),
('National Car Rental','automovil','nationalcar.com'),
--Paquetes
('Los 3 ojos Playa Santo Domingo, cenote y Cueva','paquete','viator.com'),
('Recorrido en bicicleta por la zona colonial','paquete','booking.com'),
('Relax en Samaná','paquete','viator.com'),
('Experiencia Todo Incluido en Puerto Plata','paquete','booking.com'),
('Paquete de Golf en Casa de Campo','paquete','booking.com');

--En esta parte haremos la insersión en la tabla Vuelos
insert into Vuelos (ProveedorID, Origen, Destino, FechaHoraSalida, FechaHoraLlegada, Precio) values
(1, 'Republica Dominicana','Puerto Rico','2024-07-20 08:00:00','2024-07 10:00:00', 200.00),
(1, 'Republica Dominicana','España','2024-08-15 09:00:00','2024-08-15 15:00:00', 800.00),
(1, 'Republica Dominicana','Londres','2024-12-10 12:00:00','2024-12-10 20:00:00', 2000.00),
(1, 'Republica Dominicana','Mexico','2024-04-08 12:00:00','2024-04-08 16:00:00', 500.00),
(1, 'Republica Dominicana','Francia','2024-06-08 04:00:00','2024-06-08 16:00:00', 1500.00);

--En esta parte haremos la insersión en la tabla de Hoteles
insert into Hoteles (ProveedorID, Nombre, Ubicacion, PrecioPorNoche, Disponibilidad) values
(2, 'Casa de Campo Resort & Villas', 'La Romana', 100.00, 30),
(2, 'Excellence Punta Cana', 'Punta Cana', 150.00, 25),
(2, 'Hard Rock Hotel & Casino Punta Cana', 'PuntaCana', 200.00, 20),
(2, 'Paradisus Palma Real Golf & Spa Resort', 'Punta Cana', 250.00, 15),
(2, 'Santuary Cap Cana', 'Punta Cana', 300.00, 10);

--En esta parte haremos la insersión en la tabla Automoviles
insert into Automoviles (ProveedorID, Marca, Modelo, PrecioPorDia, Disponibilidad) values
(3, 'BMW', 'X5', 250.00, 5),
(3, 'Polaris', 'Sportman 570', 100.00, 5),
(3, 'Jeep', 'Wrangler', 200.00, 6),
(3, 'Toyota', 'Hiace', 400.00, 5),
(3, 'Mercedes-Benz', 'Sprinter Minibus', 500.00, 5);

--En esta sección haremos la insersión en la tabla PaquetesTurísticos
insert into PaquetesTuristicos (ProveedorID, Descripcion, Precio, Disponibilidad) values
(4, 'Los 3 ojos Playa Santo Domingo', 500.00, 3),
(4, 'Recorrido en bicicleta por la zona colonial', 600.00, 6),
(4, 'Relax en Samana', 700.00, 9),
(4, 'Experiencia Todo Incluido en Puerto Plata', 800.00, 12),
(4, 'Paquete de Golf en Casa de Campo', 900.00, 15);

--En esta sección haremos la insersión en la tabla Reservas
insert into Reservas (UsuarioID, FechaReserva, Estado) values
(1, '2024-07-20', 'confirmada'),
(2, '2024-07-21', 'pendiente'),
(3, '2024-07-22', 'cancelada'),
(4, '2024-07-23', 'confirmada'),
(5, '2024-07-23', 'piendiente');

--En esta sección haremos la insersión en la tabla Transacciones
insert into Transacciones (ReservaID, Monto, FechaTransaccion, Tipo) values
(1, 200.00, '2024-07-20', 'vuelo'),
(2, 100.00, '2024-07-21', 'hotel'),
(3, 300.00, '2024-07-22', 'paquete'),
(4, 150.00, '2024-07-23', 'automovil');
