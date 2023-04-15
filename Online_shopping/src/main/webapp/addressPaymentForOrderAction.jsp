<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
     <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String mobileNumber=request.getParameter("mobileNumber");
String paymentMethod=request.getParameter("paymentMethod");
String transaction_id="";
transaction_id=request.getParameter("transactionId");
String status="bill";
try
{
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement stmt=con.prepareStatement("update users set address=?,city=?,state=?,country=?,mobileNumber=? where email=?");
	stmt.setString(1,address);
	stmt.setString(2,city);
	stmt.setString(3,state);
	stmt.setString(4,country);
	stmt.setString(5,mobileNumber);
	stmt.setString(6,email);
	stmt.executeUpdate();
	
	
	PreparedStatement stmt1=con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transaction_id=?,status=? where email=? and address is NULL");
	stmt1.setString(1,address);
	stmt1.setString(2,city);
	stmt1.setString(3,state);
	stmt1.setString(4,country);
	stmt1.setString(5,mobileNumber);
	stmt1.setString(6,paymentMethod);
	stmt1.setString(7,transaction_id);
	stmt1.setString(8,status);
	stmt1.setString(9,email);
	stmt1.executeUpdate();
	response.sendRedirect("bill.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}

%>
</body>
</html>