<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="/CS157APRoject_war_exploded/css/login.css">

    <title>Login Page</title>
    <style>
        body{
            background-image: url('background.png');
        }

    </style>
</head>
<body>
    <div class="overlay"></div>
    <h1>Login</h1>
    <form action="login.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required />
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required />
        <input type="submit" value="Login" />
    </form>
    
    <%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    String dbUser = "root";
    String dbPassword = "013626210!";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", dbUser, dbPassword);

        String query = "SELECT * FROM users WHERE username = ?"; 
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, username); 
        rs = pstmt.executeQuery(); 

        if (rs.next()) {
            String storedPassword = rs.getString("password");
            if (storedPassword.equals(password)) {
                session.setAttribute("loggedIn", true);
                session.setAttribute("username", username);
                session.setAttribute("userID", rs.getInt("UserID"));
                if(rs.getInt("Admin") == 1){
                    response.sendRedirect("admin.jsp");
                }
                else{
                    response.sendRedirect("main.jsp");
                }
            } else {
                out.println("<p>Login failed. Please check your username and password.</p>");
            }
        } else {
            out.println("<p>Login failed. User not found.</p>");
        }
        rs.close();
        pstmt.close();
        con.close();
    } catch (SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
        e.printStackTrace();
    } 
    %>
</body>
</html>