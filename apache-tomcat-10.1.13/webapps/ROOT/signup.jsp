<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="/css/login.css">
    <title>Signup Page</title>
</head>

<body>
    <div class="formsign" style="    
    background-color: rgba(21, 97, 238, 0.514);
    align-items: center;
    display: flex;
    flex-direction: column;
    padding: 30px;
    padding-top: 20px;
    padding-bottom: 40px;
    
        ">
        <h1 style="color:white">Sign up to GamePickerDB</h1>
        <form action="signup.jsp" method="post">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" required placeholder="turtle@gmail.com"/>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required />
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required />
            <input type="submit" value="Sign up" />
        </form>
    </div>
    <%
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    String dbUser = "root";
    String dbPassword = "Hunggo881224!";
    if(email != null){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", dbUser, dbPassword);

            String query = "SELECT * FROM users WHERE username = ? or email = ?"; 
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username); 
            pstmt.setString(2, email); 
            rs = pstmt.executeQuery(); 

            if (rs.next()) {
                out.println("<p>Signup failed. Please use a different email or username</p>");
            } else {
                String insertQuery = "INSERT INTO users (Email, Username, Password) VALUES (?, ?, ?)";
                PreparedStatement prep = con.prepareStatement(insertQuery);
                prep.setString(1, email);
                prep.setString(2, username);
                prep.setString(3, password);
                int rowsAffect = prep.executeUpdate();
                if (rowsAffect > 0) {
                    out.println("<p>Signup successful!</p>");
                    prep.close();
                    session.setAttribute("loggedIn", true);
                    session.setAttribute("username", username);
                    response.sendRedirect("main.jsp");
                    
                } else{
                    out.println("<p>Signup failed. Please try again.</p>");
                }
            }
            rs.close();
            pstmt.close();
        
            con.close();
        } catch (SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
            e.printStackTrace();
        } 
    }
    %>
</body>
</html>