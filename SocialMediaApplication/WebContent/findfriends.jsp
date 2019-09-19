<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="static_functions.tld" prefix="elf"%>
<%@ page import="com.socialmedia.datamodel.UserAccount"%>   

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

	<!-- JQuery Library -->
	<script type="text/javascript" src="bootstrap/js/jquery-3.2.1.min.js"></script>

	<!-- Bootstrap JavaScript Library -->
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	
	<!-- User Follow UnFollow Operation JavaScript -->
	<script type="text/javascript" src="js/userfollowing.js"></script>

	<!-- Bootstrap CSS Library -->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
	
	<!-- Costume Css File For This Page -->
	<!-- <link rel="" type="" href="css/findfriendsstyle.css">-->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/findfriendsliststyle.css">

<title>Find Friends</title>
</head>
<body class="w3-theme-l5">
	
	<center><h1>Suggested People On Platform</h1></center>
	
	<!-- Start Here 
	<div class="container">
    	<div class="col-sm-12">
    		<div class="bs-calltoaction bs-calltoaction-primary">
                    <div class="row">
                        <div class="col-md-9 cta-contents">
                            <h1 class="cta-title">Its a Call To Action</h1>
                            <div class="cta-desc">
                                <p>Describe the action here.</p>
                                <p>Describe the action here.</p>
                                <p>Describe the action here.</p>
                            </div>
                        </div>
                        <div class="col-md-3 cta-button">
                            <a href="#" class="btn btn-lg btn-block btn-primary">Go for It!</a>
                        </div>
                     </div>
                </div>
    	</div>
     </div>
	 End Here -->
	 
	 <!-- Start 2 Here -->
	 <div class="container">
		<div class="row">
			<div class="col-md-12">
				<c:forEach var="row" items="${users}">
					<c:choose>
						<c:when test="${elf:isfollowed(username.id,row.id)}">
							<div class="card">
								<div class="card-header">
									<h5>Followed By Hujjaj Ali,Abuzar,Sajid and <a href="#">17 others</a></h5>
								</div>
								<div class="gaadiex-list">
									<div class="gaadiex-list-item">
										<img class="gaadiex-list-item-img" src="http://www.free-icons-download.net/images/commercial-male-user-icon-32765.png" alt="List user">
										<div class="gaadiex-list-item-text">
				                        	<a href="" class="btn btn-success btn-lg cta-button" id="us${row.id}" onclick="following(id,'${username.username}','${row.username}')" style="float: right;">Unfollow</a>
				                        	<h3><a href="#">${row.username}.....</a></h3>
				                        	<h4>Software Engineer</h4>
				                        	<p> Karachi, Sindh, Pakisatn</p>
				                      	</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="card">
								<div class="card-header">
									<h5>Followed By Hujjaj Ali,Abuzar,Sajid and <a href="#">17 others</a></h5>
								</div>
								<div class="gaadiex-list">
									<div class="gaadiex-list-item">
										<img class="gaadiex-list-item-img" src="http://www.free-icons-download.net/images/commercial-male-user-icon-32765.png" alt="List user">
										<div class="gaadiex-list-item-text">
				                        	<a href="" class="btn btn-success btn-lg cta-button" id="us${row.id}" onclick="following(id,'${username.username}','${row.username}')" style="float: right;">Follow</a>
				                        	<h3><a href="#">${row.username}.....</a></h3>
				                        	<h4>Software Engineer</h4>
				                        	<p> Karachi, Sindh, Pakisatn</p>
				                      	</div>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
	 <!-- End 2 Here -->
	
	
</body>
</html>