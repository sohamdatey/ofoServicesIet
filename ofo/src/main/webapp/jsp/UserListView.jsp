<%@page import="in.co.raystech.maven.project4.util.DataValidator"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>
<%@page import="javax.mail.Header"%>
<%@page import="in.co.raystech.maven.project4.controller.UserListCtl"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.raystech.maven.project4.util.HTMLUtility"%>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/selectall.js"></script>
<html>
<body>
	<jsp:useBean id="bean" scope="request"
		class="in.co.raystech.maven.project4.bean.UserBean"></jsp:useBean>
	<%@include file="Header.jsp"%>


	<%
		List roleList = (List) request.getAttribute("roleList");
	%>
	<center>

		<h1>User List</h1>
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

	<form action="<%=ORSView.USER_LIST_CTL%>" class="container"
		method="post">



		<div class="form-group form-inline">

			<center>

				<label>First Name</label> <input type="text" class="form-control"
					name="firstName"
					value="<%=ServletUtility.getParameter("firstName", request)%>">
				&ensp;&ensp; <label>Email</label> <input type="text"
					class="form-control" name="login"
					value="<%=ServletUtility.getParameter("login", request)%>">
				&ensp;&ensp; <label>Role: </label>

				<%=HTMLUtility.getList("role", String.valueOf(bean.getRoleId()), roleList)%>

				&ensp;&ensp; <input type="submit" name="operation"
					class="btn btn-info" value="<%=UserListCtl.OP_SEARCH%>">
			</center>

		</div>

		<center>

			<table border="1" class="table table-bordered">
				<tr>
					<th>Select All &nbsp;<input type="checkbox" class="checkbox1"
						id="selecctall"></th>

					<th>S.No</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>LoginId</th>
					<th>Contact No.</th>
					<th>Gender</th>
					<th>DOB</th>
					<th>Role</th>
					<th>Edit</th>

				</tr>

				<%
					int buttonNumber = (Integer) request.getAttribute("buttonNumber");
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;

					List list = ServletUtility.getList(request);
					Iterator<UserBean> it = list.iterator();

					int size = list.size();

					while (it.hasNext())

					{
						bean = it.next();
				%>
				<tr>

					<%
						UserBean ubean = (UserBean) session.getAttribute("user");

							if (ubean.getId() != bean.getId()) {
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
					<td><%=bean.getFirstName()%></td>
					<td><%=bean.getLastName()%></td>
					<td><%=bean.getLogin()%></td>
					<td><%=bean.getMobileNo()%></td>
					<td><%=bean.getGender()%></td>
					<td><%=DataUtility.getDateString(bean.getDob())%></td>
					<td><%=HTMLUtility.getSelectedValue("collegeId", String.valueOf(bean.getRoleId()), roleList)%></td>

					<%
						if (ubean.getId() != bean.getId()) {
					%>

					<td><a href="UserCtl?id=<%=bean.getId()%>">Edit</a></td>


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
						<%if (pageNo == 1)

			{%> disabled="disabled" <%}%>
						value="<%=UserListCtl.OP_PREVIOUS%>  "></td>
					<td><input type="submit" name="operation" class="btn btn-info"
						value="<%=UserListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation" class="btn btn-info"
						value="<%=UserListCtl.OP_DELETE%>"></td>

					<td align="right"><input type="submit" name="operation"
						class="btn btn-info"
						<%if (pageNo == buttonNumber || list.size() != pageSize)

			{%>
						disabled="disabled" <%}%> value="<%=UserListCtl.OP_NEXT%>  "></td>

				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
	</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>