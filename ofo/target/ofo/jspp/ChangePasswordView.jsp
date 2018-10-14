<%@page import="co.ctl.ChangePasswordCtl"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="com.dto.*"%>
<%@page import="co.ctl.ORSView"%>
<html>
<head>
<meta charset="utf-8">
<title>Change password</title>
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
	<form action="<%=ORSView.CHANGE_PASSWORD_CTL%>" method="post">

		<jsp:useBean id="bean" class="com.dto.UserBean" scope="request"></jsp:useBean>
		<center>
			<h1>Change Password</h1>
			<input type="hidden" name="uId" value="<%=bean.getuId()%>">
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


</body>
</html>