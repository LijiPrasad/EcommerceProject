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
<title>Insert title here</title>
</head>
<body>
<table>
<thead>
<tr>
<th>ID</th>
<th>Email</th>
<th>Subject</th>
<th>Body</th>
</tr>
</thead>
<tbody>
<%
try {
	  
	  Connection con= ConnectionProvider.getConnection();
	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from message");
	  while(rs.next())
	  {
		  %>
		  
		  <tr>
		  <td><%=rs.getString(1) %></td>
		   <td><%=rs.getString(2) %></td>
		    <td><%=rs.getString(3) %></td>
		     <td><%=rs.getString(4) %></td>
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