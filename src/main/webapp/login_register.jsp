<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Coffee-Commerce</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
	<script src="js/scripts.js"></script>
	
</head>

<body>
<!-- Código para enviar el formulario de forma asíncrona -->
<script type="text/javascript">
	$(document).ready(function() {
		$("form").on("submit", function(event) {
			event.preventDefault();
			var formValue = $(this).serialize();
			$.post("new-user", formValue, function(data) { <!-- servlet que recibe todos los datos del formulario -->
				$("#result").html(data); <!-- Lo usamos para enviar la respuesta al div en la misma página -->
			});
		});
	});
</script>
	<section class="section-log">
		<div class="container">
		  <div class="user signinBx">
			<div class="imgBx"><img src="img/coffee_7.jpg" alt="" /></div>
			<div class="formBx">
			  <form action="" onsubmit="return false;">
				<h2>Sign In</h2>
				<input type="text" name="" placeholder="Username" />
				<input type="password" name="" placeholder="Password" />
				<input type="submit" name="" value="Login" />
				<p class="signup">
				  Don't have an account ?
				  <a href="#" onclick="toggleForm();">Sign Up.</a>
				</p>
			  </form>
			</div>
		  </div>
		  <div class="user signupBx">
			<div class="formBx">
			  <form action="new-user" method="post">
				<h2>Create an account</h2>
				<input type="text" name="firstname" placeholder="Firtsname" />
			  	<input type="text" name="surname" placeholder="Surname" />
			  	<input type="text" name="dni" placeholder="DNI" />
				<input type="email" name="email" placeholder="Email Address" />
			  	<input type="text" name="username" placeholder="Username" />
				<input type="password" name="pass" placeholder="Create Password" />
				<input type="password" name="pass" placeholder="Confirm Password" />
				<input type="submit" class="btn btn-primary" value="Sign Up" />
				<p class="signup">
				  Already have an account ?
				  <a href="#" onclick="toggleForm();">Sign in.</a>
				</p>
			  </form>
			<div id="result"></div> <!-- Pinta el resultado del envio asincrono con AJAX -->
			</div>
			<div class="imgBx"><img src="img/coffee_5.jpg" alt="" /></div>
		  </div>
		</div>
	  </section>
	</body>

