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
	<h1 class="display-3 text-muted text-center">USER FORM</h1>
	<form class="row form-sniped">
		<div class="col-md-6">
		  <label class="form-label">First Name</label>
		  <input type="text" class="form-control">
		</div>
		<div class="col-md-6">
		  <label class="form-label">Last Name</label>
		  <input type="text" class="form-control">
		</div>
		<div class="col-md-12">
		  <label class="form-label">Address</label>
		  <input type="text" class="form-control">
		</div>
		<div class="col-md-6">
		  <label class="form-label">E-mail</label>
		  <input class="form-control" type="email" name="email" placeholder="E-mail Address" required>
		  <div class="valid-feedback">Email field is valid!</div>
		  <div class="invalid-feedback">Email field cannot be blank!</div>
	 </div>
		</div>
		<div class="col-md-4">
		  <label class="form-label">DNI</label>
		  <input type="text" class="form-control" name="dni" placeholder="Introduce your DNI" 
		  pattern="[0-9]{8}[A-Za-z]{1}" title="Debe poner 8 números y una letra" />
		</div>
		<div class="col-md-2">
		  <label class="form-label">Rol</label>
		  <select class="form-control" id="rol">
			<option value="user">User</option>
			<option value="Admin">Admin</option>
			<option value="Manager">Manager</option>
		  </select>
		</div>
		<div class="col-md-6">
		  <label class="form-label">Password</label>
		  <input class="form-control" type="password" id="pass" name="password"
		  minlength="8" required>
		</div>
		<div class="col-md-6">
			<label class="form-label">Username</label>
			<input type="text" class="form-control">
		  </div>
		<div class="col-md-12">
		  <br>
		  <button class="btn btn-primary form-control">Submit</button>
		</div>
	</form>

</body>