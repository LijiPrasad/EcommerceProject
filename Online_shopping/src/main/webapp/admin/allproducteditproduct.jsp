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
String msg=request.getParameter("msg");
if("done".equals(msg)){%>

	<h1>Product Updated Successfully</h1>
	<%} %>
	<%if("invalid".equals(msg))
		{%>
		<h1>Something went Wrong..Try Again</h1>
		<%} %>
<h1>All Products and Edit Products</h1>
<table>
	<thead>
	<tr>
	<th>ID</th>
	<th>Name</th>
	<th>Category</th>
	<th>Price</th>
	<th>Status</th>
	<th>Edit</th>

	</tr>
	</thead>
	<tbody>
	
	
	<tr>
	<%
try
{
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product");
	while(rs.next())
	{
	%>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><a href="editproduct.jsp?id=<%=rs.getString(1) %>">Edit</a></td>
		</tr>
		<% 
	}
}
catch(Exception e)
{
	System.out.println(e);
}
	%>
	</tbody>
	</table>



</body>
</html>