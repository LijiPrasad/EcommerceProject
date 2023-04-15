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
<%String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");

try{
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement stmt=con.prepareStatement("update users set address=?,city=?,state=?,country=? where email=?");
	stmt.setString(1,address);
	stmt.setString(2,city);
	stmt.setString(3,state);
	stmt.setString(4,country);
	stmt.setString(5,email);
	stmt.executeUpdate();
	response.sendRedirect("addchangeaddress.jsp?msg=valid");
	
}
catch(Exception e)
{
	response.sendRedirect("addchangeaddress.jsp?msg=invalid");
}
%>
</body>
</html>