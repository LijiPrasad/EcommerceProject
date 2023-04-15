<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id='container'>

  <div class='signup'>
	<form action="forgotpasswordaction.jsp" method="post">

	<input type="email" name="email" placeholder="Enter email" required>
	<input type="number" name="mobileNumber" placeholder="Enter mobile number" required>
	<select name ="securityQuestion">
	<option value="What is your favorite car ?">What is your favorite car ?</option>
	<option value="What is your pet name ?">What is your pet name ?</option>
	<option value="What is your favorite color?">What is your favorite color?</option>
	<option value="What is your school name?">What is your school name?</option>
	</select>
	<input type="text" name="answer" placeholder="enter answer" required>
	<input type="password" name="newPassword" placeholder="enter your new  password" required>
	<input type="submit" value="save">
	</form>
	<h2><a href="Login.jsp">Login</a></h2>
  </div>
  <div class="whyforgotpassword">
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){%>

	<h1>Password Changed Successfully </h1>
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