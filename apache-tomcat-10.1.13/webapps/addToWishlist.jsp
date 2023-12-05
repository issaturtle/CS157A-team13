<%@ page import="java.sql.*, java.util.Date" %>
<%
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  String user = "root";
  String password = "013626210!";
  String userId = request.getParameter("userId");
  String gameId = request.getParameter("gameId");
  String gameName = "";

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);

    // Retrieve game name using gameId
    String queryGameName = "SELECT gameName FROM game WHERE gameId = ?";
    pstmt = con.prepareStatement(queryGameName);
    pstmt.setString(1, gameId);
    rs = pstmt.executeQuery();
    if (rs.next()) {
      gameName = rs.getString("gameName");
    }

    // Check if gameName was retrieved
    if (!gameName.isEmpty()) {
      // Prepare an INSERT statement
      String sql = "INSERT INTO userwishlist (UserID, GameID, DateAdded) VALUES (?, ?, ?)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, userId);
      pstmt.setString(2, gameId);
      pstmt.setDate(3, new java.sql.Date(new Date().getTime())); // Set current date for DateAdded

      pstmt.executeUpdate();
    } else {
      throw new SQLException("Game not found with provided ID");
    }

    // Redirect back to the game details page or show a success message
    response.sendRedirect("/CS157APRoject_war_exploded/searchedGame.jsp?gameName=" + gameName); // Redirect to the game details page
  } catch (SQLException e) {
    e.printStackTrace();
    // Handle exceptions
    request.getSession().setAttribute("error", "Error adding game to wishlist: " + e.getMessage());
    response.sendRedirect("/CS157APRoject_war_exploded/searchedGame.jsp?gameName=" + gameName); // Redirect back with error
  } finally {
    // Close connections and result set
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (con != null) try { con.close(); } catch (Exception e) {}
  }
%>
