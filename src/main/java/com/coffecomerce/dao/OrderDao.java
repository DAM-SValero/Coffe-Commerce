package com.coffecomerce.dao;

import java.sql.Connection;

public class OrderDao {

    private Connection connection;

    public OrderDao (Connection connection){
        this.connection = connection;
    }
}
