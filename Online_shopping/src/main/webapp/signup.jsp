<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/signup.css">
<title>Insert title here</title>
</head>
<body>
<div id='container'>

  <div class='signup'>
	<form action="signupaction.jsp" method="post">
	<input type="text" name="name" placeholder="Enter your Name" required>
	<input type="email" name="email" placeholder="Enter email" required>
	<input type="number" name="mobileNumber" placeholder="Enter mobile number" required>
	<select name ="securityQuestion">
	<option value="What is your favorite car ?">What is your favorite car ?</option>
	<option value="What is your pet name ?">What is your pet name ?</option>
	<option value="What is your favorite color?">What is your favorite color?</option>
	<option value="What is your school name?">What is your school name?</option>
	</select>
	<input type="text" name="answer" placeholder="enter answer" required>
	<input type="password" name="password" placeholder="enter password" required>
	<input type="submit" value="signup">
	</form>
	<h2><a href="Login.jsp">Login</a></h2>
  </div>
  <div class="whysign">
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){%>

	<h1>Successfully Registered</h1>
	<%} %>
	<%if("invalid".equals(msg))
		{%>
		<h1>Something went Wrong..Try Again</h1>
		<%} %>
<h2>Online shopping system</h2>
<p>The online shopping system is the application that allows  the users to shop online without going to the shops.</p>
   </div>
</div>

</body>
</html>