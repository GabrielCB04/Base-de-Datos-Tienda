CREATE VIEW info_provedores AS
SELECT
P.idProveedor,
P.nombre AS nombre_proveedor,
P.contacto,
sum(cantidadvendida) AS total_ventas,
IFNULL(SUM(D.cantidaddevuelta), 0) AS total_productos_devueltos
FROM
Proveedores P
LEFT JOIN
Productos PR ON P.idProveedor = PR.idProveedor
LEFT JOIN
Ventas V ON PR.idProducto = V.idProducto
LEFT JOIN
Devoluciones D ON V.idVenta = D.idVenta
GROUP BY
P.idProveedor, P.nombre, P.contacto;
select * from info_provedores;
