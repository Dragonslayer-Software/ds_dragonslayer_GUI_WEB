<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dragonslayer File Upload:</title>
<style>
input[type="file"] {
  display: none;
}

.custom-file-upload {
  border: 1px solid #ccc;
  display: inline-block;
  padding: 6px 12px;
  cursor: pointer;
}

</style>
</head>
<body>
 <%
 String fileName = request.getParameter("fileName");
 System.out.println(request.getParameter("fileName"));
 if (fileName != null) {
	 
	 out.println("<strong>Success, you have uploaded </strong>" + fileName + " </br></br>");
 }
 
 %>
 
 
<form class="form-select form-select-sm" action="action_file_upload.jsp" method="post"
                        enctype="multipart/form-data">
						
						<label class="custom-file-upload">
<input class="form-select form-select-sm" type="file" name="file" size="80" />Browse 
</label> <span><input class="custom-file-upload" type="submit" value="Upload File" /></span>




</form>
</body>
</html>