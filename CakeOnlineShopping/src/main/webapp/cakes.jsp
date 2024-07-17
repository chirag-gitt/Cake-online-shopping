<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CakeCorner</title>
    <link rel="stylesheet" href="login.css">
</head>
<body class="wallpaper">
    <h1>CakeCorner</h1> 
    <img src="cakes/logo.png" class="logo">
    <div class="container">
        <form class="form" action="" method="post">
            <h2>LOGIN</h2>
            <input type="email" id="email" placeholder="Enter Your Email"  class="box" name="email" required>
            <input type="password" id="password" placeholder="Enter The Password" class="box" name="password" required>
            <button type="submit" class="button1" id="submit">Log In</button>
       <a href='signup.html'><u>New to CakeCorner...?</u></a>
        </form>
        <div class="image"><img src="cakes/images.png"></div>
    </div><br><br>

    
    

    <%@page import="java.sql.*" %>
    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cakeonline", "root", "");
                PreparedStatement ps = conn.prepareStatement("select * from login WHERE email= ? AND password = ?");
                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    session.setAttribute("email", email);
                    response.sendRedirect("web.jsp");
                } else {
                    out.println("Invalid username or password");
                }

                conn.close();
            } catch (Exception e) {
                out.println("An error occurred: " + e.getMessage());
            }
        }
    %>
</body>
</html>
