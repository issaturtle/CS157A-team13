<%@ page import="java.sql.*" %>
<% //JSP to delete game by sending query to userwishlist relation %>

<%
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  String user = "root";
  String password = "013626210!";
  String userId = request.getParameter("userId");
  String gameId = request.getParameter("gameId");

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);

    // Prepare a DELETE statement
    String sql = "DELETE FROM userwishlist WHERE UserID = ? AND GameID = ?";
    pstmt = con.prepareStatement(sql); // Use already declared pstmt
    pstmt.setString(1, userId);
    pstmt.setString(2, gameId);
    int rowsAffected = pstmt.executeUpdate();

    // Redirect back to the profile page or show a success message
    if(rowsAffected > 0){
      // Optional: Set an attribute to show a success message on userProfile.jsp
      request.getSession().setAttribute("message", "Game removed from wishlist successfully.");
    }
    response.sendRedirect("/CS157APRoject_war_exploded/user.jsp"); // Redirect to the user profile page
  } catch (SQLException e) {
    e.printStackTrace();
    // Handle exceptions
    request.getSession().setAttribute("error", "Error removing game from wishlist: " + e.getMessage());
    response.sendRedirect("/CS157APRoject_war_exploded/user.jsp"); // Redirect back with error
  } finally {
    // Close connections
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (con != null) try { con.close(); } catch (Exception e) {}
  }
%>
