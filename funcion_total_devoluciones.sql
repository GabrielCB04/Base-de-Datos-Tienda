delimiter $
create function total_devoluciones_por_proveedor(ide_proveedor int)
returns int
begin
declare total_devoluciones int;
select sum(d.cantidadDevuelta) into total_devoluciones
from Devoluciones d
inner join ventas v on d.idVenta = v.idVenta
inner join productos p on v.idProducto = p.idProducto
where p.idProveedor = ide_proveedor;
return total_devoluciones;
end$
delimiter ;
select total_devoluciones_por_proveedor(1);