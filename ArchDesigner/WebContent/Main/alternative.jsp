<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.ArrayList"%>	
<%@ page language="java" import="java.sql.*"%>
<%try {
    Class.forName("org.postgresql.Driver");
} catch (ClassNotFoundException e) {
    out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alternative List</title>
<script type='text/javascript' src='/ArchDesigner/dwr/engine.js'></script>
<script type='text/javascript' src='/ArchDesigner/dwr/util.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/AlternativeServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/ApplicationServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/AlternativeServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/DecisionServer.js'></script>
<script type="text/javascript"
	src="/ArchDesigner/js/jquery-1.3.2-vsdoc2.js"></script>

</head>


<body>

	<div id="container">
		
            <%@include  file="dashboard.html" %>


<div id="page-wrapper">
	<br>
	<div style="font-weight: bold; width: 300px;" id="divAltList">
		<h2>Alternative List</h2></div>
<!-- 	<input value="Showlist" type="button" onclick="show();"
		style="margin-left: 400px;" /> -->
	<div style="text-align: center; display: inline;" id="divAlttable">
<!-- 		<table id="myTable">
			<tbody>
				<tr>
					<td>Alternative Name</td>
					<td>Application Name</td>
					<td>Decision Name</td>
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
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM application WHERE AppID =?");
            PreparedStatement pstmtdec = conn.prepareStatement("SELECT * FROM decision WHERE decisionid =?");
            ResultSet rs1;
            rs1 = stmt.executeQuery("SELECT * FROM alternative" );
        	out.println( "<table class=\"table table-bordered table-hover table-striped\">" );
			final ArrayList<String> decisionlist = new ArrayList<String>();
			final ArrayList<String> remark = new ArrayList<String>();
			ArrayList<Integer> applicationID = new ArrayList<Integer>();
			ArrayList<Integer> decisionID = new ArrayList<Integer>();
			String applicationname=null;
			String decisionname=null;
			int i=0;
            while ( rs1.next() ) {
            	i++;
            	decisionlist.add(rs1.getString("alternativename"));
            	remark.add(rs1.getString("remark"));
            	applicationID.add(rs1.getInt("ApplicationID"));
            	decisionID.add(rs1.getInt("decisionid"));
            }
            out.println("<tr><td>"+"AlternativeName"+"</td> <td>"+ "ApplicationName"+"</td>   <td>"+ "DecisionName"+"</td>  <td>"+ "remark"+"</td>   </tr>" );
             for(int j=0;j<i;j++)
            {	
            	ResultSet rs2;
          		ResultSet rs3; 
                pstmt.setInt(1, applicationID.get(j));
         		pstmtdec.setInt(1, decisionID.get(j));
                rs2 = pstmt.executeQuery();
         		rs3 = pstmtdec.executeQuery(); 
            	rs2.next();
        		rs3.next(); 
        		applicationname =rs2.getString("AppName");
        		decisionname =rs3.getString("decisionname"); 
        		/* out.println(decisionname); */
            	out.println("<tr><td>"+decisionlist.get(j)+"</td> <td>"+ applicationname+"</td>   <td>"+ decisionname+"</td>   <td>"+ remark.get(j)+"</td>   </tr>" );
            } 
	    out.println( "</table>" );
        } catch (Exception e) {
            out.println( "<h1>exception: "+e+e.getMessage()+"</h1>" );
        }
