<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Game Store</title>
    <link rel="stylesheet" type="text/css" href="/CS157APRoject_war_exploded/css/main.css">
    <style>
        .search-bar input[type="text"] {
            padding: 6px;
            border: none;
            border-radius: 4px;
            background-color: white;
            color: black;
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
    <div class="navbar">
        <ul>
            <li><a href="/CS157APRoject_war_exploded/main.jsp">Games</a></li>
        </ul>
        <ul>
            <li><a href=""><%= session.getAttribute("username") %></a></li>
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


    <div class="game-grid">
        <%
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String user = "root";
        String password = "013626210!";

        String gametitle = request.getParameter("search");
        if (gametitle == null) {
            gametitle = "";
        }
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);
            stmt = con.createStatement();
            String query = "SELECT game.*, genre.GenreName, genre.Description, MIN(currentprice.amount) " +
            "FROM game " +
            "JOIN genre ON game.GenreID = genre.GenreID " +
            "JOIN currentprice ON game.gameid = currentprice.gameid " +
            "WHERE (game.GameName LIKE ? OR genre.GenreName LIKE ?) " +
            "GROUP BY game.gameid";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, "%" + gametitle + "%"); // Set the value of the parameter
            pstmt.setString(2, "%" + gametitle + "%");
            rs = pstmt.executeQuery();
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