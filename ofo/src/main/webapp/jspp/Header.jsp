<%@page import="in.co.raystech.maven.project4.util.ServletUtility"%>
<%@page import="co.ctl.SearchRestaurantCtl"%>
<%@page import="co.ctl.RestaurantLoginCtl"%>
<%@page import="com.dto.RestaurantDTO"%>
<%@page import="co.ctl.LoginCtl"%>
<%@page import="co.ctl.ORSView"%>
<%@page import="com.dto.UserBean"%>
<html>
<head>

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/calendar.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/Cal.js"></script>
<link rel="stylesheet" href="./css/jquery-ui.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/tomato.css">
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

<jsp:useBean id="userBean" class="com.dto.UserBean" scope="session"></jsp:useBean>
<jsp:useBean id="resBean" class="com.dto.RestaurantDTO" scope="session"></jsp:useBean>
<body>

	<%
		userBean = (UserBean) session.getAttribute("user");
		resBean = (RestaurantDTO) session.getAttribute("restaurant");

		boolean userLoggedIn = userBean != null;
		boolean restaurantLoggedIn = resBean != null;

		String welcomeMsg = "Hi, ";

		if (userLoggedIn) {

			welcomeMsg += userBean.getUserName();
		} else if (restaurantLoggedIn) {
			welcomeMsg += resBean.getName();
		}

		else {
			welcomeMsg += "Guest";

		}
	%>


	<div id="sticky_header" class="ui sticky v2">
		<header class="header  breadcrumb-present  navbar" id="header">
			<div class="header__links__container">
				<div class="header__links__wrapper">
					<a href="" class="link"></a> <a href="" class="link"></a>
				</div>
			</div>

			<div class="header__container">
				<div class="header__wrapper clearfix">
					<a class="logo__container left"> <img src="../images/ofo.png">
					</a>

					<%
						if (restaurantLoggedIn) {
					%>


					<%
						} else {
					%>
					<%-- 					<form action="<%=ORSView.SEARCH_RESTAURANT_CTL%>" method="post"> --%>
					<div class="search__container left">
						<div class="header__search-bar">

							<div id="search_main_container" class="full_search  ">
								<!-- 									<div id="search_bar_wrapper" class="search_bar search-zindex" -->
								<!-- 										role="form"> -->

								<!-- 										<div class="flex-shrink-1 search-box plr0i ml5 mr5" -->
								<!-- 											style="border-bottom-left-radius: 3px; border-bottom-right-radius: 3px;"> -->
								<!-- 											<div id="keywords_container" class="col-s-16 pr0"> -->
								<!-- 												<div id="keywords_pretext"> -->
								<!-- 													<div class="k-pre-1 hidden" style="overflow: hidden;"> -->
								<!-- 														&#128269; -->

								<!-- 														<div class="keyword_placeholder nowrap"> -->
								<!-- 															<div class="keyword_div">Search for restaurants or -->
								<!-- 																cuisines...</div> -->
								<!-- 														</div> -->
								<!-- 													</div> -->
								<!-- 													<div class="k-pre-2  w100"> -->
								<!-- 														<span class="search-bar-icon mr5">&#128269;</span> <label -->
								<!-- 															id="label_search_res" class="hdn">Search for -->
								<!-- 															restaurants or cuisines...</label> <input type="text" -->
								<%-- 															value="<%=ServletUtility.getParameter("searchRestaurant", request)%>" --%>
								<!-- 															name="searchRestaurant" role="combobox" -->
								<!-- 															aria-expanded="true" aria-autocomplete="list" -->
								<!-- 															aria-owns="keywords-by" -->
								<!-- 															aria-labelledby="label_search_res" id="keywords_input" -->
								<!-- 															class="discover-search" -->
								<!-- 															placeholder="Search for restaurants or cuisines..." -->
								<!-- 															autocomplete="off"> -->
								<!-- 													</div> -->
								<!-- 												</div> -->

								<!-- 											</div> -->
								<!-- 										</div> -->
								<!-- 										<div class="flex-shrink-0 plr0i"> -->
								<!-- 											&ensp;&ensp; <input type="submit" name="operation" -->
								<!-- 												class="btn btn-info" -->
								<%-- 												value="<%=SearchRestaurantCtl.OP_SEARCH%>"> --%>

								<!-- 										</div> -->


								<!-- 										<div class="clear"></div> -->
								<!-- 									</div> -->
							</div>

						</div>
					</div>
					<!-- 					</form> -->
					<%
						}
					%>

					<div id="login-navigation" class="login__container right">
						<div class="header-link">

							<%
								if (!userLoggedIn && !restaurantLoggedIn) {
							%>


							<a href="/ofo/jspp/MainLogin.jsp"
								class="signin-link header-login-button ui button mr0"
								id="signin-link">Log in</a><a
								href="/ofo/jspp/MainRegistration.jsp"
								class="signup-link header-login-button ui button mr0"
								id="signup-link">Create an account</a>
							<%
								} else {
							%>


							<div
								class="ui button header-icon-button cursor-pointer clearfix top right pointing dropdown mr0"
								tabindex="0">

								<div class="floating ui red mini label hidden"
									id="notifications-count"></div>

								<div class="dropdown">
									<div
										class="ui left inline header-icon-menu header-icon-profile mr5 dropdown-toggle"
										id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="true">
										<div
											class="ui left inline header-icon-menu header-icon-profile mr5">
											<img class="ui avatar image mr0 mini"
												data-original="https://b.zmtcdn.com/data/user_profile_pictures/732/736786d4339b9022ef2a751a50d1e732.jpg?fit=around%7C100%3A100&amp;crop=100%3A100%3B%2A%2C%2A"
												src="https://b.zmtcdn.com/data/user_profile_pictures/732/736786d4339b9022ef2a751a50d1e732.jpg?fit=around%7C100%3A100&amp;crop=100%3A100%3B%2A%2C%2A"
												alt="Yash" style="display: inline-block;">
										</div>
										<span class="username right ml0"> <%=welcomeMsg%> <small>&#9660;</small>
										</span>
									</div>
									<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
										<%
											if (restaurantLoggedIn) {
										%>

										<li><a href="<%=ORSView.RES_MENU_CTL%>">Go To Menu</a></li>
										<%
											} else {
										%>
										<li><a href="../ofo/jspp/index.jsp">Go to Home</a></li>
										<%
											}
										%>
										<li><a href="#">Another action</a></li>
										<li><a href="#">Something else here</a></li>
										<li role="separator" class="divider"></li>

										<%
											if (userLoggedIn) {
										%>
										<li><a class="btn btn-info btn-block"
											style="margin: 0 0 10px 15px; width: 136px"
											href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</a></li>

										<li><a class="btn btn-danger btn-block"
											style="margin: 0 0 10px 15px; width: 136px"
											href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">Logout</b></a></li>

										<%
											}
										%>

										<%
											if (restaurantLoggedIn) {
										%>
										<li><a class="btn btn-info btn-block"
											style="margin: 0 0 10px 15px; width: 136px"
											href="<%=ORSView.RESTAURANT_PROFILE_CTL%>">MyProfile</a></li>

										<li><a class="btn btn-danger btn-block"
											style="margin: 0 0 10px 15px; width: 136px"
											href="<%=ORSView.RESTAURANT_LOGIN_CTL%>?operation=<%=RestaurantLoginCtl.OP_LOG_OUT%>">Logout</b></a></li>

										<%
											}
										%>



									</ul>
								</div>
							</div>


							<%
								}
							%>

						</div>

					</div>
				</div>
			</div>

		</header>

	</div>

	<div class="clear"></div>


</body>

<script>
	$('.dropdown-toggle').dropdown()
</script>

</html>