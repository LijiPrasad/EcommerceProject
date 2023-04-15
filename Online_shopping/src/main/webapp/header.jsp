<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/header.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String email=session.getAttribute("email").toString();
%>
<center><h1>Online Shopping</h1></center>
<div class="container">
<h3><a href="" ><%out.println(email); %></a></h3>
<a href="home.jsp">Home</a>
<a href="mycart.jsp">My cart</a>
<a href="myorders.jsp">My Orders</a>
<a href="changedetails.jsp">Change Details</a>
<a href="messageUs.jsp">Message us</a>
<a href="about.jsp">About</a>
<a href="logout.jsp">Log out</a>
</div>
<div class="search-container">
<form action="searchaction.jsp" method="post">
<input type="text" name="search" placeholder="Search here"> 
<button type="submit">Go</button>
</form>
</div>
</body>
</html>