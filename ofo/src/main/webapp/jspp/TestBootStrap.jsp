
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
<html>
<body>
	<%@include file="/jspp/Header.jsp"%>
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
									<div class="page-header">
										<h1>
											<small class="pull-right">45 comments</small> Comments
										</h1>
									</div>
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
								</div>



							</div>
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
								<textarea class="form-control" id="review"
									rows="3" name="review"></textarea>
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

