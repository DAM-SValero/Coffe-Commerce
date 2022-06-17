SET SERVEROUTPUT ON;

--Paso 1: Crear la secuencia por cada una de las 6 tablas que tengo 
-- SECUENCIA USERS
CREATE SEQUENCE COFFEE.SECUENCIAUSERS
   START WITH 1 -- Por donde empieza a contar la secuencia
   INCREMENT BY 1 -- Incremento
   MINVALUE 1 -- Valor mínimo
   NOCACHE
   NOCYCLE
   NOORDER;
   
--Paso 2: Crear el trigger por cada una da las tablas 
--TRIGGER USERS
CREATE OR REPLACE TRIGGER COFFEE.TRIGGER_USERS -- Nombre del trigger
   BEFORE INSERT -- Cuando se lanzara el trigger. Aquí se a puesto antes de insertar
   ON COFFEE.USERS -- Para asociar a la tabla QUE DESEAMOS
   REFERENCING NEW AS New OLD AS Old
   FOR EACH ROW
DECLARE
   tmpVar   NUMBER; -- Variable temporal para recoger el valor de la secuencia
BEGIN
   tmpVar := 0; --Inicializamos la variable a 0
  
   -- Obtenemos el valor de la secuencia
   SELECT SECUENCIAUSERS.NEXTVAL INTO tmpVar FROM DUAL;

   :NEW.ID_USER := tmpVar;

EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END;

-- SECUENCIA PROVIDERS
CREATE SEQUENCE COFFEE.SECUENCIAPROVIDERS
   START WITH 1 -- Por donde empieza a contar la secuencia
   INCREMENT BY 1 -- Incremento
   MINVALUE 1 -- Valor mínimo
   NOCACHE
   NOCYCLE
   NOORDER;
 
 --TRIGGER PROVIDERS
CREATE OR REPLACE TRIGGER COFFEE.TRIGGER_PROVIDERS -- Nombre del trigger
   BEFORE INSERT -- Cuando se lanzara el trigger. Aquí se a puesto antes de insertar
   ON COFFEE.PROVIDERS -- Para asociar a la tabla QUE DESEAMOS
   REFERENCING NEW AS New OLD AS Old
   FOR EACH ROW
DECLARE
   tmpVar   NUMBER; -- Variable temporal para recoger el valor de la secuencia
BEGIN
   tmpVar := 0; --Inicializamos la variable a 0
  
   -- Obtenemos el valor de la secuencia
   SELECT SECUENCIAPROVIDERS.NEXTVAL INTO tmpVar FROM DUAL;

   :NEW.ID_PROVIDER := tmpVar;

EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END;
 
 -- SECUENCIA CATEGORY
CREATE SEQUENCE COFFEE.SECUENCIACATEGORY
   START WITH 1 -- Por donde empieza a contar la secuencia
   INCREMENT BY 1 -- Incremento
   MINVALUE 1 -- Valor mínimo
   NOCACHE
   NOCYCLE
   NOORDER;
 
 --TRIGGER CATEGORY
CREATE OR REPLACE TRIGGER COFFEE.TRIGGER_CATEGORY -- Nombre del trigger
   BEFORE INSERT -- Cuando se lanzara el trigger. Aquí se a puesto antes de insertar
   ON COFFEE.CATEGORY -- Para asociar a la tabla QUE DESEAMOS
   REFERENCING NEW AS New OLD AS Old
   FOR EACH ROW
DECLARE
   tmpVar   NUMBER; -- Variable temporal para recoger el valor de la secuencia
BEGIN
   tmpVar := 0; --Inicializamos la variable a 0
  
   -- Obtenemos el valor de la secuencia
   SELECT SECUENCIACATEGORY.NEXTVAL INTO tmpVar FROM DUAL;

   :NEW.ID_CATEGORY := tmpVar;

EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END;

 -- SECUENCIA PRODUCTS
