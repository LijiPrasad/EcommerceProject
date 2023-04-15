<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
    <%@ include file="header.jsp" %>
      <%@ include file="footer.jsp" %>
      
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/mycart.css">
<meta charset="ISO-8859-1">
<title>My Cart</title>
</head>
<body>
<center><h3 class="heading">My Cart</h3></center>
<%
String msg=request.getParameter("msg");

if("removed".equals(msg))
{
%>
<h3>Product Successfully removed!</h3>
<%} %>

<table>
<thead>
<%
int total=0;
int sno=0;

try{
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs.next())
	{
		total=rs.getInt(1);
	}
%>

<tr>
<th>Total :<%out.println(total); %></th>
<%if(total>0) {%><th><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><br><%} %>
</tr>
</thead>
<thead class="heading" >
<tr>
<th>Sl.No</th>
<th>Product Name</th>
<th>Category</th>
<th>Price</th>
<th>Quantity</th>
<th>Sub Total</th>
<th>Remove</th>
</tr>
</thead>

<tbody>

<%
ResultSet rs1=stmt.executeQuery("select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
while(rs1.next())
{
%>
<tr>
<%sno=sno+1;%>
<td><%out.println(sno);%></td>
<td><%=rs1.getString(2)%></td>
<td><%=rs1.getString(3)%></td>
<td><%=rs1.getString(4)%></td>
<td><%=rs1.getString(8)%></td>
<td><%=rs1.getString(10)%></td>
<td><a href="removefromcart.jsp?id=<%=rs1.getString(1)%>">Remove</a></td>
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