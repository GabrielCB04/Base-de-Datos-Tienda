# Base de Datos - Sistema de Gestión de Tienda de Alimentación

Este repositorio contiene el diseño, la documentación y los scripts SQL para la implementación de una base de datos relacional en **MySQL** orientada a la gestión de una tienda de alimentación (productos, proveedores, ventas y devoluciones).

## Contenido del Proyecto

* **Diseño**: Diagrama Entidad-Relación y modelo lógico de las tablas (`Diseño.pdf`).
* **Documentación**: Especificaciones del proyecto, uso y objetivo de la BBDD (`Documentacion.pdf`).
* **Scripts SQL**: Creación del esquema, inserción de datos y objetos programables organizados por carpetas (`Tablas`, `Vistas`, `Procedimientos`, `Funciones`, `Triggers`).

---

## Arquitectura y Objetos del Sistema

### 1. Tablas

Esquema relacional principal que da soporte al negocio:

* **`Proveedores`** y **`Productos`**: Catálogo de artículos vinculados a su proveedor, con precio y stock.
* **`Ventas`** y **`Devoluciones`**: Registro de cada operación con su fecha y cantidad.
* **`Alertas`**: Avisos generados automáticamente cuando el stock cae por debajo del umbral mínimo.
* **`Auditoria`** y **`Registro_Auditoria`**: Bitácora de operaciones realizadas sobre ventas y devoluciones.

### 2. Vistas (Views)

Diseñadas para simplificar el acceso a datos complejos y la generación de reportes:

* **`info_provedores`**: Cruce de proveedores con sus productos para mostrar total de unidades vendidas y devueltas por cada proveedor.
* **`ventas_total`**: Consolida por producto el número de ventas, las unidades vendidas y las unidades devueltas.

### 3. Procedimientos Almacenados (Stored Procedures)

Lógica de negocio encapsulada para garantizar la integridad de las transacciones:

* **`nuevas_ventas`**: Automatiza el flujo de venta dentro de una transacción: comprueba stock disponible, descuenta existencias y registra la venta, o hace `ROLLBACK` si no hay stock suficiente.
* **`devoluciones`**: Registra una devolución a partir del ID de venta, devuelve las unidades al stock del producto e inserta el movimiento en la tabla de devoluciones.

### 4. Funciones (Functions)

Encapsulamiento de cálculos frecuentes:

* **`total_ventas_por_producto`**: Devuelve la cantidad total vendida de un producto dado su ID.
* **`total_devoluciones_por_proveedor`**: Calcula el total de unidades devueltas asociadas a los productos de un proveedor concreto.

### 5. Triggers (Disparadores)

Automatización de auditoría y reglas críticas:

* **`auditoria_ventas`**: Tras cada nueva venta, registra automáticamente la operación en la tabla de auditoría con proveedor, producto y cantidad.
* **`registrar_devoluciones`**: Tras cada devolución, deja constancia en el registro de auditoría con todos los datos asociados a la venta original.
* **`verificar_stock_despues_venta_devolucion`**: Trigger de seguridad que genera una alerta automática cuando el stock de un producto queda por debajo del 15% tras una venta.
