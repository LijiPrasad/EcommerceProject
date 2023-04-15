<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
    <%@ include file="changedetailsheader.jsp" %>
      <%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/changedetails.css">
<meta charset="ISO-8859-1">
<title>Change Details</title>
</head>
<body>

<%
try{
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"'");
	while(rs.next())
	{
	%>	

<h3>Name :<%=rs.getString(1) %></h3>
<h3>Email :<%=rs.getString(2) %></h3>
<h3>MobileNumber :<%=rs.getString(3) %></h3>
<h3>Security Question :<%=rs.getString(4) %></h3>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
	%>
	
	
</body>
</html>