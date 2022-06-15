package com.coffecomerce;


import com.coffecomerce.dao.Database;
import com.coffecomerce.dao.ProductDao;
import com.coffecomerce.dao.UserDao;
import com.coffecomerce.domain.Product;
import com.coffecomerce.domain.User;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Menu {

    private Scanner keyboard;
    private Database database;
    private Connection connection;
    private User currentUser;


    private List<Product> catalagoProduct;


    public Menu() {
        keyboard = new Scanner(System.in);
        catalagoProduct = new ArrayList<>();
    }

    //MÉTODO PARA CONECTAR CON LA BBDD
    public void connect() {
        database = new Database();
        connection = database.getConnection();
    }

    public void showMenu() {
        //NADA MÁS ARRANCAR MENU CONECTAMOS CON LA BBDD MEDIANTE MÉTODO ANTERIOR connect
        connect();
        //login();

        String choice = null;

        do {
            System.out.println("Aplicación de cafe: ");
            System.out.println("1. Registrar Listar Productos: ");
            System.out.println("2. Registrar Listar: ");
            System.out.println("s. Salir");
            System.out.println("Opción: ");
            choice = keyboard.nextLine();

            switch (choice) {
                case "1":
                    showProduct(); //OK
                    break;
                case "2":
                    showUsers(); //OK
                    break;
            }
        } while (!choice.equals("s"));
    }



    private void showProduct() {
        ProductDao productDao = new ProductDao(connection);
        System.out.println("HOla");
        try {
            System.out.println("HOla");
            ArrayList<Product> products = productDao.findAll();
            System.out.println("HOla");
            for ( Product product : products) {
                System.out.println(product.getProname());
                System.out.println("HOla");
            }

        } catch (SQLException sqle) {
            System.out.println("No se ha podido conectar con el servidor de base de datos. Comprueba que los datos son correctos y que el servidor se ha iniciado");
            sqle.printStackTrace();  //PARA OBTENER LAS TRAZAS DE LA EXCEPCIÓN Y ASI LUEGO SEGUIR CON PRECISION EL ERROR
        }
    }

    private void showUsers() {
        UserDao userDao = new UserDao(connection);
        try {
            ArrayList<User> users = userDao.findAll();
            for ( User user : users) {
                System.out.println(user.getFirstname() + user.getSurname());
            }

        } catch (SQLException sqle) {
            System.out.println("No se ha podido conectar con el servidor de base de datos. Comprueba que los datos son correctos y que el servidor se ha iniciado");
            sqle.printStackTrace();  //PARA OBTENER LAS TRAZAS DE LA EXCEPCIÓN Y ASI LUEGO SEGUIR CON PRECISION EL ERROR
        }
    }

    private void showUsers2() {
        UserDao userDao = new UserDao(connection);
        try {
            ArrayList<User> users = userDao.findAll();
            for ( User user : users) {
                System.out.println(user.getFirstname() + user.getSurname());
            }

        } catch (SQLException sqle) {
            System.out.println("No se ha podido conectar con el servidor de base de datos. Comprueba que los datos son correctos y que el servidor se ha iniciado");
            sqle.printStackTrace();  //PARA OBTENER LAS TRAZAS DE LA EXCEPCIÓN Y ASI LUEGO SEGUIR CON PRECISION EL ERROR
        }
    }

}

