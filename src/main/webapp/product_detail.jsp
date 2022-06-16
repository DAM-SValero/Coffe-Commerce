<%@ page import="com.coffecomerce.domain.User" %>
<%@ page import="com.coffecomerce.dao.Database" %>
<%@ page import="com.coffecomerce.dao.ProductDao" %>
<%@ page import="com.coffecomerce.domain.Product" %>
<%@ page import="com.coffecomerce.dao.CategoryDao" %>
<%@ page import="com.coffecomerce.domain.Category" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.sql.SQLException" %>
<!-- Recuperamos la sesion y si es null lo redirect a login.jsp -->
<%
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || currentUser.equals("USER")) {
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<body>
<jsp:include page="formheader.jsp" />

<div class="container">
    <br>  <p class="text-center">DAM-SValero  /  Coffe-Commerce

    <hr>

    <div class="card">
        <%
            String productId = request.getParameter("id_product");
            Database database = new Database();
            ProductDao productDao = new ProductDao(database.getConnection());
            Product product = null;
            Database database2 = new Database();
            CategoryDao categoryDao = new CategoryDao(database2.getConnection());
            Category category = null;

            try {
                Optional<Product> optionalProduct = productDao.findById(Integer.parseInt(productId));
                product = optionalProduct.get();
                Optional<Category> optionalCategory = categoryDao.findById(product.getIdCategory());
                category = optionalCategory.get();
        %>
        <div class="row">
            <aside class="col-sm-5 border-right">
                <article class="gallery-wrap">
                    <div class="img-big-wrap">
                        <div> <a href="#"><img src="img/coffee_2.jpg"></a></div>
                    </div> <!-- slider-product.// -->
                    <div class="mt-4 d-flex justify-content-center">
                        <a href="add-modify-provider" type="submit" class="mx-3 btn btn-primary">Modify</a>
                        <a href="add-modify-provider" type="submit" class="mx-3 btn btn-danger">Delete</a>
                    </div>
                </article> <!-- gallery-wrap .end// -->
            </aside>
            <aside class="col-sm-7">
                <article class="card-body p-5">
                    <h3 class="title mb-3">PRODUCT</h3>

                    <p class="price-detail-wrap">
        <span class="price h3 text-warning">
            <span class="currency"><%= product.getProname() %></span>
        </span>
                    </p> <!-- price-detail-wrap .// -->
                    <dl class="item-property">
                        <dt>COUNTRY</dt>
                        <dd><p><%= product.getCountry() %> </p></dd>
                    </dl>
                    <dl class="param param-feature">
                        <dt>INTENSITY</dt>
                        <dd><%= product.getIntensity() %></dd>
                    </dl>  <!-- item-property-hor .// -->
                    <dl class="param param-feature">
                        <dt>PRICE / KG</dt>
                        <dd><%= product.getPrice() %></dd>
                    </dl>  <!-- item-property-hor .// -->

                    <dl class="param param-feature">
                        <dt>TYPE</dt>
                        <dd><%= category.getTipo() %></dd>

                    </dl>  <!-- item-property-hor .// -->

                    <hr>
                    <div class="row">
                        <div class="col-sm-5">
                            <dl class="param param-inline">
                                <dt>Quantity: </dt>
                                <input type="number" id="tentacles" name="tentacles" min="10" max="100">
                            </dl>  <!-- item-property .// -->
                        </div> <!-- col.// -->
                        <div class="col-sm-7">
                            <dl class="param param-inline">
                                <dt>INTENSITY: </dt>
                                <input type="number" min="0" max="10">
                            </dl>  <!-- item-property .// -->
                        </div> <!-- col.// -->

                    </div> <!-- row.// -->
                    <hr>
                </article> <!-- card-body.// -->
            </aside> <!-- col.// -->
        </div> <!-- row.// -->
    </div> <!-- card.// -->
    <%
    } catch (SQLException sqle) {
    %>
    <div class='alert alert-danger' role='alert'>Se ha producido al cargar los datos del producto</div>
    <%
        }
    %>

</div>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Svalero 2022</p>
    </div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>

</html>