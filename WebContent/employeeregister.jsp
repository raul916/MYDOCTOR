<!DOCTYPE html>
<html>
<head>
	<title>Sign up Page</title>
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card" id="b">
			<div class="card-header">
				<h3>Sign UP</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form method="post" action="<%= request.getContextPath() %>/register">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-edit"></i></span>
						</div>
						<input type="text" name="fname" class="form-control" placeholder="first name" required>
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-edit"></i></span>
						</div>
						<input type="text" name="lname" class="form-control" placeholder="last name" required>
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-address-book"></i></span>
						</div>
						<input type="text" name="age" onblur="validateage()" class="form-control" placeholder="age(18+)" required id="age">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-location-arrow"></i></span>
						</div>
						<input type="text" name="loc" class="form-control" placeholder="location" required>
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="email" name="email" class="form-control" placeholder="email" required>
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-address-book"></i></span>
						</div>
						<input type="text" name="mob" onblur="validatemob()" class="form-control" placeholder="mobile no." required id="mob">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" name="uname" class="form-control" placeholder="username" required>
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" name="pass" class="form-control" placeholder="password" required>
					</div>
					<div class="form-group">
						<input type="submit" name="submit" value="Sign Up" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Already Registered !! <a href="Login.jsp">Login in</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function validateage()
	{
		var age=document.getElementById("age").value;
		if(age<18)
		{	
			alert("INVALID AGE");
		}
	}
	
	function validatemob()
	{
		var mob=document.getElementById("mob").value;
		if(mob<=999999999 || mob>9999999999 )
		{	
			alert("INVALID MOBILE NO.");
		}
	}
	</script>
</body>
</html>