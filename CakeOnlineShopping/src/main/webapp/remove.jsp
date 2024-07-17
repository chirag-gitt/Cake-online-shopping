<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
try{
	  Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cakeonline", "root", "");
      Statement st=conn.createStatement();
      st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+product_id+"' and address is NULL");
      response.sendRedirect("mycart.jsp?msg=removed");
}

catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>