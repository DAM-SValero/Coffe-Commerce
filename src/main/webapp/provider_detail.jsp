<%@ page import="com.coffecomerce.domain.User" %>
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
<jsp:include page="formheader.jsp"/>
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
                    }
                %>

            </form>
        </div>
    </div>
</nav>

    <div class="container">
        <br>  <p class="text-center">DAM-SValero  /  Coffe-Commerce
           
    <hr>
    
        
    <div class="card">
        <div class="row">
            <aside class="col-sm-5 border-right">
    <article class="gallery-wrap"> 
    <div class="img-big-wrap">
      <div> <a href="#"><img src="img/coffee_2.jpg"></a></div>
    </div> <!-- slider-product.// -->
    <div class="mt-4 d-flex justify-content-center">
               <button type="button" class="mx-3 btn btn-primary">Modify</button>
               <button type="button" class="mx-3 btn btn-danger">Delete</button>
              </div>
    </article> <!-- gallery-wrap .end// -->
            </aside>
            <aside class="col-sm-7">
    <article class="card-body p-5">
        <h3 class="title mb-3">PRONAME</h3>
    
    <p class="price-detail-wrap"> 
        <span class="price h3 text-warning"> 
            <span class="currency">PRICE US $</span><span class="num"> 0.00</span>
        </span> 
        <span>/per kg</span> 
    </p> <!-- price-detail-wrap .// -->
    <dl class="item-property">
      <dt>Description</dt>
      <dd><p>Here goes description consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco </p></dd>
    </dl>
    <dl class="param param-feature">
      <dt>Model#</dt>
      <dd>12345611</dd>
    </dl>  <!-- item-property-hor .// -->
    <dl class="param param-feature">
      <dt>Color</dt>
      <dd>Black and white</dd>
    </dl>  <!-- item-property-hor .// -->
    <dl class="param param-feature">
      <dt>Delivery</dt>
      <dd>Russia, USA, and Europe</dd>
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
                      <input type="number" min="0" max="10"
                </dl>  <!-- item-property .// -->
            </div> <!-- col.// -->
        </div> <!-- row.// -->
        <hr>
        <a href="#" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
        <a href="#" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
    </article> <!-- card-body.// -->
            </aside> <!-- col.// -->
        </div> <!-- row.// -->
    </div> <!-- card.// -->
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