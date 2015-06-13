<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.ArrayList"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="Data.StakeholderServer"%>
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
<title>Stakeholder List</title>
<script type='text/javascript' src='/ArchDesigner/dwr/engine.js'></script>
<script type='text/javascript' src='/ArchDesigner/dwr/util.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/StakeholderServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/ApplicationServer.js'></script>
<script type="text/javascript"
	src="/ArchDesigner/js/jquery-1.3.2-vsdoc2.js"></script>
</head>

<body>

                        <%@include  file="dashboard.html" %>


		<div id="page-wrapper">
			<br>
			<div style="font-weight: bold; width: 300px;padding-bottom: 5px;" id="divStkList">
				<h2>Stakeholder List</h2></div>
			<!-- <input value="Showlist" type="button" onclick="show();"
				style="margin-left: 400px;" /> -->
			<div style="text-align: center; display: inline;" id="divStktable">
<!-- 
				<table id="myTable">
					<tbody>
						<tr>
							<td>Stakeholder Name</td>
							<td>Application Name</td>
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
            ResultSet rs1;
            rs1 = stmt.executeQuery("SELECT * FROM stakeholder" );
        	out.println( "<table class=\"table table-bordered table-hover table-striped\">" );
			final ArrayList<String> decisionlist = new ArrayList<String>();
			final ArrayList<String> remark = new ArrayList<String>();
			ArrayList<Integer> applicationID = new ArrayList<Integer>();
			String applicationname=null;
			int i=0;
            while ( rs1.next() ) {
            	i++;
            	decisionlist.add(rs1.getString("stakeholdername"));
            	remark.add(rs1.getString("remark"));
            	applicationID.add(rs1.getInt("ApplicationID"));
            }
            out.println("<tr><td>"+"StakeholderName"+"</td> <td>"+ "ApplicationName"+"</td>    <td>"+ "remark"+"</td>   </tr>" );
            for(int j=0;j<i;j++)
            {	
            	ResultSet rs2;
                pstmt.setInt(1, applicationID.get(j));
                rs2 = pstmt.executeQuery();
            	rs2.next();
        		applicationname =rs2.getString("AppName");
            	out.println("<tr><td>"+decisionlist.get(j)+"</td> <td>"+ applicationname+"</td>   <td>"+ remark.get(j)+"</td>   </tr>" );
            }
	    out.println( "</table>" );
        } catch (Exception e) {
            out.println( "<h1>exception: "+e+e.getMessage()+"</h1>" );
        }
%>
				<!-- od <script type="text/javascript">
					/*
					read the col and row and add to table
					 */
					var show = function() {

						StakeholderServer.GetStakeholderValue(get);
					}
					var get = function(a) {
						var b = a;
						for (var i = 0; i < b.length; i++) {

							var tr = $('<tr>');
							$('#myTable tbody').append(tr);
							for (var j = 0; j < b[i].length; j++) {
								tr.append('<td>' + b[i][j] + '</td>');
							}
						}
					}
				</script> -->
			</div>
			<br>
			<table id="stakeholdertable">
				<tbody>
					<tr>
						<td style="border: none; font-weight: bold;"><label>Add
								a New Stakeholder</label></td>
						<td style="border: none;"></td>
					</tr>
					<tr>
						<td style="border: none;">&nbsp;</td>
						<td style="border: none;">&nbsp;</td>
					</tr>
					<tr style="margin-bottom: 5px;">
						<td style="border: none;"><label>Stakeholder Name</label></td>
						<td style="border: none;"><input class="form-control" type="text" id="StkNameTxt"
							name="StkName" value='' style="width: 250px;" /></td>
					</tr>
										<tr>
						<td style="border: none;">&nbsp;</td>
						<td style="border: none;">&nbsp;</td>
					</tr>
					<tr style="margin-bottom: 5px;">
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
						    conn.close();
							%>
								<!-- <script type="text/javascript">
									var arr = function(a) {
										var b = a;
										for (i = 0; i < b.length; i++) {
											var x = document
													.createElement("OPTION");
											var t = document
													.createTextNode(b[i][0]);
											//alert(b[i][0]);
											x.appendChild(t);
											document
													.getElementById("appselect")
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
						<td style="border: none;"><input class="btn btn-info" value="Add New"
							type="button" onclick="addstakeholder()"
							/></td>
					</tr>
				</tbody>
			</table>
			<script type="text/javascript">
				var addstakeholder = function() {
					var arr = [];
					arr.push(document.getElementById('StkNameTxt').value);
					alert(document.getElementById('StkNameTxt').value);
					var ddl = document.getElementById('appselect');
					var val = ddl.options[ddl.selectedIndex].value;
					arr.push(val);
					alert(val);
					/* 				arr.push(document.getElementById('WeightNameTxt').value); */
					arr.push(document.getElementById('Remarktext').value);
					alert(document.getElementById('Remarktext').value);
                    //StakeholderServer.savestakeholder(arr);
                   StakeholderServer.test();
					alert('final');
				}
				var ar = function() {
					alert("Success");
				}
			</script>
		</div>
		<!--page-wrapper-->
</body>
</html>