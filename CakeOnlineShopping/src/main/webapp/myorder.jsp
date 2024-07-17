<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CakeCorner</title>
<link rel="stylesheet" href="payment.css">
</head>
<body>
<h1>CakeCorner</h1> 
<img src="cakes/logo.png" class="logo">

<% String email=session.getAttribute("email").toString();%>
<table id="payment">
<thead>
<tr>
<th scope="col">S.no</th>
<th scope="col">Product name</th>
<th scope="col">price</th>
<th scope="col">quantity</th>
<th scope="col">Sub total</th>
<th scope="col">order date</th>
<th scope="col">Expected delivery date</th>
<th scope="col">payment method</th>
<th scope="col">Transaction Id</th>
<th scope="col">Status</th>
</tr>
</thead>
<tbody>
<%
int sno=0;
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cakeonline", "root", "");
    Statement st=conn.createStatement();
    ResultSet rs=st.executeQuery("select * from cart inner join cakes on cart.product_id=cakes.id where cart.email='"+email+"' and cart.orderdate is not NULL");
    while(rs.next()) {
        sno++;
%>
<tr>
<td><%= sno %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("price") %></td>
<td><%= rs.getString("quantity") %></td>
<td><%= rs.getString("total") %></td>
<td><%= rs.getString("orderdate") %></td>
<td><%= rs.getString("deliverydate") %></td>
<td><%= rs.getString("paymentmethod") %></td>
<td><%= rs.getString("transactionid") %></td>
<td><%= rs.getString("status") %></td>
</tr>
<%
    }
}
catch(Exception e) {
    out.println(e);
}
%>
</tbody>
</table>
</body>
<footer id="c1">
    <pre>
    <b>Get in Touch                                                                          Address                                                                       Contact No.    </b>                       
    cakecorner@gmail.com                                                                   B-20 Jhilmil colony,                                                          +91-9821998409                       
    Cakecorner11@yahoo.in                                                                  Delhi-95                                                                     +011-22163925                        
    It’s all about the memories.
    </pre>
</footer>

</html>
