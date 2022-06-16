package com.coffecomerce.servlet;


import com.coffecomerce.dao.Database;
import com.coffecomerce.dao.ProductDao;
import com.coffecomerce.dao.ProviderDao;
import com.coffecomerce.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/deleteProduct")
public class DeleteProduct extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        User currentUser = (User) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect("index.jsp");
        }

        String idProduct = request.getParameter("id_product");

        Database database = new Database();
        ProductDao productDao = new ProductDao(database.getConnection());
        try {
            productDao.deleteById(Integer.parseInt(idProduct));
            out.println("<a href=\"index.jsp\" class=\"btn btn-warning\" type=\"submit\">Borrado Correctamente</a>");
        } catch (SQLException sqle) {
            out.println("<a href=\"index.jsp\" class=\"btn btn-warning\" type=\"submit\">Se ha producido un error al conectar con la BBDD</a>");
            sqle.printStackTrace();
        }
    }
}
