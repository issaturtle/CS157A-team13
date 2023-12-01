<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Arrays" %>

<!DOCTYPE html>
<html>
<head>
    <title>Game Store</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <style>
        /* Add your CSS styles here */
        .filter-menu {
            display: none;
            position: absolute;
            top: 30px;
            left: 0;
            background-color: black;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            padding: 10px;
            z-index: 1;
            width:200px;
            height:200px;
          
            font-size:20px;
            color:white;
        }
        .filter-menu label {
            font-size:25px;
        }
        .filter-btn {
            cursor: pointer;
        }
        .filter-menu button {
            margin-left:150px;
        }
        .filter-menu .exitbtnFilter{
            margin-left:170px;
            background-color: black;
            color:red;
            text-align: left;
            border:none;
            font-size:25px;

        }
        .logo{
            height:30px;
            text-decoration: none;
        }
        .logo:hover {
            background: none; /* Remove the background on hover */
        }   
      
    </style>
</head>
<body class="main">
    <%
        if (session.getAttribute("loggedIn") == null || !((boolean) session.getAttribute("loggedIn"))) {
            response.sendRedirect("login.jsp");
        }
    %>
    <div class="overlay" id="overlay"></div>
    <div class="navbar">
        <ul>
            <li><a href="/main.jsp"><img src="logo3.png" class="logo" alt="Games Logo"></a></li>
        </ul>
        <ul>
            <li><a onclick="toggleForm()">Request a Game</a></li>
            <li><a href="/logout.jsp"><%= session.getAttribute("username") %></a></li>
            <li><a href="/logout.jsp">Logout</a></li>
        </ul>

    </div>
    <div class="intro">
        <h1>Game Store</h1>
        <form action="main.jsp" method="get">
            <!-- Dropdown for filtering by genre -->
            <label for="genre">Filter by Genre:</label>
            <select name="genre" id="genre" multipl size="1">
                <option value="none">None</option>
                <option value="action">Action</option>
                <option value="adventure">Adventure</option>
                <option value="rpg">RPG</option>
            </select>
    
            <!-- Dropdown for filtering by price -->
            <label for="price">Filter by Price:</label>
            <select name="price" id="price">
                <option value="none">None</option>
                <option value="0-20">$0 - $20</option>
                <option value="21-50">$21 - $50</option>
                <option value="51-70">$51 - $69.99</option>
            </select>
    
            <button type="submit" class="corebtn">Filter</button>
        </form>
        <div class="search-bar">
            <form action="/search.jsp" method="get">
                <input type="text" name="search" placeholder="Search...">
                <button type="submit">Search</button>
            </form>
        </div>
        
    </div>


    <div class="gamedisplay">
        <div class="FilterMenu">
            <button class="corebtn filter-btn" onclick="toggleFilterMenu()">Filter</button>
            <div class="filter-menu" id="filterMenu">
                <button class="exitbtnFilter" onclick="toggleFilterMenu()">X</button>
            
                <form action="" method="get">
                    <label for="genre">Filter by Genre:</label>
                    <br>
                    <input type="checkbox" class="genre-checkbox" name="genre" value="action"> Action
                    <br>
                    <input type="checkbox" class="genre-checkbox" name="genre" value="adventure"> Adventure
                    <br>
                    <input type="checkbox" class="genre-checkbox" name="genre" value="rpg"> RPG
                    <!-- Add more genres as needed -->
                    <br>
            
                    <label for="price">Filter by Price:</label>
                    <br>
                    <select name="price" id="price">
                        <option value="none">None</option>
                        <option value="0-20">$0 - $20</option>
                        <option value="21-50">$21 - $50</option>
                        <option value="51-70">$51 - $69.99</option>
                    </select>
                    
                    <br>
                    <button type="submit" class="corebtn">Filter</button>
                </form>
            </div>
        </div>
        </div>
        <div class="game-grid">
            <%
            String[] selectedGenres = request.getParameterValues("genre");
            String selectedPrice = request.getParameter("price");
            String query = null;
            if (selectedGenres != null && selectedGenres.length > 0 && "none".equals(selectedGenres[0]) && "none".equals(selectedPrice)) {
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
                if(selectedGenres!=null){
                    selectedGenres = Arrays.stream(selectedGenres)
                    .filter(genre -> !"none".equals(genre))
                    .toArray(String[]::new);
                }

                // Check if there are selected genres
                if (selectedGenres != null && selectedGenres.length > 0) {
                    queryBuilder.append("WHERE genre.GenreName IN (");

                    for (int i = 0; i < selectedGenres.length; i++) {
                        queryBuilder.append("'").append(selectedGenres[i]).append("'");
                        if (i < selectedGenres.length - 1) {
                            queryBuilder.append(", ");
                        }
                    }
                    queryBuilder.append(") ");
                }
                if (selectedPrice != null && !(selectedPrice.equals("none"))) {
                    String[] priceRange = selectedPrice.split("-");
                    if (priceRange.length == 2) {
                        queryBuilder.append("GROUP BY game.gameid HAVING MIN(currentprice.amount) BETWEEN ")
                        .append(priceRange[0]).append(" AND ").append(priceRange[1]);
                    }
                }else{
                    queryBuilder.append("GROUP BY game.gameid");
                }
    
                query = queryBuilder.toString();
            }
            out.println(query);
            // Convert StringBuilder to String
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            String user = "root";
            String password = "013626210!";
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


    </div>
    <div id="requestGameForm">
        <button class="exitButton" onclick="toggleForm()">X</button>
        <form action="processingform.jsp" method="post">
            <label for="gameName">Game Name:</label>
            <input type="text" id="gameName" name="gameName" required><br>

            <label for="UserID">UserID:</label>
            <input type="text" id="UserID" name="UserID" value="<%= session.getAttribute("userID")%>" required><br>

            <label for="WebsiteURL">Website URL:</label>
            <input type="text" id="WebsiteURL" name="WebsiteURL" required><br>

            <input type="submit" value="Submit">
        </form>
    </div>
    <script>
        function toggleForm() {
            var requestGameForm = document.getElementById("requestGameForm");
            var overlay = document.getElementById("overlay");

            // Toggle the "show" class on both the form and overlay
            requestGameForm.classList.toggle("show");
            overlay.classList.toggle("show");
        }
        function toggleFilterMenu() {
    
            var overlay = document.getElementById("overlay");
            overlay.classList.toggle("show");
            var filterMenu = document.getElementById("filterMenu");
            filterMenu.style.display = (filterMenu.style.display === "block") ? "none" : "block";
        }
    
        
    </script>
</body>
</html>