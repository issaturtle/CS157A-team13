<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% //JSP to create the form to update game through admin.jsp %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Game</title>
    <link rel="stylesheet" type="text/css" href="/CS157APRoject_war_exploded/css/main.css">
</head>
<body>
<%
    String dbUser = "root";
    String dbPassword = "013626210!";
    Connection con = null;
    PreparedStatement pstmt = null;
    int editGameID = Integer.parseInt(request.getParameter("editGameID"));
    String gameName = request.getParameter("gameName");
    String releaseDate = request.getParameter("releaseDate");
    String developer = request.getParameter("developer");
    String genreID = request.getParameter("genreID");
    String description = request.getParameter("description");
    String price = request.getParameter("price");
    String imgLink = request.getParameter("imgLink");
    String vendorLink = request.getParameter("vendorLink");
    String distributorName = request.getParameter("distributorName");
    String ogprice = request.getParameter("ogPrice");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", dbUser, dbPassword);

        // Update game table
        String sql = "UPDATE game SET gameName = ?, releaseDate = ?, Developer = ?, GenreID = ?, Description = ?, Link = ?, OriginalPrice = ? WHERE GameID = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, gameName);
        pstmt.setString(2, releaseDate);
        pstmt.setString(3, developer);
        pstmt.setString(4, genreID);
        pstmt.setString(5, description);
        pstmt.setString(6, imgLink);
        pstmt.setString(7, ogprice);
        pstmt.setInt(8, editGameID);

        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            out.println("<p>Game Update successful</p>");

            // Update currentprice table
            sql = "UPDATE currentprice SET Amount = ?, DateUpdated = NOW(), Link = ? WHERE GameID = ? AND DistributorName = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, price);
            pstmt.setString(2, vendorLink);
            pstmt.setInt(3, editGameID);
            pstmt.setString(4, distributorName);
            rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<p>Current Price Update successful</p>");
            } else {
                out.println("<p>Current Price Update failed</p>");
            }

            // Insert into pricehistory table
            sql = "INSERT INTO priceHistory (DistributorName, GameID, Amount, DateUpdated, Link) VALUES (?, ?, ?, NOW(), ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, distributorName);
            pstmt.setInt(2, editGameID);
            pstmt.setString(3, price);
            pstmt.setString(4, vendorLink);
            rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<p>Price History Insertion successful</p>");
            } else {
                out.println("<p>Price History Insertion failed</p>");
            }

        } else {
            out.println("<p>Game Update failed</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
        if (con != null) try { con.close(); } catch (SQLException ex) { ex.printStackTrace(); }
    }
%>
</body>
</html>
