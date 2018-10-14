<%@page import="java.util.Iterator"%>
<%@page import="com.dto.RestaurantDTO"%>
<%@page import="co.ctl.*"%>
<%@page import="java.util.List"%>

<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="in.co.raystech.maven.project4.util.HTMLUtility"%>


<jsp:useBean id="bean" scope="request" class="com.dto.RestaurantDTO"></jsp:useBean>

<body>



	<form action="<%=ORSView.WELCOME_CTL%>" class="container" id="noBack">

		<center>

			<%
				List list = ServletUtility.getList(request);
				Iterator<RestaurantDTO> it = list.iterator();

				int size = list.size();

				while (it.hasNext())

				{
					bean = it.next();
			%>
			<tr>
				<h2>


					<a href="McDonalds"><%=bean.getImageURL()%></a>
				</h2>
				<%
					}
				%>
			</tr>
			</table>


			<!-- 	<script>
			noBack();
		</script>
 -->
	</form>

</body>
</html>