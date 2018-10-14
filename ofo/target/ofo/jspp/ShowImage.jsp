<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.io.*"%>
<%@page import="java.io.*,java.sql.*"%>
<%@page import="com.dto.UserBean"%>

<jsp:useBean id="userBean" class="com.dto.UserBean" scope="session"></jsp:useBean>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<meta charset="utf-8">
<title>food</title>
<link href='https://fonts.googleapis.com/css?family=Lobster+Two:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,300,700'
	rel='stylesheet' type='text/css' />

<!--MOBILE DEVICE-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<!--CSS-->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="../css/animate.css">
<link rel="stylesheet" type="text/css" href="../css/responsive.css" />

<!--JS-->

<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/modernizr.js"></script>
<script src="../js/scripts.js"></script>
<script src="../js/waypoints.min.js"></script>
</head>
<body>

	<center>
		<div class="card" style="width: 400px">
			<img class="card-img-top"
				src=" <%// declare a connection by using Connection interface Connection connection = null;
			/* Create string of connection url within specified format with machine 
			name, port number and database name. Here machine name id localhost 
			and database name is mahendra. */
			String connectionURL = "jdbc:mysql://localhost:3306/appdb";
			/*declare a resultSet that works as a table resulted by execute a specified 
			sql query. */

			Connection connection;
			ResultSet rs = null;
			// Declare statement.
			PreparedStatement psmnt = null;
			// declare InputStream object to store binary stream of given image.
			InputStream sImage;
			try {
				// Load JDBC driver "com.mysql.jdbc.Driver"
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				/* Create a connection by using getConnection() method that takes 
				parameters of string type connection url, user name and password to 
				connect to database. */
				connection = DriverManager.getConnection(connectionURL, "root", "root");
				/* prepareStatement() is used for create statement object that is 
				used for sending sql statements to the specified database. */
				psmnt = connection.prepareStatement("SELECT photo FROM contacts WHERE contact_id = ?");
				psmnt.setString(1, "1"); // here integer number '11' is image id from the table
				rs = psmnt.executeQuery();
				if (rs.next()) {
					byte[] bytearray = new byte[1048576];
					int size = 0;
					sImage = rs.getBinaryStream(1);
					response.reset();
					while ((size = sImage.read(bytearray)) != -1) {
						response.getOutputStream().write(bytearray, 0, size);
					}
				}
			} catch (Exception ex) {
				out.println("error :" + ex);
			}%>"
				alt="Card image">
			<div class="card-body">
				<h4 class="card-title">John Doe</h4>
				<p class="card-text">Some example text.</p>
				<a href="#" class="btn btn-primary">See Profile</a>
			</div>
		</div>
	</center>

</body>
</html>