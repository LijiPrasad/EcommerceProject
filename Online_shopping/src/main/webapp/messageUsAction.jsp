<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message </title>
</head>
<body>
<%String email=session.getAttribute("email").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");
try{

	Connection con=ConnectionProvider.getConnection();
	PreparedStatement stmt=con.prepareStatement("insert into message(email,subject,body)values(?,?,?)");
	stmt.setString(1, email);
	stmt.setString(2, subject);
	stmt.setString(3, body);
	stmt.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("messageUs.jsp?msg=valid");
}
%>
</body>
</html>