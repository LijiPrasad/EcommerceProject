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
<title>Insert title here</title>
</head>
<body>
<%String msg=request.getParameter("msg"); 
if("not match".equals(msg))
{
	%>
	<h3>New Password and confirm password does not match</h3>
	<%} %>
<% 
	if("wrong".equals(msg))
{
	%>
	<h3>Your old password is wrong</h3>
<%} %>
<% 
	if("done".equals(msg))
{
	%>
	<h3>Password Changed Successfully..</h3>
<%} %>
<% 
	if("invalid".equals(msg))
{
	%>
	<h3>Something Went Wrong!!</h3>
<%} %>
	
<form action="changepasswordaction.jsp" method="post">

<h2>Enter Old Password :</h2>
<input type="password" name="oldpassword" placeholder="Enter old password" required>

<h2>Enter New Password :</h2>
<input type="password" name="newpassword" placeholder="Enter new password" required>

<h2>Confirm Password :</h2>
<input type="password" name="confirmpassword" placeholder="Confirm password" required><br>

<button type="submit">Save</button>
</form>
</body>
</html>