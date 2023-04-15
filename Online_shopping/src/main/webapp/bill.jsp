<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
    <%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
try
{
	int total=0;
	int sno=0;
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
	while(rs.next())
	{
		total=rs.getInt(1);
	}
	ResultSet rs1=stmt.executeQuery("select * from users inner join where cart.email='"+email+"'and cart.status='bill'");
	while(rs1.next())
	{

%>
<h3>Name:<%=rs1.getString(1) %></h3>
<h3>Email:<%out.println(email); %></h3>
<h3>Mobile Number:<%=rs1.getString(20)%></h3>
<h3>Order Date:<%=rs1.getString(21)%></h3>
<h3>Payment Method:<%=rs1.getString(23) %></h3>
<h3>Expected Delivery:<%=rs1.getString(22) %></h3>
<h3>Transaction ID:<%=rs1.getString(24) %></h3>
<h3>City:<%=rs1.getString(17) %></h3>
<h3>Address:<%=rs1.getString(16) %></h3>
<h3>State:<%=rs1.getString(18) %></h3>
<h3>Country:<%=rs1.getString(19) %></h3>
<%
break;

}
%>
<table>
<h3>Product Details</h3>
<tr>
<th>Sl.No</th>
<th>Product Name</th>
<th>Category</th>
<th>Price </th>
<th>Quantity</th>
</tr>
<%
ResultSet rs2=stmt.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill'");
while(rs2.next())
{
	sno=sno+1;

%>
<tr>
<td><%out.println(sno); %></td>
<td><%=rs2.getString(17) %></td>
<td><%=rs2.getString(18) %></td>
<td><%=rs2.getString(19) %></td>
<td><%=rs2.getString(3) %></td>
<td><%=rs2.getString(5) %></td>
</tr>
<tr>
<%} %>
</table>
<h3>total :<%out.println(total); %></h3>
<a href="continueShopping.jsp">Continue Shopping</a>

<%
}
catch(Exception e)
{
}
%>
</body>
</html>