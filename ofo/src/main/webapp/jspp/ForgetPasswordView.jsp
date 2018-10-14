<%@page import="co.ctl.*"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="com.dto.UserBean"%>
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

	<form action="<%=ORSView.FORGET_PASSWORD_CTL%>" method="post">
		<center>
			<table border="0" class="t1">
				<colgroup>
					<col style="width: 140px;">
					<col style="width: 170px;">
					<col style="width: 510px;">
				</colgroup>

				<H2>
					<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
					</font>
				</H2>
				<H2>
					<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
					</font>
				</H2>


				<%
					UserBean userbBean = (UserBean) session.getAttribute("user");

					boolean userLogged = userBean != null;
				%>

				<%
					if (userLoggedIn) {

						String msg = userBean.getLogin();
				%>

				<h1>
					<font color="#404040">You are already Logged-In!</font>
				</h1>


				<tr>
					<center>
						<h3>
							Email :
							<%=msg%>
						</h3>
				</tr>


				</center>
			</table>
			<%
				} else {
			%>

			<table border="0" class="t1">
				<colgroup>
					<col style="width: 140px;">
					<col style="width: 170px;">
					<col style="width: 510px;">
				</colgroup>
				<h1>
					Forgot your password? <font color="#404040">No Big Deal!</font>
				</h1>

				<h3>
					<font color="">Submit your email address and we'll send you
						password</font>
				</h3>


				<div class="loginbox">
					<div class="form-group">
						<label>LoginId*</label> <input type="text" name="login" size="30"
							class="form-control"
							value="<%=ServletUtility.getParameter("login", request)%>">
						<font color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
					</div>


					<input type="submit" name="operation"
						class="btn btn-danger btn-block"
						value="<%=ForgetPasswordCtl.OP_GO%>">
					<%
						}
					%>
				
			</table>
	</form>
	</center>
</body>
</html>