CREATE SEQUENCE COFFEE.SECUENCIAPRODUCTS
   START WITH 1 -- Por donde empieza a contar la secuencia
   INCREMENT BY 1 -- Incremento
   MINVALUE 1 -- Valor mínimo
   NOCACHE
   NOCYCLE
   NOORDER;
 
 --TRIGGER PRODUCTS
CREATE OR REPLACE TRIGGER COFFEE.TRIGGER_PRODUCTS -- Nombre del trigger
   BEFORE INSERT -- Cuando se lanzara el trigger. Aquí se a puesto antes de insertar
   ON COFFEE.PRODUCTS -- Para asociar a la tabla QUE DESEAMOS
   REFERENCING NEW AS New OLD AS Old
   FOR EACH ROW
DECLARE
   tmpVar   NUMBER; -- Variable temporal para recoger el valor de la secuencia
BEGIN
   tmpVar := 0; --Inicializamos la variable a 0
  
   -- Obtenemos el valor de la secuencia
   SELECT SECUENCIAPRODUCTS.NEXTVAL INTO tmpVar FROM DUAL;

   :NEW.ID_PRODUCT := tmpVar;

EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END;
 
 -- SECUENCIA ORDERS
CREATE SEQUENCE COFFEE.SECUENCIAORDERS
   START WITH 1 -- Por donde empieza a contar la secuencia
   INCREMENT BY 1 -- Incremento
   MINVALUE 1 -- Valor mínimo
   NOCACHE
   NOCYCLE
   NOORDER;
 
 --TRIGGER ORDERS
CREATE OR REPLACE TRIGGER COFFEE.TRIGGER_ORDERS -- Nombre del trigger
   BEFORE INSERT -- Cuando se lanzara el trigger. Aquí se a puesto antes de insertar
   ON COFFEE.ORDERS -- Para asociar a la tabla QUE DESEAMOS
   REFERENCING NEW AS New OLD AS Old
   FOR EACH ROW
DECLARE
   tmpVar   NUMBER; -- Variable temporal para recoger el valor de la secuencia
BEGIN
   tmpVar := 0; --Inicializamos la variable a 0
  
   -- Obtenemos el valor de la secuencia
   SELECT SECUENCIAORDERS.NEXTVAL INTO tmpVar FROM DUAL;

   :NEW.ID_ORDER := tmpVar;

EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END; 

-- SECUENCIA DETAILS
CREATE SEQUENCE COFFEE.SECUENCIADETAILS
   START WITH 1 -- Por donde empieza a contar la secuencia
   INCREMENT BY 1 -- Incremento
   MINVALUE 1 -- Valor mínimo
   NOCACHE
   NOCYCLE
   NOORDER;
 
 --TRIGGER DETAILS
CREATE OR REPLACE TRIGGER COFFEE.TRIGGER_DETAILS -- Nombre del trigger
   BEFORE INSERT -- Cuando se lanzara el trigger. Aquí se a puesto antes de insertar
   ON COFFEE.DETAILS -- Para asociar a la tabla QUE DESEAMOS
   REFERENCING NEW AS New OLD AS Old
   FOR EACH ROW
DECLARE
   tmpVar   NUMBER; -- Variable temporal para recoger el valor de la secuencia
BEGIN
   tmpVar := 0; --Inicializamos la variable a 0
  
   -- Obtenemos el valor de la secuencia
   SELECT SECUENCIADETAILS.NEXTVAL INTO tmpVar FROM DUAL;

   :NEW.ID_DETAIL := tmpVar;

EXCEPTION
   WHEN OTHERS
   THEN
      -- Consider logging the error and then re-raise
      RAISE;
END; 
 
 
 
   
-- Para Borrar la secuencia
DROP SEQUENCE COFFEE.SECUENCIAUSERS;

-- Para HABILITAR el Trigger
ALTER TRIGGER COFFEE.TRIGGER_users ENABLE;

-- Para Borrar el Trigger
DROP TRIGGER COFFEE.TRIGGER_users;