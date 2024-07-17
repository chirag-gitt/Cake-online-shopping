<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cake Corner</title>
    <link rel="stylesheet" href="Design.css">
</head>
<body class="showcart">
    <div class="web">
        <img src="cakes/logo.png" class="logo">
        
      <% String email = (String)session.getAttribute("email"); 
      int total=0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cakeonline", "root", "")) {
                Statement st=conn.createStatement();
        %>
        <h1>CakeCorner</h1>
        <ul>
         <li><img src="cakes/icons8-logout-50.png" style="height: 45px; width: 35px;"></li>
         
        <li><a href="cakes.jsp">Log Out</a></li>
           <li><img src="cakes/icons8-contact-us-32.png" href="#c1" style="height: 45px; width: 35px;"></li>
           <li><a href="#c1">Contact Us</a></li>
          <%    ResultSet rs1 = st.executeQuery("SELECT SUM(quantity) FROM cart WHERE email='" + email + "' AND address IS NULL");

       while(rs1.next())
       {
       total=rs1.getInt(1);
       }
    	   %>

            
           <li><div class="icon-cart"><img  src="cakes/iconscart.png" href="mycart.jsp" style="height: 30px; width: 25px;"><span><%out.println(total); %></span></div></li>
           <li> <a href="mycart.jsp">My Cart</a></li>
            <li><img  src="cakes/purchase-order-24.png" href="myorder.jsp" style="height: 45px; width: 30px;"></li>
            <li><a href="myorder.jsp">My Orders</a></li>
             <li><img src="cakes/icons8-time-machine-50.png" style="height: 45px; width: 35px;"></li>
             <li> <div id="last-visited">Last visited: <span id="last-visited-time"></span></div>
             <script>
             document.addEventListener("DOMContentLoaded", function() {
            	    if (typeof(Storage) !== "undefined") {
            	       if (localStorage.getItem("lastVisited")) {
            	           var lastVisitedTime = localStorage.getItem("lastVisited");
            	            document.getElementById("last-visited-time").textContent = lastVisitedTime;
            	        } else {
            	        document.getElementById("last-visited-time").textContent = "Never visited before";
            	        }
                       var currentDate = new Date();
            	        var dateString = currentDate.toLocaleString();
            	        localStorage.setItem("lastVisited", dateString);
            	    } else {
            	    
            	        document.getElementById("last-visited-time").textContent = "Sorry, your browser does not support Web Storage.";
            	    }
            	});
