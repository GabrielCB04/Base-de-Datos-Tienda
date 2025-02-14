CREATE TABLE Productos (
idProducto INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100),
precio DECIMAL(10, 2),
cantidadStock INT,
idProveedor INT,
FOREIGN KEY (idProveedor) REFERENCES Proveedores(idProveedor)
);
CREATE TABLE Proveedores (
idProveedor INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100),
contacto VARCHAR(100)
);
CREATE TABLE Ventas (
idVenta INT PRIMARY KEY AUTO_INCREMENT,
idProducto INT,
cantidadVendida INT,
fechaVenta DATE,
FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);
CREATE TABLE Devoluciones (
idDevolucion INT PRIMARY KEY AUTO_INCREMENT,
idVenta INT,
cantidadDevuelta INT,
fechaDevolucion DATE,
FOREIGN KEY (idVenta) REFERENCES Ventas(idVenta)
);
create table alertas(
idalerta int PRIMARY KEY AUTO_INCREMENT,
idProducto INT,
mensaje varchar(50),
fecha_alerta date,
FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);
CREATE TABLE Auditoria (
idAuditoria INT AUTO_INCREMENT PRIMARY KEY,

operacion VARCHAR(50),
idProveedor INT,
idProducto INT,
idVenta INT,
cantidadVendida int,
idDevolucion INT,
fecha datetime,
detalles varchar(50),
FOREIGN KEY (idProveedor) REFERENCES Proveedores(idProveedor),
FOREIGN KEY (idProducto) REFERENCES Productos(idProducto),
FOREIGN KEY (idVenta) REFERENCES Ventas(idVenta),
FOREIGN KEY (idDevolucion) REFERENCES Devoluciones(idDevolucion)
);
CREATE TABLE Registro_Auditoria (
idRegistroAuditoria INT AUTO_INCREMENT PRIMARY KEY,
operacion VARCHAR(50),
idProveedor INT,
idProducto INT,
idVenta INT,
cantidadVendida INT,
idDevolucion INT,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
detalles TEXT,
FOREIGN KEY (idProveedor) REFERENCES Proveedores(idProveedor),
FOREIGN KEY (idProducto) REFERENCES Productos(idProducto),
FOREIGN KEY (idVenta) REFERENCES Ventas(idVenta),
FOREIGN KEY (idDevolucion) REFERENCES Devoluciones(idDevolucion)
);
