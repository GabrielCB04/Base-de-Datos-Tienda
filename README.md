# Base de Datos - Sistema de Gestión de Tienda

Este repositorio contiene el diseño, la documentación y los scripts SQL para la implementación de una base de datos relacional orientada a la gestión de una tienda (ventas, inventario, clientes y proveedores).

## Contenido del Proyecto
* **Diseño**: Diagramas Entidad-Relación y modelos lógicos de las tablas.
* **Documentación**: Especificaciones del proyecto, uso y objetivo de la BBDD.
* **Scripts SQL**: Creación de esquema, inserción de datos y objetos programables.

---

## Arquitectura y Objetos del Sistema

### 1. Vistas (Views)
Diseñadas para simplificar el acceso a datos complejos y optimizar la generación de reportes:
* **`v_InventarioDisponible`**: Cruce de tablas para visualizar stock actual por categoría y alertas de reabastecimiento.
* **`v_ResumenVentas`**: Consolida información de tickets, incluyendo datos del cliente, productos y montos totales.
* **`v_HistorialClientes`**: Reporte detallado de la actividad de compra por usuario para análisis de fidelización.

### 2. Procedimientos Almacenados (Stored Procedures)
Lógica de negocio encapsulada para garantizar la integridad y seguridad de las transacciones:
* **`sp_RegistrarVenta`**: Automatiza el flujo de venta: valida cliente, registra el ticket y descuenta existencias en una sola transacción.
* **`sp_AgregarProducto`**: Procedimiento para el alta de artículos con validación de categorías y proveedores existentes.
* **`sp_ActualizarStock`**: Gestión centralizada para entradas de mercancía o ajustes de inventario.

### 3. Funciones (Functions)
Encapsulamiento de cálculos frecuentes:
* **`fn_CalcularTotalIVA`**: Calcula el importe de IVA basado en el tipo de producto.
* **`fn_VerificarStock`**: Función lógica que devuelve la disponibilidad de forma inmediata para evitar errores en el proceso de venta.

### 4. Triggers (Disparadores)
Automatización de auditoría y reglas críticas:
* **`tg_AuditoriaPrecios`**: Mantiene un historial de cambios de precios para análisis de inflación y márgenes.
* **`tg_ValidarStockNegativo`**: Trigger de seguridad que cancela cualquier operación que intente dejar el inventario en valores negativos.
