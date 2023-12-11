<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% //Delete the game from currentprice, pricehistory, and game relations when the game is deleted %>

<!DOCTYPE html>
<html>
<head>
    <title>Game Store - Remove Game</title>
    <link rel="stylesheet" type="text/css" href="/CS157APRoject_war_exploded/css/main.css">
</head>
<body class="main">
    <%
        String dbUser = "root";
        String dbPassword = "013626210!";
        int gameIDToRemove = Integer.parseInt(request.getParameter("gameIDToRemove"));

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", dbUser, dbPassword);

            // Prepare and execute SQL query
            String sql = "DELETE FROM currentprice WHERE gameID = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, gameIDToRemove);

            int rowsAffected = statement.executeUpdate();

            // Check if the deletion was successful
            if (rowsAffected > 0) {
                sql = "DELETE FROM pricehistory WHERE gameID = ?";
                PreparedStatement pricehistorystmt = con.prepareStatement(sql);
                pricehistorystmt.setInt(1, gameIDToRemove);
                if (pricehistorystmt.executeUpdate() > 0){
                    out.println("Delete pricehistory successful");
                    pricehistorystmt.close();
                }
                else{
                    out.println("Deletion failed. Game ID not found or other issues.");
                }
                
                sql = "DELETE FROM game WHERE gameID = ?";
                PreparedStatement delstmt = con.prepareStatement(sql);
                delstmt.setInt(1, gameIDToRemove);
                if (delstmt.executeUpdate() > 0){
                    out.println("Delete currentPrice successful");
                    delstmt.close();
                }
                else{
                    out.println("Deletion failed. Game ID not found or other issues.");
                }

            } else {
                out.println("Deletion failed. Game ID not found or other issues.");
            }

            // Close resources
            statement.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("admin.jsp");

    %>
</body>
</html>