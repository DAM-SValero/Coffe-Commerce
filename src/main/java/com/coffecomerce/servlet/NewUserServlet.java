package com.coffecomerce.servlet;

import com.coffecomerce.dao.Database;
import com.coffecomerce.dao.UserDao;
import com.coffecomerce.domain.User;
import com.coffecomerce.exception.UserAlredyExistException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/new-user")
public class NewUserServlet extends HttpServlet {

    /**
     * doPost PORQUE ESTOY DANDO DE ALTA DESDE UN FOMULARIO DESDE newUser.JSP
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String firstname = request.getParameter("firstname"); //REQUEST PARA RECOGER LO QUE PROVIENE DEL USUARIO --> input name del formulario
        firstname = firstname.toUpperCase();
        String surname = request.getParameter("surname");
        surname = surname.toUpperCase();
        String dni = request.getParameter("dni");
        dni = dni.toUpperCase();
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        User user = new User(firstname, surname, dni, email, username, pass);

        Database database = new Database();
        UserDao userDao = new UserDao(database.getConnection());
        try {
            userDao.add(user);
            out.println("<a href=\"login_register.jsp\" class=\"btn btn-warning\" type=\"submit\">Usuario registrado correctamente</a>");
        } catch (UserAlredyExistException uaee) {
            out.println("<a href=\"login_register.jsp\" class=\"btn btn-warning\" type=\"submit\">Usuario ya existe en la Base de Datos</a>");
            uaee.printStackTrace();
        } catch (SQLException sqle) {
            out.println("<a href=\"index.jsp\" class=\"btn btn-warning\" type=\"submit\">Se ha producido un error al conectar con la BBDD</a>");
            sqle.printStackTrace();
        }
    }
}
