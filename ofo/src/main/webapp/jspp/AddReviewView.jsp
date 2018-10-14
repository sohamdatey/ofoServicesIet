
<!DOCTYPE html>
<%@page import="co.ctl.RestaurantLoginCtl"%>
<%@page import="co.ctl.LoginCtl"%>
<%@page import="co.ctl.ORSView"%>
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


<%@page import="com.dto.*"%>
<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="in.co.raystech.maven.project4.util.DataUtility"%>


<html>
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
<html>
<body>
	<%@include file="/jspp/Header.jsp"%>
	<jsp:useBean id="bean" scope="request" class="com.dto.ReviewDTO"></jsp:useBean>
	
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-3">
			<img alt="Bootstrap Image Preview"
				src="http://www.layoutit.com/img/sports-q-c-140-140-3.jpg" />
		</div>
		<div class="col-md-5">

			<address>
				<strong>Twitter, Inc.</strong><br /> 795 Folsom Ave, Suite 600<br />
				San Francisco, CA 94107<br /> <abbr title="Phone">P:</abbr> (123)
				456-7890
			</address>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="container">
							<div class="row">
								<div class="col-md-8">
									
									<%
					int buttonNumber = (Integer) request.getAttribute("buttonNumber");
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;

					
					List<ReviewDTO> list = ServletUtility.getList(request);
					Iterator<ReviewDTO> it = list.iterator();

					int size = list.size();
					%>
									<div class="page-header">
										<h1>
											<small class="pull-right">45 comments</small> Comments
										</h1>
									</div>
									<% while (it.hasNext())

					                    {
						                  bean = it.next(); %>


									<div class="comments-list">
										<div class="media">
											<p class="pull-right">
												<small>5 days ago</small>
											</p>
											<a class="media-left" href="#"> <img
												src="http://lorempixel.com/40/40/people/1/">
											</a>
											<div class="media-body">

												<h4 class="media-heading user_name">Baltej Singh</h4>
												Wow! this is really great.

												<p>
													<small><a href="">Like</a> - <a href="">Share</a></small>
												</p>
											</div>
										</div>

									</div>
									
									<%
					}
				%>
								</div>



							</div>



							<table width="100%">
								<tr>
									<td><input type="submit" name="operation"
										class="btn btn-info" <%if (pageNo == 1)

			{%>
										disabled="disabled" <%}%>
										value="<%=RestMenuCtl.OP_PREVIOUS%>  "></td>
									<td><input type="submit" name="operation"
										class="btn btn-info" value="<%=RestMenuCtl.OP_NEW%>"></td>
									<td><input type="submit" name="operation"
										class="btn btn-info" value="<%=RestMenuCtl.OP_DELETE%>"></td>

									<td align="right"><input type="submit" name="operation"
										class="btn btn-info"
										<%if (pageNo == buttonNumber || list.size() != pageSize)

			{%>
										disabled="disabled" <%}%> value="<%=RestMenuCtl.OP_NEXT%>  "></td>

								</tr>
							</table>
						</div>


						<select class="custom-select custom-select-sm">
							<option selected>Rate your Heart out</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
							<option value="4">Four</option>
							<option value="5">Five</option>
						</select>
						<form action="<%=ORSView.LOGIN_CTL%>" method="post">
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Enter Your
									Precious Reviews!</label>
								<textarea class="form-control" id="review" rows="3"
									name="review"></textarea>
							</div>
							<button type="submit" class="btn btn-primary pull-right">Review</button>
						</form>


					</div>


				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	</div>





</body>
</html>

