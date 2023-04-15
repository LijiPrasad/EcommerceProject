<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
    <%@ include file="changedetailsheader.jsp" %>
      <%@ include file="footer.jsp" %>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Security Question</title>
</head>
<body>
<% String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3>Your Security Question Successfully Changed</h3>
<%} %>
<% 
if("wrong".equals(msg))
{
%>
<h3>Your password is Wrong</h3>
<%} %>

<form action="changesecurityquestionaction.jsp" method="post">

<h3>Select your new Security question</h3>

<select name="securityquestion">
<option value="What is your favorite car ?">What is your favorite car ?</option>
	<option value="What is your pet name ?">What is your pet name ?</option>
	<option value="What is your favorite color?">What is your favorite color?</option>
	<option value="What is your school name?">What is your school name?</option>
</select>
<h3>Enter your new answer</h3>
<input type="text" name="newanswer" placeholder="Enter your new answer" required>
<h3>Enter password for security question</h3>
<input type="password" name="password" placeholder="Enter password for security" required>

<button type="submit">Save</button>
</form>
</body>
</html>