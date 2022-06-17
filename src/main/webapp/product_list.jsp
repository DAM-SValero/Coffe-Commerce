<%@ page import="com.coffecomerce.domain.User" %>
<%@ page import="com.coffecomerce.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.coffecomerce.dao.ProductDao" %>
<%@ page import="com.coffecomerce.domain.Product" %>
<!-- Recuperamos la sesion y si es null lo redirect a login.jsp -->
<%
    User currentUser = (User) session.getAttribute("currentUser");
%>
<!-- FIN Recuperamos la sesion y si es null lo redirect a login.jsp -->
<jsp:include page="formheader.jsp" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Coffe-Commerce</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <!-- Core JS-->
    <script src="myscripts.js"></script>
</head>

<body>
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <%
                Database database = new Database(); //creamos la conexión con la BBDD
                ProductDao productDao = new ProductDao(database.getConnection()); //Creamos un productDao y le pasamos la conexion
                try {
                    List<Product> products = productDao.findAll();
                    for (Product product: products) {
            %>
            <div class="col mb-5">
                <div class="card h-100">

                    <!-- Product image-->
                    <img class="card-img-top" src="img/<%= product.getImg() %>" />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">

                            <!-- Product name-->
                            <h5 class="fw-bolder">NAME: <%= product.getProname() %></h5>
                            <!-- Product price-->
                            PRICE: <%= product.getPrice() %>
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="product_detail.jsp?id_product=<%= product.getIdProduct() %>">Product detail</a>
                        </div>
                    </div>
                </div>
            </div>
                    <%
                        }

                    } catch (SQLException sqle) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        Error al conectar con la BBDD
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
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
