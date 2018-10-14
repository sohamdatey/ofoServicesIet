<%@page import="in.co.raystech.maven.project4.bean.CollegeBean"%>
<%@page import="in.co.raystech.maven.project4.model.UserModel"%>
<%@page import="in.co.raystech.maven.project4.bean.RoleBean"%>
<%@page import="in.co.raystech.maven.project4.controller.LoginCtl"%>
<%@page import="in.co.raystech.maven.project4.bean.UserBean"%>
<%@page import="in.co.raystech.maven.project4.controller.ORSView"%>
<html>
<head>

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/Cal.js"></script>
<link rel="stylesheet" href="./css/jquery-ui.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
@import 'https://fonts.googleapis.com/css?family=Raleway';

body {
	font-family: 'Raleway', sans-serif;
}

.container {
	padding: 40px 0
}

.welcomeMsg {
	padding: 0
}

h1 {
	margin-top: 0;
	color: black
}

.rlinks {
	padding-top: 10px
}

.toplist a, .toplist .btn-group {
	margin-top: 10px;
}

.fline {
	margin: 30px 0
}

.loginbox {
	max-width: 300px;
	text-align: left;
}

.box {
	max-width: 300px;
}

.forgot {
	display: block;
	text-align: right;
	margin: 5px 0 10px
}

.signup {
	margin-top: 20px
}

.signup .btn-link {
	padding: 0;
	margin-top: -2px
}
</style>
</head>

<jsp:useBean id="userBean"
	class="in.co.raystech.maven.project4.bean.UserBean" scope="session"></jsp:useBean>

<body>

	<%
		userBean = (UserBean) session.getAttribute("user");

		boolean userLoggedIn = userBean != null;

		String welcomeMsg = "Hi, ";

		if (userLoggedIn) {

			RoleBean role = (RoleBean) session.getAttribute("role");
			welcomeMsg += userBean.getFirstName() + " (" + role.getName() + ")";
		} else {
			welcomeMsg += "Guest";
		}

		RoleBean role = (RoleBean) session.getAttribute("role");
	%>

	<div class="container">
		<div class="clearfix">
			<a href="<%=ORSView.WELCOME_CTL%>" class="pull-left"> <img
				src="<%=ORSView.APP_CONTEXT%>/img/customLogo.gif.png" width="190">
			</a>

			<div class="pull-right rlinks">

				<a class="btn btn-primary" href="<%=ORSView.WELCOME_CTL%>">Home</a>
				&nbsp;
				<%
					if (userLoggedIn) {
				%>
				<a class="btn btn-primary"
					href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</b></a>

				<%
					} else {
				%>
				<a class="btn btn-info" href="<%=ORSView.LOGIN_CTL%>">Login</b></a>
				<%
					}
				%>
			</div>
		</div>
	</div>

	<div class="container welcomeMsg">
		<div class="text-center">
			<h3><%=welcomeMsg%></h3>
		</div>

		<table width="100%" border="0" class="toplist">
			<center>
				<%
					if (userLoggedIn) {
				%>

				<a class="btn btn-default" href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</b></a>
				&nbsp; <a class="btn btn-default"
					href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</b>
				</a> <a class="btn btn-default" href="<%=ORSView.RESUME_UPLOAD_CTL%>">Resume
					upload </b>
				</a> <a class="btn btn-default" href="<%=ORSView.BAKCHOD_CTL%>">Download </b>
				</a>



				<%
					if (role.getName().equalsIgnoreCase("admin")) {
				%>

				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Role <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">

						<li><a href="<%=ORSView.ROLE_CTL%>">Add Role</a></li>
						<li><a href="<%=ORSView.ROLE_LIST_CTL%>">Role List </a></li>
					</ul>
				</div>


				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						User <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="<%=ORSView.USER_CTL%>">Add User</a></li>
						<li><a href="<%=ORSView.USER_LIST_CTL%>">User's List</a></li>
					</ul>
				</div>

				<%
					}
				%>


				<%
					if (role.getName().equalsIgnoreCase("admin")) {
				%>

				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						College <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="<%=ORSView.COLLEGE_CTL%>">Add College </a></li>
						<li><a href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a></li>
					</ul>
				</div>


				<%
					}
				%>

				<%
					if (role.getName().equalsIgnoreCase("admin") || role.getName().equalsIgnoreCase("faculty")) {
				%>

				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Course <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">


						<%
							if (role.getName().equalsIgnoreCase("admin")) {
						%>
						<li><a href="<%=ORSView.COURSE_CTL%>">Add Course </a></li>
						<li><a href="<%=ORSView.SUBJECT_CTL%>">Add Subject </a></li>

						<%
							}
						%>


						<li><a href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a></li>
						<li><a href="<%=ORSView.SUBJECT_LIST_CTL%>">Subject List</a></li>

						<%
							}
						%>

					</ul>
				</div>


				<%
					if (role.getName().equalsIgnoreCase("admin")) {
				%>


				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Faculty <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">

						<li><a href="<%=ORSView.FACULTY_CTL%>">Add Faculty </a></li>
						<li><a href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty's
								List</a></li>
					</ul>
				</div>

				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Student <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">

						<li><a href="<%=ORSView.STUDENT_CTL%>">Add Student </a></li>
						<li><a href="<%=ORSView.STUDENT_LIST_CTL%>">Student's
								List </a></li>
					</ul>
				</div>


				<%
					}
				%>


				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Marksheet <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">

						<li><a href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>">Marksheet
								Merit List </a></li>

						<%
							if (role.getName().equalsIgnoreCase("admin")) {
						%>


						<li><a href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet </a> <%
 	}
 %>
						<li><a href="<%=ORSView.GET_MARKSHEET_CTL%>">Get
								Marksheet </a></li>
						</li>


						<li><a href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet
								List</a></li>
					</ul>
				</div>


				<%
					if (role.getName().equalsIgnoreCase("admin") || role.getName().equalsIgnoreCase("student")) {
				%>

				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						TimeTable <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">


						<%
							if (role.getName().equalsIgnoreCase("admin")) {
						%>


						<li><a href="<%=ORSView.TIMETABLE_CTL%>">Add TimeTable </a></li>
						<%
							}
						%>

						<li><a href="<%=ORSView.TIMETABLE_LIST_CTL%>">TimeTable
								List</a></li>


						<%
							}
						%>


					</ul>
				</div>




				<%
					if (role.getName().equalsIgnoreCase("admin")) {
				%>


				<a target="_blank" class="btn btn-default"
					href="<%=ORSView.JAVA_DOC_VIEW%>">Java Doc</b>
				</a>

				<%
					}
				%>

				<%
					}
				%>

			</center>

		</table>
		<hr>


	</div>

</body>

<script>
	$('.dropdown-toggle').dropdown()
</script>

</html>