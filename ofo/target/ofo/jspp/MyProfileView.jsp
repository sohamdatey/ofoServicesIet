<%@page import="co.ctl.MyProfileCtl"%>
<%@page import="in.co.raystech.maven.project4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
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
<%@ include file="Header.jsp"%>
<body>
	<form action="<%=ORSView.MY_PROFILE_CTL%>" method="post">

		<jsp:useBean id="bean" class="com.dto.UserBean" scope="request"></jsp:useBean>

		<center>
			<h1>My Profile</h1>

			<H2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font> <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H2>
			<input type="hidden" name="uId" value="<%=bean.getuId()%>">
			<div class="loginbox">
				<div class="form-group">
					<label>Login Id*</label> <input type="text" readonly="readonly"
						name="login" size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getLogin())%>"> <font
						color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
				</div>

				<div class="form-group">
					<label>User Name*</label> <input type="text" name="userName"
						size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getUserName())%>">
					<font color="red"><%=ServletUtility.getErrorMessage("userName", request)%></font>
				</div>
				<div class="form-group">
					<label>Card Number*</label> <input type="text" name="cardNumber"
						size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getCardNumber())%>">
					<font color="red"><%=ServletUtility.getErrorMessage("cardNumber", request)%></font>
				</div>

				<div class="form-group">
					<label>Mobile No*</label> <input type="text" name="mobileNo"
						size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
					<font color="red"><%=ServletUtility.getErrorMessage("mobileNo", request)%></font>
				</div>
				<div class="form-group">
					<label>Location*</label> <input type="text" name="location"
						size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getLocation())%>">
					<font color="red"><%=ServletUtility.getErrorMessage("location", request)%></font>
				</div>
				<div class="form-group">
					<label>FoodHabit*</label> <input type="text" name="foodHabit"
						size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getFoodHabit())%>">
					<font color="red"><%=ServletUtility.getErrorMessage("foodHabit", request)%></font>
				</div>

				<tr>

					<center>
						<td colspan="2"><input type="submit" name="operation"
							class="btn btn-info"
							value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>">&nbsp;
							&nbsp;<input type="submit" name="operation" class="btn btn-info"
							value="<%=MyProfileCtl.OP_SAVE%>"></td>
					</center>
				</tr>
			</div>
	</form>
</body>
</html>
