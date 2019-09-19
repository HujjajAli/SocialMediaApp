<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
	<%
	if(session.getAttribute("username") != null){
		
	}else{
		request.getRequestDispatcher("login.jsp").forward(request, response);
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
	
	<style type="text/css">
		body{padding-top:20px;}
		html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
	</style>

<title>Change Password Protocol</title>
</head>
<body class="w3-theme-l5">
	
	
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
				    	<h3 class="panel-title">Change Your Password</h3>
				 	</div>
				 	<div class="panel-body">
				 		<form action="PasswordController">
				 			<fieldset>
								<div class="form-group">
									<input type="password" name="oldpassword" class="form-control" placeholder="Old Password..." required>
								</div>
								<div class="form-group">
									<input type="password" name="newpassword" class="form-control" placeholder="New Password..." required>
								</div>
								<div class="form-group">
									<input type="password" name="confermpassword" class="form-control" placeholder="Conferm Password" required>
								</div>
								<input type="submit" value="Change Password" class="btn btn-lg btn-success btn-block">
							</fieldset>
						</form>
				 	</div>
			 	</div>
			</div>
		</div>
	</div>
	
</body>
</html>