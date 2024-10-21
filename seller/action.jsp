<%@ page import="com.mysql.jdbc.*" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement, java.io.*, java.io.File" %>
<%@ page import=" java.io.IOException, org.apache.commons.*,org.apache.commons.io.FileUtils, org.json.*,java.util.List, java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet, java.io.*, java.net.*, org.joda.time.*, java.nio.file.*, java.nio.file.attribute.BasicFileAttributes, org.joda.time.format.*, java.net.ssl.*, java.time.*, java.util.*, java.time.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime, java.text.*, java.util.Date, java.time.Instant, java.net.HttpURLConnection, java.net.URL" %>
<%//@ page import="org.apache.http.client.HttpClient.*" %>
<%//@ page import="java.io.*, com.mysql.cj.jdbc.Driver" %>

<%
String fileDelete = request.getParameter("file");
System.out.println("File to delete: " + fileDelete);
File f=new File("C:/Program Files/Apache Software Foundation/Tomcat 9.0/webapps/dragonslayer/seller/pages/uploads/" + request.getParameter("file"));
System.out.println(f);
f.delete();
 response.sendRedirect("index.jsp");
%>