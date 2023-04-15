<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
   
      <%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<script>
if(windows.history.forward(1)!=null)
	window.history.forward(1);
</script>
</head>
<body>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
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
<th><a href="mycart.jsp">Back</a></th>
<th>Total<%out.println(total); %></th>


</tr>
</thead>
<thead>
<tr>
<th>Sl.No</th>
<th>Product Name</th>
<th>Category</th>
<th>Price</th>
<th>Quantity</th>
<th>Sub Total</th>

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
</tr>
<%}
ResultSet rs2=stmt.executeQuery("select * from users where email='"+email+"'");
while(rs2.next())
{
%>
</tbody>
</table>
<form action="addressPaymentForOrderAction.jsp" method="post">

<h3>Enter Address</h3>
<input type="text" name="address" value="<%=rs2.getString(7)%>" placeholder="Enter Address" required>
<h3>Enter City</h3>
<input type="text" name="city" value="<%=rs2.getString(8)%>" placeholder="Enter city" required>
<h3>Enter State</h3>
<input type="text" name="state" value="<%=rs2.getString(9)%>" placeholder="Enter state" required>
<h3>Enter Country</h3>
<input type="text" name="country" value="<%=rs2.getString(10)%>" placeholder="Enter country" required>
<h3>Select the Payment Method</h3>
<select name="paymentMethod">
<option value="COD">COD</option>
<option value="Online Payment">Online Payment</option>

</select>
<h3>Pay online on this Inmakes@pay.com</h3>
<input type="text" name="transactionId" placeholder="Enter transactionId">
<h3>Enter Mobile Number</h3>
<input type="text" name="mobileNumber" value="<%=rs2.getString(3)%>" placeholder="Enter Mobile Number" required>
<button type="submit">Proceed to Generate Bill and Save</button>
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