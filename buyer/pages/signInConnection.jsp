<%@ page import="com.mysql.jdbc.*" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement, java.io.*, java.io.File" %>
<%@ page import=" java.io.IOException, org.apache.commons.*,org.apache.commons.io.FileUtils, org.json.*,java.util.List, java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet, java.io.*, java.net.*, org.joda.time.*, java.nio.file.*, org.joda.time.format.*, java.net.ssl.*, java.time.*, java.util.*, java.time.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime, java.text.*, java.util.Date, java.time.Instant, java.net.HttpURLConnection, java.net.URL" %>
<%//@ page import="org.apache.http.client.HttpClient.*" %>
<%//@ page import="java.io.*, com.mysql.cj.jdbc.Driver" %>
<html>
<head>
   
</head>
<body>
    
    <%
	System.out.println("Hello at the beginning");
        // Check if form has been submitted
        String password2 = request.getParameter("password");
        String email2 = request.getParameter("email");
 
        System.out.println(password2);
		
		System.out.println(email2);
		
        if (password2 != null && email2 != null ) {
            // Database connection variables
            String url = "jdbc:mysql://localhost:3306/mary";
            String username = "root";  // Your MySQL username
            String password = "";  // Your MySQL password
            Connection conn = null;
            PreparedStatement ps = null;

            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish the connection
                conn = DriverManager.getConnection(url, username, password);
                
               String sql = "SELECT * FROM buyer WHERE email = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, email2);

                rs = stmt.executeQuery();

                if (rs.next()) {
                    System.out.println("<h3>Buyer Details:</h3>");
                    System.out.println("Email: " + rs.getString("email2") + "<br>");
                   
					response.sendRedirect("../index.html");
                } else {
                    System.out.println("<p>No buyer found with email: " + email + "</p>");
					response.sendRedirect("sign-in.html");
                }
                
        
            } catch (Exception e) {
                
            } 
			
        }
    %>
</body>
</html>
