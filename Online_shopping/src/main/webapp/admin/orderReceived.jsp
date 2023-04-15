<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
     <%@include file="adminHeader.jsp"  %>
     <%@include file="adminFooter.jsp"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Received</title>
</head>
<body>
<%String msg=request.getParameter("msg");
if("cancel".equals(msg))
{
%>
<h3>Order Cancelled Successfully</h3>
<%} %>

<%
if("delivered".equals(msg))
{
%>
<h3>Order delivered</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3>Something Went Wrong..</h3>
<%} %>


<table>
<tr>
<th>Mobile Number</th>
<th>Product Name</th>
<th>Quantity</th>
<th>Sub Total</th>
<th>Address</th>
<th>City</th>
<th>State</th>
<th>Country</th>
<th>Order Date</th>
<th>Expected Delivery Date</th>
<th>Payment Method</th>
<th>T-ID</th>
<th>Status</th>
<th>Cancel Order</th>
<th>Order Delivered</th>
</tr>
<%

try
{
	 
	  Connection con= ConnectionProvider.getConnection();
	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='processing'");
	  while(rs.next())
	  {
		 

%>

<tr>
<td><%=rs.getString(10) %></td>
<td><%=rs.getString(17) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>
<td><%=rs.getString(11) %></td>
<td><%=rs.getString(12) %></td>
<td><%=rs.getString(13) %></td>
<td><%=rs.getString(14) %></td>
<td><%=rs.getString(15) %></td>
<td><a href="cancelOrdersAction.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Cancel</a></td>
<td><a href="deliveredOrders.jsp?id=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Delivered</a></td>
</tr>
</table>
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