<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
    <%@ include file="header.jsp" %>
      <%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
	int z=0;
try
{
	String search=request.getParameter("search");
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product where name like'%"+search+"%' or category like'%"+search+"%' and active='yes'");
	while(rs.next())
	{
		z=1;
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