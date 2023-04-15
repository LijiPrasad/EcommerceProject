

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
<% 
String msg=request.getParameter("msg");
if("done".equals(msg)){%>

	<h1>Product Added Successfully</h1>
	<%} %>
	<%if("wrong".equals(msg))
		{%>
		<h1>Something went Wrong..Try Again</h1>
		<%} %>
<%
int id=1;

try{
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select max(id) from product");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e){
	
}
%>
<h3 style="color: yellow;">Product ID: <% out.println(id); %></h3>
<form action="addnewproductaction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id); %>">


<div class="left-div">
<h3>Enter Name</h3>
<input class="input-style" type="text" name="name" placeholder="Enter product name" required="required">
</div>

<div class="right-div">
<h3>Enter category</h3>
<input class="input-style" type="text" name="category" placeholder="Enter category" required="required">
</div>

<div class="left-div">
<h3>Price</h3>
<input class="input-style" type="text" name="price" placeholder="Enter price" required="required">
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


</body>
</html>