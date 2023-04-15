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
try {
	String id=request.getParameter("id");
	
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from product where id='"+id+"'");
			while(rs.next())
			{
				%>	
				
				<form action="editproductaction.jsp" method="post">
				<input type="hidden" name="id" value="<% out.println(id); %>">
				
				<div class="left-div">
				<h3>Enter Name</h3>
				<input class="input-style" type="text" name="name" value="<%=rs.getString(2) %>" required="required">
				</div>
				
				<div class="right-div">
				<h3>Enter Category</h3>
				<input class="input-style" type="text" name="category" value="<%=rs.getString(3) %>" required="required">
				</div>
				
				
				<div class="left-div">
				<h3>Enter Price</h3>
				<input class="input-style" type="text" name="price" value="<%=rs.getString(4) %>" required="required">
				</div>
				
				
				<div class="right-div">
				<h3>Active</h3>
				<select class="input-style" name="active">
				<option value="yes">Yes</option>
				<option value="no">No</option>
				</select>
				</div>
				
				
				<button class="button">Save</button>
				</form>
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