package com.coffecomerce.dao;

import java.sql.Connection;

public class CategoryDao {

    private Connection connection;

    public CategoryDao (Connection connection){
        this.connection = connection;
    }
}
