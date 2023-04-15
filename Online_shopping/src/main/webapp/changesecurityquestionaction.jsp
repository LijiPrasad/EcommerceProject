<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="com.online.shopping.ConnectionProvider" %>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String email=session.getAttribute("email").toString();
String securityquestion=request.getParameter("securityquestion");
String newanswer=request.getParameter("newanswer");
String password=request.getParameter("password");

int check=0;
try{

	Connection con=ConnectionProvider.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		stmt.executeUpdate("update users set securityQuestion='"+securityquestion+"', answer='"+newanswer+"' where email='"+email+"'");
		response.sendRedirect("changesecurityquestion.jsp?msg=done");
	}
	if(check==0)
		response.sendRedirect("changesecurityquestion.jsp?msg=wrong");
}
catch(Exception e)
{
	
}
%>
</body>
</html>