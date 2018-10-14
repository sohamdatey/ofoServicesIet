<%@page import="co.ctl.*"%>
<%@page import="co.ctl.RestMenuCtl"%>
<%@page import="com.model.ResMenuModel"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.dto.FoodMenuDTO"%>
<%@page import="co.ctl.ORSView"%>
<%@page import="in.co.raystech.maven.project4.util.DataValidator"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>
<%@page import="com.dto.*"%>

<%@page import="javax.mail.Header"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.raystech.maven.project4.util.HTMLUtility"%>

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
	<jsp:useBean id="bean" scope="request" class="com.dto.FoodMenuDTO"></jsp:useBean>
	<center>
		<h1>Please Select Dishes to order</h1>
		<h2>
			<center>
				<td colspan="8">
					<%
						if (DataValidator.isNotNull(DataUtility.getString(ServletUtility.getSuccessMessage(request)))) {
					%> <font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
				</td>
				<%
					} else if (DataUtility.getString(ServletUtility.getErrorMessage(request)) != null) {
				%>
				<td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
					<%
						}
					%></td>
			</center>
		</h2>
	</center>

	&ensp;&ensp;

	<form action="/ofo/UserFoodOrderingMenuCtl" class="container"
		method="post">

		<center>

			<table border="1" class="table table-bordered">
				<tr>
					<th><center>Select Dishes</center></th>

					<th>S.No</th>
					<th>Name</th>
					<th>Price</th>
					<th>Availability</th>
				</tr>

				<%
					int index = 1;

					List list = ServletUtility.getList(request);
					Iterator<FoodMenuDTO> it = list.iterator();

					int size = list.size();

					while (it.hasNext())

					{
						bean = it.next();
				%>

				<tr>

					<td>
						<center>
							<form action="/ofo/UserFoodOrderingMenuCtl" method="post">

								<input type="hidden" name="fId" value="<%=bean.getfId()%>">
								<input type="hidden" name="rId" value="<%=bean.getrId()%>">
								<input type="submit" name="operation" class="btn btn-info"
									value="<%=UserFoodOrderingMenuCtl.OP_DELETE_FROM_CART%>">
							</form>
						</center>
					</td>
					<td><%=index++%></td>
					<td><%=bean.getName()%></td>
					<td><%=bean.getPrice()%></td>
					<td><%=bean.getAvailability()%></td>

				</tr>
				<%
					}
				%>

			</table>
			<center>
				<td><input type="submit" name="operation" class="btn btn-info"
					value="<%=UserFoodOrderingMenuCtl.OP_ADD_MORE_DISHES_TO_YOUR_CART%>"></td>
			</center>
	</form>
	</center>
</body>
</html>