<%@ page import="com.coffecomerce.domain.User" %>
<%@ page import="com.coffecomerce.dao.Database" %>
<%@ page import="com.coffecomerce.dao.ProductDao" %>
<%@ page import="com.coffecomerce.domain.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<!-- Recuperamos la sesion y si es null lo redirect a login.jsp -->
<%
    User currentUser = (User) session.getAttribute("currentUser");
%>
<!-- FIN Recuperamos la sesion y si es null lo redirect a login.jsp -->

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
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="index.jsp">Coffe-Commerce</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">All Products</a></li>
                            <li>
                                <hr class="dropdown-divider" />
                            </li>
                            <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                            <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                        </ul>
                    </li>
                </ul>

                <form class="d-flex">
                    <!-- <button class="btn btn-outline-dark" type="submit">
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button> -->
                    <%
                        if ((currentUser !=null)) {
                    %>
                    <h4 class="alert-heading">!!!!WELCOME!!!! <% if (currentUser != null) out.print(currentUser.getFirstname()); %></h4>
                    <div class="">
                        <a href="logout" type="submit" class="btn btn-light">LogOff</a>
                    </div>
                    <%
                        } else {
                    %>
                    <div class="">
                        <a href="login_register.jsp" type="submit" class="btn btn-light"> LogIn / Register </a>
                    </div>
                    <%
                    }
                    %>


                </form>
            </div>
        </div>
    </nav>
    <!-- Header-->

    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">DAM & DAW SValero / Coffe-Commerce

                </h1>
                <p class="lead fw-normal text-white-50 mb-0">We have a selection of more than 100
                    coffees to suit every taste, both espresso and filter coffee. You can find
                    excellent Italian espresso as well as fresh roasted coffee from small Nordic
                    coffee roasteries.</p>
            </div>
        </div>
    </header>
    <!-- Section-->
    <section class="py-5">

        <div class="container px-4 px-lg-5 mt-5">
         <button type="button" class="btn-lg m-4 btn btn-outline-secondary">+ Add Product</button>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                <div class="col mb-5">

                    <div class="card h-100">
                        <%
                            Database database2 = new Database(); //creamos la conexión con la BBDD
                            ProductDao productDao2 = new ProductDao(database2.getConnection()); //Creamos un productDao y le pasamos la conexion
                            try {
                                List<Product> products = productDao2.findAll();
                                for (Product product: products) {
                        %>
                        <!-- Product image-->
                        <img class="card-img-top" src="img/coffee_1.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">

                                <!-- Product name-->
                                <h5 class="fw-bolder">Nombre:<%= product.getProname() %></h5>
                                <!-- Product price-->
                                <%= product.getPrice() %>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="product_detail.jsp?id_product=<%= product.getIdProduct() %>">Product detail</a>
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