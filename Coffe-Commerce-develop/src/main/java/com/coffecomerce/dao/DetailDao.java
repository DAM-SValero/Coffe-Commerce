package com.coffecomerce.dao;

import com.coffecomerce.domain.Detail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DetailDao {

    private Connection connection;

    public DetailDao (Connection connection){
        this.connection = connection;
    }

    /** Metodo AÑADIR DETAIL */
    public void addDetail(Detail detail){
        //Creamos sentencia SQL
        String sql = "INSERT INTO details (quantity) VALUES ( ? )";

        try{
            //Lanzamos la sentencia a la BD
            PreparedStatement statement= connection.prepareStatement(sql);
            statement.setInt(1,detail.getQuantity());
            statement.executeUpdate();
        }catch (SQLException sqe){
            sqe.printStackTrace();
            System.out.println(sqe);
        }
    }
    /** Metodo BORRAR DETAIL */

    public boolean deleteDetail(int iddetail) throws SQLException {
        String sql = "DELETE FROM details WHERE id_detail = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, iddetail);
        int rows = statement.executeUpdate();

        return rows == 1;
    }

    /**
     * Metodo LISTAR DETAILS
     */

    public ArrayList<Detail> listAll(){
        String sql = "SELECT * FROM details ORDER BY id_detail";
        ArrayList<Detail> details = new ArrayList<>();

        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Detail detail = new Detail();
                detail.setIdDetail(resultSet.getInt("id_detail"));
                detail.setQuantity(resultSet.getInt("quantity"));

                details.add(detail);
            }
        }catch (SQLException sqe){
            sqe.printStackTrace();
        }

        return details;
    }

    /** Metodo de resultados
     */
    private Detail fromResultSet(ResultSet resultSet) throws SQLException {
        Detail detail = new Detail();

        detail.setIdDetail(resultSet.getInt("id_detail"));
        detail.setQuantity(resultSet.getInt("quantity"));

        //Devuelve los resultados de la categoria
        return detail;
    }

}
