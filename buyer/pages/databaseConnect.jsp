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
       String name2 = request.getParameter("name");
        System.out.println(password2);
		System.out.println(name2);
		System.out.println(email2);
		
        if (password2 != null && email2 != null && name2 != null) {
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
                
                // Create the SQL INSERT query
                String sql = "INSERT INTO buyer (email, password, name) VALUES ('"+email2+"', '"+password2+"','"+name2+"')";
				System.out.println(sql);
                ps = conn.prepareStatement(sql);
                ps.executeUpdate();
                
              response.sendRedirect("sign-in.jsp");
            } catch (Exception e) {
                
            } 
			
        }
    %>
</body>
</html>