%>
		<!-- <script type="text/javascript">
			/*
			read the col and row and add to table
			 */
			var show = function() {

				AlternativeServer.GetAlternativeValue(get);
			}
			var get = function(a) {
				var b = a;
				for (var i = 0; i < b.length; i++) {

					var tr = $('<tr>');
					$('#myTable tbody').append(tr);
					for (var j = 0; j < b[i].length; j++) {
						tr.append('<td>' + b[i][j] + '</td>');

						/*alert("j="+j+"b[i].length"+b[i].length);*/
					}
				}
			}
		</script> -->
	</div>
	<br>
	<table id="alternativetable" style="border: none;">
		<tbody>
			<tr>
				<td style="border: none; font-weight: bold;"><label>Add
						a New Alternative</label></td>
				<td style="border: none;"></td>
			</tr>
			<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
			<tr>
				<td style="border: none;"><label>Alternative Name</label></td>
				<td style="border: none;"><input class="form-control" type="text" id="AltNameTxt"
					name="AltName" value='' style="width: 250px;" /></td>
			</tr>
						<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
			<tr>
				<td style="border: none;"><label>Application Name</label></td>
				<td style="border: none;"><select class="form-control" id="appselect"
					style="width: 250px;">
						<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmt = conn.createStatement();
						    	ResultSet rs1;
					            rs1 = stmt.executeQuery("SELECT * FROM application" );
					            while ( rs1.next() ) {
					                String appname = rs1.getString("AppName");
					                out.write("<OPTION VALUE=\"" + appname  + "\">" + appname  + "</OPTION>\n");
					            }
							%>
						<!-- <script type="text/javascript">
							var arr = function(a) {
								var b = a;
								for (i = 0; i < b.length; i++) {
									var x = document.createElement("OPTION");
									var t = document.createTextNode(b[i][0]);
									//alert(b[i][0]);
									x.appendChild(t);
									document.getElementById("appselect")
											.appendChild(x);
								}
							}
							ApplicationServer.GetApplicationValue(arr);
						</script> -->
				</select></td>
			</tr>
						<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
			<tr>
				<td style="border: none;"><label>Decision Name</label></td>
				<td style="border: none;"><select class="form-control" id="Decselect"
					style="width: 250px;">
					<% 
							try {
							    Class.forName("org.postgresql.Driver");
						    } catch (ClassNotFoundException e) {
						        out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
						    }
								Statement stmt1 = conn.createStatement();
						    	ResultSet rs4;
					            rs4 = stmt1.executeQuery("SELECT * FROM decision" );
					            while ( rs4.next() ) {
					                String decname = rs4.getString("decisionName");
					                out.write("<OPTION VALUE=\"" + decname  + "\">" + decname  + "</OPTION>\n");
					            }
						    conn.close(); 
					%>
				<!-- 		<script type="text/javascript">
							var arr = function(a) {
								var b = a;
								for (i = 0; i < b.length; i++) {
									var x = document.createElement("OPTION");
									var t = document.createTextNode(b[i][0]);
									//alert(b[i][0]);
									x.appendChild(t);
									document.getElementById("Decselect")
											.appendChild(x);
								}
							}
							DecisionServer.GetDecisionValue(arr);
						</script> -->
				</select></td>
			</tr>
						<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
			<tr>
				<td style="border: none;"><label>Remark</label></td>
				<td style="border: none;"><textarea class="form-control" id="Remarktext" rows="4"
						cols="50" style="width: 250px; height: 150px;"> 
					</textarea></td>
			</tr>
			<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
			<tr>
				<td style="border: none;"></td>
				<td style="border: none;"><input class="btn btn-info" value="Add New" type="button"
					onclick="addalternative();" /></td>
			</tr>
		</tbody>
	</table>
	<script type="text/javascript">
		var addalternative = function() {
			var arr = [];
			arr.push(document.getElementById('AltNameTxt').value);
			var ddl = document.getElementById('appselect');
			var val = ddl.options[ddl.selectedIndex].value;
			arr.push(val);
			var ddldec = document.getElementById('Decselect');
			var valdec = ddldec.options[ddldec.selectedIndex].value;
			arr.push(valdec);
			/* 	arr.push(document.getElementById('WeightNameTxt').value); */
			arr.push(document.getElementById('Remarktext').value);
			AlternativeServer.savealternative(arr, ar);
		}
		var ar = function() {
			alert("Success");
		}
	</script>
</div>

</body>
</html>