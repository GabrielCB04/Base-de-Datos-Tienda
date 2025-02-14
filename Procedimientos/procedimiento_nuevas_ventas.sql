delimiter $
create procedure nuevas_ventas(
in ide_producto int,
in cantidad int
)
begin
declare cantidad_stock int;
start transaction;
select cantidadstock into cantidad_stock from productos where idProducto =
ide_producto;
if cantidad_stock >= cantidad then
update productos set cantidadstock = cantidadstock - cantidad where
idProducto = ide_producto;
insert into ventas(idProducto, cantidadVendida, fechaVenta) VALUES
(ide_producto, cantidad, CURRENT_DATE);

commit;
select 'Venta realizada exitosamente' as mensaje;
else
rollback;
select 'Venta no realizada por falta de stock' as mensaje;
end if;
end$
call nuevas_ventas(1,30)
select * from productos, ventas;
