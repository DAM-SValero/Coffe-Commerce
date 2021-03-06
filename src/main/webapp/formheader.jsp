<%@ page import="com.coffecomerce.domain.User" %>
<!-- Navigation-->
<!-- Recuperamos la sesion y si es null lo redirect a login.jsp -->
<%
    User currentUser = (User) session.getAttribute("currentUser");
%>
<!-- FIN Recuperamos la sesion y si es null lo redirect a login.jsp -->

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
                        <li><a class="dropdown-item" href="product_list.jsp" type="submit">All Products</a></li>
                        <li>
                            <hr class="dropdown-divider" />
                        </li>
                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                    </ul>
                </li>
            </ul>
            <%= new java.util.Date() %>

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
