<%@page import="in.co.raystech.maven.project4.controller.TimeTableCtl"%>
<%@page import="in.co.raystech.maven.project4.controller.RoleCtl"%>
<%@page import="in.co.raystech.maven.project4.controller.BaseCtl"%>
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
</head>
<body>
	<form action="<%=ORSView.ROLE_CTL%>" method="post">
		<%@ include file="Header.jsp"%>

		<jsp:useBean id="bean"
			class="in.co.raystech.maven.project4.bean.RoleBean" scope="request"></jsp:useBean>

		<center>

			<%
				if (bean.getId() > 0) {
			%>
			<h1>Update Role</h1>

			<%
				} else {
			%>

			<h1>Add Role</h1>

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
					<div class="loginbox">
						<div class="form-group">
							<label>Name*</label> <input type="text" name="name" size="30"
								class="form-control"
								value="<%=DataUtility.getStringData(bean.getName())%>">
							<font color="red"><%=ServletUtility.getErrorMessage("name", request)%></font>
						</div>
						<div class="form-group">
							<b>Description*</b>
							<textarea rows="5" cols="40" name="description"><%=DataUtility.getStringData(bean.getDescription())%></textarea>
							<font color="red"><%=ServletUtility.getErrorMessage("description", request)%></font>
						</div>
						<center>
							<input type="submit" name="operation" class="btn btn-info"
								value="<%=TimeTableCtl.OP_SAVE%>">&emsp;

							<%
								if (bean.getId() > 0) {
							%>
							<input type="submit" class="btn btn-info" name="operation"
								value="<%=TimeTableCtl.OP_CANCEL%>">
							</td>


							<%
								} else {
							%>

							&emsp; <input type="submit" class="btn btn-info" name="operation"
								value="<%=TimeTableCtl.OP_RESET%>">

							<%
								}
							%>
						</center>
						</form>
						</center>
						<%@ include file="Footer.jsp"%>
</body>
</html>