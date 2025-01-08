-- Añadir restricción:
-- En una misma compra, no se pueden superar las 50 unidades de un solo producto

ALTER TABLE COMPRA
ADD CONSTRAINT superar_50_unidades CHECK (cantidad < 50);
