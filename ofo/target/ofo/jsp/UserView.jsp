<%@page import="in.co.raystech.maven.project4.controller.UserCtl"%>
<%@page import="java.util.List"%>
<%@page import="in.co.raystech.maven.project4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
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

<link rel="stylesheet" href="../js/jquery-ui.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>

<script>
	$(document).ready(function() {
		$("#datepicker").datepicker({
			minDate : "-70Y, 0M, 0D",
			maxDate : "-17Y, 0M, 0D",
			dateFormat : 'dd/mm/yy',
			changeMonth : true,
			changeYear : true,
			yearRange : '-70:-0'

		});
	});
</script>
</head>

<body>
	<form action="<%=ORSView.USER_CTL%>" method="post">
		<%@ include file="Header.jsp"%>
		<script type="text/javascript" src="../js/calendar.js"></script>
		<jsp:useBean id="bean"
			class="in.co.raystech.maven.project4.bean.UserBean" scope="request"></jsp:useBean>

		<%
			List l = (List) request.getAttribute("roleList");
		%>

		<center>
			<%
				if (bean.getId() > 0) {
			%>
			<h1>Update User</h1>
			<%
				} else {
			%>
			<h1>Add User</h1>
			<%
				}
			%>

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
				<tr>
					<div class="loginbox">
						<div class="form-group">
							<label>First Name*</label> <input type="text" name="firstName"
								size="30" class="form-control"
								value="<%=DataUtility.getStringData(bean.getFirstName())%>">
							<font color="red"><%=ServletUtility.getErrorMessage("firstName", request)%></font>
						</div>



						<div class="form-group">
							<label>Last Name*</label> <input type="text" name="lastName"
								size="30" class="form-control"
								value="<%=DataUtility.getStringData(bean.getLastName())%>">
							<font color="red"><%=ServletUtility.getErrorMessage("lastName", request)%></font>
						</div>


						<div class="form-group">
							<label>Login Id*</label> <input type="text" name="login" size="30"
								class="form-control" placeholder="Must be valid Email-Id"
								value="<%=DataUtility.getStringData(bean.getLogin())%>"
								<%=(bean.getId() > 0) ? "readonly" : ""%>> <font
								color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
						</div>

						<%
							if (bean.getId() < 0 || bean.getId() == 0) {
						%>

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

						<%
							} else {
						%>
						<div class="form-group">
							<label>Password*</label> <input type="password" name="password"
								readonly="readonly" size="30" class="form-control"
								value="<%=DataUtility.getStringData(bean.getPassword())%>">
							<font color="red"><%=ServletUtility.getErrorMessage("password", request)%></font>
						</div>

						<div class="form-group">
							<label>Confirm Password*</label> <input type="password"
								readonly="readonly" name="confirmPassword" size="30"
								class="form-control"
								value="<%=DataUtility.getStringData(bean.getPassword())%>">
							<font color="red"><%=ServletUtility.getErrorMessage("confirmPassword", request)%></font>
						</div>


						<%
							}
						%>

						<div class="form-group">
							<label>Contact Number*</label> <input type="text"
								name="contactNumber" size="30" class="form-control"
								value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
							<font color="red"><%=ServletUtility.getErrorMessage("contactNumber", request)%></font>
						</div>

						<div class="form-group">
							<label>Date of Birth*</label> <input type="text" id="datepicker"
								readonly="readonly" name="dob" size="30" class="form-control"
								value="<%=DataUtility.getDateString(bean.getDob())%>"> <font
								color="red"><%=ServletUtility.getErrorMessage("dob", request)%></font>
						</div>


						<b>Gender*</b>
						<%
							HashMap map = new HashMap();
							map.put("Male", "Male");
							map.put("Female", "Female");
							String htmlList = HTMLUtility.getList("gender", bean.getGender(), map);
						%>
					
						<%=htmlList%>

						<font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>

						<%
							if (bean.getId() == 0) {
						%>
						<br> <b>Role*</b>
						<%=HTMLUtility.getList("roleId", String.valueOf(bean.getRoleId()), l)%>
						<font color="red"> <%=ServletUtility.getErrorMessage("roleId", request)%></font>

						<%
							} else {
						%>
						<input type="hidden" name="roleId" value="<%=bean.getRoleId()%>" />


						<%
							}
						%>
						<br>
						<center>
							<input type="submit" name="operation" class="btn btn-info"
								value="<%=UserCtl.OP_SAVE%>">&emsp;

							<%
								if (bean.getId() > 0)

								{
							%>
							<input type="submit" class="btn btn-info" name="operation"
								value="<%=UserCtl.OP_CANCEL%>">
					</td>


					<%
						} else

						{
					%>

					&emsp;
					<input type="submit" class="btn btn-info" name="operation"
						value="<%=UserCtl.OP_RESET%>">

					<%
						}
					%>
					</center>

					</form>
					</center>
					<%@ include file="Footer.jsp"%>
</body>
</html>