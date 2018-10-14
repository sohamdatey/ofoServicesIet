<%@page import="in.co.raystech.maven.project4.controller.LoginCtl"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>

<html>
<head>

<style type="text/css">
table.t1 {
	table-layout: fixed;
	margin-left: auto;
	margin-right: 10px;
}

th {
	text-align: left;
}

tr {
	text-align: left;
}
</style>

<script type="text/javascript" src="./js/jquery.min.js"></script>

<script type="text/javascript" src="./js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/bootstrap.min.css">

<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/calendar.js"></script>
<script type="text/javascript" src="./js/npm.js"></script>
<script type="text/javascript" src="./js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/Cal.js"></script>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./css/cal.css">
<link rel="stylesheet" href="./css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
</head>
<%@ include file="Header.jsp"%>


<body>
	<form action="<%=ORSView.LOGIN_CTL%>" method="post" class="container">
		<jsp:useBean id="bean"
			class="in.co.raystech.maven.project4.bean.UserBean" scope="request"></jsp:useBean>
		<center>
			<H2>
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
			</H2>


			<%
				UserBean userbBean = (UserBean) session.getAttribute("user");

				boolean userLogged = userBean != null;
			%>

			<%
				if (userLoggedIn) {

					response.sendRedirect(ORSView.WELCOME_CTL);
			%>


			<%
				} else {
			%>
			<center>
				<h1>Login</h1>
			</center>

			<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
				type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy"
				value="<%=bean.getModifiedBy()%>"> <input type="hidden"
				name="createdDatetime"
				value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime"
				value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">


			<div class="loginbox">
				<div class="form-group">
					<label>Login Id*</label> <input type="text" name="login" size="30"
						class="form-control"
						value="<%=DataUtility.getStringData(bean.getLogin())%>"> <font
						color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
				</div>

				<div class="form-group">
					<label>Password*</label> <input type="password" name="password"
						size=30 class="form-control"
						value="<%=DataUtility.getStringData(bean.getPassword())%>">
					<font color="red"><%=ServletUtility.getErrorMessage("password", request)%></font>
					<a href="<%=ORSView.FORGET_PASSWORD_CTL%>"
						class="pull-right forgot">Forgot password</a>
				</div>

				<input type="submit" class="btn btn-info btn-block" name="operation"
					value="<%=LoginCtl.OP_SIGN_IN%>">

				<div class="signup">
					Don't have an account? <input class="btn btn-info btn-link"
						type="submit" name="operation" value="<%=LoginCtl.OP_SIGN_UP%>">
				</div>
			</div>

			<%
				}
			%>
		
	</form>
	<%@ include file="Footer.jsp"%>
</body>
</html>