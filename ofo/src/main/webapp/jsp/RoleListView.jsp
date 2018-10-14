<%@page import="in.co.raystech.maven.project4.util.DataValidator"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>
<%@page import="in.co.raystech.maven.project4.controller.RoleCtl"%>
<%@page import="in.co.raystech.maven.project4.controller.RoleListCtl"%>
<%@page import="in.co.raystech.maven.project4.controller.BaseCtl"%>
<%@page import="in.co.raystech.maven.project4.bean.RoleBean"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/selectall.js"></script>

<html>
<body>
	<jsp:useBean id="bean"
		class="in.co.raystech.maven.project4.bean.RoleBean" scope="request"></jsp:useBean>

	<%@include file="Header.jsp"%>
	<h1>
		<center>Role List</center>
	</h1>
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


	<form action="<%=ORSView.ROLE_LIST_CTL%>" class="container"
		method="post">
		<center>
			<table width="100%" class="form-inline">
				<tr>
					<td align="center"><label>Name :</label> <input type="text"
						name="name" class="form-control"
						value="<%=ServletUtility.getParameter("name", request)%>">
						&nbsp; <input type="submit" name="operation" class="btn btn-info"
						value="<%=RoleListCtl.OP_SEARCH%>"></td>
				</tr>
			</table>
		</center>
		<br>
		<center>

			<table border="1" class="table table-bordered">
				<tr>
					<th><center>
							Select All &nbsp;<input type="checkbox" class="checkbox1"
								id="selecctall">
						</center></th>
					<th>S.No</th>
					<th>Name</th>
					<th>Description</th>
					<th><center>Edit</center></th>
				</tr>

				<%
					int buttonNumber = (Integer) request.getAttribute("buttonNumber");

					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;

					List list = ServletUtility.getList(request);
					Iterator<RoleBean> it = list.iterator();
					while (it.hasNext()) {
						bean = it.next();
				%>
				<tr>

					<%
						if (bean.getId() != RoleBean.ADMIN) {
					%>
					<td><center>
							<input type="checkbox" name="ids" class="checkbox1"
								value="<%=bean.getId()%>">
						</center></td>
					<%
						} else {
					%>
					<td align="center">---</td>
					<%
						}
					%>

					<td><%=index++%></td>
					<td><%=bean.getName()%></td>
					<td><%=bean.getDescription()%></td>
					<%
						if (bean.getId() != RoleBean.ADMIN) {
					%>

					<td>
						<center>
							<a href="UserCtl?id=<%=bean.getId()%>">Edit</a>
						</center>
					</td>


					<%
						} else {
					%>
					<td align="center">---</td>
					<%
						}
					%>
				</tr>
				<%
					}
				%>
			</table>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation" class="btn btn-info"
						<%if (pageNo == 1) {%> disabled="disabled" <%}%>
						value="<%=RoleCtl.OP_PREVIOUS%>  "></td>
					<td><input type="submit" name="operation" class="btn btn-info"
						value="<%=RoleListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation" class="btn btn-info"
						value="<%=RoleListCtl.OP_DELETE%>"></td>

					<td align="right"><input type="submit" name="operation"
						class="btn btn-info"
						<%if (pageNo == buttonNumber || list.size() != pageSize)

			{%>
						disabled="disabled" <%}%> value="<%=RoleListCtl.OP_NEXT%>  "></td>

				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
	</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>