<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CakeCorner</title>
<link rel="stylesheet" href="Design.css">
</head>
<body>
<h1>CakeCorner</h1> 
    <img src="cakes/logo.png" class="logo">

<%
String email=session.getAttribute("email").toString();
String status="processing";
try{
	  Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cakeonline", "root", "");
      PreparedStatement ps=conn.prepareStatement("update cart set status=? where email=? and status='bill'");
      ps.setString(1,status);
      ps.setString(2,email);
      ps.executeUpdate();
      response.sendRedirect("web.jsp");
    
}catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>