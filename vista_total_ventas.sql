CREATE VIEW ventas_total as
SELECT
p.nombre,
COUNT(v.idVenta) AS numero_ventas,
SUM(COALESCE(v.cantidadvendida, 0)) AS cantidad_vendida,
SUM(COALESCE(d.cantidaddevuelta, 0)) AS cantidad_devuelta
FROM
productos p
LEFT JOIN
ventas v ON p.idProducto = v.idProducto
LEFT JOIN
devoluciones d ON v.idVenta = d.idVenta
GROUP BY

p.nombre;
select * from ventas_total;