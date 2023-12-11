<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <title>Game Store</title>
    <link rel="stylesheet" type="text/css" href="/CS157APRoject_war_exploded/css/main.css">
    <style>
        /* Add your CSS styles here */
        .filter-menu.active {
            display: block;
        }
        .filter-menu {
            display: none;
            position: absolute;
            top: 30px;
            left: 0;
            background-color: black;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            padding: 10px;
            z-index: 1;

            margin-top: 180px;
            font-size: 20px;
            color: white;
            transition: opacity 0.5s ease-in-out, visibility 0.5s ease-in-out;
            height: 450px;
            width:250px;
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
            margin-left:230px;
            background-color: black;
            color:red;
            text-align: left;
            border:none;
            font-size:20px;
        }
        .logo{
            height:30px;
            text-decoration: none;
        }
        .logo:hover {
            background: none; /* Remove the background on hover */
        }
        .exitButton{
            margin-left:300px;
            background-color: white;
            color:red;
            text-align: left;
            border:none;
            font-size:25px;
        }
        .search-bar input[type="text"] {
            padding: 6px;
            border: none;
            border-radius: 4px;
            background-color: white;
            color: black;
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
        <li><a href="/CS157APRoject_war_exploded/main.jsp"><img src="logo3.png" class="logo" alt="Games Logo"></a></li>
    </ul>
    <ul>
        <li><a onclick="toggleForm()">Request a Game</a></li>
        <li><a href="/CS157APRoject_war_exploded/user.jsp"><%= session.getAttribute("username") %></a></li>
        <li><a href="/CS157APRoject_war_exploded/logout.jsp">Logout</a></li>
    </ul>

</div>
<div class="intro">
    <h1>Game Store</h1>
    <div class="search-bar">
        <form action="/CS157APRoject_war_exploded/search.jsp" method="get">
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

            <form action="" method="get" style="padding-left:30px">
                <label for="genre">Filter by Genre:</label>
                <br>
                <%
                    Connection connect = null;
                    Statement stmt1 = null;
                    ResultSet rs1 = null;
                    String user1 = "root";
                    String password1 = "013626210!";
                    String query1 = "";
                    HashMap<String, String> genreMap = new HashMap<String, String>();
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user1, password1);
                        query1 = "select GenreName, GenreID from genre order by GenreName asc";
                        stmt1 = connect.createStatement();
                        rs1 = stmt1.executeQuery(query1);
                        while (rs1.next()) {
                            genreMap.put(rs1.getString("GenreID"),rs1.getString("GenreName"));
                            String genre = rs1.getString("GenreName");
                %>
                <input type="checkbox" class="genre-checkbox" name="genre" value="<%=genre%>"> <%=genre%><br>
                <%
                        }
                        rs1.close();
                        connect.close();
                        stmt1.close();
                    }
                    catch (Exception e) {
                        e.printStackTrace();
                    }

                %>


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
                <label for="price">Order by:</label>
                <br>
                <select name="orderAlp" id="orderAlp">
                    <option value="0">None</option>
                    <option value="1">A-Z</option>
                    <option value="2">Z-A</option>
                    <option value="3">Low to High</option>
                    <option value="4">High to Low</option>
                </select>

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
            String orderAlpParameter = request.getParameter("orderAlp");

            if(orderAlpParameter != null && !orderAlpParameter.equals("none")){
                if(request.getParameter("orderAlp").equals("1")){
                    queryBuilder.append(" ORDER BY game.GameName ASC");
                }
                else if(request.getParameter("orderAlp").equals("2")){
                    queryBuilder.append(" ORDER BY game.GameName DESC");
                }
                else if(request.getParameter("orderAlp").equals("3")){
                    queryBuilder.append(" ORDER BY MIN(currentprice.amount) ASC");
                }
                else if(request.getParameter("orderAlp").equals("4")){
                    queryBuilder.append(" ORDER BY MIN(currentprice.amount) DESC");
                }
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
        <br>
        Genre: <%= rs.getString("GenreName") %>
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
    <form action="requestgames.jsp" method="post">
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
        filterMenu.classList.toggle("active");

    }


</script>
</body>
</html>