INSERT INTO Proveedores (nombre, contacto) VALUES
('Proveedor A', 'proveedora@gmail.com'),
('Proveedor B', 'proveedorb@gmail.com'),
('Proveedor C', 'proveedorc@gmail.com'),
('Proveedor D', 'proveedord@gmail.com'),
('Proveedor E', 'proveedore@gmail.com');
INSERT INTO Productos (nombre, precio, cantidadStock, idProveedor) VALUES
('Manzanas', 2.50, 150, 1),
('Leche', 1.75, 200, 2),
('Pan', 1.20, 100, 4),
('Plátanos', 1.80, 120, 3),
('Cereal', 3.25, 80, 5),
('Huevos', 2.00, 150, 4),
('Papas', 1.20, 90, 3),
('Carne de res', 8.50, 60, 4),
('Arroz', 2.75, 120, 5),
('Aceite de oliva', 4.90, 80, 3);
INSERT INTO Ventas (idProducto, cantidadVendida, fechaVenta) VALUES
(1, 50, '2024-05-01'),
(2, 30, '2024-05-02'),
(3, 80, '2024-05-03'),
(4, 40, '2024-05-04'),
(5, 25, '2024-05-05'),
(6, 60, '2024-05-06');
INSERT INTO Devoluciones (idVenta, cantidadDevuelta, fechaDevolucion) VALUES
(1, 5, '2024-05-05'),
(3, 10, '2024-05-07'),
(2, 8, '2024-05-08'),
(5, 5, '2024-05-10'),
(6, 15, '2024-05-12');