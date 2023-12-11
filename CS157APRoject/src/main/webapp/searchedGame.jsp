<%@ page import="java.sql.*, java.util.*, com.google.gson.Gson, java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Searched Game Information</title>
    <link rel="stylesheet" type="text/css" href="/CS157APRoject_war_exploded/css/searchedGame.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns"></script>
    <style>
        .desc{
            flex-direction: row;
            flex:1;
            display:flex;
            color:white;
            font-size:18px;
            margin-bottom: 30px;
            justify-content: space-between;
            align-items: center;
        }
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
        .corebtn{
            background-color: #0077ff;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 6px 10px;
            cursor: pointer;
        }
        .corebtn a{
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body class="main">
    <%
    if (session.getAttribute("loggedIn") == null || !((boolean) session.getAttribute("loggedIn"))) {
        response.sendRedirect("login.jsp");
    }
    %>
    <div class="navbar" style="align-items: center;">
        <ul>
            <li><a href="/CS157APRoject_war_exploded/main.jsp"><img src="logo3.png" class="logo" alt="Games Logo"></a></li>
        </ul>
        <ul>
            <li><a href="/CS157APRoject_war_exploded/user.jsp"><%= session.getAttribute("username") %></a></li>
            <li><a href="/CS157APRoject_war_exploded/logout.jsp">Logout</a></li>
        </ul>

    </div>
    <% String gametitle = request.getParameter("gameName"); %>
    <div class='main-body'>
        <div>
            <div style="
            display: flex;
            flex-direction: row;
            justify-content: space-between;">
                <h1><%=gametitle%></h1>
                <div class="search-bar">
                    <form action="/CS157APRoject_war_exploded/search.jsp" method="get">
                        <input type="text" name="search" placeholder="Search...">
                        <button type="submit">Search</button>
                     </form>
                 </div>
            </div>
        </div>


    <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            String user = "root";
            String password = "013626210!";
            String gameID = "";
            String ratingString = "No Ratings";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);

                String query2 = "SELECT gamename, avg(rating)\n" +
                        "FROM game\n" +
                        "JOIN userreview on game.gameid = userreview.gameid\n" +
                        "where game.gamename Like ? \n" +
                        "group by game.gamename";
                PreparedStatement pstmt = con.prepareStatement(query2);

                pstmt.setString(1, gametitle); // Set the value of the parameter
                rs = pstmt.executeQuery();

                if(rs.next()){
                    double rating = rs.getDouble("avg(rating)");
                    ratingString = Double.toString(rating);
                }

                stmt = con.createStatement();
                String query = "SELECT game.*, genre.GenreName, genre.Description, min(currentprice.amount) " +
                "FROM game " +
                "JOIN genre ON game.GenreID = genre.GenreID " +
                "JOIN currentprice ON game.gameid = currentprice.gameid WHERE game.gameName = ? " +
                "GROUP BY game.gameid";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, gametitle); // Set the value of the parameter
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    gameID = rs.getString("GameID");
        %>
        <div class="desc">
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
                        <td><%=ratingString%></td>
                    </tr>
                    <tr>
                        <th style="white-space: nowrap;">GameID</th>
                        <td><%=rs.getString("GameID")%></td>
                    </tr>
                </table>
                <h3><%=rs.getString("Description")%></h3>
            </div>
            <img src="<%=rs.getString("Link")%>" style="margin-top:-120px;" alt="<%=rs.getString("GameName")%>">
        </div>


        <%
            }
            rs.close();
            stmt.close();
        } catch(SQLException e) {
            //println.out("SQLException caught: " + e.getMessage());
            e.printStackTrace();
        }

        %>
        <!-- Wishlist form -->
        <form action="/CS157APRoject_war_exploded/addToWishlist.jsp" method="post">
            <input type="hidden" name="userId" value="<%= session.getAttribute("userID") %>">
            <input type="hidden" name="gameId" value="<%= gameID%>">
            <button type="submit" class="corebtn">Add to Wishlist</button>
        </form>

        <br></br>

        <div>
            <div>
                <h1>Vendors</h1>
                <div>
                    <table class="vendorLinks">
                        <tr>
                            <th>Vendor</th>
                            <th>Price</th>
                            <th>Buy</th>
                        </tr>
                        <%
                            ResultSet result = null;
                            String PricingQuery = "SELECT DistributorName, amount, currentprice.link FROM gamepickerdb.currentprice, game where currentprice.GameID = game.GameID and game.gameName = ? ORDER BY Amount;";
                            PreparedStatement getStorePrices = con.prepareStatement(PricingQuery);
                            getStorePrices.setString(1, gametitle);
                            result = getStorePrices.executeQuery();
                            while (result.next()) {
                                String distributorName = result.getString("DistributorName");
                                String amount = result.getString("Amount");
                                String link = result.getString("Link");
                        %>
                        <tr>
                            <td><%= distributorName %></td>
                            <td>$<%= amount %></td>
                            <td>
                                <form action="/CS157APRoject_war_exploded/addPurchase.jsp" method="post">
                                    <input type="hidden" name="userId" value="<%= session.getAttribute("userID") %>">
                                    <input type="hidden" name="gameId" value="<%= gameID %>">
                                    <input type="hidden" name="distributorName" value="<%= distributorName %>">
                                    <input type="hidden" name="purchasePrice" value="<%= amount %>">
                                    <input type="hidden" name="redirectLink" value="<%= link %>">
                                    <button type="submit" class="corebtn">Buy</button>
                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>

        <br></br>

        <div>
            <h1>Reviews for <%= gametitle %></h1>
            <div class="reviews">
                <ul>
                    <%
                        String reviewQuery = "SELECT userreview.*, users.username FROM userreview JOIN users ON userreview.UserID = users.UserID WHERE GameID = ?";
                        PreparedStatement reviewStmt = con.prepareStatement(reviewQuery);
                        reviewStmt.setString(1, gameID); // Use the gameID obtained earlier
                        ResultSet reviewRs = reviewStmt.executeQuery();

                        while (reviewRs.next()) {
                            String reviewer = reviewRs.getString("username");
                            int rating = reviewRs.getInt("rating");
                            String reviewText = reviewRs.getString("ReviewText");
                            Date reviewDate = reviewRs.getDate("ReviewDate");
                    %>
                    <li>
                        <strong><%= reviewer %></strong> (Reviewed on: <%= new SimpleDateFormat("yyyy-MM-dd").format(reviewDate) %>, Rating: <%= rating %>/5)
                        <p><%= reviewText %></p>
                    </li>
                    <%
                        }
                        reviewRs.close();
                        reviewStmt.close();
                    %>
                </ul>
            </div>
        </div>

        <br>

        <div>
            <h2>Leave a Review</h2>
            <form action="/CS157APRoject_war_exploded/submitReview.jsp" method="post">
                <input type="hidden" name="userId" value="<%= session.getAttribute("userID") %>">
                <input type="hidden" name="gameId" value="<%= gameID %>">
                <label for="rating">Rating (1-5):</label>
                <input type="number" id="rating" name="rating" min="1" max="5" required>
                <label for="reviewText">Review:</label>
                <textarea id="reviewText" name="reviewText" rows="4" cols="50" required></textarea>
                <button type="submit" class="corebtn">Submit Review</button>
            </form>
        </div>

        <br>

        <div>
            <h1>Historical Pricing</h1>
            <div class="chart-container">
                <canvas id="pricingChart"></canvas>
            </div>
        </div>

    </div>

    <script>
        // Function to fetch historical pricing data from the server
        function fetchHistoricalPricingData() {
            // Make an AJAX request to fetch historical pricing data
            //console.log('gametitle:', '<%= gametitle %>');
            fetch('/CS157APRoject_war_exploded/fetchHistoricalPricing.jsp?gameName=<%= gametitle %>')
                .then((response) => response.json())
                .then((data) => {
                    // Extract data for the chart
                    const gameDates = data.map((entry) => entry.DateUpdated);
                    const prices = data.map((entry) => entry.Amount);

                    // Create a chart using Chart.js
                    const ctx = document.getElementById('pricingChart').getContext('2d');
                    const pricingChart = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: gameDates,
                            datasets: [
                                {
                                    label: 'Price History (USD)',
                                    data: prices,
                                    borderColor: 'rgba(75, 192, 192, 1)',
                                    borderWidth: 2,
                                    fill: false,
                                },
                            ],
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            scales: {
                                x: {
                                    type: 'time', // Specify that the x-axis represents time
                                    time: {
                                        unit: 'day',
                                        parser: 'yyyy-MM-dd', // Specify the date format
                                        tooltipFormat: 'll', // Specify the tooltip date format
                                    },
                                    title: {
                                        display: true,
                                        text: 'Date Updated',
                                    },
                                },
                                y: {
                                    title: {
                                        display: true,
                                        text: 'Price (USD)',
                                    },
                                },
                            },
                        },
                    });
                })
                .catch((error) => {
                    console.error('Error fetching historical pricing data:', error);
                });
        }
        // Call the function to fetch and display historical pricing data
        fetchHistoricalPricingData();
    </script>
</body>
</html>