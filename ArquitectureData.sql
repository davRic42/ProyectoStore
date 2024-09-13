CREATE DATABASE IF NOT EXISTS ArquitectureData;
USE ArquitectureData;
START TRANSACTION;
CREATE TABLE Usuario(
    idUsuario INTEGER PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR (25),
    Correo VARCHAR (50),
    Contraseña VARCHAR (25),
    TipoUsuario VARCHAR (50)
);
CREATE TABLE Notificaciones(
    idNotificacion INTEGER PRIMARY KEY AUTO_INCREMENT,
    MensajeNotificacion VARCHAR (255),
    FechaEnvio DATE,
    TipoNotificacion VARCHAR(50)
);
CREATE TABLE Productos(
    IdProducto INTEGER PRIMARY KEY AUTO_INCREMENT,
    NombreProducto VARCHAR (25),
    CategoriaProducto VARCHAR (25),
    Disponible BOOLEAN,
    Precio FLOAT,
    MetodoPago VARCHAR(50)
);
CREATE TABLE Promocion(
    idPromocion INTEGER PRIMARY KEY AUTO_INCREMENT,
    Descripcion VARCHAR (25),
    FechaInicio DATE,
    FechaFin DATE
);
CREATE TABLE Pedidos(
    idPedido INTEGER PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT,
    EstadoProducto BOOLEAN,
    PrecioTotal FLOAT,
    Cantidad INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);
CREATE TABLE Envio(
    idEnvio INTEGER PRIMARY KEY AUTO_INCREMENT,
    idPedido INT,
    Salida POINT,
    LLegada POINT,
    EstadoEnvio BOOLEAN,
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido)
);
CREATE TABLE Recomendaciones(
    idRecomendacion INTEGER PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT,
    idPedido INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido)
);
CREATE TABLE PersonalizacionProductos(
    idPersonalizacion INTEGER PRIMARY KEY AUTO_INCREMENT,
    idProducto INT,
    TipoPersonalizacion VARCHAR(50),
    Detalles VARCHAR (255),
    FOREIGN KEY (idProducto) REFERENCES Productos(IdProducto)
);