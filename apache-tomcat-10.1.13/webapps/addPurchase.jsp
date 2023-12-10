<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.Date" %>
<%
  // Add game to the user's purchase history database when the user presses "Buy" on a vendor in searchedGame.jsp
%>
<%
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null; // Declare rs here
  String user = "root";
  String password = "013626210!";
  String userId = request.getParameter("userId");
  String gameId = request.getParameter("gameId");
  String distributorName = request.getParameter("distributorName");
  String purchasePrice = request.getParameter("purchasePrice");
  String redirectLink = request.getParameter("redirectLink");
  String gameName = "";

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);

    // Retrieve game name using gameId
    String queryGameName = "SELECT gameName FROM game WHERE gameId = ?";
    pstmt = con.prepareStatement(queryGameName);
    pstmt.setString(1, gameId);
    rs = pstmt.executeQuery(); // Use the declared rs variable here
    if (rs.next()) {
      gameName = rs.getString("gameName");
    }

    // Check if gameName was retrieved
    if (!gameName.isEmpty()) {
      // Prepare an INSERT statement for purchasehistory
      String sql = "INSERT INTO purchasehistory (UserID, GameID, DistributorName, DatePurchased, PurchasePrice) VALUES (?, ?, ?, ?, ?)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, userId);
      pstmt.setString(2, gameId);
      pstmt.setString(3, distributorName);
      pstmt.setDate(4, new java.sql.Date(new Date().getTime())); // Current date for DatePurchased
      pstmt.setString(5, purchasePrice);

      pstmt.executeUpdate();
    } else {
      throw new SQLException("Game not found with provided ID");
    }

    // Redirect to the distributor's link
    response.sendRedirect(redirectLink);
  } catch (SQLException e) {
    e.printStackTrace();
    // Handle exceptions
    request.getSession().setAttribute("error", "Error processing purchase: " + e.getMessage());
    response.sendRedirect("/CS157APRoject_war_exploded/searchedGame.jsp?gameName=" + gameName); // Redirect back with error
  } finally {
    // Close connections and result set
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (con != null) try { con.close(); } catch (Exception e) {}
  }
%>
