<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="in.co.raystech.maven.project4.controller.ORSView"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error page</title>
</head>


<%@page isErrorPage="true"%>

<body>

	<br>
	<br>
	<H1>
		<center>

			<%
				if (session.getAttribute("chngpwd") != null) {
			%>
			<font color="red"> <%=session.getAttribute("chngpwd")%></font> <br>
			<br> <img src="<%=ORSView.APP_CONTEXT%>/img/conn.jpg"
				width="100%">
			<%
				} else {
			%>

			<font color="red"> Something went wrong </font> <br>

			<%
				}
			%>
		</center>
	</H1>
</body>
</html>