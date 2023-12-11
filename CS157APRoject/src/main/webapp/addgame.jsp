<%@ page import="java.sql.*" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //This file is used to insert a game into the database
%>
<!DOCTYPE html>
<html>
<head>
    <title>Game Store</title>
    <link rel="stylesheet" type="text/css" href="/CS157APRoject_war_exploded/css/main.css">
</head>
<body class="main">
    <%

    String dbUser = "root";
    String dbPassword = "013626210!";
    try {
        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection
        Connection con = null;
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", dbUser, dbPassword);

        // Get form data
        String gameName = request.getParameter("gameName");
        String releaseDateString = request.getParameter("releaseDate");
        String developer = request.getParameter("developer");
        String genreid = request.getParameter("genreid");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String imgLink = request.getParameter("imglink");
        String vendorLink = request.getParameter("vendorlink");
        String vendor = request.getParameter("vendor");
        // Correct date parsing
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date releaseDate = inputFormat.parse(releaseDateString);

            // Prepare and execute SQL query
            String sql = "INSERT INTO game (gameName, releaseDate, Developer, GenreID, Description, Link, OriginalPrice ) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, gameName);
            statement.setDate(2, new java.sql.Date(releaseDate.getTime()));  // Use setDate for a Date object
            statement.setString(3, developer);
            statement.setString(4, genreid);
            statement.setString(5, description);
            statement.setString(6, imgLink);
            statement.setString(7, price);


            int rowsAffected = statement.executeUpdate();

            // Check if the insertion was successful
            if (rowsAffected > 0) {
                out.println("Insertion successful");
                ResultSet gameIds = statement.getGeneratedKeys();
                if(gameIds.next()){
                    int gameID = gameIds.getInt(1);
                    sql = "INSERT INTO currentprice ( GameID, DistributorName, Amount, DateUpdated, Link) VALUES (?, ?, ?, ?, ?)";
                    PreparedStatement currentPriceStmt = con.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
                    
                    currentPriceStmt.setInt(1, gameID);
                    currentPriceStmt.setString(2, vendor);
                    currentPriceStmt.setString(3, price);
                    currentPriceStmt.setDate(4, new java.sql.Date(releaseDate.getTime()));  // Use setDate for a Date object
                    currentPriceStmt.setString(5, vendorLink);
                    
                    if(currentPriceStmt.executeUpdate()>0){
                        out.println("Current Price Insertion successful");
                        currentPriceStmt.close();
                    }
                    else{
                        out.println("Current Price Insertion failed");
                    }

                    sql = "INSERT INTO priceHistory (DistributorName, GameID, Amount, DateUpdated, Link) VALUES (?, ?, ?, ?, ?)";
                    PreparedStatement priceHistoryStmt = con.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
                    priceHistoryStmt.setString(1, vendor);
                    priceHistoryStmt.setInt(2, gameID);
                    priceHistoryStmt.setString(3, price);
                    priceHistoryStmt.setDate(4, new java.sql.Date(releaseDate.getTime()));  // Use setDate for a Date object
                    priceHistoryStmt.setString(5, vendorLink);

                    if(priceHistoryStmt.executeUpdate()>0){
                        out.println("priceHistoryStmt Insertion successful");
                        priceHistoryStmt.close();
                        gameIds.close();
                    }
                    else{
                        out.println("priceHistoryStmt Insertion failed");
                    }
                }
                else{
                    out.println("Game ID not found");
                }
                
                
            } else {
                out.println("Insertion failed");
            }

            // Close resources
            statement.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    catch(Exception e){
        e.printStackTrace();
    }
    %>

</body>