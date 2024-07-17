<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
<script>
if(window.history.forward(1)!+null)
	window.history.forward(1)</script>
		
<%
String email=session.getAttribute("email").toString();
int total=0;
int sno=0;
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cakeonline", "root", "");
    Statement st=conn.createStatement();
    ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
    while(rs1.next()) {
        total=rs1.getInt(1);
    }
%>

<a href="mycart.jsp" style="font-size: 24px; font-family: Arial, sans-serif; color: purple; text-decoration: none; transition: color 0.3s;"><u>Back</u></a>

<hr>
	
	
	
<table id="payment">
<thead>
<tr>
<th scope="col">S.No</th>
<th scope="col">Product name</th>
<th scope="col">Price</th>
<th scope="col">Quantity</th>
<th scope="col">Sub Total</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs2=st.executeQuery("select * from cakes inner join cart on cakes.id=cart.product_id and cart.email='"+email+"' and cart.address is Null");
while(rs2.next()) {
    sno++;
%>  
<tr>
<td><%= sno %></td>
<td><%= rs2.getString(2) %></td>
<td><%= rs2.getString(3) %></td>
<td><%= rs2.getString(6) %></td>
<td><%= rs2.getString(8) %></td>
</tr>
<%
}
ResultSet rs3=st.executeQuery("select * from login where email='"+email+"'");
if(rs3.next()) {
%>
</tbody>
</table><br>
<hr>
<div style="text-align: center;"><h2 class="invoice">Total:<%= total %></h2></div>
<hr><br>

<form action="addresspayment.jsp" method="post">
<center><h2 style="font-family:courier;">Order Details:</h2></center>

<h3>Address</h3>
<input type="text" name="address" value="<%= rs3.getString(5) %>" placeholder="Enter address" required>
<h3>Enter the city</h3>
<input type="text" name="city" value="<%= rs3.getString(6) %>" placeholder="Enter city" required>
<h3>State</h3>
<input type="text" name="state" value="<%= rs3.getString(7) %>" placeholder="Enter state" required>
<h3>Country</h3>
<input type="text" name="country" value="<%= rs3.getString(8) %>" placeholder="Enter country" required>
<h3>Select way of payment</h3>
<select name="paymentmethod">
<option value="Cash on Delivery(cod)">Cash on Delivery(cod)</option>
<option value="Online Payment">Online Payment</option>
</select>
<h3>Pay on cakecorner@paytm.com</h3>
<input type="text" name="transactionid" placeholder="Transaction Id">
<h5>If you select online payment, enter the transaction ID; otherwise, leave this blank</h5>
<h3>Mobile Number</h3>
<input type="tel" id="phone" name="phone" pattern="[0-9]{10}" value="<%= rs3.getString(3) %>" placeholder="Enter the mobile number" title="Please enter a 10-digit phone number" required>

<button type="submit">Proceed to generate bill & save</button>
</form>
<%
}

}catch(Exception e) {
    System.out.println(e);    
}
%>

</body>
</html>
