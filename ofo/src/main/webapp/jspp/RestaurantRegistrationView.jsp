<%@page import="co.ctl.MyProfileCtl"%>
<%@page import="in.co.raystech.maven.project4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<html>
<head>
<link rel="stylesheet" href="../css/tomato.css">
<meta charset="utf-8">
<title>Restaurant Registration</title>
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
<%@ include file="Header.jsp"%>
<body>
	<form action="<%=ORSView.RESTAURANT_REGISTRATION_CTL%>" method="post">

		<jsp:useBean id="bean" class="com.dto.RestaurantDTO" scope="request"></jsp:useBean>

		<center>
			<h1>Restaurant Registration</h1>

			<H2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font> <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>
			<input type="hidden" name="rId" value="<%=bean.getrId()%>">
			<div class="loginbox">
				<div class="form-group">
					<label>Restaurant Name*</label> <input type="text"
						name="restaurantName" size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getName())%>"> <font
						color="red"><%=ServletUtility.getErrorMessage("restaurantName", request)%></font>
				</div>

				<div class="form-group">
					<label>Type*</label> <input type="text" name="type" size="30"
						class="form-control"
						value="<%=DataUtility.getStringData(bean.getType())%>"> <font
						color="red"><%=ServletUtility.getErrorMessage("type", request)%></font>
				</div>
				<div class="form-group">
					<label>Location*</label> <input type="text" name="location"
						size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getLocation())%>">
					<font color="red"><%=ServletUtility.getErrorMessage("location", request)%></font>
				</div>

				<div class="form-group">
					<label>Business Timings*</label>
					<%
						HashMap hashMap = new HashMap();
						hashMap.put("09:00 AM - 12:00 AM", "09:00 AM - 12:00 AM");
						hashMap.put("01:00 AM - 04:00 PM", "01:00 PM - 04:00 PM");

						String lists = HTMLUtility.getList("businessTimings", bean.getOpeningTime(), hashMap);
					%>
					<%=lists%>

					<font color="red"> <%=ServletUtility.getErrorMessage("businessTimings", request)%></font>
				</div>

				<div class="form-group">
					<label>Contact*</label> <input type="text" name="mobileNo"
						size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getContact())%>">
					<font color="red"><%=ServletUtility.getErrorMessage("mobileNo", request)%></font>
				</div>

				<div class="form-group">
					<label>Email*</label> <input type="text" name="login" size="30"
						class="form-control"
						value="<%=DataUtility.getStringData(bean.getLogin())%>"> <font
						color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
				</div>

				<div class="form-group">
					<label>Password*</label> <input type="password" name="password"
						size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getPassword())%>">
					<font color="red"><%=ServletUtility.getErrorMessage("password", request)%></font>
				</div>

				<div class="form-group">
					<label>Confirm Password*</label> <input type="password"
						name="confirmPassword" size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getPassword())%>">
					<font color="red"><%=ServletUtility.getErrorMessage("confirmPassword", request)%></font>
				</div>
				<tr>
					<center>
						<td colspan="2">&nbsp; &nbsp;<input type="submit"
							name="operation" class="btn btn-info"
							value="<%=MyProfileCtl.OP_SAVE%>"></td>
					</center>
				</tr>
			</div>
	</form>
</body>
</html>
