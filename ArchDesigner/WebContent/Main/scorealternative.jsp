<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.ArrayList"%>	
<%@ page language="java" import="java.sql.*"%>
<%try {
    Class.forName("org.postgresql.Driver");
} catch (ClassNotFoundException e) {
    out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
}
	Connection conn = DriverManager.getConnection (
	    "jdbc:postgresql://localhost/ArchDB",
		"user", "password" );
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Score Alternative</title>
<script type='text/javascript' src='/ArchDesigner/dwr/engine.js'></script>
<script type='text/javascript' src='/ArchDesigner/dwr/util.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/ComputeValueScores.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/ApplicationServer.js'></script>
</head>
<body>

	<div id="container">

            <%@include  file="dashboard.html" %>

	<div id="page-wrapper">
		<br> <h3>Select an application profile and click the
			button below to execute AHP</h3>
		<table id="decisiontable" style="border: none;">
			<tbody>
				<tr>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border: none;"><label>Application Name</label></td>
					<td style="border: none;"><select id="appselect"
						style="width: 250px;">
							<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmtapp = conn.createStatement();
						    	ResultSet rsapp;
					            rsapp = stmtapp.executeQuery("SELECT * FROM application" );
					            while ( rsapp.next() ) {
					                String appname = rsapp.getString("AppName");
					                out.write("<OPTION VALUE=\"" + appname  + "\">" + appname  + "</OPTION>\n");
					            }
						    conn.close();
							%>
					</select></td>
				</tr>
				<tr>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border: none;"></td>
					<td style="border: none;"><input class="btn btn-info" value="Score Alternative"
						type="button" onclick="button();" style="" /></td>
				</tr>
				<tr>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
					<label id="myLabel" name ="result"></label>
				</tr>
			</tbody>
		</table>
		<br>
		<script type="text/javascript">
			var button = function() {
				var ddlalt2 = document.getElementById('appselect');
				var valalt2 = ddlalt2.options[ddlalt2.selectedIndex].value;
				ComputeValueScores.QualityWightValueScore(valalt2, ar);
			}
			var ar = function(a) {
				/* var b =a; */
				alert("finished execution");
			}
		</script>
	</div>
	<br>
	<br>
	<br>
	</div>
</body>

</html>