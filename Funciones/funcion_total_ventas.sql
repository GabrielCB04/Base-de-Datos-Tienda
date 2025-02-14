delimiter $
create function total_ventas_por_producto(ide_producto int)
returns int

begin
declare total_ventas int;
select sum(cantidadVendida) into total_ventas from ventas where idProducto =
ide_producto;
return total_ventas;
end$
delimiter ;
SELECT total_ventas_por_producto(1);
