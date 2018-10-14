<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="co.ctl.RestaurantLoginCtl"%>
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
	<%@ include file="Header.jsp"%>
	<jsp:useBean id="bean" class="com.dto.RestaurantDTO" scope="request"></jsp:useBean>

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

	<input type="hidden" name="rId"
		value="<%=session.getAttribute("rId")%>">
	<%
		RestaurantDTO bean2 = (RestaurantDTO) session.getAttribute("restaurantSession");

		boolean restaurantLoggedInn = bean2 != null;
	%>

	<%
		if (restaurantLoggedInn) {

			response.sendRedirect(ORSView.RES_MENU_CTL);
	%>


	<%
		} else {
	%>



	<h1>stylish Sign in and Sign up form</h1>
	<div class="form-w3ls">
		<div class="form-head-w3l">
			<h2>F</h2>
		</div>
		<div class="tab-content">
			<form action="<%=ORSView.RESTAURANT_LOGIN_CTL%>" method="post">
				<p class="header">Email</p>
				<input type="text" name="login" placeholder="User Name"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'User Name';}"
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
				<input type="checkbox" id="brand" value=""> <label
					for="brand"><span></span> Remember me?</label><input type="submit"
					class="sign-in" name="operation"
					value="<%=RestaurantLoginCtl.OP_REST_SIGN_IN%>"> <a
					href="<%=ORSView.FORGET_PASSWORD_RESTAURANT_CTL%>"
					class="pull-right forgot">Forgot password?</a>

			</form>


		</div>
	</div>
	<%
		}
	%>

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
