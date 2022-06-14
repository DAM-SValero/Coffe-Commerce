package com.coffecomerce.dao;

import com.coffecomerce.domain.Provider;
import com.coffecomerce.domain.User;
import com.coffecomerce.exception.UserAlredyExistException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;

public class ProviderDao {

    private Connection connection;

    /**
     * CONSTRUCTOR PARA CONECTAR CON LA BBDD
     */
    public ProviderDao(Connection connection) {
        this.connection = connection;
    }

    /**
     * METODO PARA AÑADIR PROVEEDORES
     */
    public void add(Provider provider) throws SQLException {
        String sql = "INSERT INTO providers (provider, cif, address, country) VALUES (?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, provider.getProvider());
        statement.setString(2, provider.getCif());
        statement.setString(3, provider.getAddress());
        statement.setString(4, provider.getCountry());
        statement.executeUpdate();
    }

    /**
     * METODO PARA MODIFICAR PROVEEDORES
     */
    public boolean modifyId(int idProvider, Provider provider) throws SQLException {
        String sql = "UPDATE providers SET provider = ?, cif = ?, address = ?, country = ? WHERE idProvider = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, provider.getProvider());
        statement.setString(2, provider.getCif());
        statement.setString(3, provider.getAddress());
        statement.setString(4, provider.getCountry());
        int rows = statement.executeUpdate();
        return rows ==1;
    }

    /**
     * METODO PARA BORRAR PROVEEDORES
     */
    public boolean deleteById(int idProvider) throws SQLException {
        String sql = "DELETE FROM providers WHERE idProvider = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idProvider);
        int rows = statement.executeUpdate();
        return rows ==1;
    }

    /**
     * METODO PARA BUSCAR POR ID
     */
    public Optional<Provider> findById(int idProvider) throws SQLException {
        String sql = "SELECT * FROM providers WHERE idProvider = ?";
        Provider provider = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idProvider);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            provider = fromResultSet(resultSet);
        }
        statement.close();
        return Optional.ofNullable(provider);
    }

    /**
     * LISTADO DE LA TABLA PROVIDERS
     */
    public ArrayList<Provider> findAll() throws SQLException {
        String sql = "SELECT * FROM player ORDER BY FirstName";
        ArrayList<Provider> providers = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Provider provider = fromResultSet(resultSet);
            providers.add(provider);
        }
        statement.close();
        return providers;
    }

    /**
     * PARA USARLO EN LOS LISTADOS QUE DEVUELVE ResultSet
     */
    private Provider fromResultSet(ResultSet resultSet) throws SQLException {
        Provider provider = new Provider();
        provider.setIdProvider(resultSet.getInt("idProvider"));
        provider.setProvider(resultSet.getString("provider"));
        provider.setCif(resultSet.getString("cif"));
        provider.setAddress(resultSet.getString("address"));
        provider.setCountry(resultSet.getString("country"));
        return provider;
    }

}
