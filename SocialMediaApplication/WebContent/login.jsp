<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	if(session.getAttribute("username") != null){
		request.getRequestDispatcher("profilepage.jsp").forward(request, response);
	}else{
		
	}
	%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<!-- JQuery Library -->
	<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js"></script>

	<!-- Bootstrap JavaScript Library -->
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

	<!-- Bootstrap CSS Library -->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/findfriendsliststyle.css">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
	<style>
		body{padding-top:20px;}
		html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
	</style>
<title>Login Page</title>
</head>
<body class="w3-theme-l5">
	
	
		
		<center><h1>Login To Your Account</h1></center>
		
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
			    		<h3 class="panel-title">${msg}</h3>
			 		</div>
			 		<div class="panel-body">
			 			<form action="LoginController">
			 				<fieldset>
				 				<div class="form-group">
									<input type="text" name="username" placeholder="Username..." class="form-control" required>
								</div>
								<div class="form-group">
									<input type="password" name="password" placeholder="Password..." class="form-control" required>
								</div>
								<div class="checkbox">
					    	    	<label>
					    	    		<input name="remember" type="checkbox" value="Remember Me"> Remember Me
					    	    	</label>
				    	    	</div>
								<input type="submit" value="Login" class="btn btn-lg btn-success btn-block">
							</fieldset>
						</form>
			 		</div>
				</div>
			</div>
		</div>	
	</div>
	
</body>
</html>