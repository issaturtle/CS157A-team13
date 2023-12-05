<%@ page import="java.sql.*, java.util.Date" %>
<%
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  String user = "root";
  String password = "013626210!";
  String userId = request.getParameter("userId");
  String gameId = request.getParameter("gameId");
  int rating = Integer.parseInt(request.getParameter("rating"));
  String reviewText = request.getParameter("reviewText");
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

    if (!gameName.isEmpty()) {
      // Prepare an INSERT statement for the review
      String sql = "INSERT INTO userreview (UserID, GameID, Rating, ReviewText, ReviewDate) VALUES (?, ?, ?, ?, ?)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, userId);
      pstmt.setString(2, gameId);
      pstmt.setInt(3, rating);
      pstmt.setString(4, reviewText);
      pstmt.setDate(5, new java.sql.Date(new Date().getTime()));

      pstmt.executeUpdate();

      // Redirect to the game details page after successful submission
      response.sendRedirect("/CS157APRoject_war_exploded/searchedGame.jsp?gameName=" + gameName);
    } else {
      throw new SQLException("Game not found with provided ID");
    }
  } catch (SQLException e) {
    e.printStackTrace();
    // Handle exceptions
    request.getSession().setAttribute("error", "Error submitting review: " + e.getMessage());
    response.sendRedirect("/CS157APRoject_war_exploded/searchedGame.jsp?gameName=" + gameName);
  } finally {
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (con != null) try { con.close(); } catch (Exception e) {}
  }
%>
