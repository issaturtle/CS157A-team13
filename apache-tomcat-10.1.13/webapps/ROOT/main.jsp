<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Game Store</title>
</head>
<body>
    <h1>Game Store</h1>
    
    <table border="1">
        <tr>
            <th>Game Name</th>
            <th>Release Date</th>
            <th>Developer</th>
            <th>GenreName</th>
        </tr>
        <% 
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        String user = "root";
        String password = "!"; // Replace with your database password

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);

            out.println("Database connection successful.<br/><br>");

            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT game.*, genre.GenreName, genre.Description FROM game INNER JOIN genre ON game.GenreID = genre.GenreID;");

            while (rs.next()) {
        %>
        <tr>
            <td><a href="searchedGame.jsp?gameName=<%=rs.getString("GameName")%>"> <%=rs.getString("GameName")%></a></td>
            <td><%=rs.getString("ReleaseDate")%></td>
            <td><%=rs.getString("Developer")%></td>
            <td><%=rs.getString("GenreName")%></td>
        </tr>
        <%
            }
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close the database resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                out.println("Error while closing resources: " + e.getMessage());
                e.printStackTrace();
            }
        }
        %>
    </table>
</body>
</html>