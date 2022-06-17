-- PARAMETRIZACION INSERCION INICAL DE DATOS

-- PARA PODER MOSTRAR DATOS EN PANTALLA
SET SERVEROUTPUT ON;

-- SCRIPT PARAMETRIZACION INICIAL INSERCION DE DATOS DISTTINTAS TABLAS
BEGIN    

 INSERT INTO users (firstname,surname,dni,email,username,pass,rol) VALUES ('admin','admin','1','a@a.es','admin','admin','admin');
 INSERT INTO users (firstname,surname,dni,email,username,pass,rol) VALUES ('ges','ges','2','ges@ges.es','ges','ges','ges');
 INSERT INTO users (firstname,surname,dni,email,username,pass,rol) VALUES ('user','user','3','user@user.es','user','user','user');
 INSERT INTO users (firstname,surname,dni,email,username,pass,rol) VALUES ('Vicente','Irlandes','523456A','vicente@user.es','vicente','vicente','user');
 INSERT INTO users (firstname,surname,dni,email,username,pass,rol) VALUES ('German','Madriles','3456789S','german@user.es','german','german','user');
 INSERT INTO users (firstname,surname,dni,email,username,pass,rol) VALUES ('Juansenen','Polaco','25252546F','juansenen@user.es','jsenen','jsenen','user');
 INSERT INTO users (firstname,surname,dni,email,username,pass,rol) VALUES ('Fernando','Islas','2323232D','ferna@user.es','fernando','fernando','user');
   
 INSERT INTO category (tipo) VALUES ('Supremo');
 INSERT INTO category (tipo) VALUES ('Selecto');
 INSERT INTO category (tipo) VALUES ('Torrefacto');
 INSERT INTO category (tipo) VALUES ('Expreso');
 INSERT INTO category (tipo) VALUES ('Grano');
 INSERT INTO category (tipo) VALUES ('Molido');
 
 INSERT INTO providers (provider,cif,address,country) VALUES ('Cafes MRW','B123487F','C/Romero 23','France');
 INSERT INTO providers (provider,cif,address,country) VALUES ('Tu CafeExcpres','B765487G','C/Principe 32','Holand');
 INSERT INTO providers (provider,cif,address,country) VALUES ('Coffee Guay','S123787F','Camino Sahara','Arabia Saudi');
 INSERT INTO providers (provider,cif,address,country) VALUES ('Take a Coffee','Z123487F','Cami del Mig','Africa');
 INSERT INTO providers (provider,cif,address,country) VALUES ('Coffe and Milk','D155587F','Isla del mar','Bahamas');
 INSERT INTO providers (provider,cif,address,country) VALUES ('Cafes Paco','D34765G','Puerto Llano','Spain');
 INSERT INTO providers (provider,cif,address,country) VALUES ('Saimaza','E157587F','Poligono Cartagena','Murcia');
 

  
 INSERT INTO products (proname,country,intensity,price,img,id_category) VALUES ('Colombo','Colombia','1',8,'Coffee_1.jpg','2');
 INSERT INTO products (proname,country,intensity,price,img,id_category) VALUES ('Torremar','Brasil','2',5,'Coffee_2.jpg','2');
 INSERT INTO products (proname,country,intensity,price,img,id_category) VALUES ('Surfsea','Guinea','3',7,'Coffee_3.jpg','3');
 INSERT INTO products (proname,country,intensity,price,img,id_category) VALUES ('Arrays','Africa','4',7,'Coffee_4.jpg','2');
 INSERT INTO products (proname,country,intensity,price,img,id_category) VALUES ('Stringes','Italy','2',3,'Coffee_5.jpg','3');
 INSERT INTO products (proname,country,intensity,price,img,id_category) VALUES ('ValenciaCoff','Spain','4',10,'Coffee_6.jpg','2');
 INSERT INTO products (proname,country,intensity,price,img,id_category) VALUES ('Cafe-Murcia','Spain','3',1,'Coffee_7.jpg','3');
 INSERT INTO products (proname,country,intensity,price,img,id_category) VALUES ('Valcafe','Spain','4',10,'Coffee_6.jpg','2');
 INSERT INTO products (proname,country,intensity,price,img,id_category) VALUES ('Valencia','Spain','4',10,'Coffee_6.jpg','1'); 
 INSERT INTO products (proname,country,intensity,price,img,id_category) VALUES ('La Burra','Jamaica','2',7,'Coffee_2.jpg','1');
 
INSERT INTO supllies (id_provider,id_product) VALUES ('1','1');
 INSERT INTO supllies (id_provider,id_product) VALUES ('2','2');
 INSERT INTO supllies (id_provider,id_product) VALUES ('3','3');
 INSERT INTO supllies (id_provider,id_product) VALUES ('4','4');
 INSERT INTO supllies (id_provider,id_product) VALUES ('5','5');
 INSERT INTO supllies (id_provider,id_product) VALUES ('6','6');
 INSERT INTO supllies (id_provider,id_product) VALUES ('7','7');
 INSERT INTO supllies (id_provider,id_product) VALUES ('3','8');
 INSERT INTO supllies (id_provider,id_product) VALUES ('2','9');
 INSERT INTO supllies (id_provider,id_product) VALUES ('3','10');

 COMMIT; 
 -- CASO DE EXCEPCION EN EL PROCESO
 EXCEPTION
        WHEN OTHERS THEN
        -- MENSAJE APARECERA SI HAY ERROR EN LA INSERCION DE DATOS
        DBMS_OUTPUT.PUT_LINE('ERROR EN LA INSERCION DE DATOS:'||SQLERRM); 
        DBMS_OUTPUT.PUT_LINE('SE DESHACEN LAS MODIFICACIONES');
        -- SE DESHACEN LAS MODIFICACIONES
        ROLLBACK;
END;

