<%@page
	import="in.co.raystech.maven.project4.controller.ChangePasswordCtl"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>

<%@page import="in.co.raystech.maven.project4.controller.ORSView"%>
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
<%@ include file="Header.jsp"%>
<body>
	<form action="<%=ORSView.CHANGE_PASSWORD_CTL%>" method="post">

		<jsp:useBean id="bean"
			class="in.co.raystech.maven.project4.bean.UserBean" scope="request"></jsp:useBean>
		<center>
			<h1>Change Password</h1>
			<input type="hidden" name="id" value="<%=bean.getId()%>"> <input
				type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
			<input type="hidden" name="modifiedBy"
				value="<%=bean.getModifiedBy()%>"> <input type="hidden"
				name="createdDatetime"
				value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
			<input type="hidden" name="modifiedDatetime"
				value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
			<H3>
				<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
				<font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
				</font>
			</H3>
			<div class="loginbox">
				<div class="form-group">
					<label>Old Password*</label> <input type="password"
						name="oldPassword" size="30" class="form-control"
						value=<%=DataUtility.getString(request.getParameter("oldPassword") == null ? ""
					: DataUtility.getString(request.getParameter("oldPassword")))%>>
					<font color="red"><%=ServletUtility.getErrorMessage("oldPassword", request)%></font>
				</div>
				<div class="form-group">
					<label>New Password*</label> <input type="password"
						name="newPassword" size="30" class="form-control"
						value=<%=DataUtility.getString(request.getParameter("newPassword") == null ? ""
					: DataUtility.getString(request.getParameter("newPassword")))%>>
					<font color="red"><%=ServletUtility.getErrorMessage("newPassword", request)%></font>
				</div>
				<label>Confirm Password*</label> <input type="password"
					name="confirmPassword" size="30" class="form-control"
					value=<%=DataUtility.getString(request.getParameter("confirmPassword") == null ? ""
					: DataUtility.getString(request.getParameter("confirmPassword")))%>>
				<font color="red"><%=ServletUtility.getErrorMessage("confirmPassword", request)%></font>
			</div>


			<br>
			<td colspan="2"><input type="submit" name="operation"
				class="btn btn-info" value="<%=ChangePasswordCtl.OP_SAVE%>">
				&nbsp;<input type="submit" name="operation" class="btn btn-info"
				value="<%=ChangePasswordCtl.OP_RESET%>"> &nbsp;</td>
			</tr>

			</table>
	</form>
	</center>

	<%@ include file="Footer.jsp"%>

</body>
</html>