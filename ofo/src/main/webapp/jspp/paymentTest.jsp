
<%@page import="co.ctl.ORSView"%>
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
<form action="<%=ORSView.TEST_PAYMENT%>" method="POST">
<!-- Note that the amount is in paise = 50 INR -->
<script
    src="https://checkout.razorpay.com/v1/checkout.js"
    data-key="rzp_test_AUj2k85owlEOuS"
    data-amount="200"
    data-buttontext="Pay with Razorpay"
    data-name="Merchant Name"
    data-description="Purchase Description"
    data-image="https://your-awesome-site.com/your_logo.jpg"
    data-prefill.name="Harshil Mathur"
    data-prefill.email="support@razorpay.com"
    data-theme.color="#F37254"
></script>
<input type="hidden" value="soham" name="name">
<input type="hidden" value="Hidden Element" name="hidden">


</form>


</body>
</html>

