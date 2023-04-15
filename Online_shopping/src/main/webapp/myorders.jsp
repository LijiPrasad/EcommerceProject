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
<th>Sl.No</th>
<th>Product Name</th>
<th>Category</th>
<th>Price</th>
<th>Quantity</th>
<th>Sub Total</th>
<th>Order Date</th>
<th>Expected Delivery Date</th>
<th>Payment Method</th>
<th>Status</th>

</tr>
</thead>
<tbody>

<%
int sno=0;
try{
	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderdate is not NULL");
	while(rs.next())
	{
		sno=sno+1;
%>
<tr>
<td><%out.println(sno); %></td>
<td><%=rs.getString(17)%></td>
<td><%=rs.getString(18)%></td>
<td><%=rs.getString(19)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(11)%></td>
<td><%=rs.getString(12)%></td>
<td><%=rs.getString(13)%></td>
<td><%=rs.getString(15)%></td>

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