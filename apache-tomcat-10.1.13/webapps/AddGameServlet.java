import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AddGameServlet")
public class AddGameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Assuming your MySQL server credentials
        String dbUser = "root";
        String dbPassword = "013626210!";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            Connection con = null;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamepickerdb?autoReconnect=true&useSSL=false", dbUser, dbPassword);

            // Get form data
            String gameName = request.getParameter("gameName");
            String releaseDate = request.getParameter("releaseDate");
            SimpleDateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy");
             try {
                Date inputDate = inputFormat.parse(releaseDate);
                SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
                releaseDate = outputFormat.format(inputDate);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            String developer = request.getParameter("developer");
            String genreid = request.getParameter("genreid");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String link = request.getParameter("link");
            // Add other form fields here
    
            // Prepare and execute SQL query
            String sql = "INSERT INTO game (gameName, releaseDate, Developer, GenreID, Description, Link, OriginalPrice ) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, gameName);
            statement.setString(2, releaseDate);
            statement.setString(3, developer);
            statement.setString(4, genreid);
            statement.setString(5, description);
            statement.setString(6, link);
            statement.setString(7, price);
    
    
            // Set other parameters and execute the statement
    
            int rowsAffected = statement.executeUpdate();
    
            // Check if the insertion was successful
            if (rowsAffected > 0) {
                out.println("Insertion successful");
            } else {
                out.println("Insertion failed");
            }

            // Close resources
            statement.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to the form or any other page after processing
        response.sendRedirect("admin.jsp");
    }
}
