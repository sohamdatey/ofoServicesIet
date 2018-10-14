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
<title></title>
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

	<h1>Are you a Merchant or a Host</h1>
	<div class="form-w3ls">
		<div class="form-head-w3l">
			<h3>OFO</h>
			
		</div>
		<center>
		<div class="login">
			<ul>
				<li><a href="Login.jsp"> User Login</a></li>
				<li><a href="LoginRestaurant.jsp">Restaurant Login</a></li>
				</li>
			</ul>
		</div>
		</center>
	</div>
	<!-- tab-content -->
	</div>
	<!-- /form -->


	
	<!-- js files -->
	<script src="../js/jquery.min.js"></script>
	<script src="../js/index.js"></script>
	<!-- /js files -->
</body>
</html>
