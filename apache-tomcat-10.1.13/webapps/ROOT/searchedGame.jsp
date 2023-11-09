<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Searched Game Information</title>
    <link rel="stylesheet" type="text/css" href="/css/searchedGame.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  </head>
  <body class="main">
    <%
    if (session.getAttribute("loggedIn") == null || !((boolean) session.getAttribute("loggedIn"))) {
        response.sendRedirect("login.jsp");
    }
    %>
    <div class="navbar">
        <ul>
            <li><h2>GamePickerDB</h2></li>
            <li><a href="/main.jsp">Games</a></li>
        </ul>
        <div class="search-bar">
            <form action="/search.jsp" method="get">
                <input type="text" name="search" placeholder="Search...">
                <button type="submit">Search</button>
            </form>
        </div>
    </div>
    <% String gametitle = request.getParameter("gameName"); %>
    <div class='main-body'>
        <div>
            <h1><%=gametitle%></h1>
            <button>Wishlist</button>
        </div>
    
    
    <% 
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            String user = "root";
            String password = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);
                
                stmt = con.createStatement();
                String query = "SELECT game.*, genre.GenreName, genre.Description, min(currentprice.amount) " +
                "FROM game " +
                "JOIN genre ON game.GenreID = genre.GenreID " +
                "JOIN currentprice ON game.gameid = currentprice.gameid WHERE game.gameName = ? " +
                "GROUP BY game.gameid";                
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, gametitle); // Set the value of the parameter
                rs = pstmt.executeQuery();
                
                while (rs.next()) {
        %>
        <div class="desc">
            <!-- <div>
                <div class="game-info">
                    <h3>Release Date:</h3>
                    <p><%=rs.getString("ReleaseDate")%></p>
                </div>
                
                <div class="game-info">
                    <h3>Developer:</h3>
                    <p><%=rs.getString("Developer")%></p>
                </div>
                
                <div class="game-info">
                    <h3>Genre Type:</h3>
                    <p><%=rs.getString("GenreName")%></p>
                </div>
                
                <div class="game-info">
                    <p><%=rs.getString("Description")%></p>
                </div>
            </div> -->
            <div class="flex-desc">
                <table class="descTable">
                    <tr>
                        <th style="white-space: nowrap;">Price</th>
                        <td>
                            <%
                            String originalPrice = rs.getString("originalprice");
                            String currentPrice = rs.getString("MIN(currentprice.amount)");
                        
                            // Check if both originalPrice and currentPrice are not null
                            if (originalPrice != null && currentPrice != null) {
                                double originalPriceValue = Double.parseDouble(originalPrice);
                                double currentPriceValue = Double.parseDouble(currentPrice);
                        
                                // Calculate the percentage discount
                                double discountPercentage = ((originalPriceValue - currentPriceValue) / originalPriceValue) * 100;
                            %>
                            $<%= currentPrice %>
                            <%
                                if (discountPercentage > 0) {
                            %>
                            <p style="color: red;">(<%= String.format("%.2f%% off", discountPercentage) %>)</p>
                            <%
                                }
                            } else {
                            %>
                            $<%= currentPrice %>
                            Not available
                            <%
                            }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <th style="white-space: nowrap;">Release Date</th>
                        <td><%=rs.getString("ReleaseDate")%></td>
                    </tr>
                    <tr>
                        <th style="white-space: nowrap;">Developer</th>
                        <td><%=rs.getString("Developer")%></td>
                    </tr>
                    <tr>
                        <th style="white-space: nowrap;">GenreName</th>
                        <td><%=rs.getString("GenreName")%></td>
                    </tr>
                    <tr>
                        <th style="white-space: nowrap;">Rating</th>
                        <td>Very Positive (# of comment)</td>
                    </tr>
                </table>
                <h3><%=rs.getString("Description")%></h3>
            </div>
            <img src="<%=rs.getString("Link")%>" alt="<%=rs.getString("GameName")%>">
        </div>
    
    
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
            e.printStackTrace();
        } 
        
        %>

        <div>
            <h1>Historical Pricing</h1>
            <div class="chart-container">
                <canvas id="pricingChart"></canvas>
            </div>
        
        </div>
        <div>
            <h1>Comments</h1>
        </div>
    </div>
    <script src="script.js"></script>
  </body>
</html>
