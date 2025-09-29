CREATE TABLE `libros`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `titulo` VARCHAR(100) NOT NULL,
    `id_editorial_fk` BIGINT NOT NULL,
    `categoria` ENUM(
        'fantasia',
        'romance',
        'misterio',
        'filosofia'
    ) NOT NULL DEFAULT 'fantasia',
    `fecha_estreno` DATE NOT NULL,
    `isbn` BIGINT NOT NULL,
    `precio` INT NOT NULL,
    `cantidad` INT NOT NULL,
    `id_busqueda` BIGINT NOT NULL
);
ALTER TABLE
    `libros` ADD UNIQUE `libros_isbn_unique`(`isbn`);
CREATE TABLE `autores`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `fecha_nacimiento` DATE NOT NULL,
    `nacionalidad` VARCHAR(100) NOT NULL
);
CREATE TABLE `clientes`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `correo` VARCHAR(100) NOT NULL,
    `telefono` VARCHAR(10) NOT NULL,
    `direccion` VARCHAR(100) NOT NULL
);
CREATE TABLE `pedidos`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_cliente_fk` BIGINT NOT NULL,
    `fecha_compra` DATE NOT NULL,
    `estado` ENUM(
        'pendiente',
        'procesado',
        'completado'
    ) NOT NULL DEFAULT 'pendiente'
);
CREATE TABLE `transacciones`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_pedidos_fk` BIGINT NOT NULL,
    `metodo_pago` ENUM(
        'tarjeta de crédito',
        'PayPal',
        'nequi',
        'papel moneda'
    ) NOT NULL DEFAULT 'tarjeta de crédito'
);
CREATE TABLE `editorial`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
    `direccion` VARCHAR(100) NOT NULL
);
CREATE TABLE `proceso`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_pedidos_fk` BIGINT NOT NULL,
    `id_libros_fk` BIGINT NOT NULL,
    `cantidad` INT NOT NULL,
    `precio_unitario` INT NOT NULL,
    `sub_total` INT NOT NULL
);
CREATE TABLE `autor_libro`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_libros_fk` BIGINT NOT NULL,
    `id_autores_fk` BIGINT NOT NULL
);
ALTER TABLE
    `transacciones` ADD CONSTRAINT `transacciones_id_pedidos_fk_foreign` FOREIGN KEY(`id_pedidos_fk`) REFERENCES `pedidos`(`id`);
ALTER TABLE
    `libros` ADD CONSTRAINT `libros_id_editorial_fk_foreign` FOREIGN KEY(`id_editorial_fk`) REFERENCES `editorial`(`id`);
ALTER TABLE
    `proceso` ADD CONSTRAINT `proceso_id_pedidos_fk_foreign` FOREIGN KEY(`id_pedidos_fk`) REFERENCES `pedidos`(`id`);
ALTER TABLE
    `proceso` ADD CONSTRAINT `proceso_id_libros_fk_foreign` FOREIGN KEY(`id_libros_fk`) REFERENCES `libros`(`id`);
ALTER TABLE
    `pedidos` ADD CONSTRAINT `pedidos_id_cliente_fk_foreign` FOREIGN KEY(`id_cliente_fk`) REFERENCES `clientes`(`id`);
ALTER TABLE
    `autor_libro` ADD CONSTRAINT `autor_libro_id_libros_fk_foreign` FOREIGN KEY(`id_libros_fk`) REFERENCES `libros`(`id`);
ALTER TABLE
    `autor_libro` ADD CONSTRAINT `autor_libro_id_autores_fk_foreign` FOREIGN KEY(`id_autores_fk`) REFERENCES `autores`(`id`);