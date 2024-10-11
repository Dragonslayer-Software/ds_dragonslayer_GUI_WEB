<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<html>
<head>
    <title>JSP MySQL Connection</title>
</head>
<body>
    <h2>Database Connection Example</h2>
    <%
	System.out.println("Hello at the beginning");
        // Check if form has been submitted
        String password2 = "maple1";
        String email = "lewellynmary@yahoo.com";
       String name = "Mary Lewellyn";
        
        if (password2 != null && email != null && name != null) {
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
                String sql = "INSERT INTO buyer (email, password2, name) VALUES (?, ?, ?)";
                ps = conn.prepareStatement(sql);
                
                // Set the parameters for the prepared statement
                ps.setString(1, email);
                ps.setString(2, password2);
                 ps.setString(3, name);
                // Execute the insert statement
                int rowsInserted = ps.executeUpdate();
                
               
            } catch (Exception e) {
                
            } 
        }
    %>
</body>
</html>
