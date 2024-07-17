<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="cart.css">
    <meta charset="UTF-8">
    <title>CakeCorner</title>
    
    
</head>
<body>
    <h1>CakeCorner</h1>
    <img src="cakes/logo.png" class="logo">
    
            <%
            String email = session.getAttribute("email").toString();
            int total = 0;
            int sno = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cakeonline", "root", "");
                Statement st = conn.createStatement();
                ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='" + email + "' and address is NULL");
                while (rs1.next()) {
                    total = rs1.getInt(1);
                }
            %>
            		 <hr>
<div style="text-align: center;"><h2 class="invoice">Total:<%out.println(total); %></h2></div>
<hr>
               
                <% if(total > 0) { %>
                   <a href="payment.jsp" style="font-size: 24px; font-family: Arial, sans-serif; color: purple; text-decoration: none; transition: color 0.3s;"><u>Proceed To Order</u></a>
                <% } %>
            
        <div class="container"> 
            <%
            ResultSet rs = st.executeQuery("select * from cakes inner join cart on cakes.id=cart.product_id and cart.email='" + email + "' and cart.address is Null");
            while (rs.next()) {
                %>
    <% sno = sno + 1; %>
    
<div class="box">
    <b>S.no: <%= sno %></b>
    <b>Name: <%= rs.getString(2) %></b>
    <b>Price(kg): <%= rs.getString(3) %></b>
    <b>Quantity: <%= rs.getString(6) %></b>
    <b>Sub-Total: <%= rs.getString(8) %></b>
    <a href="remove.jsp?id=<%= rs.getString(1) %>">Remove</a>
</div>

    
                
                <%
            }
            } catch(Exception e) {
            }
            %>
        </div>
       
    </body>
</html>
