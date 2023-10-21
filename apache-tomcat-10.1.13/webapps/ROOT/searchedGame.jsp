<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Searched Game Information</title>
  </head>
  <body>
    <h1>Searched Game Information</h1>
    <% String gametitle = request.getParameter("gameName"); %>
    <p>Game Name: <%= gametitle %></p>
    <table border="1">
        <tr>
            <th>Game Name</th>
            <th>Release Date</th>
            <th>Developer</th>
            <th>GenreName</th>
            <th>Description</th>
            <th>Link</th>
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
                String query = "SELECT game.*, genre.GenreName, genre.Description FROM game INNER JOIN genre ON game.GenreID = genre.GenreID WHERE game.GameName = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, gametitle); // Set the value of the parameter
                rs = pstmt.executeQuery();

                while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString("GameName")%></td>
            <td><%=rs.getString("ReleaseDate")%></td>
            <td><%=rs.getString("Developer")%></td>
            <td><%=rs.getString("GenreName")%></td>
            <td><%=rs.getString("Description")%></td>
            <td><%=rs.getString("Link")%></td>
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
