# Documentación
## Relacion Autor - Libro - autor_libro
Autores y Libros estan relacionados con autor_libro de uno a muchos, ya que de un autor pueden haber muchos libros y de un libro puede haber muchos autores
## Relacion Editorial - Libro
Editorial esta relacionado con libros de uno a muchos, ya que una editorial puede tener muchos libros.
## Relacion Libros - Pedidos - Proceso
Libros y Pedidos estan relacionado con proceso de uno a muchos, ya que de libro se pueden hacer muchos pedidos y un pedido puede ser de muchos libros
## Relacion Clientes - Pedidos
Clientes esta relacionado con pedidos de uno a muchos, ya que en un cliente se pueden hacer muchos pedidos
## Relacion Transacciones - Pedidos
Pedidos esta relacionado de uno a uno con transacciones debido a que un pedido solo se puede hacer una transaccion

No hay tabla de busqueda ya que la propia tabla de Libros puede cumplir con eso mismo

## Restricciones y Validaciones
### Libro
Llave Primaria:
- id

Llaves Forenea:
- id_editorial_fk

Restriccion:
- isbn

### autor_libro
Llave Primaria:
- id

Llaves Forenea:
- id_libros_fk
- id_autores_fk

Restriccion:
- None

### autores
Llave Primaria:
- id

Llaves Forenea:
- None

Restriccion:
- None

### editorial
Llave Primaria:
- id

Llaves Forenea:
- None

Restriccion:
- None

### clientes
Llave Primaria:
- id

Llaves Forenea:
- None

Restriccion:
- correo

### pedidos
Llave Primaria:
- id

Llaves Forenea:
- id_cliente_fk

Restriccion:
- None

### proceso
Llave Primaria:
- id

Llaves Forenea:
- id_pedidos_fk
- id_libros_fk

Restriccion:
- None

### transacciones
Llave Primaria:
- id

Llaves Forenea:
- id_pedidos_fk

Restriccion:
- None
