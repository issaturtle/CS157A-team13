<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% //User.jsp allows user to get their profile information, what they have purchased and wishlist. They can also see the comments they made. %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css" href="/CS157APRoject_war_exploded/css/main.css">
    <link rel="stylesheet" type="text/css" href="/CS157APRoject_war_exploded/css/userProfile.css">
    <style>
        .logo{
            height:30px;
            text-decoration: none;
        }
        .logo:hover {
            background: none; /* Remove the background on hover */
        }
    </style>
</head>
<body class="profile">
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

<div class="profile-info">
    <h1>User Profile: <%= session.getAttribute("username") %></h1>

    <!-- Common database variables -->
    <%
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String user = "root";
        String password = "013626210!";
        int userId = Integer.parseInt(session.getAttribute("userID").toString());

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);

            // Wishlist Section
            String wishlistQuery = "SELECT game.GameName, userwishlist.DateAdded, userwishlist.GameID " +
                    "FROM userwishlist " +
                    "JOIN game ON userwishlist.GameID = game.GameID " +
                    "WHERE userwishlist.UserID = ? " +
                    "ORDER BY userwishlist.DateAdded DESC";
            pstmt = con.prepareStatement(wishlistQuery);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();
    %>
    <h2>Wishlist</h2>
    <div class="wishlist">
        <ul>
            <% while (rs.next()) { %>
            <li>
                <%= rs.getString("GameName") %> (Added on: <%= new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("DateAdded")) %>)
                <form action="/CS157APRoject_war_exploded/removeFromWishlist.jsp" method="post">
                    <input type="hidden" name="userId" value="<%= userId %>">
                    <input type="hidden" name="gameId" value="<%= rs.getString("GameID") %>">
                    <input type="submit" value="Remove from Wishlist">
                </form>
            </li>
            <% } %>
            <%
                rs.close();
                pstmt.close();
            %>
        </ul>
    </div>

    <%
        // Purchase History Section
        String purchaseQuery = "SELECT game.GameName, purchasehistory.DatePurchased, purchasehistory.PurchasePrice " +
                "FROM purchasehistory " +
                "JOIN game ON purchasehistory.GameID = game.GameID " +
                "WHERE purchasehistory.UserID = ? " +
                "ORDER BY purchasehistory.DatePurchased DESC";
        pstmt = con.prepareStatement(purchaseQuery);
        pstmt.setInt(1, userId);
        rs = pstmt.executeQuery();
    %>
    <br></br>
    <h2>Purchase History</h2>
    <div class="purchase-history">
        <table>
            <tr>
                <th>Game</th>
                <th>Date Purchased</th>
                <th>Amount</th>
            </tr>
            <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getString("GameName") %></td>
                <td><%= new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("DatePurchased")) %></td>
                <td>$<%= String.format("%.2f", rs.getDouble("PurchasePrice")) %></td>
            </tr>
            <% } %>
            <%
                rs.close();
                pstmt.close();
            %>
        </table>
    </div>

    <%
        // Reviews Section
        String reviewQuery = "SELECT game.GameName, userreview.rating, userreview.ReviewDate, userreview.ReviewText " +
                "FROM userreview " +
                "JOIN game ON userreview.GameID = game.GameID " +
                "WHERE userreview.UserID = ? " +
                "ORDER BY userreview.ReviewDate DESC";
        pstmt = con.prepareStatement(reviewQuery);
        pstmt.setInt(1, userId);
        rs = pstmt.executeQuery();
    %>
    <br></br>
    <h2>Reviews</h2>
    <div class="reviews">
        <ul>
            <% while (rs.next()) { %>
            <li>
                <strong><%= rs.getString("GameName") %></strong> (Reviewed on: <%= new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("ReviewDate")) %>, Rating: <%= rs.getInt("rating") %>/5)
                <p><%= rs.getString("ReviewText") %></p>
            </li>
            <% } %>
            <%
                rs.close();
                pstmt.close();
            %>
        </ul>
    </div>

    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) try { con.close(); } catch (SQLException ex) {}
        }
    %>
</div>

<script>
    function toggleForm() {
        var requestGameForm = document.getElementById("requestGameForm");
        var overlay = document.getElementById("overlay");
        requestGameForm.classList.toggle("show");
        overlay.classList.toggle("show");
    }
</script>
</body>
</html>
