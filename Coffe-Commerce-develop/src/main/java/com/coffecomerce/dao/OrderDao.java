package com.coffecomerce.dao;

import com.coffecomerce.domain.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDao {

    private Connection connection;

    public OrderDao (Connection connection){
        this.connection = connection;
    }

    /** Metodo AÑADIR ORDER */
    public void addOrder(Order order){
        //Creamos sentencia SQL
        String sql = "INSERT INTO orders (current_date,order_number,id_order) VALUES ( ? , ?, ? )";

        try{
            //Lanzamos la sentencia a la BD
            PreparedStatement statement= connection.prepareStatement(sql);
            statement.setDate(1,order.getFecha()); // TODO comprobar insercion fecha
            statement.setString(2, order.getOrderNumber());
            statement.setInt(3, order.getIdorder());
            statement.executeUpdate();
        }catch (SQLException sqe){
            sqe.printStackTrace();
            System.out.println(sqe);
        }
    }

    /** Metodo BORRAR ORDER */

    public boolean deleteOrder(int idorder) throws SQLException {
        String sql = "DELETE FROM orders WHERE id_order = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idorder);
        int rows = statement.executeUpdate();

        return rows == 1;
    }

    /** Metodo LISTAR CATEGORIA */

    public ArrayList<Order> listAll(){
        String sql = "SELECT * FROM orders ORDER BY id_order";
        ArrayList<Order> orders = new ArrayList<>();

        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Order order = new Order();
                order.setIdorder(resultSet.getInt("id_order"));
                order.setOrderNumber(resultSet.getString("order_number"));

                orders.add(order);
            }
        }catch (SQLException sqe){
            sqe.printStackTrace();
        }

        return orders;
    }

    /** Metodo de resultados
     */
    private Order fromResultSet(ResultSet resultSet) throws SQLException {
        Order order = new Order();

        order.setIdorder(resultSet.getInt("id_order"));
        order.setOrderNumber(resultSet.getString("order_number"));

        //Devuelve los resultados de la categoria
        return order;
    }

}
