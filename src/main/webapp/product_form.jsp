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
    <h1 class="display-3 text-muted text-center">PRODUCT FORM</h1>
	<form action="addProduct" method="post" class="row form-sniped">
		<div class="col-md-6">
		  <label class="form-label">Product Name</label>
		  <input type="text" name="productname" class="form-control">
		</div>

		<div class="col-md-6">
		  <label class="form-label">Country</label>
		  <input type="text" name="country" class="form-control">
		</div>
		<div class="col-md-6">
		  <label class="form-label">Category</label>
          <input type="text" name="category" class="form-control">
		  
	 </div>
		</div>
		<div class="col-md-6">
		  <label class="form-label">Amount</label>
          <input type="number" name="price"  class="form-control"
           value="" data-type="currency"
          placeholder="10">
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
                  			<option value="1">1</option>
                              <option value="src/main/webapp/img/3avatar.png">img</option>
                              <option value="src/main/webapp/img/4avatar.png">img</option>
                  		  </select>
                    </div>


	
		<div class="col-md-12">
		  <br>
		  <button class="btn btn-primary form-control">Submit</button>
		</div>
	</form>

</body>