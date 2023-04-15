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
<title>Change Mobile Number</title>
</head>
<body>
<%String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3>MobileNumber Successfully Updated</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3>Entered Password is wrong</h3>
<%} %>

<form action="changemobilenumberaction.jsp" method="post">
<h3>Enter your new mobile number</h3>
<input type="number" name="mobilenumber" placeholder="Enter your new MobileNumber" required>

<h3>Enter your Password</h3>
<input type="password" name="password" placeholder="Enter your password for security" required>

<button type="submit">Save</button>
</form>
</body>
</html>