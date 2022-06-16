package com.coffecomerce.dao;

import com.coffecomerce.domain.Product;
import com.coffecomerce.exception.ProductAlreadyExistException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;

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

    /**
     * METODO PARA AÑADIR PRODUCTOS
     */
    public void add(Product product) throws SQLException, ProductAlreadyExistException {
        String sql = "INSERT INTO products (proname, country, intensity, price, id_category ) VALUES ( ? , ? , ? , ? , ? )";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, product.getProname());
        statement.setString(2, product.getCountry());
        statement.setString(3, product.getIntensity());
        statement.setDouble(4, product.getPrice());
        statement.setInt(5, product.getIdCategory());

        statement.executeUpdate();
    }

    /**
     * METODO PARA MODIFICAR PRODUCTOS
     */
    public boolean modifyId(int idProduct, Product product) throws SQLException {
        String sql = "UPDATE products SET proname = ?, country = ?, intensity = ?, price = ? WHERE id_Product = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, product.getProname());
        statement.setString(2, product.getCountry());
        statement.setString(3, product.getIntensity());
        statement.setDouble(4, product.getPrice());
        statement.setInt(5, idProduct);
        int rows = statement.executeUpdate();
        return rows ==1;
    }

    /**
     * METODO PARA BORRAR PRODUCTOS
     */
    public boolean deleteById(int idProduct) throws SQLException {
        String sql = "DELETE FROM products WHERE id_Product = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idProduct);
        int rows = statement.executeUpdate();
        return rows ==1;
    }

    /**
     * METODO PARA BUSCAR POR ID
     */
    public Optional<Product> findById(int idProduct) throws SQLException {
        String sql = "SELECT * FROM products WHERE id_Product = ?";
        Product product = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idProduct);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            product = fromResultSet(resultSet);
        }
        statement.close();
        return Optional.ofNullable(product);
    }

    /**
     * LISTADO DE LA TABLA PRODUCTS
     */
    public ArrayList<Product> findAll() throws SQLException {
        String sql = "SELECT * FROM products";
        ArrayList<Product> products = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Product product = fromResultSet(resultSet);
            products.add(product);
        }
        statement.close();
        return products;
    }

    /**
     * PARA USARLO EN LOS LISTADOS QUE DEVUELVE ResultSet
     */
    private Product fromResultSet(ResultSet resultSet) throws SQLException {
        Product product = new Product();

        product.setIdProduct(resultSet.getInt("id_product"));
        product.setIdCategory(resultSet.getInt("id_category"));
        product.setProname(resultSet.getString("proname"));
        product.setCountry(resultSet.getString("country"));
        product.setIntensity(resultSet.getString("intensity"));
        product.setPrice(resultSet.getInt("price"));
        return product;
    }
}
