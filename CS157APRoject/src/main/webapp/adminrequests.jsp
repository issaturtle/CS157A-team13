<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><html>
<head>
    <title>Title</title>
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
            background: none; /* Remove the background on hover */
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
            width: 350px;
            height: 350px;
            background-color: #fff;
            color: white;
            margin-top: 40px;
            padding-top: 40px;
            margin-left: 30px;
            margin-right: 30px;
            align-items: self-start;
        }
        .request-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;

        }
        .game-item {
            text-align: center;
            padding: 10px;
        }
        .request-grid h1{
            color: black;
            font-size:17px;
        }
        h4{
            color: black;
            font-size:14px;
        }
        h5{
            color: black;
            font-size:10px;
        }
        .container{
            display:flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding-left:100px;
            padding-right:100px;
        }
        .corebtn{
            background-color: #0077ff;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 6px 10px;
            cursor: pointer;
            text-decoration: none;
            margin-left: 200px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <ul>
            <li><a href="/CS157APRoject_war_exploded/main.jsp"><img src="logo3.png" class="logo" alt="Games Logo"></a></li>
        </ul>
        <button onclick="window.location.href='logout.jsp'" class="corebtn">Logout</button>
    </div>
    <div class="container">

        <h1>Games Requested</h1>
        <div class="request-grid">

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
                <h5><%= rs.getString("WebsiteURL") %></h5>
                <h4><%= "Date Requested: " + rs.getString("DateAdded") %></h4>
                <button onclick="removeRequest(<%= rs.getInt("RequestID") %>)" class="corebtn")>Remove from list</button>

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
    </div>
    <script>
        function removeRequest(a) {
            window.location.href = '/CS157APRoject_war_exploded/removerequest.jsp?requestID=' + a;
        }
    </script>

</body>
</html>
