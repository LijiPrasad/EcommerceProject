<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
     <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String email=session.getAttribute("email").toString();
String status="processing";
try
{
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement stmt=con.prepareStatement("update cart set status=? where email='"+email+"' and status='bill'");
	stmt.setString(1,status);
	stmt.setString(2,email);
	stmt.executeUpdate();
	response.sendRedirect("home.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>