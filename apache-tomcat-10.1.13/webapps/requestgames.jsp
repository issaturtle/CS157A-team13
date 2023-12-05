<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%

        String dbUser = "root";
        String dbPassword = "013626210!";
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            Connection con = null;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", dbUser, dbPassword);
            LocalDate currentDate = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String formattedDate = currentDate.format(formatter);
            LocalDate parsedDate = LocalDate.parse(formattedDate, formatter);

            // Get form data
            String gameName = request.getParameter("gameName");
            String UserID = request.getParameter("UserID");
            String websiteURL = request.getParameter("WebsiteURL");
            try {
                String sql = "INSERT INTO requestlist (UserID, GameName, WebsiteURL, DateAdded ) VALUES (?, ?, ?, ?)";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setString(1, UserID);
                statement.setString(2, gameName);
                statement.setString(3, websiteURL);
                statement.setDate(4, java.sql.Date.valueOf(parsedDate));
                if (statement.executeUpdate() > 0) {
                    out.println("Request added successfully");
                } else {
                    out.println("Request failed to add");
                }
                response.sendRedirect("main.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
