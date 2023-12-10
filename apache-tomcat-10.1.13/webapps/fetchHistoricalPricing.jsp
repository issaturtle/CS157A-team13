<%@ page import="java.sql.*, java.util.*, com.google.gson.Gson, java.text.SimpleDateFormat" %>
<% //This JSP pulls historical pricing data from the pricehistory relation and return it to searchedgame.jsp  %>
<%
    String gametitle = request.getParameter("gameName");
    List<Map<String, Object>> historicalData = new ArrayList<>();

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false";
        String user = "root";
        String password = "013626210!";
        con = DriverManager.getConnection(url, user, password);

        String query = "SELECT DateUpdated, Amount FROM pricehistory WHERE GameID = (SELECT GameID FROM game WHERE gameName = ?) ORDER BY DateUpdated";

        pstmt = con.prepareStatement(query);
        pstmt.setString(1, gametitle);
        rs = pstmt.executeQuery();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // Define the date format

        while (rs.next()) {
            Map<String, Object> entry = new HashMap<>();
            // Format the date as a string
            String formattedDate = dateFormat.format(rs.getDate("DateUpdated"));
            entry.put("DateUpdated", formattedDate);
            entry.put("Amount", rs.getDouble("Amount"));
            historicalData.add(entry);
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        // Close resources (rs, pstmt, con)
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Convert the historical data to JSON
    response.setContentType("application/json");
    response.getWriter().write(new Gson().toJson(historicalData));
%>
