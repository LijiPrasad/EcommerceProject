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
String oldpassword=request.getParameter("oldpassword");
String newpassword=request.getParameter("newpassword");
String confirmpassword=request.getParameter("confirmpassword");

if(!confirmpassword.equals(newpassword))
	response.sendRedirect("changepassword.jsp?msg=not match");
else{
	int check=0;
	try{
		Connection con=ConnectionProvider.getConnection();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"' and password='"+oldpassword+"'");
		while(rs.next())
		{
			check=1;
			stmt.executeUpdate("update users set password='"+newpassword+"' where email='"+email+"'");
			response.sendRedirect("changepassword.jsp?msg=done");
		}
		if(check==0){
			response.sendRedirect("changepassword.jsp?msg=wrong");
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
}
%>
</body>
</html>