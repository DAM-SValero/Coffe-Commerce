--Para crear el usuario y su contraseña 
CREATE USER COFFEE IDENTIFIED BY "1234";

--Para poder conectarnos a la BBDD
GRANT CREATE SESSION TO COFFEE;

--Permisos para crear tablas
GRANT CREATE TABLE TO COFFEE;

--Permisos de cuota para TableSpace System
ALTER USER COFFEE QUOTA 100M ON system;

--Roles
GRANT ALL PRIVILEGES TO COFFEE;

