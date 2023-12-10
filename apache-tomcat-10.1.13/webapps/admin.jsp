<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% //Main admin page to perform add,remove,update, and game details %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <link rel="stylesheet" type="text/css" href="/CS157APRoject_war_exploded/css/admin.css">
    <style>
        .logo{
            height:30px;
            text-decoration: none;
        }
        li{
            text-decoration: none;
            list-style-type: none;

        }
        .navbar{
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
        }
        .logo:hover {
            background: none;
        }
        #RequestedGame{
            display: none;
            background-color: #fff;
            padding: 30px;
            height:500px;
            border-radius: 10px;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        #RequestedGame ul{
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
        }
        #RequestedGame.show {
            display: block;
        }
        .flexReq{
            display: flex;
            flex-direction: column;
            width:200px;
            height:200px;
            background-color: #fff;
            color:white;
        }
        body{
            background-color: #161616;

        }
        .corebtn{
            background-color: #0077ff;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 6px 10px;
            cursor: pointer;
            text-decoration: none;
        }
        input{
            color:black;
        }
        #addGameForm {
            display: none;
            background-color: #fff;
            padding: 30px;
            height:500px;
            width:300px;
            border-radius: 10px;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        #addGameForm label,
        #addGameForm input {
            margin-bottom: 10px;
        }

        #addGameForm input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 16px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Show the overlay when the addGameForm is displayed */
        #addGameForm.show {
            display: block;
        }

        /* Adjust the z-index to make sure the overlay is on top of other elements */
        .overlay.show {
            display: block;
            z-index: 0;
        }
        .exitButton {
            background-color: white;
            color:red;
            font-size:20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left:290px;
            padding-bottom:20px;

        }

        #deleteGameForm label,
        #deleteGameForm input {
            margin-bottom: 10px;
        }

        #deleteGameForm input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 16px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Show the overlay when the addGameForm is displayed */
        #deleteGameForm.show {
            display: block;
        }
        #deleteGameForm {
            display: none;
            background-color: white;
            padding: 30px;
            height:500px;
            border-radius: 10px;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        h2{
            color:black;
            padding: 0px;
            margin-top:0px;
        }
        #editGameForm label,
        #editGameForm input {
            margin-bottom: 10px;
        }

        #editGameForm input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 16px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Show the overlay when the addGameForm is displayed */
        #editGameForm.show {
            display: block;
        }
        #editGameForm {
            display: none;
            background-color: white;
            padding: 30px;
            height:500px;
            border-radius: 10px;
            text-align: center;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>
    <div class="overlay" id="overlay"></div>

    <div class="navbar">
        <ul>
            <li><a href="/CS157APRoject_war_exploded/main.jsp"><img src="logo3.png" class="logo" alt="Games Logo"></a></li>
        </ul>
        <button class="corebtn" onclick="window.location.href='logout.jsp'">Logout</button>
    </div>

    <h1 style="color:white;">Welcome to Administration</h1>
    <div id="button-container">
        <a href="#" class="square-button" onclick="toggleForm()">Add Game</a>
        <a href="adminrequests.jsp" class="square-button">Requested Games</a>
        <a href="#" class="square-button" onclick="toggleDeleteForm()">Delete Game</a>
        <a href="#" class="square-button" onclick="toggleEditForm()">Edit Game</a>
    </div>

    <% //Form to add game %>
    <div id="addGameForm">
        <button class="exitButton" onclick="toggleForm()">X</button>
        <h2>Add Game</h2>
        <form action="addgame.jsp" method="post">
            <table style="text-align: left;">
                <tr>
                    <th><label for="gameName">Game Name:</label></th>
                    <td><input type="text" id="gameName" name="gameName" required></td>
                </tr>
                <tr>
                    <th><label for="releaseDate">Release Date:</label></th>
                    <td><input type="date" id="releaseDate" name="releaseDate" required></td>
                </tr>
                <tr>
                    <th><label for="developer">Developer:</label></th>
                    <td><input type="text" id="developer" name="developer" required></td>
                </tr>
                <tr>
                    <th><label for="genreid">Genre ID:</label></th>
                    <td><input type="text" id="genreid" name="genreid" required></td>
                </tr>
                <tr>
                    <th><label for="description">Description:</label></th>
                    <td><input type="text" id="description" name="description" required></td>
                </tr>
                <tr>
                    <th><label for="price">Price:</label></th>
                    <td><input type="number" id="price" name="price" step="any" required></td>
                </tr>
                <tr>
                    <th><label for="imglink">Image link:</label></th>
                    <td><input type="text" id="imglink" name="imglink" required></td>
                </tr>
                <tr>
                    <th><label for="vendorlink">Vendor link:</label></th>
                    <td><input type="text" id="vendorlink" name="vendorlink" required></td>
                </tr>
                <tr>
                    <th><label for="vendor">Vendor:</label></th>
                    <td><input type="text" id="vendor" name="vendor" required></td>
                </tr>
            </table>
            <input type="submit" value="Submit">

        </form>
    </div>
    <% //Form to delete game %>
    <div id="deleteGameForm">
        <button class="exitButton" onclick="toggleDeleteForm()">X</button>
        <h2>Delete Game</h2>
        <form action="removegame.jsp" method="post">
            <label for="gameIDToRemove">Game ID to Remove:</label>
            <input type="number" id="gameIDToRemove" name="gameIDToRemove" required><br>
            <input type="submit" value="Submit">
        </form>
    </div>
    <div id="RequestedGame">
        <button class="exitButton" onclick="toggleRequestForm()">X</button>
        <h1>Games Requested</h1>
        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            String user = "root";
            String password = "013626210!";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);
                String query = "SELECT * FROM requestlist";
                stmt = con.createStatement();
                rs = stmt.executeQuery(query);
                while (rs.next()) {
                    %>

                    <div class="flexReq">
                        <h1><%= "Requested By: " + rs.getInt("RequestID") %></h1>
                        <h4><%= "User ID: " + rs.getInt("UserID") %></h4>
                        <h4><%= "Game Name: "+ rs.getString("GameName") %></h4>
                        <h4><%= "Website: " %></h4>
                        <h7><%= rs.getString("WebsiteURL") %></h7>
                        <h4><%= "Date Requested: " + rs.getString("DateAdded") %></h4>
                    </div>
                    <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    rs.close();
                    stmt.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
    <% //Form to edit game %>
    <div id="editGameForm" >
        <button class="exitButton" onclick="toggleEditForm()">X</button>
        <form action="/CS157APRoject_war_exploded/editgame-details.jsp" method="post">
            <label for="editGameID">Game ID to Edit:</label>
            <input type="number" id="editGameID" name="editGameID" required><br>

            <input type="submit" value="Edit Game">
        </form>
    </div>

    <% //Script to show forms whenever buttons are clicked %>
    <script>
        function toggleForm() {
            var addGameForm = document.getElementById("addGameForm");
            var overlay = document.getElementById("overlay");

            // Toggle the "show" class on both the form and overlay
            addGameForm.classList.toggle("show");
            overlay.classList.toggle("show");
        }
        function toggleDeleteForm() {
            var deleteGameForm = document.getElementById("deleteGameForm");
            var overlay = document.getElementById("overlay");

            // Toggle the "show" class on both the form and overlay
            deleteGameForm.classList.toggle("show");
            overlay.classList.toggle("show");
        }
        function toggleRequestForm() {
            var requestGameForm = document.getElementById("RequestedGame");
            var overlay = document.getElementById("overlay");

            // Toggle the "show" class on both the form and overlay
            requestGameForm.classList.toggle("show");
            overlay.classList.toggle("show");
        }
        function toggleEditForm() {
            var editGameForm = document.getElementById("editGameForm");
            var overlay = document.getElementById("overlay");
            editGameForm.classList.toggle("show");
            overlay.classList.toggle("show");
        }

    </script>
</body>
</html>