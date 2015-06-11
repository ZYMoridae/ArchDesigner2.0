<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.Properties"%>
<%@ page language="java" import="java.io.*"%>
<% 
try {
	    Class.forName("org.postgresql.Driver");
    } catch (ClassNotFoundException e) {
        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Application Profile</title>
<script type='text/javascript' src='/ArchDesigner/dwr/engine.js'></script>
<script type='text/javascript' src='/ArchDesigner/dwr/util.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/DecisionServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/ApplicationServer.js'></script>
</head>

<body>

        <%@include  file="dashboard.html" %>

        <div id="page-wrapper">
            <h1>
                Welcome to the ArchDesigner v2.0!
            </h1>
        </div>

        <script type="text/javascript">
		var button = function() {
			var arr = [];
			arr.push(document.getElementById('AppNametxt').value);
			arr.push(document.getElementById('Remarktext').value);
			ApplicationServer.saveapplication(arr, ar);
		          }
			var ar = function() {
				alert("Success");
			}
        </script>

</body>
</html>