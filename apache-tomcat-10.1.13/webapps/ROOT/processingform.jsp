
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Processing Form</title>
</head>
<body>
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
    }
    


</body>
</html>