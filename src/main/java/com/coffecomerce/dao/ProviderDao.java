package com.coffecomerce.dao;

import java.sql.Connection;

public class ProviderDao {

    private Connection connection;

    /**
     * CONSTRUCTOR PARA CONECTAR CON LA BBDD
     */
    public ProviderDao(Connection connection) {
        this.connection = connection;
    }

}