</script>
              </li>
              <li><img src="cakes/user-24.png" style="height: 45px; width: 35px;"></li>
             <li><p style="color:white;"><% out.println(email); %></p></li>
        </ul><%
    
                    PreparedStatement pst = conn.prepareStatement("SELECT * FROM cakes WHERE id = ?");
                     pst.setInt(1, 1);
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
        %>
          <div class="container">
        <div class="box">
                        <img src="cakes/cheesecake.jpg" height="250px" width="250px" alt="cheesecake" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                        <%= rs.getString(1) %>
                        <b><%= rs.getString(2) %></b>
                            "Indulge in a slice of creamy, dreamy cheesecake bliss!<br>
                          <b> Price <%= rs.getString(3) %>/kg</b>
                        <button  class="button"><a href="addtocartaction.jsp?id=<%= rs.getString(1) %>">Add to cart</a></button>
                        </div>
        <% 
        
                    }
                    
                    pst.setInt(1, 2);
                    ResultSet rs2 = pst.executeQuery();
                    while (rs2.next()) {
        %>
           <div class="box">
                        <img src="cakes/blackforest.jpg" height="250px" width="250px" alt="blackforest" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                      
                        <%= rs2.getString(1) %>
                        <b><%= rs2.getString(2) %></b>
                        "Indulge in the rich layers of chocolate and cherries with every bite of our Black Forest Cake!"<br>
                       <b> Price <%= rs2.getString(3) %>/kg</b>
                      <button  class="button">  <a href="addtocartaction.jsp?id=<%= rs2.getString(1) %>">Add to cart</a></button>
                        </div>
        <% 
                    }
                    
                    pst.setInt(1, 3);
                    ResultSet rs3 = pst.executeQuery();
                    while (rs3.next()) {
        %>
           <div class="box">
                        <img src="cakes/brownie.jpg" height="250px" width="250px" alt="brownie" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                        <%= rs3.getString(1) %>
                        <b><%= rs3.getString(2) %></b>
                          "Indulge in a slice of rich, gooey brownie cake, a blissful blend of chocolatey decadence.<br>
                         <b> Price <%= rs3.getString(3) %>/kg</b>
                       <button  class="button"> <a href="addtocartaction.jsp?id=<%= rs3.getString(1) %>">Add to cart</a></button>
                        </div><br>
        <% 
                    }
                    pst.setInt(1, 4);
                    ResultSet rs4 = pst.executeQuery();
                    while (rs4.next()) {
        %>
           <div class="box">
                        <img src="cakes/blueberry.jpg" height="250px" width="250px" alt="blueberry" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                        <%= rs4.getString(1) %>
                        <b><%= rs4.getString(2) %></b>
                                "Indulge in the exquisite taste of blueberry cake, a burst of fruity bliss in every bite!"<br>
                           <B> Price <%= rs4.getString(3) %>/kg</B>
                        <button  class="button"><a href="addtocartaction.jsp?id=<%= rs4.getString(1) %>">Add to cart</a></button>
                        </div>
                        </div>
        <% 
                    }
                    pst.setInt(1, 5);
                    ResultSet rs5 = pst.executeQuery();
                    while (rs5.next()) {
        %>
        <div class="container">
           <div class="box">
                        <img src="cakes/icecream.jpg" height="250px" width="250px" alt="icecream" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                        <%= rs5.getString(1) %>
                        <b><%= rs5.getString(2) %></b>
                          "Indulge in the heavenly fusion of creamy ice cream and decadent cake layers, a divine treat for your taste buds!<br>
                          <b> Price <%= rs5.getString(3) %>/kg</b>
                      <button  class="button">  <a href="addtocartaction.jsp?id=<%= rs5.getString(1) %>">Add to cart</a><br></button>
                        </div>
        <% 
                    }
                    pst.setInt(1, 6);
                    ResultSet rs6 = pst.executeQuery();
                    while (rs6.next()) {
        %>
           <div class="box">
                        <img src="cakes/chocolate.jpg" height="250px" width="250px" alt="chocolate" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                        <%= rs6.getString(1) %>
                        <b><%= rs6.getString(2) %></b>
                            "Indulge in a slice of rich, decadent chocolate cake and let your taste buds dance with delight!"<br>
                         <b> Price <%= rs6.getString(3) %>/kg</b>
                      <button  class="button">  <a href="addtocartaction.jsp?id=<%= rs6.getString(1) %>">Add to cart</a></button>
                        </div>
        <% 
                    }
                    pst.setInt(1, 7);
                    ResultSet rs7 = pst.executeQuery();
                    while (rs7.next()) {
        %>
           <div class="box">
                        <img src="cakes/fruit.jpg" height="250px" width="250px" alt="fuit" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                        <%= rs7.getString(1) %>
                        <b><%= rs7.getString(2) %></b>
                              "Indulge in a slice of heaven with our luscious fruit cake, bursting with flavor in every bite!"<br>
                           <b>  Price <%= rs7.getString(3) %>/kg</b>
                       <button  class="button"> <a href="addtocartaction.jsp?id=<%= rs7.getString(1) %>">Add to cart</a></button>
                        </div>
        <% 
                    }
                    pst.setInt(1, 8);
                    ResultSet rs8 = pst.executeQuery();
                    while (rs8.next()) {
        %>
           <div class="box">
                        <img src="cakes/pineapple.jpg" height="250px" width="250px" alt="pineapple" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                        <%= rs8.getString(1) %>
                        <b><%= rs8.getString(2) %></b>
                           "Savor the tropical sweetness with every bite of our luscious pineapple cake!<br>
                      <b> Price <%= rs8.getString(3) %>/kg</b>
                       <button  class="button"> <a href="addtocartaction.jsp?id=<%= rs8.getString(1) %>">Add to cart</a></button>
                        </div>
                        </div>
        <% 
                    }
                    pst.setInt(1, 9);
                    ResultSet rs9 = pst.executeQuery();
                    while (rs9.next()) {
        %>
        <div class="container">
           <div class="box">
                        <img src="cakes/rainbow.jpg" height="250px" width="250px" alt="rainbow" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                        <%= rs9.getString(1) %>
                        <b><%= rs9.getString(2) %></b>
                           "Indulge in a slice of happiness with our vibrant rainbow cake!"<br>
                            <b>Price <%= rs9.getString(3) %>/kg</b>
                       <button  class="button"> <a href="addtocartaction.jsp?id=<%= rs9.getString(1) %>">Add to cart</a><br></button>
                        </div>
        <% 
                    }
                    pst.setInt(1, 10);
                    ResultSet rs10 = pst.executeQuery();
                    while (rs10.next()) {
        %>
           <div class="box">
                        <img src="cakes/redvelvet.jpg" height="250px" width="250px" alt="redvelvet" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                        <%= rs10.getString(1) %>
                        <b><%= rs10.getString(2) %></b>
                          "Indulge in a slice of happiness with our vibrant rainbow cake!"<br>
                           <b> Price <%= rs10.getString(3) %>/kg</b>
                        <button  class="button"><a href="addtocartaction.jsp?id=<%= rs10.getString(1) %>">Add to cart</a></button>
                        </div>
        <% 
                    }
                    pst.setInt(1, 11);
                    ResultSet rs11 = pst.executeQuery();
                    while (rs11.next()) {
        %>
           <div class="box">
                        <img src="cakes/stawberry.jpg" height="250px" width="250px" alt="strawberry" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                        <%= rs11.getString(1) %>
                        <b><%= rs11.getString(2) %></b>
                         "Indulge in the luscious delight of strawberry cake, a sweet symphony of freshness and flavor!"<br>
                           <B> Price <%= rs11.getString(3) %>/kg</B>
                       <button  class="button"> <a href="addtocartaction.jsp?id=<%= rs11.getString(1) %>">Add to cart</a>
                        </div>
        <% 
                    }
                    pst.setInt(1, 12);
                    ResultSet rs12 = pst.executeQuery();
                    while (rs12.next()) {
        %>
           <div class="box">
                        <img src="cakes/butterscotch.jpg" height="250px" width="250px" alt="butterscotch" onmouseover="enlarge(this)" onmouseleave="resize(this)">
                        <%= rs12.getString(1) %>
                        <b><%= rs12.getString(2) %></b>
                           "Delight in the rich and creamy goodness of butterscotch cake, a taste of pure indulgence!"<br>
                           <b>Price <%= rs12.getString(3) %>/kg</b>
                        <button  class="button"><a href="addtocartaction.jsp?id=<%= rs12.getString(1) %>">Add to cart</a></button>
                        </div>
                        </div>
                 <script>
        function enlarge(p) {
                     p.style.height = "300px";
                     p.style.width = "300px";
                 }
                 function resize(p)
                 {
                     p.style.height = "250px";
                     p.style.width = "250px";
                 }
                 </script>       
        <% 
                    }
                         }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
<footer id="c1">
    <pre>
    <b>Get in Touch                                                                          Address                                                                       Contact No.    </b>                       
    cakecorner@gmail.com                                                                   B-20 Jhilmil colony,                                                          +91-9821998409                       
    Cakecorner11@yahoo.in                                                                  Delhi-95                                                                     +011-22163925                        
    It’s all about the memories.
    </pre>
</footer>
</body>
</html>    