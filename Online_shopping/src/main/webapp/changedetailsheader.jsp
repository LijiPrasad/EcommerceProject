<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/changedetailsheader.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<centre><h2 ">Change Details</h2 ></centre>
<%String email=session.getAttribute("email").toString(); %>
<h2><a href="">Back</a></h2>
<h2><a href="home.jsp">Your Profile(<%out.println(email); %>)</a></h2>
<a href="changepassword.jsp">Change Password</a>
<a href="addchangeaddress.jsp">Change Address</a>
<a href="changesecurityquestion.jsp">Change Security Question</a>
<a href="changemobilenumber.jsp">Change MobileNumber</a>
</body>
</html>