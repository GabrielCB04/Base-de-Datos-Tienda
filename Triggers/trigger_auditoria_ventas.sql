DELIMITER $
CREATE TRIGGER auditoria_ventas
AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN
DECLARE proveedor INT;
SELECT idProveedor INTO proveedor FROM Productos WHERE idProducto =
NEW.idProducto;
INSERT INTO Auditoria (operacion, idProveedor, idProducto, idVenta,
cantidadVendida, fecha, detalles)
VALUES ('INSERT', proveedor, NEW.idProducto, NEW.idVenta,
NEW.cantidadVendida, NOW(), CONCAT('Venta realizada - ID de venta: ',
NEW.idVenta));
END;
$

DELIMITER $
CREATE TRIGGER registrar_devoluciones
AFTER INSERT ON Devoluciones
FOR EACH ROW
BEGIN
DECLARE idProd INT;
DECLARE cantVend INT;
DECLARE ventaId INT;
DECLARE proveedorId INT;
SELECT idProducto, cantidadVendida, idVenta INTO idProd, cantVend, ventaId
FROM Ventas
WHERE idVenta = NEW.idVenta;
SELECT idProveedor INTO proveedorId
FROM Productos
WHERE idProducto = idProd;

INSERT INTO Registro_Auditoria (operacion, idProveedor, idProducto,
cantidadVendida, idVenta, idDevolucion, fecha, detalles)
VALUES ('Devolución realizada', proveedorId, idProd, cantVend, ventaId,
NEW.idDevolucion, NOW(), CONCAT('Devolución realizada - ID de devolución: ',
NEW.idDevolucion));
END;
$
DELIMITER ;
