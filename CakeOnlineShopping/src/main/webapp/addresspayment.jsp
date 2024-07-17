<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CakeCorner</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String mobilenumber=request.getParameter("phone");
String paymentMethod=request.getParameter("paymentmethod");
String transactionid="";
transactionid=request.getParameter("transactionid");
String status="bill";

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cakeonline", "root", "");
    PreparedStatement ps=conn.prepareStatement("update login set address=?,city=?,state=?,country=?,mobilenumber=? where email=?");
    ps.setString(1,address);
    ps.setString(2,city);
    ps.setString(3,state);
    ps.setString(4,country);
    ps.setString(5,mobilenumber);
    ps.setString(6,email);
    ps.executeUpdate();
    PreparedStatement ps1=conn.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobile=?,orderdate=now(),deliverydate=DATE_ADD(orderDate, INTERVAL 7 DAY),paymentmethod=?,transactionid=?,status=? where email=? and address is NULL");
    ps1.setString(1,address);
    ps1.setString(2,city);
    ps1.setString(3,state);
    ps1.setString(4,country);
    ps1.setString(5,mobilenumber);
    ps1.setString(6,paymentMethod);
    ps1.setString(7,transactionid);
    ps1.setString(8,status);
    ps1.setString(9,email);
    ps1.executeUpdate();
    response.sendRedirect("bill.jsp");
}catch(Exception e)
{
    out.println("Error: " + e.getMessage());
}
%>
</body>
</html>
