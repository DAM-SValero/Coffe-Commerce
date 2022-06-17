package com.coffecomerce.servlet;

import com.coffecomerce.dao.CategoryDao;
import com.coffecomerce.dao.Database;
import com.coffecomerce.dao.ProductDao;
import com.coffecomerce.domain.Category;
import com.coffecomerce.domain.Product;
import com.coffecomerce.domain.Provider;
import com.coffecomerce.exception.ProductAlreadyExistException;
import com.coffecomerce.exception.UserAlredyExistException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/addProduct")
public class NewProductServlet extends HttpServlet {
    /**
     * doPost PORQUE ESTOY DANDO DE ALTA DESDE UN FOMULARIO DESDE product_form.jsp
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        /** Recuperamos datos del formulario */

        String action = request.getParameter("action");
        String productName = request.getParameter("productname");
        String country = request.getParameter("country");
        int category = Integer.parseInt(request.getParameter("idCategory"));
        String intensity = request.getParameter("intensity");
        String img = request.getParameter("img");
        double price = Double.parseDouble(request.getParameter("price"));
        String idProduct = request.getParameter("idProduct");

        Database database = new Database();
        ProductDao productDao = new ProductDao(database.getConnection());
        Product product = new Product(productName, country, intensity, price, category, img);

        try {
            if (action.equals("register")) {
                productDao.add(product);
                out.println("<a href=\"index.jsp\" class=\"btn btn-warning\" type=\"submit\">PRODUCTO Registrado Correctamente</a>");
            } else {
                product = new Product(productName, country, intensity, price, category, img);
                productDao.modifyId(Integer.parseInt(idProduct), product);
                out.println("<a href=\"index.jsp\" class=\"btn btn-warning\" type=\"submit\">PRDUCTO Modificado Correctamente</a>");
            }
        } catch (ProductAlreadyExistException  pae) {
            out.println("<a href=\"product_form.jsp\" class=\"btn btn-warning\" type=\"submit\">PRODUCTO ya existe en la Base de Datos</a>");
            pae.printStackTrace();
        } catch (SQLException sqe){
            out.println("<a href=\"product_form.jsp\" class=\"btn btn-warning\" type=\"submit\">ERROR conexion BBDDs</a>");
            sqe.printStackTrace();
        }


    }




}
