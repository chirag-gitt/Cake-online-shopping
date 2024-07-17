<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="bill.css">
<title>CakeCorner</title>
</head>
<body>
  <%
   String email=session.getAttribute("email").toString();
   try{
       int total=0;
       int sno=0;
       Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cakeonline", "root", "");
       Statement st=conn.createStatement();
       ResultSet rs=st.executeQuery("select sum(total) from cart where email='"+email+"' and status='bill'");
       while(rs.next())
       {
           total=rs.getInt(1);
       }
       ResultSet rs2=st.executeQuery("select * from login inner join cart on login.email=cart.email where cart.email='"+email+"' and cart.status='bill'");
       while(rs2.next())
       {
    	   
           %>
 
<h1>CakeCorner</h1> 
    <img src="cakes/logo.png" class="logo">
    <hr>
<div style="text-align: center;"><h2 class="invoice">INVOICE</h2></div>
<hr><br><BR>
    
    
    <div class="container">
    <div class="box">
    <b>
    <h1>From:</h1>
    CakeCorner<br>
    Jhilmil Colony, Delhi-95
    cakecorner@gmail.com      <br>                                                                                                                                     
      +91-9821998409      <br>  
      
Indulge in happiness, one bite at a time. Welcome to our cake paradise!                                                                                                                                     
    
    </b>
    </div>
           <div class="box">
           <b>
           <h1>Invoice To:</h1>
           <%=rs2.getString(1) %>,<Br>
           <%=email %>,<Br>
           <%=rs2.getString(18)%>,<Br>
           <%=rs2.getString(15)%>,<Br>
           <%=rs2.getString(14)%>,
           <%=rs2.getString(16)%>,<Br>
           <%=rs2.getString(17)%><Br></b>
           </div></div><br><br>
           <div class="order-details">
  <div class="order-detail">
    <span class="heading">Order Date:</span> <%=rs2.getString(19)%>
  </div>
  <div class="order-detail">
    <span class="heading">Payment Method:</span> <%=rs2.getString(21)%>
  </div>
</div>
<div class="order-details">
  <div class="order-detail">
    <span class="heading">Expected Delivery:</span> <%=rs2.getString(20)%>
  </div>
  <div class="order-detail">
    <span class="heading">Transaction Id:</span> <%=rs2.getString(22)%>
  </div>
</div>
 <hr>
<div style="text-align: center;"><h2 class="invoice">PRODUCT DETAILS</h2></div>
<hr><br>
           
           <table id="bill">
           
           <tr>
           <th>S.No</th>
           <th>Product Name</th>
           <th>price</th>
           <th>Quantity</th>
           <th>Sub Total</th>
           </tr>
           <%
           ResultSet rs1 = st.executeQuery("SELECT * FROM cart INNER JOIN cakes ON cart.product_id = cakes.id WHERE cart.email = '" + email + "' AND cart.status = 'bill'");

          while(rs1.next())
          {
        	  sno=sno+1;
          
           
           %>
           <tr>
           <td><%out.println(sno); %></td>
           <td><%=rs1.getString(17) %></td>
           <td><%=rs1.getString(18)%></td>
           <td><%=rs1.getString(3)%></td>
           <td><%=rs1.getString(5)%></td>
           </tr>
           <% } %>
           </table><Br>
           <hr><div style="text-align: center;"><h2 class="invoice">Total: <%out.println(total); %></h2></div>
           <hr>
<a href="continueshopping.jsp" class="pink-button"><button>Continue Shopping</button></a>
<a onclick="window.print();" class="pink-button"><button>Print</button></a>
           
           <%
       }
   }catch(Exception e)
   {
       System.out.println(e);
   }
   %>
 
    
</body>
</html>
