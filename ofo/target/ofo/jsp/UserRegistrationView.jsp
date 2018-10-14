R
<%@page
	import="in.co.raystech.maven.project4.controller.UserRegistrationCtl"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.raystech.maven.project4.util.HTMLUtility"%>
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

<link rel="stylesheet" href="./js/jquery-ui.css">
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/calendar.js"></script>
<script type="text/javascript" src="./js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/Cal.js"></script>
<link rel="stylesheet" href="./css/bootstrap.min.css">

<script>
	$(document).ready(function() {
		$("#datepicker").datepicker({
			minDate : "-70Y 0M 0D",
			dateFormat : 'dd/mm/yy',
			maxDate : "-17Y 0M 0D",
			changeMonth : true,
			changeYear : true,
			yearRange : '-70:+0'
		});
	});
</script>

</head>
<%@ include file="Header.jsp"%>

<body>
	<form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">

		<script type="text/javascript" src="../js/calendar.js"></script>
		<jsp:useBean id="bean"
			class="in.co.raystech.maven.project4.bean.UserBean" scope="request"></jsp:useBean>

		<center>
			&emsp;
			<h1>User Registration</h1>

			<H2>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font> <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font>
			</H2>
			<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
				type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy"
				value="<%=bean.getModifiedBy()%>"> <input type="hidden"
				name="createdDatetime"
				value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime"
				value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

			<table border="0" class="t1">
				<colgroup>
					<col style="width: 140px;">
					<col style="width: 170px;">
					<col style="width: 510px;">
				</colgroup>

				<div class="loginbox">
					<div class="form-group">
						<label>First Name*</label> <input type="text" name="firstName"
							class="form-control"
							value="<%=DataUtility.getStringData(bean.getFirstName())%>">
						<font color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font>
					</div>

					<div class="form-group">
						<label>Last Name*</label> <input type="text" name="lastName"
							class="form-control"
							value="<%=DataUtility.getStringData(bean.getLastName())%>">
						<font color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font>
					</div>

					<div class="form-group">
						<label>Login Id*</label> <input type="text" name="login"
							placeholder="Must be Email ID" class="form-control"
							value="<%=DataUtility.getStringData(bean.getLogin())%>">
						<font color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font>
					</div>

					<div class="form-group">
						<label>Password*</label> <input type="password" name="password"
							class="form-control"
							value="<%=DataUtility.getStringData(bean.getPassword())%>">
						<font color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font>
					</div>

					<div class="form-group">
						<label>Confirm Password*</label> <input type="password"
							name="confirmPassword" class="form-control"
							value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>">
						<font color="red"> <%=ServletUtility.getErrorMessage("confirmPassword", request)%></font>
					</div>
					<div class="form-group">
						<label>Contact Number*</label> <input type="text"
							name="contactNumber" class="form-control"
							value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
						<font color="red"> <%=ServletUtility.getErrorMessage("contactNumber", request)%></font>
					</div>



					<div class="form-group">
						<label>Date Of Birth*</label> <input id="datepicker" name="dob"
							class="form-control" readonly="readonly"
							value="<%=DataUtility.getDateString(bean.getDob())%>" /> <font
							color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font>
					</div>


					<div class="form-group">
						<label>Gender*</label>
						<%
							HashMap map = new HashMap();
							map.put("Male", "Male");
							map.put("Female", "Female");
							String htmlList = HTMLUtility.getList("gender", bean.getGender(), map);
						%>
						<%=htmlList%>
						<font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>
					</div>
					<br>
					<center>
						<input type="submit" name="operation" class="btn btn-info"
							value="<%=UserRegistrationCtl.OP_SIGN_UP%>"> &nbsp; <input
							type="submit" name="operation" class="btn btn-info"
							value="<%=UserRegistrationCtl.OP_RESET%>">
					</center>

				</div>
			</table>
	</form>
	</center>
	<%@ include file="Footer.jsp"%>
</body>
</html>