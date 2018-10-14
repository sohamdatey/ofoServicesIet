<%@page import="co.ctl.UpdateDishCtl"%>
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
<!-- <script type="text/javascript" src="../js/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="../js/selectall.js"></script> -->

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
	<jsp:useBean id="bean" scope="request" class="com.dto.FoodMenuDTO">

	</jsp:useBean>
	<center>
		<h1>Food List</h1>
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

	<form action="/ofo/AddNewDishNameCtl" class="container" method="post">



		<div class="form-inline" style="margin: 40px;">



			<label>Add a Completely New Dish</label> <input type="text"
				class="form-control" name="completelyNewDish"
				value="<%=ServletUtility.getParameter("completelyNewDish", request)%>">
			&ensp;&ensp; <input type="submit" name="operation"
				class="btn btn-info"
				value="<%=RestMenuCtl.OP_ADD_COMPLETELY_NEW_DISH%>">

			&ensp;&ensp; <input type="submit" name="operation"
				class="btn btn-info" value="<%=RestMenuCtl.OP_BACK%>">



		</div>

		<center>

			<%--<table border="1" class="table table-bordered">--%>
			<table class="table">
				<thead class="thead-dark">
					<tr>

						<th scope="col">Select All &nbsp;<input type="checkbox"
							class="checkbox1" id="selecctall"></th>

						<th scope="col">S.No</th>
						<th scope="col">Name</th>
						<th scope="col">Price Range Min</th>
						<th scope="col">Price Range Max</th>
						<th scope="col">Availability</th>
						<th scope="col">Edit</th>
					</tr>

				</thead>

				<%
					int buttonNumber2 = (Integer) request.getAttribute("buttonNumber2");
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;
					String addDish = ServletUtility.getDishName(request);
					HashMap map = ServletUtility.getMap(request);
					Iterator<HashMap.Entry<FoodMenuDTO, Boolean>> itr = map.entrySet().iterator();

					int size = map.size();
					while (itr.hasNext()) {
						HashMap.Entry<FoodMenuDTO, Boolean> entry = itr.next();
						System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());

						bean = entry.getKey();
				%>
				<tbody>

					<%
						if (entry.getValue().booleanValue()) {
					%>
					<tr class="bg-primary">
						<%
							} else {
						%>
					
					<tr class="bg-success">

						<%
							}
						%>



						<td><center>
								<input type="checkbox" name="ids" class="checkbox1"
									value="<%=bean.getfId()%>">
							</center></td>



						<td><%=index++%></td>
						<td><%=bean.getName()%></td>
						<td><%=bean.getRangeMin()%></td>
						<td><%=bean.getRangeMax()%></td>
						<td><%=bean.getAvailability()%></td>

						<%
							session.setAttribute("beans", bean);
								if (entry.getValue().booleanValue()) {
						%>
						<td><a href="UpdateDishCtl?id=0&name=<%=bean.getName()%>">Edit</a></td>

						<%
							} else {
						%>
						<td><a href="UpdateDishCtl?id=1&name=<%=bean.getName()%>">Add
								This Dish to your Menu</a></td>

						<%
							}
						%>

					</tr>
				</tbody>

				<%
					}
				%>

			</table>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation" class="btn btn-info"
						<%if (pageNo == 1)

			{%> disabled="disabled" <%}%>
						value="<%=RestMenuCtl.OP_PREVIOUS%>  "></td>
					<td><input type="submit" name="operation" class="btn btn-info"
						value="<%=RestMenuCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation" class="btn btn-info"
						value="<%=RestMenuCtl.OP_DELETE%>"></td>

					<td align="right"><input type="submit" name="operation"
						class="btn btn-info"
						<%if (pageNo == buttonNumber2
			// 						|| map.size() != pageSize
			)

			{%>
						disabled="disabled" <%}%> value="<%=RestMenuCtl.OP_NEXT%>  "></td>

				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>"> <input
				type="hidden" name="addDish" value="<%=addDish%>">
	</form>
	</center>
</body>
</html>

