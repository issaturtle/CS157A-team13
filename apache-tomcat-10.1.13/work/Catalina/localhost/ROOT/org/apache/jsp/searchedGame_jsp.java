/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.13
 * Generated at: 2023-12-01 05:36:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;

public final class searchedGame_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <meta charset=\"UTF-8\" />\r\n");
      out.write("    <title>Searched Game Information</title>\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/css/searchedGame.css\">\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/chart.js\"></script>\r\n");
      out.write("\r\n");
      out.write("  </head>\r\n");
      out.write("  <body class=\"main\">\r\n");
      out.write("    ");

    if (session.getAttribute("loggedIn") == null || !((boolean) session.getAttribute("loggedIn"))) {
        response.sendRedirect("login.jsp");
    }
    
      out.write("\r\n");
      out.write("    <div class=\"navbar\">\r\n");
      out.write("        <ul>\r\n");
      out.write("            <li><a href=\"/homepage.jsp\">Home</a></li>\r\n");
      out.write("            <li><a href=\"/main.jsp\">Games</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("        <ul>\r\n");
      out.write("            <li><a href=\"/logout.jsp\">");
      out.print( session.getAttribute("username") );
      out.write("</a></li>\r\n");
      out.write("            <li><a href=\"/logout.jsp\">Logout</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    ");
 String gametitle = request.getParameter("gameName"); 
      out.write("\r\n");
      out.write("    <div class='main-body'>\r\n");
      out.write("        <div >\r\n");
      out.write("            <div style=\"\r\n");
      out.write("            display: flex;\r\n");
      out.write("            flex-direction: row;\r\n");
      out.write("            justify-content: space-between;\">\r\n");
      out.write("                <h1>");
      out.print(gametitle);
      out.write("</h1>\r\n");
      out.write("                <div class=\"search-bar\">\r\n");
      out.write("                    <form action=\"/search.jsp\" method=\"get\">\r\n");
      out.write("                        <input type=\"text\" name=\"search\" placeholder=\"Search...\">\r\n");
      out.write("                        <button type=\"submit\">Search</button>\r\n");
      out.write("                     </form>\r\n");
      out.write("                 </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <button>Wishlist</button>\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    ");
 
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            String user = "root";
            String password = "013626210!";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", user, password);
                
                stmt = con.createStatement();
                String query = "SELECT game.*, genre.GenreName, genre.Description, min(currentprice.amount) " +
                "FROM game " +
                "JOIN genre ON game.GenreID = genre.GenreID " +
                "JOIN currentprice ON game.gameid = currentprice.gameid WHERE game.gameName = ? " +
                "GROUP BY game.gameid";                
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, gametitle); // Set the value of the parameter
                rs = pstmt.executeQuery();
                
                while (rs.next()) {
        
      out.write("\r\n");
      out.write("        <div class=\"desc\">\r\n");
      out.write("            <!-- <div>\r\n");
      out.write("                <div class=\"game-info\">\r\n");
      out.write("                    <h3>Release Date:</h3>\r\n");
      out.write("                    <p>");
      out.print(rs.getString("ReleaseDate"));
      out.write("</p>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"game-info\">\r\n");
      out.write("                    <h3>Developer:</h3>\r\n");
      out.write("                    <p>");
      out.print(rs.getString("Developer"));
      out.write("</p>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"game-info\">\r\n");
      out.write("                    <h3>Genre Type:</h3>\r\n");
      out.write("                    <p>");
      out.print(rs.getString("GenreName"));
      out.write("</p>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div class=\"game-info\">\r\n");
      out.write("                    <p>");
      out.print(rs.getString("Description"));
      out.write("</p>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div> -->\r\n");
      out.write("            <div class=\"flex-desc\">\r\n");
      out.write("                <table class=\"descTable\">\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th style=\"white-space: nowrap;\">Price</th>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            ");

                            String originalPrice = rs.getString("originalprice");
                            String currentPrice = rs.getString("MIN(currentprice.amount)");
                        
                            // Check if both originalPrice and currentPrice are not null
                            if (originalPrice != null && currentPrice != null) {
                                double originalPriceValue = Double.parseDouble(originalPrice);
                                double currentPriceValue = Double.parseDouble(currentPrice);
                        
                                // Calculate the percentage discount
                                double discountPercentage = ((originalPriceValue - currentPriceValue) / originalPriceValue) * 100;
                            
      out.write("\r\n");
      out.write("                            $");
      out.print( currentPrice );
      out.write("\r\n");
      out.write("                            ");

                                if (discountPercentage > 0) {
                            
      out.write("\r\n");
      out.write("                            <p style=\"color: red;\">(");
      out.print( String.format("%.2f%% off", discountPercentage) );
      out.write(")</p>\r\n");
      out.write("                            ");

                                }
                            } else {
                            
      out.write("\r\n");
      out.write("                            $");
      out.print( currentPrice );
      out.write("\r\n");
      out.write("                            Not available\r\n");
      out.write("                            ");

                            }
                            
      out.write("\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th style=\"white-space: nowrap;\">Release Date</th>\r\n");
      out.write("                        <td>");
      out.print(rs.getString("ReleaseDate"));
      out.write("</td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th style=\"white-space: nowrap;\">Developer</th>\r\n");
      out.write("                        <td>");
      out.print(rs.getString("Developer"));
      out.write("</td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th style=\"white-space: nowrap;\">GenreName</th>\r\n");
      out.write("                        <td>");
      out.print(rs.getString("GenreName"));
      out.write("</td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th style=\"white-space: nowrap;\">Rating</th>\r\n");
      out.write("                        <td>Very Positive (# of comment)</td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </table>\r\n");
      out.write("                <h3>");
      out.print(rs.getString("Description"));
      out.write("</h3>\r\n");
      out.write("            </div>\r\n");
      out.write("            <img src=\"");
      out.print(rs.getString("Link"));
      out.write("\" alt=\"");
      out.print(rs.getString("GameName"));
      out.write("\">\r\n");
      out.write("        </div>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("        ");

            }
            rs.close();
            stmt.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
            e.printStackTrace();
        } 
        
        
      out.write("\r\n");
      out.write("        <div>\r\n");
      out.write("            <div>\r\n");
      out.write("                <h1>Vendors</h1>\r\n");
      out.write("                <div>\r\n");
      out.write("                    <table class=\"vendorLinks\">\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th>Vendor</th>\r\n");
      out.write("                            <th>Price</th>\r\n");
      out.write("                            <th>Link</th>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        ");

                        ResultSet result = null;
                        String PricingQuery = "SELECT DistributorName, amount, currentprice.link FROM gamepickerdb.currentprice, game where currentprice.GameID = game.GameID and game.gameName = ? ORDER BY Amount;";
                        PreparedStatement getStorePrices = con.prepareStatement(PricingQuery);
                        getStorePrices.setString(1, gametitle); // Set the value of the parameter
                        result = getStorePrices.executeQuery();
                        while (result.next()) {
                        
      out.write("\r\n");
      out.write("                            \r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>");
      out.print( result.getString("DistributorName") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( result.getString("Amount") );
      out.write("</td>\r\n");
      out.write("                                <td><button><a href=\"");
      out.print( result.getString("Link") );
      out.write("\">Buy</a></button></td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        ");

                        }
                        
      out.write("\r\n");
      out.write("                        \r\n");
      out.write("                    </table>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <div>\r\n");
      out.write("            <h1>Historical Pricing</h1>\r\n");
      out.write("            <div class=\"chart-container\">\r\n");
      out.write("                <canvas id=\"pricingChart\"></canvas>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div>\r\n");
      out.write("            <h1>Comments</h1>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"script.js\"></script>\r\n");
      out.write("  </body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}