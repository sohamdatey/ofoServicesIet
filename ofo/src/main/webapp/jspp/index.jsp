<!doctype html>
<%@page import="co.ctl.ORSView"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.dto.FoodMenuDTO"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="com.dto.RestaurantDTO"%>

<jsp:useBean id="bean3" class="com.dto.RestaurantDTO" scope="request"></jsp:useBean>
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
<% RequestDispatcher rd = request.getRequestDispatcher("/SearchRestaurantCtl?searchRestaurant=");
rd.forward(request, response); %>
</body>
</html>
