<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
    <%@ include file="header.jsp" %>
      <%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message Us</title>
</head>
<body>
<%String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3>Message Successfully sent.</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3>Something went wrong.try again!!</h3>
<%} %>
<form action="messageUsAction.jsp" method="post">
<input type="text" name="subject" placeholder="your Subject" required><br>
<textarea  name="body" placeholder=" enter your message" required></textarea><br>
<button type="submit">Save</button>
</form>
</body>
</html>