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
String name=request.getParameter("name");
    String mail=request.getParameter("mail");
    String password=request.getParameter("password");
    String mobile=request.getParameter("phone");
    
    if (mail != null && !mail.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cakeonline", "root", "")) {
            	String sql = "INSERT INTO login (name,email,password,mobilenumber) values (?,?,?, ?)";

                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, name);
                    ps.setString(2, mail);
                    ps.setString(3, password);
                    ps.setString(4, mobile);
                
                    int x = ps.executeUpdate();
                    response.sendRedirect("cakes.jsp");
                }
            }
        } catch (Exception e) {
            out.println("Error: " + e);
        }
    } else {
        out.println("Error: Username cannot be null or empty.");
    }
%>

</body>
</html>
