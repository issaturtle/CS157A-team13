<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
    <%
      Connection con = null;
      PreparedStatement pstmt = null;
      String user = "root";
      String password = "013626210!";
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);
        String query = "DELETE FROM requestlist WHERE requestlist.requestID = ?";

        pstmt = con.prepareStatement(query);
        pstmt.setInt(1, Integer.parseInt(request.getParameter("requestID")));
        pstmt.executeUpdate();
        response.sendRedirect("/CS157APRoject_war_exploded/adminrequests.jsp");
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        try {
          pstmt.close();
          con.close();
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
    %>
</body>
</html>
