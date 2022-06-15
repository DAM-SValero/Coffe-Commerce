package com.coffecomerce.exception;

public class ProductAlreadyExistException extends Exception{
    public ProductAlreadyExistException(String message) {
        super(message);
    }

    /**
     * SEGUNDO CONSTRUCTOR PARA PASARLE NOSOTROS EL MENSAJE PERSONALIZADO
     */
    public ProductAlreadyExistException() {
        super("El producto ya existe en la BBDD");
    }

}
