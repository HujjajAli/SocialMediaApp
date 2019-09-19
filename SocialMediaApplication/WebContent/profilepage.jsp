<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.socialmedia.datamodel.UserAccount"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="static_functions.tld" prefix="elf"%>
<%@ taglib uri="state_fun.tld" prefix="els"%>   
	<%
	if(session.getAttribute("username") != null){
		
	}else{
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	UserAccount user = (UserAccount)session.getAttribute("username");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- JQuery Library -->
	<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js"></script>

	<!-- Bootstrap JavaScript Library --> 
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

	<!-- Bootstrap CSS Library -->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css"> 
	
	<!-- Get Address Full Information Ajax Call Operation JavaScript -->
	<script type="text/javascript" src="js/addressinfo.js"></script>
	<!-- Setup Date in Information Model Ajax Call Operation JavaScript -->
	<script type="text/javascript" src="js/createdate.js"></script>
	
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
	</style>

<title>Profile Page</title>
</head>
<body class="w3-theme-l5">
	
	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-theme-d2 w3-left-align w3-large">
			<a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()">
				<i class="fa fa-bars"></i>
			</a>
			
			<a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Friends Book</a>
			<a href="ProfileController?action=findfreind" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Find Friends"><i class="fa fa-user-plus"></i></a>
			<a href="changepassword.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Change Your Password"><i class="fa fa-lock"></i></a>
  			<a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-envelope"></i></a>
  			
  			<div class="w3-dropdown-hover w3-hide-small">
  				<button class="w3-button w3-padding-large" title="Notifications">
  					<i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">5</span>
  				</button>
  				<div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      				<a href="#" class="w3-bar-item w3-button">3 New Followers</a>
      				<a href="#" class="w3-bar-item w3-button">Amjad Ali posted on your wall</a>
      				<a href="#" class="w3-bar-item w3-button">Abu Baker likes your post</a>
    			</div>
  			</div>
  			
  			<a href="LogoutController" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="Signout">
  				<i class="fa fa-sign-out"></i>
  			</a>
  			
		</div>
	</div>

	<!-- Navbar on small screens -->
	<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
	  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
	  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
	  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
	  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
	</div>

	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">
		<!-- The Grid -->
		<div class="w3-row">
			<!-- Left Column -->
    		<div class="w3-col m3">
    			<!-- Profile -->
      			<div class="w3-card w3-round w3-white">
      				<div class="w3-container">
      					<h4 class="w3-center"><%=user.getUserinfo().getFullname()%></h4>
      					
      					
      					<p class="w3-center"><a href="#profileimages" class="w3-button w3-theme-d1 w3-margin-bottom" data-toggle="modal">Change Image</a></p>
      					<hr>
      					<p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i><%=user.getUserinfo().getProfession()%></p>
         				<p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i><%=user.getUserinfo().getAddress()%></p>
         				<p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i><%=user.getUserinfo().getSdate()%></p>
         				<p><i class="fa fa-plus-square fa-fw w3-margin-right w3-text-theme"></i><a href="#informationform" id="loaddate" data-toggle="modal"> Edit Profile</a></p>
      				</div>
				</div>
				<br>
				
				<!-- Accordion -->
      			<div class="w3-card w3-round">
      				<div class="w3-white">
      					<button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align">
      						<i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i>My Groups
      					</button>
      					<div id="Demo1" class="w3-hide w3-container">
            				<p>Some text..</p>
          				</div>
          				<button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align">
          					<i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events
          				</button>
          				<div id="Demo2" class="w3-hide w3-container">
            				<p>Some other text..</p>
          				</div>
          				<button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align">
          					<i class="fa fa-users fa-fw w3-margin-right"></i> My Photos
          				</button>
          				<div id="Demo3" class="w3-hide w3-container">
          					<div class="w3-row-padding">
          						<br>
          						<div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
						         <div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
						         <div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
						         <div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
						         <div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
						         <div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
          					</div>
          				</div>
      				</div>
      			</div><!-- Accordian End -->
      			<br>
      			
      			<!-- Interests --> 
      			<div class="w3-card w3-round w3-white w3-hide-small">
      				<div class="w3-container">
      					<p>Interests</p>
      					<p>
				            <span class="w3-tag w3-small w3-theme-d5">News</span>
				            <span class="w3-tag w3-small w3-theme-d4">W3Schools</span>
				            <span class="w3-tag w3-small w3-theme-d3">Labels</span>
				            <span class="w3-tag w3-small w3-theme-d2">Games</span>
				            <span class="w3-tag w3-small w3-theme-d1">Friends</span>
				            <span class="w3-tag w3-small w3-theme">Games</span>
				            <span class="w3-tag w3-small w3-theme-l1">Friends</span>
				            <span class="w3-tag w3-small w3-theme-l2">Food</span>
				            <span class="w3-tag w3-small w3-theme-l3">Design</span>
				            <span class="w3-tag w3-small w3-theme-l4">Art</span>
				            <span class="w3-tag w3-small w3-theme-l5">Photos</span>
          				</p>
      				</div>
      			</div><!-- Interests End-->
      			<br>
      			
      			<!-- Alert Box -->
      			<div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        			<span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          				<i class="fa fa-remove"></i>
        			</span>
        			<p><strong>Hey!</strong></p>
        			<p>People are looking at your profile. Find out who.</p>
      			</div>
      			
			</div><!-- End Left Column -->
			
			<!-- Middle Column -->
    		<div class="w3-col m7">
    			
    			<div class="w3-row-padding">
		        	<div class="w3-col m12">
			          <div class="w3-card w3-round w3-white">
			            <div class="w3-container w3-padding">
			              <h6 class="w3-opacity">Hujjaj Ali How Are You Feeling Today</h6>
			              <p contenteditable="true" class="w3-border w3-padding">Status: Feeling Blue</p>
			              <button type="button" class="w3-button w3-theme"><i class="fa fa-pencil"></i>  Post</button> 
			            </div>
			          </div>
			        </div>
			      </div>
			      
			      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
			      	<img src="https://www.w3schools.com/w3images/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
			      	<span class="w3-right w3-opacity">1 min</span>
			      	<h4>John Doe</h4><br>
        			<hr class="w3-clear">
        			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut 
        			labore et dolore magna aliqua. Ut enim ad minim veniam, 
        			quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        			</p>
        			<div class="w3-row-padding" style="margin:0 -16px">
        				<div class="w3-half">
              				<img src="https://www.w3schools.com/w3images/lights.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
            			</div>
            			<div class="w3-half">
              				<img src="https://www.w3schools.com/w3images/nature.jpg" style="width:100%" alt="Nature" class="w3-margin-bottom">
          				</div>
        			</div>
        			<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
        			<button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button>
			      </div>
			      
			      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
			        <img src="https://www.w3schools.com/w3images/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
			        <span class="w3-right w3-opacity">16 min</span>
			        <h4>Jane Doe</h4><br>
			        <hr class="w3-clear">
			        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
			         	incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
			          	exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
			        </p>
			        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
			        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
			      </div>
			      
			      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
			        <img src="https://www.w3schools.com/w3images/avatar6.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
			        <span class="w3-right w3-opacity">32 min</span>
			        <h4>Angie Jane</h4><br>
			        <hr class="w3-clear">
			        <p>Have you seen this?</p>
			        <img src="https://www.w3schools.com/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
			        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
			         dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut 
			         aliquip ex ea commodo consequat.</p>
			        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
			        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
			      </div>
    			
    		</div><!-- End Middle Column -->
			
		</div>
	</div>
	
	
	<!-- Model For Information  Form Start --> 
	<div id="informationform" class="modal fade">
		<div class="modal-dialog">
				<div class="modal-content">
					<form action="ProfileController">
						<div class="modal-header">
							<button class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Edit Information</h4>
						</div>
						<div class="modal-body">
							<div class="form-group row">
									<div class="col-md-3">
										<label>Your Name</label>
									</div>
									<div class="col-md-3">
										<input type="text" name="fname" value="<%=user.getUserinfo().getFname()%>" class="form-control" placeholder="First Name" required>
									</div>
									<div class="col-md-3">
										<input type="text" name="mname" value="<%=user.getUserinfo().getMname()%>" class="form-control" placeholder="Middle Name" required>
									</div>
									<div class="col-md-3">
										<input type="text" name="lname" value="<%=user.getUserinfo().getLname() %>" class="form-control" placeholder="Last Name" required>
									</div>
							</div>
							<div class="form-group row">
								<div class="col-md-3 ">
									<label>Profession</label>
								</div>
								<div class="col-md-9">
									<input type="text" name="profession" value="<%=user.getUserinfo().getProfession()%>" class="form-control" placeholder="Profession" required>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-3 ">
									<label>Gender</label>
								</div>
								<div class="col-md-9">
									 <select name="gender" class="form-control"  required>
									 	<option value="">Select Your Gender</option>
									 	<option value="Male">Male</option>
									 	<option value="Female">Female</option>
									 	<option value="Other">Other</option>
									 </select>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-3 ">
									<label>Country</label>
								</div>
								<div class="col-md-9">
									<select name="country" id="country" class="form-control" required>
										<option value="">Select Your Country</option>
										<option value="Pakistan">Pakistan</option>
										<option value="India">India</option>
										<option value="Iran">Iran</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-3 ">
									<label>Province/State</label>
								</div>
								<div class="col-md-9">
									<select name="province" id="province" class="form-control" required>
										
									</select>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-3 ">
									<label>City</label>
								</div>
								<div class="col-md-9">
									<select name="city" id="city" class="form-control" required>
										
									</select>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-3">
									<label>Date of Birth</label>
								</div>
								<div class="col-md-3">
									<select name="day" class="form-control" id="dateday" required>
									</select>
								</div>
								<div class="col-md-3">
									<select name="month" class="form-control" required>
										<option value="">Month</option>
										<option value="January">January</option>
										<option value="February">February</option>
										<option value="March">March</option>
										<option value="April">April</option>
										<option value="May">May</option>
										<option value="March">March</option>
										<option value="June">June</option>
										<option value="July">July</option>
										<option value="August">August</option>
										<option value="September">September</option>
										<option value="October">October</option>
										<option value="November">November</option>
										<option value="December">December</option>
									</select>
								</div>
								<div class="col-md-3">
									<select name="year" class="form-control" id="dateyear" required>
									</select>
								</div>
							</div>
							
							<div class="form-group row">
								<div class="col-md-3 ">
									<label>User ID</label>
								</div>
								<div class="col-md-9">
									<input type="text" name="userid" value="<%=user.getId()%>" class="form-control" readonly>
								</div>
							</div>
							
						</div>
						<div class="modal-footer ">
							<div class="form-group row">
								<div class="col-md-6">
									<input type="submit" name="action" class="form-control btn-success" value="Save Information">
								</div>
								<div class="col-md-6">
									<input type="reset" class="form-control btn-success" value="Reset">
								</div>
							</div>
						</div>
					</form>
				</div>
		</div>
	</div>
	<!-- Model For Information  Form Start -->
	
	<div class="modal fade" id="profileimages">
		<div class="modal-dialog">
		<form action="#">
			<div class="modal-content">
				<div class="model-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Choose/Upload an Image</h4>
					<input type="file">
				</div>
				<div class="modal-body">
					<!-- IMages start -->
					
							<div class="w3-row-padding">
          						<br>
          						<div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
						         <div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
						         <div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
						         <div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
						         <div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
						         <div class="w3-half">
						             <img src="https://www.w3schools.com/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom">
						         </div>
          					</div>
					
					<!-- Images End -->
				</div>
				<div class="modal-footer">
					<input type="submit" class="form-control btn-success" value="Set as Profile Image">
				</div>
			</div>
			</form>
		</div>
	</div>
	
	
<script>
// Accordion
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme-d1";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme-d1", "");
    }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>
</body>
</html>