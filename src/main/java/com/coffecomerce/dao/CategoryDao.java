package com.coffecomerce.dao;

import com.coffecomerce.domain.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoryDao {

    private Connection connection;

    public CategoryDao (Connection connection){
        this.connection = connection;
    }

    // Metodo AÑADIR CATEGORIA
    public void addCategory(Category category){
        //Creamos sentencia SQL
        String sql = "INSERT INTO category (tipo) VALUES ( ? )";

        try{
            //Lanzamos la sentencia a la BD
            PreparedStatement statement= connection.prepareStatement(sql);
            statement.setString(1,category.getTipo());
            statement.executeUpdate();
        }catch (SQLException sqe){
            sqe.printStackTrace();
            System.out.println(sqe);
        }
    }

    // Metodo MODIFICAR CATEGORIA
    public boolean modifyTipo(int idCategory, Category category) {
        int rows = 0;
        try {
            String sql = "UPDATE category SET tipo = ? WHERE id_category = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, category.getTipo());
            statement.setInt(2, category.getIdCategory());

            rows = statement.executeUpdate();

        } catch (SQLException sqe) {
            sqe.printStackTrace();
            System.out.println(sqe);
        }

        return rows == 1;
    }

    // Metodo BORRAR CATEGORIA

    public boolean deleteCategory(int idcategory) throws SQLException {
        String sql = "DELETE FROM category WHERE id_category = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idcategory);
        int rows = statement.executeUpdate();

        return rows == 1;
    }

    // Metodo LISTAR CATEGORIA

    public ArrayList<Category> listAll(){
        String sql = "SELECT * FROM category ORDER BY tipo";
        ArrayList<Category> usuario = new ArrayList<>();

        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Category category = new Category();
                category.setIdCategory(resultSet.getInt("id_category"));
                category.setTipo(resultSet.getString("tipo"));

                usuario.add(category);
            }
        }catch (SQLException sqe){
            sqe.printStackTrace();
        }

        return usuario;
    }
    //Metodo de resultados
    private Category fromResultSet(ResultSet resultSet) throws SQLException {
        Category category = new Category();

        category.setIdCategory(resultSet.getInt("id_category"));
        category.setTipo(resultSet.getString("tipo"));

        //Devuelve los resultados de la categoria
        return category;
    }


}
