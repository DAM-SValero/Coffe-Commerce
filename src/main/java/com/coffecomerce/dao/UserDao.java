package com.coffecomerce.dao;

import com.coffecomerce.domain.User;
import com.coffecomerce.exception.UserAlredyExistException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

public class UserDao {

    private Connection connection;

    /**
     * CONSTRUCTOR PARA CONECTAR CON LA BBDD
     */
    public UserDao(Connection connection) {
        this.connection = connection;
    }

    /**
     * METODO PARA AÑADIR USUARIOS
     */
    public void add(User user) throws SQLException, UserAlredyExistException {
        if (existUsername(user.getUsername()))
            throw new UserAlredyExistException();

        String sql = "INSERT INTO users (firstname, surname, email, dni, username, pass) VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, user.getFirstname());
        statement.setString(2, user.getSurname());;
        statement.setString(3, user.getDni());
        statement.setString(4, user.getEmail());
        statement.setString(5, user.getUsername());
        statement.setString(6, user.getPass());
        statement.executeUpdate();
    }

    /**
     * METODO PARA MODIFICAR USUARIOS
     */
    public boolean modifyId(int idUser, User user) throws SQLException {
        String sql = "UPDATE users SET firstname = ?, surname = ?, dni = ?, email = ?, username = ?, pass = ?, rol = ? WHERE id_user = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, user.getFirstname());
        statement.setString(2, user.getSurname());
        statement.setString(3, user.getDni());
        statement.setString(4, user.getEmail());
        statement.setString(5, user.getUsername());
        statement.setString(6, user.getPass());
        statement.setString(7, user.getRol());
        statement.setInt(8, idUser);
        int rows = statement.executeUpdate();
        return rows ==1;
    }

    /**
     * METODO PARA BORRAR USUARIOS
     */
    public boolean deleteById(int idUser) throws SQLException {
        String sql = "DELETE FROM users WHERE id_user = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idUser);
        int rows = statement.executeUpdate();
        return rows ==1;
    }

    /**
     * METODO PARA OBTENER UN USUARIO POR SU USERNAME Y PASS
     * ENCRIPTAR LA PASS CON SHA1(?)
     * USAMOS ROL PARA LOS PERMISOS
     */
    public Optional<User> login(String username, String password) throws SQLException {
        String sql ="SELECT * FROM users WHERE username = ? AND pass = ?";
        User user = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);
        statement.setString(2, password);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            user = new User();
            user.setIdUser(resultSet.getInt("id_user"));
            user.setFirstname(resultSet.getString("firstname"));
            user.setUsername(resultSet.getString("username"));
            user.setRol(resultSet.getString("rol"));
        }
        statement.close();
        return Optional.ofNullable(user);
    }

    /**
     * METODO PARA BUSCAR POR USERNAME
     */
    public User findByUsername(String username) throws SQLException {
        String sql ="SELECT * FROM users WHERE username = ?";
        User user = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, username);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            user = fromResultSet(resultSet);
        }
        statement.close();
        return user;
    }

    /**
     * METODO PARA SI EL NOMBRE DE USUARIO YA EXISTE
     */
    private boolean existUsername(String username) throws SQLException{
        User user = findByUsername(username);
        return user != null;
    }

    /**
     * METODO PARA BUSCAR POR ID
     */
    public Optional<User> findById(int idUser) throws SQLException {
        String sql = "SELECT * FROM users WHERE id_user = ?";
        User user = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idUser);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            user = fromResultSet(resultSet);
        }
        statement.close();
        return Optional.ofNullable(user);
    }

    /**
     * PARA USARLO EN LOS LISTADOS QUE DEVUELVE ResultSet
     */
    private User fromResultSet(ResultSet resultSet) throws SQLException {
        User user = new User();
        user.setIdUser(resultSet.getInt("id_user"));
        user.setFirstname(resultSet.getString("firstname"));
        user.setSurname(resultSet.getString("surname"));
        user.setDni(resultSet.getString("dni"));
        user.setEmail(resultSet.getString("email"));
        user.setUsername(resultSet.getString("username"));
        user.setPass(resultSet.getString("pass"));
        user.setRol(resultSet.getString("rol"));
        return user;
    }
}
