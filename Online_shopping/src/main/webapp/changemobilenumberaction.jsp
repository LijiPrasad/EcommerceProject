<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Mobile Number</title>
</head>
<body>
<%String email=session.getAttribute("email").toString();
String mobilenumber=request.getParameter("mobilenumber");
String password=request.getParameter("password");
int check=0;
try{
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		stmt.executeUpdate("update users set mobileNumber='"+mobilenumber+"' where email='"+email+"'");
		response.sendRedirect("changemobilenumber.jsp?msg=done");
	}
	if(check==0)
	response.sendRedirect("changemobilenumber.jsp?msg=wrong");
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>