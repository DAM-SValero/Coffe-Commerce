package com.coffecomerce.dao;

import java.sql.Connection;

public class ProductDao {

    private Connection connection;

    /**
     * CONSTRUCTOR PARA CONECTAR CON LA BBDD
     */
    public ProductDao(Connection connection) {
        this.connection = connection;
    }

    /**
     * CONSTRUCTOR VACIO PARA USARLO CON LOS ARRAYLIST
     */
    public ProductDao() {

    }
}
