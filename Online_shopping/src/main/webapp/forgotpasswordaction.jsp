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
String email=request.getParameter("email");
String mobileNumber=request.getParameter("mobileNumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String newPassword=request.getParameter("newPassword");


int check=0;
try{
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"' and mobileNumber='"+mobileNumber+"'and securityQuestion='"+securityQuestion+"'and answer='"+answer+"'");
	
	while(rs.next())
		
	{
		check=1;
		stmt.executeUpdate("update users set paswword='"+newPassword+"' where email='"+email+"'");
		response.sendRedirect("forgotpassword.jsp?msg=done");
	}
	if(check==0)
	
		response.sendRedirect("forgotpassword.jsp?msg=invalid");
	
	}
catch(Exception e)
{
	System.out.println(e);
	
	}
%>
</body>
</html>