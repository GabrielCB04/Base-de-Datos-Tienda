DELIMITER $
CREATE PROCEDURE devoluciones(
IN ide_ventas INT
)
BEGIN
DECLARE cantidad_venta INT;
DECLARE ide_producto INT;
SELECT cantidadVendida, idProducto INTO cantidad_venta, ide_producto FROM
Ventas WHERE idVenta = ide_ventas;
UPDATE Productos SET cantidadStock = cantidadStock + cantidad_venta WHERE
idProducto = ide_producto;
INSERT INTO Devoluciones (idVenta, cantidadDevuelta, fechaDevolucion) VALUES
(ide_ventas, cantidad_venta, CURRENT_DATE);
END$
DELIMITER ;
call devoluciones(2)
select * from devoluciones, productos;