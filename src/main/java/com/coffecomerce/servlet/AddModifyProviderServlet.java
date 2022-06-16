package com.coffecomerce.servlet;


import com.coffecomerce.dao.Database;
import com.coffecomerce.dao.ProviderDao;
import com.coffecomerce.domain.Provider;
import com.coffecomerce.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/add-modify-provider")
public class AddModifyProviderServlet extends HttpServlet {

    /**
     * doPost PORQUE ESTOY DANDO DE ALTA DESDE UN FOMULARIO DESDE provider_form.jsp
     * response.setContentType("text/html"); PONERLO SIEMPRE PARA QUE NOS DEVUELVA COMO HTML Y NO TEXTO SIMPLE
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        /**
         * SINO ESTA LOGEADO LO MANDO DE NUEVO AL INICIO DE SESIÓN
         */
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect("index.jsp");
        }

        /**
         * REQUEST PARA RECOGER LO QUE PROVIENE DEL USUARIO --> input name del formulario
         */
        String nameProvider = request.getParameter("provider");
        nameProvider = nameProvider.toUpperCase();
        String cif = request.getParameter("cif");
        cif = cif.toUpperCase();
        String address = request.getParameter("address");
        address = address.toUpperCase();
        String country = request.getParameter("country");
        address = address.toUpperCase();
        String action = request.getParameter("action");
        String idProvider = request.getParameter("idProvider");
        Provider provider = new Provider(nameProvider, cif, address, country);

        Database database = new Database(); //CREAMOS UN OBJETO Database PARA CONECTARNOS A LA BBDD
        ProviderDao providerDao = new ProviderDao(database.getConnection()); //CREAMOS EL OBJETO DAO CORRESPONDIENTE Y LE PASAMOS LA CONEXIÓN A LA BBDD
        try {
            if (action.equals("register")) {
                providerDao.add(provider);
                out.println("<a href=\"index.jsp\" class=\"btn btn-warning\" type=\"submit\">Proveedor Registrado Correctamente</a>");
            } else {
                provider = new Provider(nameProvider, cif, address, country);
                providerDao.modifyId(Integer.parseInt(idProvider), provider);
                out.println("<a href=\"index.jsp\" class=\"btn btn-warning\" type=\"submit\">Proveedor Modificado Correctamente</a>");
            }
        } catch (SQLException sqle) {
            out.println("<a href=\"index.jsp\" class=\"btn btn-warning\" type=\"submit\">Se ha producido un error al conectar con la BBDD</a>");
            sqle.printStackTrace(); //PINTAMOS LAS TRAZAS DEL ERROR
        }
    }
}
