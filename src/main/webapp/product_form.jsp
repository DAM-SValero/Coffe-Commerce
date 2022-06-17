<%@ page import="com.coffecomerce.dao.Database" %>
<%@ page import="com.coffecomerce.dao.CategoryDao" %>
<%@ page import="com.coffecomerce.domain.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.coffecomerce.domain.User" %>
<%@ page import="java.io.File"%>
<%@ page import="com.coffecomerce.domain.Product" %>
<%@ page import="com.coffecomerce.dao.ProductDao" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.sql.SQLException" %>

<!-- Recuperamos la sesion y si es null lo redirect a login.jsp -->
<%
	User currentUser = (User) session.getAttribute("currentUser");
	if (currentUser == null || currentUser.equals("USER")) {
		response.sendRedirect("index.jsp");
	}

	String textButton = "";
	String idProduct = request.getParameter("id_product");
	Product product = null;
	if (idProduct !=null) {
		textButton = "Modify";
		Database database = new Database();
		ProductDao productDao = new ProductDao(database.getConnection());
		try {
			Optional<Product> optionalProduct = productDao.findById(Integer.parseInt(idProduct));
			product = optionalProduct.get();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
	} else {
		textButton = "Submit";
	}
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
	<script src="js/scripts.js"></script>
	
</head>

<body>
<!-- AJAX envio a formulario -->
<script type="text/javascript"> //!--Script de Ajax para asincronia de formulario con servidor-- >
$(document).ready(function () {
	$("form").on("submit", function (event) {
		event.preventDefault();
		var formValue = $(this).serialize();
		$.post("addProduct", formValue, function (data) {
			$("#result").html(data);
		});
	});
});
</script>
<jsp:include page="formheader.jsp" />
    <h1 class="display-3 text-muted text-center">PRODUCT FORM</h1>
	<form action="addProduct" method="post" class="row form-sniped">
		<div class="col-md-6">
		  <label class="form-label">Product Name</label>
		  <input type="text" name="productname" class="form-control" value="<% if (product != null) out.print(product.getProname()); %>">
		</div>

		<div class="col-md-6">
		  <label class="form-label">Country</label>
		  <input type="text" name="country" class="form-control" value="<% if (product != null) out.print(product.getCountry()); %>">
		</div>

		<div class="col-md-6">
			<select class="form-control w-50" id="idCategory" name="idCategory">
				<option> Category </option>
				<%
					Database databaseUser = new Database();
					CategoryDao categoryDao = new CategoryDao(databaseUser.getConnection());
					ArrayList<Category> categories = categoryDao.listAll();
					for (Category category : categories) {
						out.println("<option value=\"" + category.getIdCategory() + "\">" + category.getTipo() + "</option>");
					}
				%>
			</select>
	 	</div>

		<div class="col-md-6">
		  <label class="form-label">Price</label>
          <input type="text" name="price"  class="form-control" value="<% if (product != null) out.print(product.getPrice()); %>">
		</div>

		  <div class="col-md-6">
        		  <label class="form-label">Intensity</label>
        		  <select class="form-control" name="intensity">
        			<option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
        		  </select>
          </div>
          <div class="col-md-6">
               <label class="form-label">Img</label>
                 <select class="form-control" name="img">
                  		  <%
                  			File file = new File("../img");
                            String[] images = file.list();
                            for (String imageName : images) {
                               out.println("<option value=\"" + imageName + "\">" + imageName + "</option>");
                            }
                            %>
                </select>
          </div>



		<div class="col-md-12">
			<br>
			<input type="hidden" name="action" value="<% if (product != null) out.print("modify"); else out.print("register"); %>">
			<input type="hidden" name="idProduct" value="<% if (product != null) out.print(product.getIdProduct()); %>">
			<button class="btn btn-primary form-control"><%= textButton %></button>
		</div>
	</form>

</body>