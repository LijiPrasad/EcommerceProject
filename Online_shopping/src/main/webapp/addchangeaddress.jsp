<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
    <%@ include file="changedetailsheader.jsp" %>
      <%@ include file="footer.jsp" %>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add or change Address</title>
</head>
<body>
<%String msg=request.getParameter("msg");
if("valid".equals(msg))
{
	
%>
<h3>Address Successfully updated!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
	
%>
<h3>Something Went Wrong!</h3>
<%} %>
<%
try
{
		Connection con=ConnectionProvider.getConnection();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"'");
		while(rs.next())
		{

%>
<form action="addchangeaddressaction.jsp" method="post">
<h3>Enter the Address :</h3>
<input type="text" name="address" value="<%=rs.getString(7)%>" placeholder="Enter address" required>
<h3>Enter City:</h3>
<input type="text" name="city" value="<%=rs.getString(8)%>" placeholder="Enter city" required>
<h3>Enter State :</h3>
<input type="text" name="state" value="<%=rs.getString(9)%>" placeholder="Enter state" required>
<h3>Enter Country :</h3>
<input type="text" name="country" value="<%=rs.getString(10)%>" placeholder="Enter country" required><br>
<button type="submit">Save</button>
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