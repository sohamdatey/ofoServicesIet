<!doctype html>
<%@page import="com.dto.FoodMenuDTO"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="com.dto.UserBean"%>

<jsp:useBean id="bean" class="com.dto.FoodMenuDTO" scope="request"></jsp:useBean>
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

<body
	style="background-image: url(./images/foodback.jpg); background-repeat: no-repeat;">

	<%@include file="/jspp/Header.jsp"%>
	<div class="container" style="height: 70px;"></div>
	<form action="/ofo/UpdateDishCtl" method="post">

		<div class="container" class="clearfix"
			style="background-color: #ffffff; width: 600px; padding-top: 40px;">

			<div class="container" style="width: 500px;">
				<div class="form-group">
					<label for="exampleInputPassword1">Price</label> <input type="text"
						class="form-control" name="price" placeholder="Price">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">OfferCode</label> <input
						type="text" class="form-control" name="offerCode"
						placeholder="OfferCode">
				</div>
				<div class="form-group">
					<label for="exampleFormControlSelect1">TypeOfFood</label> <select
						class="form-control" name="type">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
				<button type="submit" class="btn btn-danger btn-lg btn-block">Submit</button>
			</div>
		</div>
	</form>
	</div>

</body>

</html>


