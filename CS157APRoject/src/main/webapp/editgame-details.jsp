<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Game Details</title>
  <link rel="stylesheet" type="text/css" href="/CS157APRoject_war_exploded/css/main.css">
</head>
<body>
<%
  String dbUser = "root";
  String dbPassword = "013626210!";
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  boolean dataFetched = false;
  String gameName = "";
  String releaseDate = "";
  String developer = "";
  String genreID = "";
  String description = "";
  String price = "";
  String imgLink = "";
  String vendorLink = "";
  String distributorName = "";
  String ogPrice = "";
  int editGameID = Integer.parseInt(request.getParameter("editGameID"));
  String submit = "/CS157APRoject_war_exploded/updategame.jsp?ogPrice=";
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", dbUser, dbPassword);
    // Fetch game data
    String sql = "SELECT * FROM game WHERE GameID = ?";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, editGameID);
    rs = pstmt.executeQuery();
    out.println("Query executed");
    if (rs.next()) {
      gameName = rs.getString("GameName");
      releaseDate = new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate("ReleaseDate"));
      developer = rs.getString("Developer");
      genreID = rs.getString("GenreID");
      description = rs.getString("Description");
      price = rs.getString("OriginalPrice");
      imgLink = rs.getString("Link");
      dataFetched = true;
      ogPrice = rs.getString("OriginalPrice");
      submit = submit + ogPrice;
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    if (rs != null) try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
    if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
    if (con != null) try { con.close(); } catch (SQLException ex) { ex.printStackTrace(); }
  }
%>
<% if (dataFetched) { %>
<form action="<%= submit %>"  method="post">
  <input type="hidden" name="editGameID" value="<%=editGameID%>">
  Game Name: <input type="text" name="gameName" value="<%=gameName%>"><br>
  Release Date: <input type="date" name="releaseDate" value="<%=releaseDate%>"><br>
  Developer: <input type="text" name="developer" value="<%=developer%>"><br>
  Genre ID: <input type="text" name="genreID" value="<%=genreID%>"><br>
  Description: <input type="text" name="description" value="<%=description%>"><br>
  Original Price: <input type="number" name="price" value="<%=price%>"><br>
  Image Link: <input type="text" name="imgLink" value="<%=imgLink%>"><br>
  Vendor Link: <input type="text" name="vendorLink" value="<%=vendorLink%>"><br>
  Distributor Name(Steam, GOG, or Epic Games): <input type="text" name="distributorName" value="<%=distributorName%>"><br>
  <input type="submit" value="Update Game">
</form>
<% } else { %>
<p>Game not found or error occurred.</p>
<% } %>
</body>
</html>
