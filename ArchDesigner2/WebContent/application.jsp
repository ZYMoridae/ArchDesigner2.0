<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.Properties"%>
<%@ page language="java" import="java.io.*"%>
<%@ page language="java" import="Data.*"%>
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
		<div style="font-weight: bold; width: 300px;" id="divAppList">
			<h2>Application List</h2>
			</div>
			<!-- 	<input value="Showlist" type="button" onclick="show();"
				style="margin-left: 400px;" /> -->
			<div style="text-align: center; display: inline;" id="divApptable">
				<!-- 		<table id="myTable">
					<tbody>
						<tr>
							<td>Decision Name</td>
							<td>Application Name</td>
							<td>Weight</td>
							<td>Remark</td>
						</tr>
					</tbody>
				</table> -->
				<%
					try {
										    Class.forName("org.postgresql.Driver");
									    } catch (ClassNotFoundException e) {
									        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
									    }
									
									Connection conn = DriverManager.getConnection (
									    "jdbc:postgresql://localhost/ArchDB",
										"user", "password" );
								        try {
								 	    Class.forName("org.postgresql.Driver");
								        } catch (ClassNotFoundException e) {
								            out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
								        }
										try {
								            Statement stmt = conn.createStatement();
								            ResultSet rs1;
								            rs1 = stmt.executeQuery("SELECT * FROM application" );
								        	out.println( "<table class=\"table table-bordered table-hover table-striped\">" );
									final ArrayList<String> applist = new ArrayList<String>();
									final ArrayList<String> remark = new ArrayList<String>();
									ArrayList<Integer> applicationID = new ArrayList<Integer>();
									String applicationname=null;
									int i=0;
								            while ( rs1.next() ) {
								            	i++;
								            	applist.add(rs1.getString("appname"));
								            	remark.add(rs1.getString("remark"));
								            	applicationID.add(rs1.getInt("appid"));
								            }
								            out.println("<tr> <td>"+ "ApplicationName"+"</td>  <td>"+ "remark"+"</td>   </tr>" );
								            for(int j=0;j<i;j++)
								            {	
								            	out.println("<tr> <td>"+ applist.get(j)+"</td>  <td>"+ remark.get(j)+"</td>   </tr>" );
								            }
									    out.println( "</table>" );
								        } catch (Exception e) {
								            out.println( "<h1>exception: "+e+e.getMessage()+"</h1>" );
								        }
				%>
			</div>
        <form action="ApplicationBusiness" method="post">
		<table id="decisiontable" class="form-control" style="border: none;">
			<tbody>
				<tr>
					<td style="border: none; font-weight: bold;"><h2>Add
							a new Application</h2></td>
					<td style="border: none;"></td>
				</tr>
				<tr>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border: none;"><label>Application Name</label></td>
					<td style="border: none;"><input type="text" class="form-control" id="AppNametxt"
						name="AppName" value='' style="width: 250px;" /></td>
				</tr>
                                <tr>
                    <td style="border: none;">&nbsp;</td>
                    <td style="border: none;">&nbsp;</td>
                </tr>
				<tr>
					<td style="border: none;"><label>Remark</label></td>
					<td style="border: none;"><textarea id="Remarktext" class="form-control" name="RmkText" rows="4"
							cols="50" style="width: 250px; height: 150px;"> 
					</textarea></td>
				</tr>
				<tr>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border: none;"></td>
					<td style="border: none;"><input class="btn btn-info" value="Add New" type="submit"
						/></td>
				</tr>
			</tbody>
		</table>
        </form>
        
		<br>
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
	</div>
</body>
</html>