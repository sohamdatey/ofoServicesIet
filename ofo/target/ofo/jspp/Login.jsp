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
<link rel="stylesheet" href="../css/tomato.css">
<meta charset="utf-8">
<title>user</title>
<!--MOBILE DEVICE-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/calendar.js"></script>
<script type="text/javascript" src="./js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/Cal.js"></script>
<link rel="stylesheet" href="./css/jquery-ui.css">
<link rel="stylesheet" href="./css/jquery-ui.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/tomato.css">

</head>
<body>
	<%@ include file="Header.jsp"%>
	<jsp:useBean id="bean" class="com.dto.UserBean" scope="request"></jsp:useBean>

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
	<input type="hidden" name="uId" value="<%=bean.getuId()%>">
	<h1>Login</h1>
	<center>
		<div class="form-w3ls">
			<div class="form-head-w3l"></div>
			<div class="tab-content">
				<form action="<%=ORSView.LOGIN_CTL%>" method="post">
					<div class="loginbox">
						<div class="form-group">
							<label>Login Id*</label> <input type="text" name="login"
								placeholder="Please Enter Email-ID" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'User Name';}"
								required="required"
								value="<%=DataUtility.getStringData(bean.getLogin())%>">
							<font color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
						</div>

						<div class="form-group">
							<label>Password*</label> <input type="password" name="password"
								placeholder="Password" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Password';}"
								required="required"
								value="<%=DataUtility.getStringData(bean.getPassword())%>">
							<font color="red"><%=ServletUtility.getErrorMessage("password", request)%></font>
						</div>

						<input type="submit" class="btn btn-info" name="operation"
							class="btn btn-info" value="<%=LoginCtl.OP_SIGN_IN%>"> <a
							href="<%=ORSView.FORGET_PASSWORD_CTL%>" class="pull-right forgot">Forgot
							password?</a>
					</div>
				</form>

			</div>
		</div>

		<!-- tab-content -->
		</div>
	</center>
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
