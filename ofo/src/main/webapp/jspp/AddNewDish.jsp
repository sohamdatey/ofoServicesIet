<!doctype html>
<%@page import="com.dto.FoodMenuDTO"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="com.dto.UserBean"%>

<jsp:useBean id="bean" class="com.dto.FoodMenuDTO" scope="request"></jsp:useBean>
<html>
<head>
<meta charset="utf-8">
<title>food</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!--MOBILE DEVICE-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />


<!--JS-->

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/modernizr.js"></script>
<script src="js/scripts.js"></script>
<script src="js/waypoints.min.js"></script>




</head>

<body
	style="background-image: url(./images/foodback.jpg); background-repeat: no-repeat;">
	<div class="container" style="height: 100px;"></div>
	<form action="/ofo/UpdateDishCtl" method="post">

		<div class="container"
			style="background-color: #ffffff; width: 600px; height: 550px; padding-top: 40px;">
			<div class="container" style="width: 500px;">
				<div class="form-group">
					<label for="exampleInputEmail1">Dish you Entered</label> 
					<input
						type="text" class="form-control" name="addNewDish" id="addNewDish" aria-describedby="emailHelp"
						<%if (bean.getId() == 0) {%>
						 
						value="<%=bean.getAddDishName()%>"> 
						
						<%} else {%>
						
						disabled
						value="<%=bean.getAddDishName()%>"> 
						<input type="hidden"
						class="form-control" name="addNewDish" id="addNewDish"
						aria-describedby="emailHelp" value="<%=bean.getAddDishName()%>">
						
						 <%}%>
						

				</div>
			</div>
			<div class="container" style="width: 500px;">
				<div class="form-group">
					<label for="exampleInputPassword1">Price</label> <input type="text"
						class="form-control" name="price" placeholder="Price">
				</div>
			</div>


			<div class="container" style="width: 500px;">
				<div class="form-group">
					<label for="exampleInputPassword1">OfferCode</label> <input
						type="text" class="form-control" name="offerCode"
						placeholder="OfferCode">
				</div>
			</div>

			<div class="container" style="width: 500px;">
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
			</div>
			<div class="container" style="width: 500px;">
				<div class="form-group">
					<label for="exampleFormControlSelect1">Availability</label> <select
						class="form-control" name="availability">
						<option>1</option>
						<option>0</option>

					</select>
				</div>
			</div>
			<div class="container" style="width: 500px;">
				<input type="hidden" class="form-control" name="id"
					placeholder="OfferCode" value="<%=bean.getId()%>"> 
				<input type="hidden"
						class="form-control" name="name" id="name"
						aria-describedby="emailHelp" value="<%=bean.getAddDishName()%>">
				<button type="submit" class="btn btn-danger btn-lg btn-block">Submit</button>
			</div>
		</div>
	</form>
	</div>

</body>

</html>


