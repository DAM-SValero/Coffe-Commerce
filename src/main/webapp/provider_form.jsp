<%@ page import="com.coffecomerce.dao.Database" %>
<%@ page import="com.coffecomerce.domain.User" %>
<%@ page import="com.coffecomerce.domain.Provider" %>
<%@ page import="com.coffecomerce.dao.ProviderDao" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.sql.SQLException" %>
<!-- Recuperamos la sesion y si es null lo redirect a login.jsp -->
<%
	User currentUser = (User) session.getAttribute("currentUser");
	if (currentUser == null || currentUser.equals("USER")) {
		response.sendRedirect("index.jsp");
	}

	String textButton = "";
	String idProvider = request.getParameter("id_provider");
	Provider provider = null;
	if (idProvider !=null) {
		textButton = "Modify";
		Database database = new Database();
		ProviderDao providerDao = new ProviderDao(database.getConnection());
		try {
			Optional<Provider> optionalProvider = providerDao.findById(Integer.parseInt(idProvider));
			provider = optionalProvider.get();
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
		$.post("add-modify-provider", formValue, function (data) {
			$("#result").html(data);
		});
	});
});
</script>
<jsp:include page="formheader.jsp" />
    <h1 class="display-3 text-muted text-center">PROVIDER FORM</h1>
	<form action="add-modify-provider" method="post" class="row form-sniped">

		<div class="col-md-6">
		  <label class="form-label">Provider Name</label>
		  <input type="text" name="provider" class="form-control" value="<% if (provider != null) out.print(provider.getProvider()); %>">
		</div>

		<div class="col-md-6">
		  <label class="form-label">Cif</label>
		  <input type="text" name="cif" class="form-control" value="<% if (provider != null) out.print(provider.getCif()); %>">
		</div>

		<div class="col-md-6">
			<label class="form-label">Address</label>
			<input type="text" name="address" class="form-control" value="<% if (provider != null) out.print(provider.getAddress()); %>">
		</div>

		<div class="col-md-6">
			<label class="form-label">Country</label>
			<input type="text" name="country" class="form-control" value="<% if (provider != null) out.print(provider.getCountry()); %>">
		</div>

	
		<div class="col-md-12">
		  <br>
			<input type="hidden" name="action" value="<% if (provider != null) out.print("modify"); else out.print("register"); %>">
			<input type="hidden" name="idProvider" value="<% if (provider != null) out.print(provider.getIdProvider()); %>">
			<button class="btn btn-primary form-control"><%= textButton %></button>
		</div>
	</form>

</body>