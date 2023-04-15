<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/Login.css">
<title>Insert title here</title>
</head>
<body>
<div id='container'>

  <div class='login'>
	<form action="loginaction.jsp" method="post">
	
	<input type="email" name="email" placeholder="Enter email" required>
	
	<input type="password" name="password" placeholder="enter password" required>
	<input type="submit" value="Login">
	</form>
	<h2><a href="signup.jsp">SignUp</a></h2>
	<h2><a href="forgotpassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class="whylogin">
<%
String msg=request.getParameter("msg");
if("notexist".equals(msg)){%>

	<h1>incorrect username and password</h1>
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