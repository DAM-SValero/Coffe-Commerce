package com.coffecomerce.dao;

import java.sql.Connection;

public class UserDao {

    private Connection connection;

    /**
     * CONSTRUCTOR PARA CONECTAR CON LA BBDD
     */
    public UserDao(Connection connection) {
        this.connection = connection;
    }

}
