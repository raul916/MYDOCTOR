<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    	request.getRequestDispatcher("Login.jsp").forward(request, response);
%>
<%} 
    else {
%>
<!DOCTYPE html>
<html>
<head>
	<title>Search Page</title>
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
<div>
	<div class="input-group-prepend">
	<span class="input-group-text"><i class="fas fa-user"></i></span>
	<h5 style="color:white;"><%=session.getAttribute("userid")%></h5 >
	<form method="POST" action="<%=request.getContextPath()%>/Logout"><button type="submit" class="btn float-right login_btn"> LogOut</button></form>
	</div>
</div>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card" id="a">
			<div class="card-header">
				<h3>Search Doctor</h3>
				
			</div>
			<div class="card-body">
				<form method="post" action="<%= request.getContextPath() %>/register">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-map-marker-alt"></i></span>
						</div>
						<input type="text" name="loc" class="form-control" placeholder="LOCATION" required>
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fa fa-stethoscope"></i></span>
						</div>
						<input type="text" name="spec" class="form-control" placeholder="SPECIALIZATION" required>
					</div>
					<div class="form-group">
						<input type="submit" name="submit" value="Search" class="btn float-right login_btn">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%
    }
%>