<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="co.ctl.LoginCtl"%>
<%@page import="co.ctl.ORSView"%>

<%@page import="com.dto.*"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>
<html>
<head>
<title>stylish Sign in and Sign up Form A Flat Responsive widget
	Template :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="stylish Sign in and Sign up Form A Flat Responsive widget, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 




























































</script>
<!--online_fonts-->
<link
	href="//fonts.googleapis.com/css?family=Sansita:400,400i,700,700i,800,800i,900,900i&amp;subset=latin-ext"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Poiret+One"
	rel="stylesheet">
<!--//online_fonts-->
<link href="../css/Login.css" rel='stylesheet' type='text/css'
	media="all" />
<link href="./css/Login.css" rel='stylesheet' type='text/css'
	media="all" />
<!--stylesheet-->
</head>
<body>
	<center>
		<H1>
			<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				<%=ServletUtility.getErrorMessage("message", request)%>
			</font> <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
			</font>
			<%
				if (session.getAttribute("rgstrtnsucs") != null) {
			%>
			<font color="green"> <%=session.getAttribute("rgstrtnsucs")%></font>
			<%
				}
			%>
		</H1>
	</center>

	<jsp:useBean id="bean" class="com.dto.UserBean" scope="request"></jsp:useBean>


	<input type="hidden" name="uId" value="<%=bean.getuId()%>">

	<h1>stylish Sign in and Sign up form</h1>
	<div class="form-w3ls">
		<div class="form-head-w3l">
			<h2>s</h2>
		</div>
		<ul class="tab-group cl-effect-4">
		</ul>
		<div class="tab-content tab active tab">
			<form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">

				<p class="header">User Name</p>
				<input type="text" name="user" placeholder="Your Full Name"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Your Full Name';}"
					required="required"
					value="<%=DataUtility.getStringData(bean.getUserName())%>">
				<font color="red"><%=ServletUtility.getErrorMessage("user", request)%></font>

				<p class="header">Location</p>
				<input type="text" name="location" placeholder="location"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'location';}"
					required="required"
					value="<%=DataUtility.getStringData(bean.getLocation())%>">
				<font color="red"><%=ServletUtility.getErrorMessage("location", request)%></font>

				<p class="header">Card Number</p>
				<input type="text" name="cardNumber" placeholder="cardNumber"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'cardNumber';}"
					required="required"
					value="<%=DataUtility.getStringData(bean.getCardNumber())%>">
				<font color="red"><%=ServletUtility.getErrorMessage("cardNumber", request)%></font>

				<p class="header">Contact</p>
				<input type="text" name="mobileNo" placeholder="contact"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'mobileNo';}"
					required="required"
					value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
				<font color="red"><%=ServletUtility.getErrorMessage("mobileNo", request)%></font>

				<p class="header">Type</p>
				<input type="text" name="type" placeholder="type"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'type';}"
					required="required"
					value="<%=DataUtility.getStringData(bean.getType())%>"> <font
					color="red"><%=ServletUtility.getErrorMessage("type", request)%></font>

				<p class="header">Food Habbit</p>
				<input type="text" name="foodHabit" placeholder="foodHabit"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'type';}"
					required="required"
					value="<%=DataUtility.getStringData(bean.getFoodHabit())%>">
				<font color="red"><%=ServletUtility.getErrorMessage("foodHabit", request)%></font>


				<p class="header">Image</p>
				<input type="text" name="images" placeholder="images"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'images';}"
					required="required"
					value="<%=DataUtility.getStringData(bean.getLogin())%>"> <font
					color="red"><%=ServletUtility.getErrorMessage("images", request)%></font>

				<p class="header">Email Address</p>
				<input type="text" name="login" placeholder="Email"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Email';}"
					required="required"
					value="<%=DataUtility.getStringData(bean.getLogin())%>"> <font
					color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>


				<p class="header">Password</p>
				<input type="password" name="password" placeholder="Password"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Password';}"
					required="required"
					value="<%=DataUtility.getStringData(bean.getPassword())%>">
				<font color="red"><%=ServletUtility.getErrorMessage("password", request)%></font>


				<p class="header">Confirm Password</p>
				<input type="password" name="confirmPassword" placeholder="Password"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Password';}"
					required="required"
					value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>">
				<font color="red"><%=ServletUtility.getErrorMessage("confirmPassword", request)%></font>
				<input type="submit" class="sign-in" name="operation"
					value="<%=LoginCtl.OP_SIGN_UP%>">
			</form>
		</div>
	</div>
	<!-- tab-content -->
	</div>
	<!-- /form -->


	<p class="copyright">
		&copy; 2018 stylish sign in and sign up Form. All Rights Reserved |
		Design by <a href="https://w3layouts.com/" target="_blank">w3layouts</a>
	</p>
	<!-- js files -->
	<script src="../js/jquery.min.js"></script>
	<script src="../js/index.js"></script>
	<!-- /js files -->
</body>
</html>
