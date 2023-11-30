<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Game Store</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body class="main">
    <%
        if (session.getAttribute("loggedIn") == null || !((boolean) session.getAttribute("loggedIn"))) {
            response.sendRedirect("login.jsp");
        }
    %>
    <div class="navbar">
        <ul>
            <li><a href="/homepage.jsp">Home</a></li>
            <li><a href="/main.jsp">Games</a></li>
        </ul>
        <ul>
            <li><a href="/logout.jsp"><%= session.getAttribute("username") %></a></li>
            <li><a href="/logout.jsp">Logout</a></li>
        </ul>

    </div>
    <div class="intro">
        <h1>Game Store</h1>
        <form action="main.jsp" method="get">
            <!-- Dropdown for filtering by genre -->
            <label for="genre">Filter by Genre:</label>
            <select name="genre" id="genre">
                <option value="none">None</option>
                <option value="action">Action</option>
                <option value="adventure">Adventure</option>
                <option value="rpg">RPG</option>
                <!-- Add more genre options as needed -->
            </select>
    
            <!-- Dropdown for filtering by price -->
            <label for="price">Filter by Price:</label>
            <select name="price" id="price">
                <option value="none">None</option>
                <option value="0-20">$0 - $20</option>
                <option value="21-50">$21 - $50</option>
                <option value="51-70">$51 - $69.99</option>
                <!-- Add more price range options as needed -->
            </select>
    
            <!-- Submit button to trigger filtering -->
            <input type="submit" value="Apply Filters">
        </form>
        <div class="search-bar">
            <form action="/search.jsp" method="get">
                <input type="text" name="search" placeholder="Search...">
                <button type="submit">Search</button>
            </form>
        </div>
        
    </div>


    <div class="game-grid">
        <%
        String selectedGenre = request.getParameter("genre");
        String selectedPrice = request.getParameter("price");
        String query = null;
        if ("none".equals(selectedGenre) && "none".equals(selectedPrice)) {
            query = "SELECT game.*, genre.GenreName, genre.Description, MIN(currentprice.amount) " +
                    "FROM game " +
                    "JOIN genre ON game.GenreID = genre.GenreID " +
                    "JOIN currentprice ON game.gameid = currentprice.gameid " +
                    "GROUP BY game.gameid";
        }
        else{
            query = "SELECT game.*, genre.GenreName, genre.Description, MIN(currentprice.amount) " +
            "FROM game " +
            "JOIN genre ON game.GenreID = genre.GenreID " +
            "JOIN currentprice ON game.gameid = currentprice.gameid ";

            StringBuilder queryBuilder = new StringBuilder(query);

            if (selectedGenre != null && !(selectedGenre.equals("none"))) {
            queryBuilder.append("WHERE genre.GenreName = '").append(selectedGenre).append("' ");
            }

            if (selectedPrice != null && !selectedPrice.isEmpty()) {
                String[] priceRange = selectedPrice.split("-");
                if (priceRange.length == 2) {
                    if (queryBuilder.toString().contains("WHERE")) {
                        queryBuilder.append("AND ");
                    } else {
                        queryBuilder.append("WHERE ");
                    }
                    queryBuilder.append("currentprice.amount BETWEEN ")
                                .append(priceRange[0]).append(" AND ").append(priceRange[1]).append(" ");
                }
            }

            queryBuilder.append("GROUP BY game.gameid");
            query = queryBuilder.toString();
        }
        
        // Convert StringBuilder to String
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String user = "root";
        String password = "Hunggo881224!";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);

            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
        %>
        <div class="game-item">
            <img class="game-image" src="<%= rs.getString("Link") %>" alt="<%= rs.getString("GameName") %>">
            <br>
            <a href="searchedGame.jsp?gameName=<%= rs.getString("GameName") %>"><%= rs.getString("GameName") %></a>
            <br>
            Price: $<%= rs.getString("min(currentprice.amount)") %>
        </div>
        <%
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
            e.printStackTrace();
        }
        %>
    </div>
</body>
</html>