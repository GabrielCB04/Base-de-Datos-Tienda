DELIMITER $
CREATE TRIGGER verificar_stock_despues_venta_devolucion
AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN
DECLARE producto_stock INT;
DECLARE producto_umbral INT;
SELECT cantidadStock INTO producto_stock FROM Productos WHERE idProducto =
NEW.idProducto;
SELECT cantidadStock * 0.15 INTO producto_umbral FROM Productos WHERE
idProducto = NEW.idProducto;
SET producto_stock = producto_stock - NEW.cantidadVendida;
IF producto_stock <= producto_umbral THEN
INSERT INTO alertas (idProducto, mensaje, fecha_alerta) VALUES
(NEW.idProducto, CONCAT('Stock por debajo del 15% del umbral mínimo. Stock
actual: ', producto_stock), NOW());

END IF;
END$