package com.coffecomerce.dao;

import java.sql.Connection;

public class DetailDao {

    private Connection connection;

    public DetailDao (Connection connection){
        this.connection = connection;
    }
}
