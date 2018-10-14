<%@page import="in.co.raystech.maven.project4.controller.MyProfileCtl"%>
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
	<form action="<%=ORSView.MY_PROFILE_CTL%>" method="post">

		<%@ include file="Header.jsp"%>
		<script type="text/javascript" src="../js/calendar.js"></script>
		<jsp:useBean id="bean"
			class="in.co.raystech.maven.project4.bean.UserBean" scope="request"></jsp:useBean>

		<center>
			<h1>My Profile</h1>

			<H2>
				<font color="red"> <%=ServletUtility.getErrorMessage(request)%>
				</font> <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
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
			<div class="loginbox">
				<div class="form-group">
					<label>Login Id*</label> <input type="text" readonly="readonly"
						name="login" size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getLogin())%>"> <font
						color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
				</div>
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
					<label>Date of Birth*</label> <input type="text" id="datepicker"
						readonly="readonly" name="dob" size="30" class="form-control"
						value="<%=DataUtility.getDateString(bean.getDob())%>"> <font
						color="red"><%=ServletUtility.getErrorMessage("dob", request)%></font>
				</div>

				<b>Gender*</b>
				<td>
					<%
						HashMap map = new HashMap();
						map.put("Male", "Male");
						map.put("Female", "Female");
						String htmlList = HTMLUtility.getList("gender", bean.getGender(), map);
					%> <%=htmlList%>
				</tr>
				<font color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font>
				<div class="form-group">
					<label>Mobile No*</label> <input type="text" name="mobileNo"
						size="30" class="form-control"
						value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
					<font color="red"><%=ServletUtility.getErrorMessage("mobileNo", request)%></font>
				</div>


				<tr>

					<center>
						<td colspan="2"><input type="submit" name="operation"
							class="btn btn-info" value="<%=MyProfileCtl.OP_SAVE%>">&nbsp;<input
							type="submit" name="operation" class="btn btn-info"
							value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>"> &nbsp;</td>
					</center>
				</tr>
			</div>
	</form>
	<%@ include file="Footer.jsp"%>
</body>
</html>
