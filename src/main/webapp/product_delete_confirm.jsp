<%@ page import="com.coffecomerce.domain.User" %>
<%@ page import="com.coffecomerce.dao.Database" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.coffecomerce.dao.ProductDao" %>
<%@ page import="com.coffecomerce.domain.Product" %>
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
            try {
                Optional<Product> optionalProduct = productDao.findById(Integer.parseInt(productId));
                product = optionalProduct.get();
        %>
        <div class="container">
            <h2>Delete Product</h2>
            <div class="card text-center">
                <div class="card-header">CONFIRM DELETE</div>
                <div class="card-body">
                    <a href="deleteProduct?id_product=<%= product.getIdProduct() %>" class="btn btn-danger">Si</a>
                    <a href="index.jsp" class="btn btn-outline-danger">No</a>
                </div>
            </div>
        </div>
        <div id="result"></div>
    </div>
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