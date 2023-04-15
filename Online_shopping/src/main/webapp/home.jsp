<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="header.jsp" %>
      <%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("added".equals(msg)){%>

	<h1>Product added into Your Cart </h1>
	<%} %>
	<%if("exist".equals(msg))
		{%>
		<h1>Product Already exists in your cart.Quantity increased</h1>
		<%} %>
		<%if("invalid".equals(msg))
		{%>
		<h1>Something went Wrong .Try Again..</h1>
		<%} %>
<table>
	<thead>
	<tr>
	<th>ID</th>
	<th>Name</th>
	<th>Category</th>
	<th>Price</th>
	<th>Add to Cart</th>
	

	</tr>
	</thead>
	<tbody>
	
	
	<tr>
	<%
try
{
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product where active='yes'");
	while(rs.next())
	{
	%>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		
		<td><a href="addtocartaction.jsp?id=<%=rs.getString(1)%>">Add to Cart</a></td>
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