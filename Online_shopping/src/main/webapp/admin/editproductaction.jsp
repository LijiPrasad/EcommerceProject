<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@include file="adminHeader.jsp" %>
    <%@include file="adminFooter.jsp" %>
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
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");
try{
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	stmt.executeUpdate("update product set name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	if(active.equals("no"))
	{
		stmt.executeUpdate("delete from cart where productid='"+id+"' and address is NULL");
	}
	response.sendRedirect("allproducteditproduct.jsp?msg=done");
}
catch(Exception e)
{
	response.sendRedirect("allproducteditproduct.jsp?msg=invalid");
	System.out.println(e);
}
%>


</body>
</html>