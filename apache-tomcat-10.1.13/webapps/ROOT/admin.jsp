<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <link rel="stylesheet" type="text/css" href="/css/admin.css">
</head>
<body>
    <div class="overlay" id="overlay"></div>

    <div class="navbar">
        <button class="logoutButton" onclick="window.location.href='/logout.jsp'">Logout</button>
    </div>

    <h1>Welcome to Administration</h1>
    <div id="button-container">
        <a href="#" class="square-button" onclick="toggleForm()">Add Game</a>
        <a href="#" class="square-button">Edit Game</a>
        <a href="#" class="square-button" onclick="toggleDeleteForm()">Delete Game</a>
    </div>
    <div id="addGameForm">
        <button class="exitButton" onclick="toggleForm()">X</button>
        <form action="addgame.jsp" method="post">
            <label for="gameName">Game Name:</label>
            <input type="text" id="gameName" name="gameName" required><br>

            <label for="releaseDate">Release Date:</label>
            <input type="date" id="releaseDate" name="releaseDate" required><br>

            <label for="developer">Developer:</label>
            <input type="text" id="developer" name="developer" required><br>

            <label for="genreid">Genre ID:</label>
            <input type="text" id="genreid" name="genreid" required><br>

            <label for="description">Description:</label>
            <input type="text" id="description" name="description" required><br>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" required><br>

            <label for="imglink">Image link:</label>
            <input type="text" id="imglink" name="imglink" required><br>

            <label for="vendorlink">Vendor link:</label>
            <input type="text" id="vendorlink" name="vendorlink" required><br>

            <label for="vendor">Vendor</label>
            <input type="text" id="vendor" name="vendor" required><br>
            <input type="submit" value="Submit">
        </form>
    </div>
    <div id="deleteGameForm">
        <button class="exitButton" onclick="toggleDeleteForm()">X</button>
        <form action="removegame.jsp" method="post">
            <label for="gameIDToRemove">Game ID to Remove:</label>
            <input type="number" id="gameIDToRemove" name="gameIDToRemove" required><br>
            <input type="submit" value="Submit">
        </form>
    </div>
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
    </script>
</body>
</html>